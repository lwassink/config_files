parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
# set the command prompt
export PS1="\[\e[32;1m\]\W:\$(parse_git_branch)\[\e[0m\e[31;1m\]\$\[\e[0m\] "

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# no keyboard ding
set bell-style none

# cd will search these dirs after the current one
CDPATH=$HOME
export CDPATH

# path for postgress
PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"

# initialize rbenv
eval "$(rbenv init -)"


export NVM_DIR="/Users/lwassink/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
