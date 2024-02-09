# history
HISTFILE="${HOME}/.local/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE    # don't save command prefixed with a space
setopt APPEND_HISTORY       # append to history
setopt SHARE_HISTORY        # allow multiple terminal sessions to use history
setopt HIST_IGNORE_ALL_DUPS # remove older duplicate commands

# set aliases
if [[ -f "${HOME}/.config/aliases" ]]; then
    source "${HOME}/.config/aliases"
fi

# zim:fw zsh framework
if [[ -d "${HOME}/.config/zsh/zimfw" ]]; then
    # don't use git
    zstyle ':zim:zmodule' use 'degit'
    
    # set zim paths
    ZIM_HOME="${HOME}/.config/zsh/zimfw"
    ZDOTDIR="${HOME}/.config/zsh"
    
    # create .zimrc file if it doesn't exist
    if [[ ! -f "${ZDOTDIR}/.zimrc" ]]; then
        touch ${ZDOTDIR}/.zimrc
    fi
    # download zim framework if it doesn't exist
    if [[ ! -e "${ZIM_HOME}/zimfw.zsh" ]]; then
        curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    fi

    # initialize zim
    if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR}/.zimrc ]]; then
        source ${ZIM_HOME}/zimfw.zsh init -q
    elif [[ -f "${ZIM_HOME}/init.zsh" ]]; then
	source "${ZIM_HOME}/init.zsh"
    fi
fi

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

