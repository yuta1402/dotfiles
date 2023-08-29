ZSHDIR="${HOME}/.zsh"

source "${ZSHDIR}/alias.zsh"
source "${ZSHDIR}/base.zsh"
source "${ZSHDIR}/bindkey.zsh"
source "${ZSHDIR}/prompt.zsh"

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
