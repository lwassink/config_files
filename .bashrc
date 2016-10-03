# set the command prompt
export PS1="\[\e[32;1m\]\u: \[\e[0m\e[31;1m\]\W\$\[\e[0m\] "

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
