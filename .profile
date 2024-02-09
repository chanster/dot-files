# shellcheck disable=SC2148,SC1090,SC1091
# This is configured to work with both bash and zsh

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi

# asdf version manager
if [[ -d "${HOME}/.asdf" ]]; then
    source "${HOME}/.asdf/asdf.sh"
    if [[ -n "${BASH_VERSION}" ]]; then
        source "${ASDF_DIR}/completions/asdf.bash"
        # load plugins helpers
        if [[ -d "${HOME}/.asdf/plugins" ]]; then
            for helper in $(find "${HOME}/.asdf/plugins" -maxdepth 2 -name "*.bash"); do
                source "${helper}"
            done
        fi
    elif [[ -n "${ZSH_VERSION}" ]]; then
        # append completions to fpath
        fpath=("${ASDF_DIR}/completions" "${fpath}")
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

# mise version manager
if [[ $(command -v "mise") ]]; then
    # shellcheck disable=SC2086
    eval "$(mise activate ${SHELL##*/})"
    # shellcheck disable=SC2086
    eval "$(mise completion ${SHELL##*/})"
fi

# android dev
if [[ -d "${HOME}/.local/applications/Android/Sdk" ]]; then
    export ANDROID_HOME="${HOME}/.local/applications/Android/Sdk"
    export PATH="${PATH}:${ANDROID_HOME}/emulator"
    export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
    export GRADLE_USER_HOME="${HOME}/.config/.gradle"
fi

# diable history files
if [[ $(command -v less) ]]; then
    export LESSHISTFILE=-
    export LESSHISTSIZE=0
fi

# load rc files
if [[ -n "${ZSH_VERSION}" ]]; then
    if [[ -f "${HOME}/.zshrc" ]]; then
        source "${HOME}/.zshrc"
    fi
elif [[ -n "${BASH_VERSION}" ]]; then
    # include .bashrc if it exists
    if [[ -f "${HOME}/.bashrc" ]]; then
        source "${HOME}/.bashrc"
    fi
fi

