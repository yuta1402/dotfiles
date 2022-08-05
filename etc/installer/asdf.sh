#!/usr/bin/env bash

set -eu

PREFIX="${HOME}/.asdf"
VERSION="v0.10.2"

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

    install "golang" "1.19"
    install "nodejs" "16.16.0"
    install "python" "3.10.6"
}

main
