#!/usr/bin/env bash

set -eu

installer_dir="$(dirname "${0}")/installer"
install()
{
    echo "Installing ${1}"
    bash "${installer_dir}/${1}.sh"
}

install "asdf"
install "sheldon"
install "venv"
