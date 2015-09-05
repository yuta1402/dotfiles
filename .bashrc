
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
