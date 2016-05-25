#set $PS1
PS1='\[\e[32;1m\]\u: \[\e[0m\e[31;1m\]\W\$\[\e[0m\] '

#aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

set bell-style none

#set PYTHONPATH
#PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
#export $PYTHONPATH

#set the path for LaTeX
#export PATH=$PATH:/Library/TeX/texbin

#set the path for my scripts
export PATH=$PATH:/Users/lwassink/bin
