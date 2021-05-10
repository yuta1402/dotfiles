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

# ディレクトリ名だけで cd できるように設定
setopt auto_cd

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - --no-rehash)"
  eval "$(pyenv virtualenv-init - --no-rehash)"
fi

# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
    . $HOME/.asdf/asdf.sh
fi

if [ -d $HOME/bin ]; then
    export PATH=$PATH:$HOME/bin
fi
