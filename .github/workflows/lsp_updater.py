# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.


import hashlib
import json
import os
import pathlib
import subprocess
import sys
import urllib.request as url_lib
from typing import Union

import github
import github.PullRequest

MODEL_SCHEMA = "https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.schema.json"
MODEL = "https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.json"

OWNER = "karthiknadig"
LSP_ROOT = pathlib.Path(__file__).parent.parent.parent / "generator"
REPO = f"{OWNER}/lsprotocol"

UPDATER_BRANCH = "lsp-updater"
UPDATER_BRANCH_HEAD = f"{OWNER}:{UPDATER_BRANCH}"

LABEL_UPDATE = "lsp-update"
LABEL_UPDATE_ERROR = "lsp-update-error"

gh = github.Github(os.getenv("GITHUB_TOKEN"))
GH_REPO = gh.get_repo(REPO)


def _get_content(uri) -> str:
    with url_lib.urlopen(uri) as response:
        content = response.read()
        if isinstance(content, str):
            return content
        else:
            return content.decode("utf-8")


def _get_update_error_issue_body(error: str, schema_hash: str, model_hash: str) -> str:
    return "\n".join(
        [
            "LSP Schema has changed. Please update the generator.",
            f"Schema: [source]({MODEL_SCHEMA})",
            f"Model: [source]({MODEL})",
            "",
            "Instructions:",
            "1. Setup a virtual environment and install nox.",
            "2. Install all requirements for generator.",
            "3. Run `nox --session update_lsp`.",
            "",
            "Error:",
            "```",
            error,
            "```",
            "",
            "Hashes:",
            f"* schema: `{schema_hash}`",
            f"* model: `{model_hash}`",
        ]
    )


def _get_update_pr_body(schema_hash: str, model_hash: str) -> str:
    return "\n".join(
        [
            "LSP Schema has changed.",
            f"Schema: [source]({MODEL_SCHEMA})",
            f"Model: [source]({MODEL})",
            "" "Hashes:",
            f"* schema: `{schema_hash}`",
            f"* model: `{model_hash}`",
        ]
    )


def is_schema_changed(old_schema: str, new_schema: str) -> bool:
    old_schema = json.loads(old_schema)
    new_schema = json.loads(new_schema)
    return old_schema != new_schema


def is_model_changed(old_model: str, new_model: str) -> bool:
    old_model = json.loads(old_model)
    new_model = json.loads(new_model)
    return old_model != new_model


def get_hash(text: str) -> str:
    hash_object = hashlib.sha256()
    hash_object.update(json.dumps(json.loads(text)).encode())
    return hash_object.hexdigest()


def already_published_pr(
    schema_hash: str, model_hash: str
) -> Union[github.PullRequest.PullRequest, None]:
    prs = GH_REPO.get_pulls(state="open", base="main")
    for pr in prs:
        if schema_hash in pr.body or model_hash in pr.body:
            return pr
    return None


def clean_up_old_prs():
    prs = GH_REPO.get_pulls(state="open", base="main")
    for pr in prs:
        if any([l for l in pr.labels if l.name == LABEL_UPDATE]):
            pr.create_comment(
                "Closing this PR as there are more recent changes to LSP JSON."
            )
            pr.edit(state="closed")


def clean_up_branches():
    branches = GH_REPO.get_branches()
    for branch in branches:
        if branch.name == UPDATER_BRANCH:
            branch.delete()


def create_and_apply_lsp_update() -> Union[str, None]:
    result = subprocess.run(["git", "checkout", "-b", UPDATER_BRANCH])
    if result.returncode != 0:
        return result.stderr

    result = subprocess.run([sys.executable, "-m", "nox", "--session", "update_lsp"])
    if result.returncode != 0:
        return result.stderr

    result = subprocess.run(
        ["git", "commit", "-a", "-m", "Update LSP model and packages to latest"]
    )
    if result.returncode != 0:
        return result.stderr

    result = subprocess.run(["git", "push", "--set-upstream", "origin", UPDATER_BRANCH])
    if result.returncode != 0:
        return result.stderr

    return None


def create_pr(schema_hash: str, model_hash: str):
    pr = GH_REPO.create_pull(
        title="Auto-update LSP",
        body=_get_update_pr_body(schema_hash, model_hash),
        head=UPDATER_BRANCH,
        base="main",
        maintainer_can_modify=True,
        draft=True,
    )
    pr.add_to_labels(LABEL_UPDATE, "no-changelog")
    return pr


def handle_update_error(schema_hash: str, model_hash: str, update_error: str):
    issues = GH_REPO.get_issues(state="open", labels=["lsp-update-error"])

    issue_found = None
    stale_issues = []
    for issue in issues:
        if schema_hash in issue.body and model_hash in issue.body:
            issue_found = issue
        else:
            stale_issues.append(issue)

    if issue_found:
        issue_found.create_comment(
            "\n".join(
                [
                    "Another attempt to generate LSP code failed.",
                    "Update failed with error:",
                    "",
                    "```",
                    update_error,
                    "```",
                ]
            )
        )
    else:
        issue_found = GH_REPO.create_issue(
            title="Auto-update LSP failed",
            body=_get_update_error_issue_body(update_error, schema_hash, model_hash),
            state="open",
            labels=[LABEL_UPDATE_ERROR, "bug", "triage-needed"],
        )

    for issue in stale_issues:
        issue.create_comment(
            "\n".join(
                [
                    "This issue is stale as the schema has changed.",
                    f"Closing in favor of {issue_found.url} .",
                ]
            )
        )
        issue.edit(state="closed")


def clean_up_issues(pr: github.PullRequest.PullRequest) -> None:
    issues = GH_REPO.get_issues(state="open", labels=["lsp-update-error"])

    for issue in issues:
        issue.create_comment(f"Resolved via {pr.url}")
        issue.edit(state="closed")


def main():
    old_schema = pathlib.Path(LSP_ROOT / "lsp.schema.json").read_text(encoding="utf-8")
    old_model = pathlib.Path(LSP_ROOT / "lsp.json").read_text(encoding="utf-8")
    new_schema = _get_content(MODEL_SCHEMA)
    new_model = _get_content(MODEL)
    schema_hash = get_hash(new_schema)
    model_hash = get_hash(new_model)

    schema_changed = is_schema_changed(old_schema, new_schema)
    model_changed = is_model_changed(old_model, new_model)

    if schema_changed or model_changed:
        # See if PR already published
        published_pr = already_published_pr(schema_hash, model_hash)
        if published_pr:
            print(f"Changes already in PR {published_pr.url}")
            return

        # Schema or model changed but there is no PR with the latest changes
        # Clean up any old PRs
        clean_up_old_prs()

        # Clean up any old branches from auto-updater
        clean_up_branches()

        # Create new branch and apply changes
        err = create_and_apply_lsp_update()
        if err:
            handle_update_error(schema_hash, model_hash, err)
            return

        # Create PR
        pr = create_pr(schema_hash, model_hash)
        print(f"Pull request created successfully: {pr.url}")

        # Clean-up old update error issues
        clean_up_issues(pr)
    else:
        print("No changes detected.")


if __name__ == "__main__":
    main()
