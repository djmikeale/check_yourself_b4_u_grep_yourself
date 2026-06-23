CONFIG_DIR="${HOME}/.zsh"

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000              # how many lines kept in memory
SAVEHIST=10000              # how many lines saved to disk
setopt INC_APPEND_HISTORY   # add to history instead of overwriting
setopt SHARE_HISTORY        # share history across terminals
setopt HIST_IGNORE_ALL_DUPS # skip duplicates
setopt HIST_REDUCE_BLANKS   # trim multiple spaces

# ---------- zinit stuff --------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search

# Prompt
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    Aloxaf/fzf-tab \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# fuzzy finder hack
if [[ "$(uname -s)" == "Linux" ]]; then
  # Ubuntu / WSL: install latest fzf via git installer (outdated on apt, issue installing on wsl)
  if [[ ! -d "$HOME/.fzf" ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    "$HOME/.fzf/install" --all --no-update-rc
  fi
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

elif [[ "$(uname -s)" == "Darwin" ]]; then
  # macOS
  zinit light junegunn/fzf
fi
# ctrl + r to search history
# ctrl + t to fuzzy find files
# alt + c to fuzzy cd into dirs
source <(fzf --zsh)

# Suggest when I should have used an alias
zinit ice wait lucid
zinit light MichaelAquilina/zsh-you-should-use

# ---------- aliases ------------------------------

alias -g -- --help='--help 2>&1 | bat --language=help --style=plain' # override -h and --help to use bat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain' # override -h and --help to use bat
alias g='git'
alias la='ls -lathr'
alias path='echo -e ${PATH//:/\\n}'
alias qr='pbpaste | qrencode -t ansiutf8'

alias -s md='bat'

# ---------- exports ------------------------------

export EDITOR=code
export MANPAGER="bat -plman"
export CLICOLOR=1
export VISUAL=code EDITOR=$VISUAL
# export FZF_CTRL_T_COMMAND='rg --files'
# export FZF_ALT_C_COMMAND='fd . --type d'


# source "$CONFIG_DIR"/functions.zsh
# source "$CONFIG_DIR"/paths.zsh

# ---------- misc ---------------------------------
# Consider https://youtu.be/3fVAtaGhUyU?si=NSfXY2jLtrAfGGUO&t=851
# for sqlfmt usage

# ---------- autocomplete -------------------------
autoload -Uz compinit
compinit -C

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
