# ヒストリの設定
HISTSIZE=10000

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

if [ -f $HOME/bin/git-prompt.sh ]; then
	source $HOME/bin/git-prompt.sh
fi
export PS1='\u@\h[\w]$(__git_ps1 " (%s)")'$'\n\$ '

# asdf
if [ -f $HOME/.asdf/asdf.sh ]; then
    source $HOME/.asdf/asdf.sh
fi

if [ -d $HOME/bin ]; then
	export PATH=$PATH:$HOME/bin
fi

if [ -f $HOME/.bashrc.local ]; then
	source $HOME/.bashrc.local
fi
