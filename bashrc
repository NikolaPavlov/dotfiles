export VISUAL=nvim
export EDITOR=nvim

alias w='whois'
alias v='nvim'
alias ..='cd ..'
alias e='exit'
alias c='clear'
alias cl='clear'
alias r='ranger'
alias a='alsamixer'
alias s='startx'
alias rm='rm -Irv'
alias off='poweroff'
alias cp='cp -i'
alias mv='mv -i'
alias tt='xfce4-terminal'
alias ps='ps auxf'
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias du='ncdu'
alias df='pydf'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias l='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias free='free -m'
alias myip='curl http://ipecho.net/plain; echo'
alias hardware='sudo lshw -short'

alias p1='ping 192.168.1.1'
alias p8='ping 8.8.8.8 -c 100'
alias netstat='netstat -antp'

alias todo='v $HOME/Documents/Repos/ToDo/todo.vim'
alias journal='v $HOME/Documents/Repos/Journal/journal.vim'
# Pacman
alias install='sudo pacman -S '
alias remove='sudo pacman -Rs '
alias search='sudo  pacman -Ss '
alias u='yay'
# Python
alias p='python3.7'
alias i='ipython'
# PipEnv
alias pe='pipenv'
# Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gpush='git push'
alias gpull='git pull'
alias glog='git log'
alias gitreset='git reset --hard HEAD'
# Docker
alias d='docker'
alias di='docker images'
alias drmc='docker rm -f $(docker ps -a -q)' # remove all images
alias drmi='docker rmi -f $(docker images -q)' # remove image
alias dc='docker-compose'
# Encryption
alias secret='sudo mount -t ecryptfs EncFolder/ EncFolder/'
#TODO: Update secret alias with full parameters
alias playlist='youtube-dl -ci -o "%(title)s-%(id)s.%(ext)s" --yes-playlist --audio-format mp3 --audio-quality 0'
alias mp3='youtube-dl -i -f bestaudio --extract-audio --audio-format mp3 --no-check-certificate'
alias dl='~/.local/bin/spotdl --song'
# Django
alias cookie='cookiecutter https://github.com/pydanny/cookiecutter-django'
alias pm='python manage.py'
alias pmr='python manage.py runserver'
alias pmmm='python manage.py makemigrations'
alias pmm='python manage.py migrate'
alias t='python manage.py test'
# MPSYouTube
alias yt='mpsyt'

# ex - archive extractor
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xvf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# colorfull man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# powerline-go https://github.com/justjanne/powerline-go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go  \
        -shell bash \
        -newline \
        -mode patched \
        -modules venv,user,host,cwd,git \
        -modules-right docker,dotenv \
        -condensed \
        -error $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# autojump
. /usr/share/autojump/autojump.bash

# vi mode in terminal
set -o vi

# change dirs withowth cd instead with ..
shopt -s autocd

# disable <ctrl-s> in xfce4-terminal (legacy software control flow)
stty -ixon

# Complete after sudo
complete -cf sudo

# Links
# http://bropages.org/ ---> command line examples

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Ruby gems added to $PATH
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
