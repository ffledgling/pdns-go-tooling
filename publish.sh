#!/bin/bash

set -euxo pipefail

PDNS_GO_REPO="https://github.com/ffledgling/pdns-go-test.git"

git clone "${PDNS_GO_REPO}"

# Sync the new bindings
rsync -avz out/go/ pdns-go-test/

# Get in the repo because we need to do a bunch of stuff
pushd pdns-go-test
git status
popd
