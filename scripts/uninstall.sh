#!/usr/bin/env bash

set -eu

remove()
{
    echo "Removing ${1}"
    rm -rf "${2}"
}

remove "asdf" "${HOME}/.asdf"
remove "mise" "${HOME}/bin/mise"
remove "sheldon" "${HOME}/bin/sheldon"
remove "venv" "${HOME}/.venv"
