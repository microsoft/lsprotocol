# How to ship a release

## Publishing to PyPI

1. Ensure that the project version number in [`packages/python/pyproject.toml`](packages/python/pyproject.toml) has been updated. Historically we have sometimes done this before the release. If not, change it now. Our versioning scheme is:
   | Release type | Version format | Notes |
   |--------------|----------------|-------|
   | Stable | YYYY.0.N | `N` starts at `0` and increments with each release during the year |
   | Release candidate | YYYY.0.NrcX | `YYYY.0.N` matches the upcoming stable release and `X` starts at `1` and increments with each RC |
   | Beta | YYYY.0.NbX | `YYYY.0.N` matches the upcoming stable release and `X` starts at `1` and increments with each beta release |
   | Alpha | YYYY.0.NaX | `YYYY.0.N` matches the upcoming stable release and `X` starts at `1` and increments with each alpha release |

1. Run the [`lsprotocol-Release` pipeline](https://dev.azure.com/devdiv/DevDiv/_build?definitionId=26767) against the `main` branch and check the `🚀 Publish Package` checkbox.
1. Wait for the pipeline to reach the `WaitForValidation` stage.
1. Run the `pygls` tests against the new release:
    1. `git clone https://github.com/openlawlibrary/pygls`
    1. `cd pygls`
    1. `poetry install --all-extras` -- Save the path to the generated virtualenv
    1. `poetry run poe test` -- Baseline. Note which tests fail, if any. Don't run their `test-pyodide` tests.
    1. Download the `lsprotocol-*.tar.gz` file from the Github Release created by the pipeline.
    1. Remove the `lsprotocol` directory in the Poetry virtualenv and create a new one using the `lsprotocol` directory within the `tar.gz`.
    1. Rerun the tests -- Compare against baseline.
1. Once you're satisfied with the release, publish it by going to the `lsprotocol-Release` pipeline run that you started earlier and pressing the blue `Review` button and then pressing the blue `Resume` button to initiate publishing.
1. Publish the GitHub release (it was created as a draft).

## Publishing to crates.io

1. Ensure that the project version number in [`packages/rust/lsprotocol/cargo.toml`](packages/rust/lsprotocol/Cargo.toml) has been updated. Historically we have sometimes done this before the release. If not, change it now. Our versioning scheme is shown below. Note that so far we have only shipped alpha/beta releases because the Rust version has only been tested in toy servers.:
   | Release type | Version format | Notes |
   |--------------|----------------|-------|
   | Stable | Major.Minor.0 | |
   | Beta | Major.Minor.0-beta.X | `Major.Minor.0` matches the upcoming stable release and `X` starts at `1` and increments with each beta release |
   | Alpha | Major.Minor.0-alpha.X | `Major.Minor.0` matches the upcoming stable release and `X` starts at `1` and increments with each alpha release |
1. `cd packages/rust/lsprotocol`
1. Optionally use `cargo publish --dry-run` to do all of the building and testing work without actually publishing to crates.io.
1. `cargo login`
1. `cargo publish`
