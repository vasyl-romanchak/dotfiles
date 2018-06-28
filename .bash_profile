
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source /Volumes/mhdev/devutils/bash_profile/.bashrc

alias ag='/usr/local/Cellar/the_silver_searcher/2.1.0/bin/ag' 
alias ctags="`brew --prefix`/bin/ctags"
alias vi='nvim'
alias dotfiles='/usr/bin/git --git-dir=/Users/vasyl.romanchak/.dotfiles/ --work-tree=/Users/vasyl.romanchak'
