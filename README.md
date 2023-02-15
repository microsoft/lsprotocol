# Language Server Protocol types code generator

This repository contains code to generate Language Server Protocol types and classes for various languages.

# Code Generator usage

## Usage

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
```

### using `nox`

This project uses `nox` as a task runner to run the code generator. You can install `nox` and run `build_lsp` session to generate code from spec available in the repo.

```console
> python -m pip install nox
> nox --session build_lsp
```

# Contributing plugins

You can contribute plugins by adding your code generator under `generator-plugins` directory. The `generator` module will load the plugin (`myplugin`), and call `myplugin.generate()` on it. See, the `python` plugin for layout.

This is the expected signature of generate:

```python
def (spec: model.LSPModel, output_dir: str) -> None: ...
```

Expected directory structure:

```
generator-plugins
├───myplugin
│      __init__.py (required)
│      <your code files>
│
└───python
       utils.py
       __init__.py

```

# Supported plugins

| Language | Plugin                  | Package                                                            | Notes  |
| -------- | ----------------------- | ------------------------------------------------------------------ | ------ |
| Python   | generator-plugin.python | ![PyPI](https://img.shields.io/pypi/v/lsprotocol?label=lsprotocol) | Active |
