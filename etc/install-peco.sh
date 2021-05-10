#!/bin/bash

PREFIX="${HOME}/bin"

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

peco_latest_version=$(get_latest_release "peco/peco")

os_type=$(uname -s | tr "[:upper:]" "[:lower:]")

case "${os_type}" in
    darwin)
        extension="zip"
        ;;
    linux)
        extension="tar.gz"
        ;;
    *)
        echo "$os_type Didn't match anything"
        exit 1
esac

case "$(uname -m)" in
    x*)
        os_machine="amd64"
        ;;
    i*)
        os_machine="386"
        ;;
    aarch64)
        os_machine="arm64"
        ;;
    armv7l)
        os_machine="arm"
        ;;
    *)
        echo "$(uname -m) didn't match anything machine"
        exit 1
esac

peco_basename=peco_${os_type}_${os_machine}
peco_filename=${peco_basename}.${extension}
url="https://github.com/peco/peco/releases/download/${peco_latest_version}/${peco_filename}"

mkdir -p "${PREFIX}"

wget -qO- "${url}" |
    tar -xvz -C "${PREFIX}" --strip-components 1 ${peco_basename}/peco
