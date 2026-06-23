if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
