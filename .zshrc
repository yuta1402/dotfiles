# 補完を有効にする
autoload -U compinit && compinit
# 補完で小文字でも大文字でもマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# ビープ音をオフにする
setopt nobeep

# ヒストリの設定
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# 異なるウィンドウでヒストリを共有する
setopt share_history
# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# historyコマンドは履歴に残さない
setopt hist_no_store

autoload -Uz colors
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# PROMPT変数内で変数参照
setopt prompt_subst

precmd () { vcs_info }

PROMPT='%n@%m[%~] ${vcs_info_msg_0_}
$ '

alias df='df -h'

case "${OSTYPE}" in
    darwin*)
        alias ls='ls -hG'
        alias ll='ls -lhG'
        alias la='ls -lahG'
        ;;
    linux*)
        alias ls='ls -hv --color'
        alias ll='ls -lhv --color'
        alias la='ls -alhv --color'
        ;;
esac

# bind C-r to select history by peco
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# bind C-] to select repo directory by peco
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

if [ -d $HOME/bin ]; then
	export PATH=$PATH:$HOME/bin
fi

if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
