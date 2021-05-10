#!/usr/bin/env bash

set -eu

PREFIX="${HOME}/.asdf"
VERSION="v0.8.0"

install()
{
    name="${1}"
    asdf plugin-add "${name}"

    version="${2:-$(asdf latest ${name})}"

    asdf install "${name}" "${version}"
    asdf global "${name}" "${version}"
}

main()
{
    git clone https://github.com/asdf-vm/asdf.git "${PREFIX}" --branch "${VERSION}"
    source "${PREFIX}/asdf.sh"

    install "golang"
    install "nodejs"
    install "python"
}

main
