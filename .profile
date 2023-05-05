# This is configured to work with both bash and zsh

# if running bash
if [[ -n "${BASH_VERSION}" ]]; then
    # include .bashrc if it exists
    if [ -f "${HOME}/.bashrc" ]; then
	source "${HOME}/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi

# set aliases
if [[ -f "${HOME}/.config/aliases" ]]; then
    source "${HOME}/.config/aliases"
fi

# asdf version manager
if [[ -d "${HOME}/.asdf" ]]; then
    source ${HOME}/.asdf/asdf.sh
    if [[ -n "${BASH_VERSION}" ]]; then
    	source "${ASDF_DIR}/completions/asdf.bash"
    fi
    if [[ -n "${ZSH_VERSION}" ]]; then
        # append completions to fpath
        fpath=(${ASDF_DIR}/completions $fpath)
        # initialise completions with ZSH's compinit
        autoload -Uz compinit && compinit
    fi
fi

# android dev
if [[ -d "${HOME}/Android/Sdk" ]]; then
    export ANDROID_HOME="${HOME}/Android/Sdk"
    export PATH="${PATH}:${ANDROID_HOME}/emulator"
    export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
fi

