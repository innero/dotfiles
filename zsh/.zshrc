
if [ ! -f ~/.antigen.zsh ]; then
    curl -L raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh > ~/.antigen.zsh
fi
source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

#
antigen bundle arzzen/calc.plugin.zsh

# Load the theme.
antigen theme aussiegeek

# Tell Antigen that you're done.
antigen apply


# functions

[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local


# aur: anaconda-git
alias an='source /opt/anaconda/bin/activate root && anaconda-navigator &'
alias dan='source /opt/anaconda/bin/deactivate root '


alias getTime='date +%s'
alias gl='git log --graph --oneline --decorate'
alias ls='ls -Flas'

psMShowTotalMemory() {
    free -h |awk '/^Mem:/ {print $3 " USED / " $2 " TOTAL"}'
}

alias psM='echo These are the biggest memory hogs!! && psMShowTotalMemory && ps axch -o cmd,%mem --sort=-%mem|head'
alias psC='echo These are the biggest CPU hogs!!! && ps axch -o cmd,%cpu --sort=-%cpu|head && echo BTW, here is your CPU temperature! && sensors | awk "/^temp1/ {print $2}"| head -1' # needs installed lw_sensors
# FUNCTIONS

s5() {
    export all_proxy="socks5://localhost:1080"
}

