# Author: Luke Wassink
# my aliases
# linked to by my .bashrc

alias pep='ps -Aa | grep'
alias pss='ps -aA | grep'
alias pa='ps -aA'
alias ps="ps -o pid,user,time,command=PROCESS"
alias l="ls -GF"
alias ls="ls -GF"
alias la="ls -GFA"
alias ll="ls -lFG"
alias vi="vim"
alias shoes='/Applications/Shoes.app/Contents/MacOS/shoes'
alias v="vim"

# t todo list aliases
alias t='/usr/bin/python ~/tasks/t_by_sjl/t.py --task-dir ~/tasks --list tasks'
alias tcount='/usr/bin/python ~/tasks/t_by_sjl/t.py --task-dir ~/tasks --list tasks | wc -l'

# add standard gitignore
alias gitignore='source /Users/lwassink/configuration_files/git_init_setup.bash'
