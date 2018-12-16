
export PATH="${HOME}/.scripts.local:${HOME}/.scripts:${PATH}"


export WORKON_HOME=$HOME/.local/share/virtualenvs # so that pyvenv in emacs can work on them

export $EDITOR=emacs
emacs --version && emacs --daemon && export $EDITOR=ec # assuming you have an alias for emacsclient -c to ec
[ -f .profile.local ] && source .profile.local


