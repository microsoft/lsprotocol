# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
import json
import pathlib
import urllib.request as url_lib

import nox


def _install_requirements(session: nox.Session):
    session.install(
        "-r",
        "./packages/python/requirements.txt",
        "-r",
        "./generator/requirements.txt",
        "-r",
        "./tests/python/requirements.txt",
        "-r",
        "./tests/generator/requirements.txt",
    )
    session.run("pip", "list")


@nox.session()
def tests(session: nox.Session):
    """Run tests for lsprotocol and generator."""
    _install_requirements(session)
    session.run("pytest", "./tests")


@nox.session()
def lint(session: nox.Session):
    """Lint all packages."""
    _install_requirements(session)

    session.install("isort", "black", "mypy")
    session.run("isort", "--profile", "black", "--check", ".")
    session.run("black", "--check", ".")
    session.run("mypy", "--strict", "--no-incremental", "./packages/python/lsprotocol")


@nox.session()
def format(session: nox.Session):
    """Format all code."""
    _format_code(session)


def _generate_model(session: nox.Session):
    _install_requirements(session)

    session.run("python", "-m", "generator")
    _format_code(session)


def _format_code(session: nox.Session):
    session.install("isort", "black", "docformatter")

    session.run("isort", "--profile", "black", ".")
    session.run("black", ".")
    session.run("docformatter", "--in-place", "--recursive", ".")
    session.run("isort", "--profile", "black", ".")
    session.run("black", ".")

    # this is for the lsprotocol package only
    python_package_path = "./packages/python/lsprotocol"
    session.run("isort", "--profile", "black", python_package_path)
    session.run("black", python_package_path)
    session.run("docformatter", "--in-place", "--recursive", python_package_path)
    # do it again to correct any adjustments done by docformatter
    session.run("isort", "--profile", "black", python_package_path)
    session.run("black", python_package_path)


@nox.session()
def build(session: nox.Session):
    """Build lsprotocol package."""
    session.install("flit")
    with session.chdir("./packages/python"):
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
        "pip-compile",
        "--generate-hashes",
        "--upgrade",
        "./packages/python/requirements.in",
    )
    session.run(
        "pip-compile", "--generate-hashes", "--upgrade", "./generator/requirements.in"
    )
    session.run(
        "pip-compile",
        "--generate-hashes",
        "--upgrade",
        "./tests/python/requirements.in",
    )
    session.run(
        "pip-compile",
        "--generate-hashes",
        "--upgrade",
        "./tests/generator/requirements.in",
    )


@nox.session()
def create_plugin(session: nox.Session):
    """Create a new plugin."""
    name = input("Enter the name of the plugin: ")

    plugin_root = pathlib.Path(__file__).parent / "generator-plugins" / name
    plugin_root.mkdir(parents=True, exist_ok=True)

    init_text = "\n".join(
        [
            "# Copyright (c) Microsoft Corporation. All rights reserved.",
            "# Licensed under the MIT License.",
            "",
            f"from .{name}_utils import generate_from_spec as generate",
        ]
    )
    plugin_root.joinpath("__init__.py").write_text(init_text, encoding="utf-8")

    utils_text = "\n".join(
        [
            "# Copyright (c) Microsoft Corporation. All rights reserved.",
            "# Licensed under the MIT License.",
            "",
            "import pathlib",
            "from typing import List, Dict",
            "",
            "import generator.model as model",
            "",
            "",
            'PACKAGE_DIR_NAME = "lsprotocol"',
            "",
            "",
            "def generate_from_spec(spec: model.LSPModel, output_dir: str) -> None:",
            '    """Generate the code for the given spec."""',
            "    # key is the relative path to the file, value is the content",
            "    code: Dict[str, str] = generate_package_code(spec)",
            "    for file_name in code:",
            "        pathlib.Path(output_dir, PACKAGE_DIR_NAME, file_name).write_text(",
            '            code[file_name], encoding="utf-8"',
            "        )",
            "",
            "def generate_package_code(spec: model.LSPModel) -> List[str]:",
            "    return {",
            '        "src/lib.rs": "code for lib.rs",',
            "    }",
        ]
    )

    plugin_root.joinpath(f"{name}_utils.py").write_text(utils_text, encoding="utf-8")

    package_root = pathlib.Path(__file__).parent / "packages" / name / "lsprotocol"
    package_root.mkdir(parents=True, exist_ok=True)
    package_root.joinpath("README.md").write_text(
        f"# your generated code and other package files go under this directory.",
        encoding="utf-8",
    )

    tests_root = pathlib.Path(__file__).parent / "tests" / name
    tests_root.mkdir(parents=True, exist_ok=True)
    tests_root.joinpath("README.md").write_text(
        f"# your tests go under this directory.", encoding="utf-8"
    )

    launch_json_path = pathlib.Path(__file__).parent / ".vscode" / "launch.json"
    launch_json = json.loads(launch_json_path.read_text(encoding="utf-8"))

    for i in launch_json["inputs"]:
        if i["id"] == "plugin":
            i["options"].append(name)

    launch_json_path.write_text(json.dumps(launch_json, indent=4), encoding="utf-8")

    session.log(f"Created plugin {name}.")
