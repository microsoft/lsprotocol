# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
import pathlib
import urllib.request as url_lib

import nox


@nox.session()
def run_test(session):
    session.install("-r", "./requirements.txt")
    session.install("-r", "./tests/requirements.txt")
    session.run("pytest", "./tests")


@nox.session()
def lint(session):
    session.install("isort", "black", "docformatter")
    session.run("isort", "--profile", "black", "--check", ".")
    session.run("docformatter", "--check", ".")
    session.run("black", "--check", ".")


def _build(session):
    session.run(
        "python", "-m", "generator", "./generator/lsp.json", "./lsprotocol/types.py"
    )

    session.install("isort", "black", "docformatter")
    session.run("isort", "--profile", "black", ".")
    session.run("docformatter", "--in-place", "--recursive", ".")
    session.run("black", ".")


@nox.session()
def build(session):
    session.install("-r", "./requirements.txt")
    _build(session)


def _get_content(uri) -> str:
    with url_lib.urlopen(uri) as response:
        content = response.read()
        if isinstance(content, str):
            return content
        else:
            return content.decode("utf-8")


MODEL_SCHEMA = "https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.schema.json"
MODEL = "https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.json"


@nox.session()
def update(session):
    session.install("-r", "./requirements.txt")

    model_schema_text: str = _get_content(MODEL_SCHEMA)
    model_text: str = _get_content(MODEL)

    schema_path = pathlib.Path(__file__).parent / "generator" / "lsp.schema.json"
    model_path = schema_path.parent / "lsp.json"

    schema_path.write_text(model_schema_text.replace("\t", "    "), encoding="utf-8")
    model_path.write_text(model_text.replace("\t", "    "), encoding="utf-8")
    _build(session)
