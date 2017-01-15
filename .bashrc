alias df='df -h'

case "${OSTYPE}" in
	darwin*)
		alias ls='ls -G'
		alias ll='ls -lG'
		alias la='ls -laG'
		;;
	linux*)
		alias ls='ls -v --color'
		alias ll='ls -lv --color'
		alias la='ls -alv --color'
		;;
esac

if [ -f $HOME/bin/git-prompt.sh ]; then
	source $HOME/bin/git-prompt.sh
fi
export PS1='\u@\h[\w]$(__git_ps1 " (%s)")'$'\n\$ '

if [ -d $HOME/bin ]; then
	export PATH=$PATH:$HOME/bin
fi

if [ -f $HOME/.bashrc.local ]; then
	source $HOME/.bashrc.local
fi
