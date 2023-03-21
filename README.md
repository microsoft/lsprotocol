# Language Server Protocol types code generator

This repository contains code to generate Language Server Protocol types and classes for various languages.

# Code Generator usage

## Usage

You will need a python environment to run the generator. Here are the steps:

1. Clone this repository.
2. Create environment using `python -m venv .venv` in the root directory of this project.
3. Activate the environment using `.venv\Scripts\activate` on Windows or `.venv/bin/activate` on Linux/Mac.
4. Run this command to install `nox`: `python -m pip install nox`
5. Run this command to install dependencies:

```
python -m pip install -r ./packages/python/requirements.txt -r ./generator/requirements.txt -r ./tests/python/requirements.txt -r ./tests/generator/requirements.txt
```

### Command line

Clone this repository and run `generator` like a module.

```console
>python -m generator --help
usage: __main__.py [-h] [--schema SCHEMA] [--model MODEL]

Generate types from LSP JSON model.

optional arguments:
  -h, --help            show this help message and exit
  --schema SCHEMA, -s SCHEMA
                        Path to a model schema file. By default uses packaged
                        schema.
  --model MODEL, -m MODEL
                        Path to a model JSON file. By default uses packaged
                        model file.
  --plugin PLUGIN, -p PLUGIN
                        Name of a builtin plugin module. By default uses all
                        plugins.
```

### using `nox`

This project uses `nox` as a task runner to run the code generator. You can install `nox` and run `build_lsp` session to generate code from spec available in the repo.

```console
> python -m pip install nox
> nox --session build_lsp
```

You can format code, run tests, and other tasks using `nox` as well.

# Contributing plugins

## Adding a new plugin

Follow these steps to generate boiler plate code for new plugin:

1. Create a virtual environment for python using python 3.7 and activate that environment.
    1. If you have python extension for VS Code installed then run `Python: Create Environment` command. Be sure to select all the `requirements.txt` files in the repo. This should, install all packages needed and select the environment for you.
1. Ensure `nox` is installed.
    1. Run `nox --list`, is nox is installed oyu should see a list of available sessions. Otherwise, run `python -m pip install nox` from the python 3.7 environment you created above.
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

# Supported plugins

| Language | Plugin                  | Package                                                                                             | Notes  |
| -------- | ----------------------- | --------------------------------------------------------------------------------------------------- | ------ |
| Python   | generator-plugin.python | [![PyPI](https://img.shields.io/pypi/v/lsprotocol?label=lsprotocol)](https://pypi.org/p/lsprotocol) | Active |
