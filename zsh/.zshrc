source ~/.antigen.setup.zsh

# functions

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local


# aur: anaconda-git
alias an='source /opt/anaconda/bin/activate root'
alias dan='source /opt/anaconda/bin/deactivate root '
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

s5() {
    export all_proxy="socks5://localhost:1080"
}

