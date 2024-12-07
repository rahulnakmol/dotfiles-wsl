# Aliases for ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'    # Add an "alert" alias for long running commands

# Aliases for apt
alias sau='sudo apt update && sudo apt upgrade -y'
alias sai='sudo apt install -y'
alias sar='sudo apt remove -y'
alias sac='sudo apt clean'
alias saa='sudo apt autoremove'
alias sas='apt search'
alias sash='apt show'

# Aliases for homebrew
alias bi='brew install'
alias bu='brew uninstall'
alias bl='brew list'
alias bup='brew update'
alias bug='brew upgrade'
alias buu='brew update && brew upgrade'
alias bs='brew search'
alias bss='brew info'

# Aliases for git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch -a'
alias gf='git fetch'
alias gcl='git clone'
alias gb!='git blame'
alias glog='git log --oneline --decorate --all --graph'

# Enable color support for common commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi