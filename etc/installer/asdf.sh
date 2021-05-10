#!/bin/bash

PREFIX="${HOME}/.asdf"
VERSION="v0.8.0"

install()
{
    asdf plugin-add ${1}
    asdf install ${1} $(asdf list all ${1} | tail -n 1)
    asdf global ${1} $(asdf list ${1} | tail -n 1)
}

git clone https://github.com/asdf-vm/asdf.git "${PREFIX}" --branch "${VERSION}"
. ${HOME}/.asdf/asdf.sh

install "golang"
install "nodejs"
