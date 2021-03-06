# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
import pathlib
import urllib.request as url_lib

import nox


@nox.session(python="3.7")
def tests(session: nox.Session):
    """Run tests for lsprotocol and generator."""
    session.install("-r", "./requirements.txt")
    session.install("-r", "./generator/requirements.txt")
    session.install("-r", "./tests/requirements.txt")
    session.run("pytest", "./tests")


@nox.session(python="3.7")
def lint(session: nox.Session):
    """Lint all packages."""
    session.install("isort", "black", "docformatter")
    session.run("isort", "--profile", "black", "--check", ".")
    session.run("docformatter", "--check", ".")
    session.run("black", "--check", ".")


def _generate_model(session: nox.Session):
    session.install("-r", "./requirements.txt")
    session.install("-r", "./generator/requirements.txt")
    session.install("isort", "black", "docformatter")

    session.run("python", "-m", "generator", "--output", "./lsprotocol/types.py")
    session.run("isort", "--profile", "black", ".")
    session.run("docformatter", "--in-place", "--recursive", ".")
    session.run("black", ".")


@nox.session(python="3.7")
def build(session: nox.Session):
    """Build lsprotocol package."""
    session.install("flit")
    session.run("flit", "build")


def _get_content(uri) -> str:
    with url_lib.urlopen(uri) as response:
        content = response.read()
        if isinstance(content, str):
            return content
        else:
            return content.decode("utf-8")


MODEL_SCHEMA = "https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.schema.json"
MODEL = "https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.json"


@nox.session(python="3.7")
def build_lsp(session: nox.Session):
    """Generate lsprotocol package from LSP model."""
    _generate_model(session)


@nox.session(python="3.7")
def update_lsp(session: nox.Session):
    """Update the LSP model and generate the lsprotocol content."""
    session.log("Downloading LSP model schema.")
    model_schema_text: str = _get_content(MODEL_SCHEMA)
    session.log("Downloading LSP model.")
    model_text: str = _get_content(MODEL)

    schema_path = pathlib.Path(__file__).parent / "generator" / "lsp.schema.json"
    model_path = schema_path.parent / "lsp.json"

    schema_path.write_text(model_schema_text.replace("\t", "    "), encoding="utf-8")
    model_path.write_text(model_text.replace("\t", "    "), encoding="utf-8")
    _generate_model(session)


@nox.session(python="3.7")
def update_packages(session: nox.Session):
    """Update dependencies of generator and lsprotocol."""
    session.install("wheel", "pip-tools")
    session.run(
        "pip-compile", "--generate-hashes", "--upgrade", "./generator/requirements.in"
    )
    session.run("pip-compile", "--generate-hashes", "--upgrade", "./requirements.in")
    session.run(
        "pip-compile", "--generate-hashes", "--upgrade", "./tests/requirements.in"
    )
