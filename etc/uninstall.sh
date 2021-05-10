#!/bin/bash

set -eu

remove()
{
    echo "removing ${1}"
    rm -rf ${2}
}

remove "asdf" "${HOME}"/.asdf
remove "venv" "${HOME}/.venv"
