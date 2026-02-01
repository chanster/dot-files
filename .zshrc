# # If not running interactively, don't do anything
# if ! [[ -o interactive ]]; then
#     return
# fi

# set aliases
if [[ -f "${HOME}/.config/aliases" ]]; then
    source "${HOME}/.config/aliases"
fi

# set local aliases
if [[ -f "${HOME}/.config/aliases.local" ]]; then
    source "${HOME}/.config/aliases.local"
fi

# diable less history files
if [[ $(command -v less) ]]; then
    export LESSHISTFILE
    export LESSHISTSIZE=0
fi

# zim:fw zsh framework
if [[ -f "${ZDOTDIR:-${HOME}}/.zimrc" ]]; then
    zstyle ':zim:zmodule' use 'degit' # don't use git to install modules
    
    # set zim paths
    export ZIM_HOME="${HOME}/.config/zsh/zimfw"
    
    # download zim framework if it doesn't exist
    if [[ ! -e "${ZIM_HOME}/zimfw.zsh" ]]; then
        curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    fi

    # initialize zim
    if [[ ! "${ZIM_HOME}/init.zsh" -nt "${ZDOTDIR:-${HOME}}/.zimrc" ]]; then
        source "${ZIM_HOME}/zimfw.zsh" init -q
    fi
    if [[ -f "${ZIM_HOME}/init.zsh" ]]; then
        source "${ZIM_HOME}/init.zsh"
    fi
fi

# enable bash completion commands
autoload bashcompinit && bashcompinit

# mise-en-place tool manager
if [[ $(command -v "mise") ]]; then
    # shellcheck disable=SC2086
    eval "$(mise completion ${SHELL##*/})"
fi

# uv
if [[ $(command -v "uv") ]]; then
    eval "$(uv generate-shell-completion ${SHELL##*/})"
fi

# asdf tool manager
if [[ -f "${HOME}/.asdf/asdf.sh" ]]; then
    # load plugins helpers
    if [[ -d "${HOME}/.asdf/plugins" ]]; then
        for helper in $(find "${HOME}/.asdf/plugins" -maxdepth 2 -name "*.zsh"); do
            source "${helper}"
        done
    fi
fi

# aws completion
if [[ $(command -v "aws_completer") ]]; then
    complete -C "aws_completer" aws
fi
# azure completion, very slow
if [[ $(command -v "az" ) ]]; then
    # taken from https://github.com/Azure/azure-cli/blob/dev/az.completion
    _az_python_argcomplete() {
        local IFS=$'\013'
        local SUPPRESS_SPACE=0
        if compopt +o nospace 2> /dev/null; then
            SUPPRESS_SPACE=1
        fi
        COMPREPLY=( $(IFS="$IFS" \
                      COMP_LINE="$COMP_LINE" \
                      COMP_POINT="$COMP_POINT" \
                      COMP_TYPE="$COMP_TYPE" \
                      _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS" \
                      _ARGCOMPLETE=1 \
                      _ARGCOMPLETE_SUPPRESS_SPACE=$SUPPRESS_SPACE \
                      "$1" 8>&1 9>&2 1>/dev/null 2>/dev/null) )
        if [[ $? != 0 ]]; then
            unset COMPREPLY
        elif [[ $SUPPRESS_SPACE == 1 ]] && [[ "$COMPREPLY" =~ [=/:]$ ]]; then
            compopt -o nospace
        fi
    }
    complete -o nospace -o default -o bashdefault -F _az_python_argcomplete "az"
fi

# history
HISTFILE="${HOME}/.local/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE    # don't save command prefixed with a space
setopt APPEND_HISTORY       # append to history
setopt SHARE_HISTORY        # allow multiple terminal sessions to use history
setopt HIST_IGNORE_ALL_DUPS # remove older duplicate commands

# Bind up and down keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
    bindkey ${terminfo[kcuu1]} history-substring-search-up
    bindkey ${terminfo[kcud1]} history-substring-search-down
fi

