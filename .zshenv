if [[ -d "${HOME}/.local/bin" ]]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# mise-en-place tool manager
if [[ $(command -v "mise") ]]; then
    # shellcheck disable=SC2086
    eval "$(mise activate ${SHELL##*/})"
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
