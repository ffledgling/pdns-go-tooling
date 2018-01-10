#!/bin/bash

set -euxo pipefail

# We use HTTPS because we can clone unauth'd
GIT_REPO='https://github.com/PowerDNS/pdns.git'

git clone ${GIT_REPO}

pushd pdns
# The current release doesn't have the swagger-spec in it, so let's use master for now
#LATEST_RELEASE_TAG="$(git tag --list auth-* --sort='version:refname' | grep -E -v 'rc|alpha|beta' | tail -1)"
#git checkout ${LATEST_RELEASE_TAG}
popd
