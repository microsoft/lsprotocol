# Language Server Protocol Types implementation for Crystal

`lsprotocol` is a Crystal implementation of object types used in the Language Server Protocol (LSP). This repository contains the code generator and the generated types for LSP.

## Overview

LSP is used by editors to communicate with various tools to enables services like code completion, documentation on hover, formatting, code analysis, etc. The intent of this library is to allow you to build on top of the types used by LSP. This repository will be kept up to date with the latest version of LSP as it is updated.

## Installation

```yaml
dependencies:
  kemal:
    github: nobodywasishere/lsprotocol.cr
```

## Usage

### Using LSP types

```crystal
require "lsprotocol"

position = LSP::Position.new(line: 10, character: 3)
```
