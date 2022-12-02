# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
import os
import sys

sys.path.insert(0, os.path.abspath("../"))

from sphinx.application import Sphinx


project = 'lsprotocol'
author = 'Microsoft Corporation'
copyright = f'2022, {author}'
release = '2022.0.0a9'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.intersphinx"
]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

intersphinx_mapping = {
    "python": ("https://docs.python.org/3/", None),
}
# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'


def process_docstring(app: Sphinx, what: str, name, obj, options, lines):

    for i, line in enumerate(lines):
        if '@since' in line:
            lines[i] = line.replace("@since", ".. versionadded:: ")


def setup(app: Sphinx):
    app.connect('autodoc-process-docstring', process_docstring)
