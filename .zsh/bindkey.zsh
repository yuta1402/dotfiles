# use vi mode
bindkey -v

# set emacs-like keymap on viins
bindkey -M viins '^A' beginning-of-line
bindkey -M viins '^B' backward-char
bindkey -M viins '^D' delete-char-or-list
bindkey -M viins '^E' end-of-line
bindkey -M viins '^F' forward-char
bindkey -M viins '^N' down-line-or-history
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^U' backward-kill-line
bindkey -M viins '^W' backward-kill-word

# bind C-r to select history by peco
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER" | sed s/\\\\n/\\$'\n'/g)
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

# pkill by peco
function peco-pkill () {
  for pid in $(ps aux | peco | awk '{ print $2 }'); do
    kill $pid
    echo "killed ${pid}"
  done
}
alias pk="peco-pkill"

# snippets by peco
function peco-snippets () {
  local snippets="$HOME/.etc/snippets.txt"

  if [ ! -e "$snippets" ]; then
    echo "$snippets is not found."
    return 1
  fi

  local line="$(grep -v -e "^\s*#" -e "^\s*$" "$snippets"  | peco --query "$LBUFFER")"
  if [ -z "$line" ]; then
    return 1
  fi

  local selected="$(echo "$line" | sed "s/^\[[^]]*\] *//g")"
  if [ -z "$selected" ]; then
    return 1
  fi

  BUFFER="$selected"
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-snippets
bindkey '^K' peco-snippets

# change gcloud configurations by peco
function peco-change-gcloud-conf()
{
  selected=$(gcloud config configurations list | awk '{print $1}' | tail -n +2 | peco)
  if [ -z "${selected}" ]; then
    return 1
  fi
  gcloud config configurations activate "${selected}"
}
alias cgc="peco-change-gcloud-conf"

# change kubectx by peco
function peco-change-kubectx()
{
  selected=$(kubectx | awk '{print $1}' | peco)
  if [ -z "${selected}" ]; then
    return 1
  fi
  export SHOW_KUBE_INFO_PROMPT=1
  kubectx "${selected}"
}
alias ckc="peco-change-kubectx"

# change kubens by peco
function peco-change-kubens()
{
  selected=$(kubens | awk '{print $1}' | peco)
  if [ -z "${selected}" ]; then
    return 1
  fi
  kubens "${selected}"
}
alias ckn="peco-change-kubens"

function peco-grep-open()
{
  if [ -z "$@" ]; then
    echo "Usage:\n    $0 <word>"
    return 1
  fi

  selected=$(grep -r "$@" ./ | peco | awk -F':' '{print $1}')
  if [ -z "${selected}" ]; then
    return 1
  fi

  editor=${EDITOR:-nvim}
  ${editor} "${selected}"
}
alias greo="peco-grep-open"

# change AWS_PROFILE by peco
function peco-change-aws-profile()
{
  selected=$(cat ~/.aws/config | grep '\[profile .*]' | sed -e "s/\[profile \(.*\)\]/\1/g" | sort | peco)
  if [ -z "${selected}" ]; then
    return 1
  fi
  export AWS_PROFILE=${selected}
  export SHOW_AWS_INFO_PROMPT=1
  echo "switched to profile \"${selected}\""
}
alias awsp="peco-change-aws-profile"
alias cawsp="peco-change-aws-profile"
