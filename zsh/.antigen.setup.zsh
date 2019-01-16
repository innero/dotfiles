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
antigen bundle zsh-users/zsh-autosuggestions
#
antigen bundle arzzen/calc.plugin.zsh
# Load the theme.
antigen theme ys

# Tell Antigen that you're done.
antigen apply


