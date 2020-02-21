# Git branch bash completion
# Soure for the function: https://gist.github.com/JuggoPop/10706934
# Source for the file: https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash

  # Add git completion to aliases
  __git_complete gco _git_checkout
fi

_complete_ssh_hosts ()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | \
    sed -e s/,.*//g | \
    grep -v ^# | \
    uniq | \
    grep -v "\[" ;
  cat ~/.ssh/config | \
    grep "^Host " | \
    awk '{print $2}'
  `
  COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
  return 0
}
complete -F _complete_ssh_hosts ssh

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null | tail -n1) != "" ]] && echo -e "\033[91m*\033[00m"
  # [[ -z $(git status --porcelain) ]] || echo "*"
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)$(parse_git_dirty)/"
}

export PS1="\u \[\033[32m\]\W\[\033[34m\]\$(parse_git_branch)\[\033[00m\] $ "

# Aliases (duh!)
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias la='ls -a'
alias ll='ls -lh'
alias ls='ls -GFh'
alias l='ls'
alias ..='cd ..'
alias cd..='cd ..'
alias v='vim'
alias ip='curl ipv4.icanhazip.com'
alias ipp='ifconfig | grep ".*inet.*netmask.*broadcast"'
# alias myfind='find . -type f -not -path "./node_modules/*" -not -path "./build/*" | xargs grep'
alias myfind='fd --type f --exclude "prebid.js" --exclude "build/" --exclude "test/whitelabels.json" | xargs rg'
alias weather='curl -4 http://wttr.in/Berlin'
alias mkd='mkdir $1; cd $1'

alias dev='cd ~/Documents/Development'
alias fed='cd ~/Documents/Development/fedex-node'
alias cms='cd ~/Documents/Development/cms'
alias goversus='~/Documents/Development/start-script'
alias endversus='~/Documents/Development/stop-script'
alias timer='/Users/ray/Documents/Development/fun_scripts/kill.sh'

export PATH=/usr/local/sbin:$PATH
export GOPATH=/Users/ray/Documents/Development/go
alias rayfit="cd /Users/ray/Documents/Development/go/src/github.com/haargeeel/rayfit"
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

alias gopath="cd $GOPATH"
alias hnpi="while true; do date | rpipe 2; sleep 5; curl -s https://news.ycombinator.com | grep 'class=\"storylink\"' | sed 's/^.*storylink..//' | sed 's/^rel=.nofollow..//' | sed 's/\<\/a\>.*$//' | rpipe 2; sleep 360; done;"
alias hn="while true; do date | rpipe 2; sleep 5; curl -s https://news.ycombinator.com | grep 'class=\"storylink\"' | sed 's/^.*storylink..//' | sed 's/^rel=.nofollow..//' | sed 's/\<\/a\>.*$//'; sleep 360; done;"

alias ga.='git add .;git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m '
alias gca='git commit --amend --no-edit'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gp='git pull'
alias gpu='git push origin HEAD'
alias gpuf='git push -f origin'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gb='git for-each-ref --sort=-committerdate refs/heads/'
alias gdelete='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

alias mwti='mongo wl_versusio'

alias tmc="ssh -tt rasp 'bash tmuxcontrol.sh'"

alias vimrc="vim ~/.vimrc"
alias bashprofile="vim ~/.bash_profile"

# versus aliases
alias n1p="ssh n1p"
alias n2p="ssh n2p"
alias n1s="ssh n1s"
alias f1p="ssh f1p"
alias f2p="ssh f2p"
alias f3p="ssh f3p"
alias f1s="ssh f1s"
alias f2s="ssh f2s"
alias m1p="ssh m1p"
alias m2p="ssh m2p"
alias m3p="ssh m3p"
alias m1s="ssh m1s"
alias m2s="ssh m2s"
alias m3s="ssh m3s"

alias f1error="ssh f1p 'tail -f /var/log/fedex.err.log'"
alias f2error="ssh f2p 'tail -f /var/log/fedex.err.log'"
alias f3error="ssh f3p 'tail -f /var/log/fedex.err.log'"
alias pancholog="ssh -t lithium 'tail -f /var/log/pancho.log'"

ulimit -n 4096

export PATH="~/.yarn/bin:/opt/local/bin:/opt/local/sbin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/ray/Documents/Development/gcloud/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/ray/Documents/Development/gcloud/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/ray/Documents/Development/gcloud/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/ray/Documents/Development/gcloud/google-cloud-sdk/completion.bash.inc'
fi

# Please fix mongo
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_TYPE=en_US.UTF-8

# Surpress default shell warning on MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# No dups in a row anymore :tada:
HISTCONTROL=ignoreboth
# Bigger bash history
HISTSIZE=10000
HISTFILESIZE=10000

export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR="/usr/bin/vim"
cowsay 'Jo Ray'
