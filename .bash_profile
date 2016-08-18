alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias la='ls -a'
alias ll='ls -lh'
alias ls='ls -GFh'
alias l='ls'
alias ..='cd ..'
alias v='vim'
alias ip='curl ipv4.icanhazip.com'
alias ipp='ifconfig | grep ".*inet.*netmask.*broadcast"'
alias send='~/Documents/Development/fun_scripts/send.sh'
alias rep='cd ~/Documents/Development/report_architecture/reports'

alias hv='cd ~/Documents/Development/hv3'
alias now='cd ~/Documents/Development/Now'
alias versus='cd ~/Documents/Development/versus/versus-android'
alias server='ssh ray@134.255.239.58'
alias dev='cd ~/Documents/Development'
alias fed='cd ~/Documents/Development/fedex-node'
alias goversus='~/Documents/Development/start-script'
alias endversus='~/Documents/Development/stop-script'
alias goiot='~/Documents/Development/start-iot'
alias iot='cd ~/Documents/Development/Masterprojekt-WS15-16-MMI-IoT/iot-frontend'
alias mmi='cd ~/Documents/Development/Masterprojekt-WS15-16-MMI-IoT/iot-infrastructure'
alias slite='cd ~/AndroidStudioProjects/SliteAlarm'
#alias mvim='open -a macvim'
alias mac-wlan='ssh ray@192.168.178.21'
alias mac='ssh ray@192.168.178.30'
alias funarea='cd /Users/ray/Documents/Development/fun_scripts'
export PATH=/usr/local/sbin:$PATH
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

alias ga.='git add .;git status'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m '
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gp='git pull'
alias gpu='git push'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias gb='git for-each-ref --sort=-committerdate refs/heads/'
alias real='cd ~/uni/realtime/uebung/ue1/rtr-template'

alias drmi="~/Documents/Development/fun_scripts/docker_remove_stuff.sh rmi"
alias drmc="~/Documents/Development/fun_scripts/docker_remove_stuff.sh rmc"
alias dsc="~/Documents/Development/fun_scripts/docker_remove_stuff.sh stopc"

test -f ~/.git-completion.bash && . $_
ulimit -n 4096

##
# Your previous /Users/ray/.bash_profile file was backed up as /Users/ray/.bash_profile.macports-saved_2015-10-28_at_13:16:01
##

# MacPorts Installer addition on 2015-10-28_at_13:16:01: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR="/usr/bin/vim"
cowsay 'Hey Ray'
