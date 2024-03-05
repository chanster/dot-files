# If not running interactively, don't do anything
if ! [[ -o interactive ]]; then
    return
fi

# set aliases
if [[ -f "${HOME}/.config/aliases" ]]; then
    source "${HOME}/.config/aliases"
fi

# set local aliases
if [[ -f "${HOME}/.config/aliases.local" ]]; then
    source "${HOME}/.config/aliases.local"
fi

# history
HISTFILE="${HOME}/.local/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE    # don't save command prefixed with a space
setopt APPEND_HISTORY       # append to history
setopt SHARE_HISTORY        # allow multiple terminal sessions to use history
setopt HIST_IGNORE_ALL_DUPS # remove older duplicate commands

# diable less history files
if [[ $(command -v less) ]]; then
    export LESSHISTFILE
    export LESSHISTSIZE=0
fi

# Bind up and down keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi
