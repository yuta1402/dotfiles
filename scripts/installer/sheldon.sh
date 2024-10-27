#!/usr/bin/env bash

set -eu

PREFIX="${HOME}/bin"
VERSION="0.8.0"

# ref: https://github.com/rossmacarthur/sheldon?tab=readme-ov-file#pre-built-binaries
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to "${PREFIX}" --tag "${VERSION}"
