# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
import pathlib
import urllib.request as url_lib

import nox


def _install_requirements(session: nox.Session):
    session.install("-r", "./requirements.txt")
    session.install("-r", "./generator/requirements.txt")
    session.install("-r", "./tests/requirements.txt")


@nox.session()
def tests(session: nox.Session):
    """Run tests for lsprotocol and generator."""
    _install_requirements(session)

    session.run("pip", "list")
    session.run("pytest", "./tests")


@nox.session()
def lint(session: nox.Session):
    """Lint all packages."""
    _install_requirements(session)

    session.install("isort", "black", "docformatter", "mypy")
    session.run("isort", "--profile", "black", "--check", ".")
    session.run("docformatter", "--check", "--recursive", ".")
    session.run("black", "--check", ".")

    session.run("mypy", "--strict", "lsprotocol")


@nox.session()
def format(session: nox.Session):
    """Format all code."""
    _format_code(session)


def _generate_model(session: nox.Session):
    session.install("-r", "./requirements.txt")
    session.install("-r", "./generator/requirements.txt")

    session.run("pip", "list")

    session.run("python", "-m", "generator", "--output", "./lsprotocol")
    _format_code(session)


def _format_code(session: nox.Session):
    session.install("isort", "black", "docformatter")

    session.run("isort", "--profile", "black", "./lsprotocol")
    session.run("black", "./lsprotocol")
    session.run("docformatter", "--in-place", "--recursive", "./lsprotocol")

    # Do it again because doc-formatter can move lines.
    session.run("isort", "--profile", "black", "./lsprotocol")
    session.run("black", "./lsprotocol")
    session.run("docformatter", "--in-place", "--recursive", "./lsprotocol")

    session.run("isort", "--profile", "black", ".")
    session.run("black", ".")
    session.run("docformatter", "--in-place", "--recursive", ".")


@nox.session()
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


@nox.session()
def build_lsp(session: nox.Session):
    """Generate lsprotocol package from LSP model."""
    _generate_model(session)


@nox.session()
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


@nox.session()
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
