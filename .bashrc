alias df='df -h'

case "${OSTYPE}" in
	darwin*)
		alias ls='ls -G'
		alias ll='ls -lG'
		alias la='ls -laG'
		;;
	linux*)
		alias ls='ls --color'
		alias ll='ls -l --color'
		alias la='ls -la --color'
		;;
esac

export PS1='\u@\h[\w]\n\$ '

if [ -d $HOME/bin ]; then
	export PATH=$PATH:$HOME/bin
fi

if [ -f $HOME/.bashrc.local ]; then
	source $HOME/.bashrc.local
fi
