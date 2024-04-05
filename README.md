# Language Server Protocol types code generator & packages

This repository contains packages and tools to generate code for [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) types and classes.

It simplifies the creation of language servers for different programming languages by providing a robust and easy-to-use type generation system.

➡️ For instructions on how to use the **code generator**, refer to the [Usage](#usage) section.

➡️ For instructions on existing **plugins and packages** for different languages, refer to the table in the [Existing packages/plugins](#existing-packagesplugins) section.

➡️ For instructions on how to **create additional plugins** to support more languages, refer to the [Contributing plugins](#contributing-plugins) section.

# Code Generator Usage

You will need a Python environment to run the generator. Here are the steps:

1. Create a Python environment: `python -m venv .venv`
    > **Note**: Python 3.8 is the minimum supported version
2. Activate the environment: `.venv\Scripts\activate` (Windows) or `source .venv/bin/activate` (Linux/macOS)
3. Install this repo's tool: `python -m pip install git+https://github.com/microsoft/lsprotocol.git`
4. Run your plugin. You can use the [command line](#command-line) or [Nox](#using-nox) to run the generator.

## Command line

Clone this repository and run `generator` as a Python module.

For example: `python -m generator --plugin dotnet --output-dir ./code`

```console
>python -m generator --help
usage: __main__.py [-h] [--model [MODEL [MODEL ...]]] --plugin PLUGIN
                   [--output-dir OUTPUT_DIR]

Generate types from LSP JSON model.

optional arguments:
  -h, --help            show this help message and exit
  --model [MODEL [MODEL ...]], -m [MODEL [MODEL ...]]
                        Path to a model JSON file. By default uses packaged
                        model file.
  --plugin PLUGIN, -p PLUGIN
                        Name of a builtin plugin module. By default uses all
                        plugins.
  --output-dir OUTPUT_DIR, -o OUTPUT_DIR
                        Path to a directory where the generated content is
```

## Using Nox

This project uses Nox as a task runner to run the code generator. You can install Nox and run a `build_lsp` session to generate code from the spec available in this repo.

```console
> python -m pip install nox
> nox --session build_lsp
```

You can also use Nox to format code, run tests and run various tasks. Run `nox --list` to see all available tasks.

# Contributing plugins

## Adding a new plugin

Follow these steps to generate boilerplate code for a new plugin:

1. Create a virtual environment for Python using Python >= 3.8 and activate that environment.
    1. If you are using the Python extension for VS Code, you can just run the **Python: Create Environment** command from the Command Palette. Be sure to select all the `requirements.txt` files in the repo. This command will install all packages needed and select the newly created environment for you.
1. Ensure `nox` is installed.
    1. Run `nox --list` in the terminal. If Nox is installed, you should see a list of all available sessions. Otherwise, run `python -m pip install nox` in the activated environment you created above.
1. Run `nox --session create_plugin` and follow the prompts to create a new plugin.

Example:

```console
> nox --session create_plugin
nox > Running session create_plugin
nox > Creating virtual environment (virtualenv) using python.exe in .nox\create_plugin
Enter the name of the plugin: java
nox > Created plugin java.
nox > Session create_plugin was successful.
```

# Existing packages/plugins

Below is the list of plugins already created using this package, with their respective package links.

| Language         | Plugin Module            | Package                                                                                             | Status            | Documentation                                               |
| ---------------- | ------------------------ | --------------------------------------------------------------------------------------------------- | ----------------- | ----------------------------------------------------------- |
| Python           | generator.plugins.python | [![PyPI](https://img.shields.io/pypi/v/lsprotocol?label=lsprotocol)](https://pypi.org/p/lsprotocol) | Active            | [Python package README](./packages/python/README.md)        |
| Rust             | generator.plugins.rust   | [![Crates](https://img.shields.io/crates/v/lsprotocol)](https://crates.io/crates/lsprotocol)        | Active            | [Rust package README](./packages/rust/lsprotocol/README.md) |
| Dotnet           | generator.plugins.dotnet | <in development>                                                                                    | Under development |
| <in development> |
