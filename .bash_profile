
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias la='ls -a'
alias ll='ls -lh'
alias l='ls -F'
alias ..='cd ..'
alias v='vim'
alias ip='curl ipv4.icanhazip.com'

alias hv='cd ~/Documents/Development/hv3'
alias now='cd ~/Documents/Development/Now'
alias versus='cd ~/Documents/Development/versus/versus-android'
alias server='ssh ray@134.255.239.58'
alias dev='cd ~/Documents/Development'
alias fed='cd ~/Documents/Development/fedex-node'
alias slite='cd ~/AndroidStudioProjects/SliteAlarm'
alias mvim='open -a macvim'
alias mac='ssh ray@192.168.178.23'
export PATH=/usr/local/sbin:$PATH
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

alias ga.='git add .;git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m '
alias gs='git status'
alias gco='git checkout'
alias gp='git pull'
alias gpu='git push'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gb='git for-each-ref --sort=-committerdate refs/heads/'
alias real='cd ~/uni/realtime/uebung/ue1/rtr-template'

test -f ~/.git-completion.bash && . $_
