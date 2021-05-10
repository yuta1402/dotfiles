#!/usr/bin/env bash

set -eu

os_type="$(uname -s | tr "[:upper:]" "[:lower:]")"

if [ "${os_type}" == 'darwin' ]; then
    brew bundle --no-lock
elif [ "${os_type}" == 'linux' ]; then
    # TODO: Add support for linux
    echo ""
else
    echo "Your platform ( ${os_type} ) is not supported."
    exit 1
fi

installer_dir="$(dirname ${0})/installer"
install()
{
    echo "Installing ${1}"
    bash "${installer_dir}/${1}.sh"
}

install "asdf"
install "venv"
