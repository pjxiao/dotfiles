# misc
alias docker='sudo docker'
alias dl='docker ps -l -q'
alias l='ls -laF --color'
alias rm='rm -vi'
alias mv='mv -vi'
alias cp='cp -vi'
alias diff='colordiff -u'
alias ssh-add="ssh-add -t $(expr 60 \* 60 \* 5)"

# vi compat
alias ':q'='exit'

# Network
alias wget='wget --content-disposition --max-redirect 10 -c -t0'
alias curl='curl -c ~/.curlcookie -b ~/.curlcookie -L'

# Shortcut
__yesterday='date --date "1 day ago" +"%Y-%m-%d"'
alias yesterday="${__yesterday}"
alias yst="${__yesterday}"
unset __yesterday
alias now-iso='date +"%Y-%m-%dT%H:%M:%S"'
alias today-iso='date +"%Y-%m-%d"'
alias yesterday-iso='date +"%Y-%m-%d"'
alias yst-iso='yesterday-iso'
alias unixtime='date +"%s"'
alias open-tunnel='start-stop-daemon --start --background --make-pidfile --pidfile /var/run/sshtunnel.pid --exec /usr/local/bin/sshtunnel -- '
alias close-tunnel='start-stop-daemon --stop --pidfile /var/run/sshtunnel.pid'
alias pingle='ping google.com'
which xsel >/dev/null 2>&1   && alias clipboard='xsel --clipboard --input'
which rlwrap >/dev/null 2>&1 && alias gosh='rlwrap gosh'

# Git
__git_status='git status -bs'
alias gstat="${__git_status}"
alias gst="${__git_status}"
unset __git_status
alias gdf='git diff'
alias gcm='git commit -m'
alias glg="git log --stat"
alias glgr="git log --graph --date-order --pretty=format:'%Cblue%h %Cgreen%ci %Cred%an %Cblue%m %Creset%s %Cred%d'"
