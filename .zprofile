# set PATH so it includes user's local bin if it exists
if [[ -d "${HOME}/.local/bin" ]]; then
    PATH="${HOME}/.local/bin:${PATH}"
fi

# android dev
if [[ -d "${HOME}/.local/applications/Android/Sdk" ]]; then
    export ANDROID_HOME="${HOME}/.local/applications/Android/Sdk"
    export PATH="${PATH}:${ANDROID_HOME}/emulator"
    export PATH="${PATH}:${ANDROID_HOME}/platform-tools"
    export GRADLE_USER_HOME="${HOME}/.config/.gradle"
fi

if [[ $(command -v "mise") ]]; then
    # shellcheck disable=SC2086
    eval "$(mise activate ${SHELL##*/})"
fi

# asdf version manager
if [[ -d "${HOME}/.asdf" ]]; then
    source "${HOME}/.asdf/asdf.sh"
fi
