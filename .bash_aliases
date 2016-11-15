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
alias shoes='/Applications/Shoes.app/Contents/MacOS/shoes'
alias vi="vim"
alias v="vim"
alias vim="vim"
alias g="g++"
alias ..='cd ..'
alias gpp='g++'
alias ag='ag --path-to-agignore ~/.agignore'
alias be='bundle exec'
alias bi='bundle install'
alias ber='bundle exec rspec'
alias vimclean='find . -type f -name "\.*sw[klmnop]" -delete; find . -type f -name "*.un~" -delete'
alias tm='tmux'
alias ta='tmux attach -t'
alias tn='tmux new'
alias dev='cd ~/developer'

# t todo list aliases
alias t='/usr/bin/python ~/tasks/t_by_sjl/t.py --task-dir ~/tasks --list tasks'
alias tcount='/usr/bin/python ~/tasks/t_by_sjl/t.py --task-dir ~/tasks --list tasks | wc -l'

# add standard gitignore
alias gitignore='source /Users/lwassink/configuration_files/git_init_setup.bash'
