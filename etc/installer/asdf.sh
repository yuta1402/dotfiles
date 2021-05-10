#!/bin/bash

set -eu

PREFIX="${HOME}/.asdf"
VERSION="v0.8.0"

install()
{
    name="${1}"
    version="${2:-$(asdf list all ${1} | tail -n 1)}"

    asdf plugin-add "${name}"
    asdf install "${name}" "${version}"
    asdf global "${name}" "${version}"
}

main()
{
    git clone https://github.com/asdf-vm/asdf.git "${PREFIX}" --branch "${VERSION}"
    source "${PREFIX}/asdf.sh"

    install "golang"
    install "nodejs"
    install "python" "3.9.5"
}

main
