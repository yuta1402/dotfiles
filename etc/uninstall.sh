#!/bin/bash

set -eu

remove()
{
    echo "removing ${1}"
    rm -rf ${2}
}

remove "peco" "${HOME}/.pyenv"
remove "asdf" "${HOME}"/.asdf
