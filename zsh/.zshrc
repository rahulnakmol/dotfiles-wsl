# Global Variables
export CLICOLOR=1                                                                                                       # Enable colorized output
export WSLHOME="/mnt/c/Users/rahulnarasimhaa"                                                                           # Parent Windows OS user directory
export GOPATH="$WSLHOME/Developer/go"                                                                                   # Go tools and modules root path
export RUSTUP_PATH="/opt/homebrew/opt/rustup"                                                                           # Rustup path
export RUSTUP_HOME="$WSLHOME/Developer/.rustup"                                                                         # Rustup home
export CARGO_HOME="$WSLHOME/Developer/.cargo"                                                                           # Cargo home
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$RUSTUP_PATH/bin"                                                            # Add Rustup & Go to PATH
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"                                  # Colorize GCC output
export MANPAGER="sh -c 'col -bx | bat -l man -p'"                                                                       # Use bat as manpager
export BAT_THEME="Catppuccin Macchiato"                                                                                 # Set bat theme
export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"


# Load aliases and functions from separate files
if [ -d ~/.zshrc.d ]; then
  for rc in ~/.zshrc.d/*; do  
    if [ -f "$rc" ]; then
      source "$rc"                                                                                                           
    fi
  done
fi
unset rc

# Shell Hooks
eval "$(starship init zsh)"                                                                                             # Initialize Starship prompt
eval "$(zoxide init --cmd cd zsh)"                                                                                      # Initialize zoxide
source <(fzf --zsh)                                                                                                     # Set up fzf key bindings and fuzzy completion

