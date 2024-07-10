alias ...='cd ../../'
alias ....='cd ../../../'

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

alias today='date "+%Y%m%d"'

# k9s
alias k9s="LANG=en_US.UTF-8 k9s"
