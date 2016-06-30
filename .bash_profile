[[ -s ~/.bashrc ]] && source ~/.bashrc

rbenv init &> ~/.redirected_log

PATH="~/.rbenv/shims:/usr/local/sbin:${PATH}"
export PATH
