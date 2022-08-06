#!/usr/bin/env bash

set -eu

PREFIX="${HOME}/.asdf"
VERSION="v0.10.2"

install_plugins()
{
    for plugin in $(cat ${HOME}/.tool-versions | awk '{print $1}'); do
        if ! [ -d "${HOME}/.asdf/plugins/${plugin}" ]; then
            asdf plugin-add "${plugin}"
        fi
    done

    asdf install
}

install_asdf()
{
    if ! [ -d "${HOME}/.asdf" ]; then
        git clone https://github.com/asdf-vm/asdf.git "${PREFIX}" --branch "${VERSION}"
    fi
    source "${PREFIX}/asdf.sh"
}

main()
{
    install_asdf
    install_plugins
}

main
