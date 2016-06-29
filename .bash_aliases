# Author: Luke Wassink
# my aliases
# linked to by my .bashrc

alias pep='ps -Aa | grep'
alias pss='ps -aA | grep'
alias pa='ps -aA'
alias ps="ps -o pid,user,time,command=PROCESS"
alias ls="ls -GF"
alias la="ls -GFA"
alias ll="ls -lFG"
alias vi="vim"
alias shoes='/Applications/Shoes.app/Contents/MacOS/shoes'

# t todo list aliases
alias t='/usr/bin/python ~/tasks/t_by_sjl/t.py --task-dir ~/tasks --list tasks'
alias tcount='/usr/bin/python ~/tasks/t_by_sjl/t.py --task-dir ~/tasks --list tasks | wc -l'
