if [[ -d "${HOME}/.local/bin" ]]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# mise-en-place tool manager
if [[ $(command -v "mise") ]]; then
    # shellcheck disable=SC2086
    eval "$(mise activate ${SHELL##*/})"
    # # enable shims
    # if [[ -d "${HOME}/.local/share/mise/shims" ]]; then
    #     export PATH="${HOME}/.local/share/mise/shims:${PATH}"
    # fi
fi

# asdf tool manager
if [[ -f "${HOME}/.asdf/asdf.sh" ]]; then
    source "${HOME}/.asdf/asdf.sh"
fi

# android dev
if [[ -d "${HOME}/.local/applications/Android/Sdk" ]]; then
    export ANDROID_HOME="${HOME}/.local/applications/Android/Sdk"
    export PATH="${PATH}:${ANDROID_HOME}/emulator"
    export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
    export GRADLE_USER_HOME="${HOME}/.config/.gradle"
fi

# miniconda
if [[ $(command -v "conda") || -d "${HOME}/.local/bin/miniconda3" || -d "${HOME}/miniconda3" ]]; then
    # upstream
    if [[ -f "${HOME}/.local/bin/miniconda3/etc/profile.d/conda.sh" ]]; then
        source "${HOME}/.local/bin/miniconda3/etc/profile.d/conda.sh"
    elif [[ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]]; then
        source "${HOME}/miniconda3/etc/profile.d/conda.sh"
    # brew
    elif [[ "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]]; then
        source "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    fi
fi
