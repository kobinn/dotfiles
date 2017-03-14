# .bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:$HOME/repo/scripts"
export EDITOR="/usr/bin/vim"
export GREP_OPTIONS="--color=auto"
export LESS="-iMRF"
export HISTSIZE=4096
export HISTFILESIZE=4096
