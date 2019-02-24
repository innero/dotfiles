HTTP_PROXY='http://localhost:1081'
source ~/.antigen.setup.zsh
# vars
export GOPATH=$HOME/go
# functions

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
alias s='sudo shutdown now' # quick shutdown

# aur: anaconda-git
alias an='source /opt/anaconda/bin/activate'
alias dan='source /opt/anaconda/bin/deactivate'
alias p='proxychains'
alias nf='neofetch'
alias getTime='date +%s'
alias gl='git log --graph --oneline --decorate'
alias l='ls -Flas'

alias ec='emacsclient -c' # start emacs client(available if "emacs --daemon" is running)

alias sudoH="sudo HOME=$HOME"
#
alias nb='newsboat'

psMShowTotalMemory() {
    free -h |awk '/^Mem:/ {print $3 " USED / " $2 " TOTAL"}'
}

alias psM='echo These are the biggest memory hogs!! && psMShowTotalMemory && ps axch -o cmd,%mem --sort=-%mem|head'
alias psC='echo These are the biggest CPU hogs!!! && ps axch -o cmd,%cpu --sort=-%cpu|head && echo BTW, here is your CPU temperature! && sensors' # needs installed lm_sensors
# FUNCTIONS

sp() {
    export https_proxy='localhost:1081'
    export http_proxy='localhost:1081'    
    export all_proxy="socks5://localhost:1080"
}
pyenv -v > /dev/null && eval "$(pyenv init -)" # setup pyenv
