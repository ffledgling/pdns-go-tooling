#!/bin/bash

set -euxo pipefail

GITHUB_USERNAME="ffledgling"
PDNS_GO_REPO="pdns-go"
PDNS_GO_REPO_URL="https://github.com/${GITHUB_USERNAME}/${PDNS_GO_REPO}.git"

git clone "${PDNS_GO_REPO_URL}"

# Sync the new bindings
rsync -avz out/go/ ${PDNS_GO_REPO}

# Get in the repo because we need to do a bunch of stuff
pushd pdns-go-test

git status

# Add details before commiting
git config user.email "ffledgling+travis-pdns-go@gmail.com"
git config user.name "Anhad Jai Singh (via automation)"


#TODO: Add version *from* which these bindings were generated, using something like `git tag -l --points-at HEAD`
git add *
git diff --quiet && git diff --staged --quiet || git commit -am 'Automated release of pdns-go bindings'

# Show last 5 commits
git log -5 --decorate --all

# We don't want to leak the token in the logs
set +x
git remote add write-remote https://${PDNS_GO_SERVICE_TOKEN}@github.com/${GITHUB_USERNAME}/${PDNS_GO_REPO}.git
set -x

# But we also want to see the remote was added successfully
git remote

# Publish to master, the --set-upstream flag is required for the "first" commit into a remote repo
# https://stackoverflow.com/a/6157755/1220089
# TODO: Figure out why
git push --set-upstream write-remote master

popd
