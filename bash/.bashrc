# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Global Variables
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export BAT_THEME='Catppuccin Macchiato'
export MAMBA_EXE='/home/linuxbrew/.linuxbrew/Cellar/micromamba/2.0.4_1/bin/mamba';
export MAMBA_ROOT_PREFIX='/home/rahulnarasimhaa/mamba';

# History Settings
HISTCONTROL=ignoreboth  # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=1000       # for setting history length 
HISTFILESIZE=2000   # for setting history file size
shopt -s histappend     # append to the history file, don't overwrite it

# UI & Prompt Settings
shopt -s checkwinsize   # update the values of LINES and COLUMNS.
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"    # If this is an xterm set the title to user@host:dir
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Shell Hooks
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"  # Initialize Homebrew
eval "$(starship init bash)"                            # Initialize Starship prompt

__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup


# Misc Settings
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"    # make less more friendly for non-text input files
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)     # set variable identifying the chroot you work in (used in the prompt below)
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion    # Enable programmable completion features 
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion                          # Enable programmable completion features 
  fi
fi