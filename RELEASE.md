# Release Process

1. Run and generate the latest from spec. Then clone pygls, run their setup, then install the generated lsprotocol, run tests and see if anything breaks. If something breaks it is likely in pygls, just update and ship

There isn't a wiki. I just follow the guidelines on pygls, to setup the testing and run tests. Then install the local lsprotocol version on top of it, run tests again to see if anything breaks.

You will want to duplicate the azure-publish pipeline for lsprotocol package (not the generator). the generator is not published.
