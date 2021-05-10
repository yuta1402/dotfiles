#!/bin/bash

os_type="$(uname -s | tr "[:upper:]" "[:lower:]")"

if [ "${os_type}" == 'darwin' ]; then
    brew bundle --no-lock
else
    # TODO: Add support for linux
    echo "Your platform ( ${os_type} ) is not supported."
    exit 1
fi

installer_dir="$(dirname ${0})/installer"
install()
{
    echo "Installing ${1}"
    . "${installer_dir}/${1}.sh"
}

install "peco"
install "asdf"
install "pyenv"
