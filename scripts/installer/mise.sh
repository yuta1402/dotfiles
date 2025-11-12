#!/usr/bin/env bash

set -eu

PREFIX="${HOME}/bin"
VERSION="v2025.11.3"

# ref: https://mise.jdx.dev/installing-mise.html#https-mise-run
curl https://mise.run | MISE_INSTALL_PATH="${PREFIX}/mise" MISE_VERSION="${VERSION}" sh
