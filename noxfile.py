# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
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


@nox.session()
def build(session):
    session.install("-r", "./requirements.txt")
    session.run(
        "python", "./generator", "./generator/lsp.json", "./lsprotocol/types.py"
    )
    session.run("isort", "--profile", "black", ".")
    session.run("black", ".")
    session.run("docformatter", "--in-place", "--recursive", ".")
