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
    if [[ ! "${ZIM_HOME}/init.zsh" -nt "${ZDOTDIR}/.zimrc" ]]; then
        source "${ZIM_HOME}/zimfw.zsh" init -q
    elif [[ -f "${ZIM_HOME}/init.zsh" ]]; then
	source "${ZIM_HOME}/init.zsh"
    fi
fi

if [[ $(command -v "mise") ]]; then
    # shellcheck disable=SC2086
    eval "$(mise completion ${SHELL##*/})"
fi

# asdf version manager
if [[ -d "${HOME}/.asdf" ]]; then
    if [[ -n "${BASH_VERSION}" ]]; then
        source "${ASDF_DIR}/completions/asdf.bash"
        # load plugins helpers
        if [[ -d "${HOME}/.asdf/plugins" ]]; then
            for helper in $(find "${HOME}/.asdf/plugins" -maxdepth 2 -name "*.bash"); do
                source "${helper}"
            done
        fi
    elif [[ -n "${ZSH_VERSION}" ]]; then
        # initialise completions with ZSH's compinit
        autoload -Uz compinit && compinit
        # load plugins helpers
        if [[ -d "${HOME}/.asdf/plugins" ]]; then
            for helper in $(find "${HOME}/.asdf/plugins" -maxdepth 2 -name "*.zsh"); do
                source "${helper}"
            done
        fi
    fi
fi

# Bind up and down keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi
