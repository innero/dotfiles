
export PATH="${HOME}/.scripts.local:${HOME}/.scripts:${PATH}"


export WORKON_HOME=$HOME/.local/share/virtualenvs # so that pyvenv in emacs can work on them

$EDITOR="/usr/bin/emacs"
emacs --version && emacs --daemon && $EDITOR="/usr/bin/emacsclient -c"
[ -f .profile.local ] && source .profile.local


