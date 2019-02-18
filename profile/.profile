# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${HOME}/.scripts.local:${HOME}/.scripts:${PATH}"


export WORKON_HOME=$HOME/.local/share/virtualenvs # so that pyvenv in emacs can work on them

export EDITOR=vim
export BROWSER=firefox
[ -f .profile.local ] && source .profile.local


