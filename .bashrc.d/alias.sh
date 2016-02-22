alias docker='sudo docker'
alias dl='docker ps -l -q'
alias l='ls -laF --color'
alias rm='rm -vi'
alias mv='mv -vi'
alias cp='cp -vi'
alias diff='colordiff -u'

alias wget='wget --content-disposition --max-redirect 10'
alias curl='curl -c ~/.curlcookie -b ~/.curlcookie -L'

# Shortcut
alias yesterday='date --date "1 day ago"'
alias yst='yesterday'
alias now-iso='date +"%Y-%m-%dT%H:%M:%S"'
alias today-iso='date +"%Y-%m-%d"'
alias yesterday-iso='date +"%Y-%m-%d"'
alias yst-iso='yesterday-iso'
alias unixtime='date +"%s"'
alias open-tunnel='start-stop-daemon --start --background --make-pidfile --pidfile /var/run/sshtunnel.pid --exec /usr/local/bin/sshtunnel -- '
alias close-tunnel='start-stop-daemon --stop --pidfile /var/run/sshtunnel.pid'
alias pingle='ping google.com'
alias clipboard='xsel --clipboard --input'
if which rlwrap >/dev/null 2>&1 ; then
    alias gosh='rlwrap -s 10000 gosh'
fi

# Git
git_status='git status -bs'
alias gstat="${git_status}"
alias gst="${git_status}"
alias gdf='git diff'
alias gcm='git commit -m'
alias glg="git log --stat"
alias glgr="git log --graph --date-order --pretty=format:'%Cblue%h %Cgreen%ci %Cred%an %Cblue%m %Creset%s %Cred%d'"
