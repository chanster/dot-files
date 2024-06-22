# Dot Files

My dot files.

## Requirements

- `git`
- [`stow`](https://www.gnu.org/software/stow/manual/html_node/)

```shell
sudo apt install git stow 
```

## Stow files

```shell
# Dry run to validate what is being linked
stow -vn --target $HOME .

# Then a real run
stow -v --target $HOME .
```

## Troubleshooting

**issue**: `existing target is neither a link nor a directory: ...`

**resolution**:

```shell
git pull origin main
stow --target $HOME --adopt .
git restore .
```

## Misc

### `zsh` Startup Loading Sequence

```mermaid
graph TD
    zsh{"Zsh"}

    login{"Login"}
    nonLogin{"Non-login"}
    interactive{"Interactive"}
    nonInteractive{"Non-interactive"}

    zsh --> login
    zsh --> nonLogin

    login --> interactive
    login --> nonInteractive
    nonLogin --> interactive
    nonLogin --> nonInteractive

    linkStyle 2 stroke: red;
    linkStyle 3 stroke: orange;
    linkStyle 4 stroke: green;
    linkStyle 5 stroke: blue;

    etcEnv["/etc/zsh/zshenv"]
    etcProfile["/etc/zsh/zprofile"]
    etcRc["/etc/zsh/zshrc"]
    etcLogin["/etc/zsh/zlogin"]
    etcLogout["/etc/zsh/zlogout"]

    homeEnv["~/.zshenv"]
    homeProfile["~/.zprofile"]
    homeRc["~/.zshrc"]
    homeLogin["~/.zlogin"]
    homeLogout["~/.zlogout"]

    systemEtcProfile["/etc/profile"]
    systemHomeProfile["~/.profile (not sourced)"]

    %% login, interactive
    interactive
     --> etcEnv --> homeEnv
     --> etcProfile --> systemEtcProfile --> homeProfile
     --> etcRc --> homeRc
     --> etcLogin --> homeLogin
     -->|on logout| homeLogout --> etcLogout
    linkStyle 6,7,8,9,10,11,12,13,14,15,16 stroke: red;

    %% login, non-interactive
    nonInteractive
     --> etcEnv --> homeEnv
     --> etcProfile --> systemEtcProfile --> homeProfile
     --> etcLogin --> homeLogin
    %%  -->|on logout| homeLogout --> etcLogout
    linkStyle 17,18,19,20,21,22,23 stroke: orange;

    %% non-login, interactive
    interactive --> etcEnv --> homeEnv
     --> etcRc --> homeRc
    linkStyle 24,25,26,27 stroke: green;

    %% non-login, non-interactive
    nonInteractive --> etcEnv --> homeEnv
    linkStyle 28,29 stroke: blue;
```

### `bash` Startup Loading Sequence

```mermaid
graph TD
    bash{"Bash"}

    login{"Login"}
    nonLogin{"Non-login"}
    interactive{"Interactive"}
    nonInteractive{"Non-interactive"}

    bash --> login
    bash --> nonLogin

    login --> interactive
    login --> nonInteractive
    nonLogin --> interactive
    nonLogin --> nonInteractive
    
    linkStyle 2 stroke: red;
    linkStyle 3 stroke: orange;
    linkStyle 4 stroke: green;
    linkStyle 5 stroke: blue;

    systemEtcProfile["/etc/profile"]
    systemHomeProfile["~/.profile"]

    etcRc["/etc/bash.bashrc"]
    etcLogout["/etc/bash.bash_logout"]

    homeProfile["~/.bash_profile"]
    homeLogin["~/.bash_login"]
    homeRc["~/.bashrc"]
    homeLogout["~/.bash_logout"]
    ENV["$BASH_ENV"]

    %% Shared amongst lines
    subgraph bashFirstOf [First of]
        direction LR
        homeProfile
        homeLogin
        systemHomeProfile
    end


    %% login, interactive
    interactive --> systemEtcProfile --> bashFirstOf
     -->|on logout| homeLogout --> etcLogout
    linkStyle 6,7,8,9 stroke: red;

    %% login, non-interactive
    nonInteractive --> systemEtcProfile --> bashFirstOf
     -->|on logout| homeLogout --> etcLogout
    linkStyle 10,11,12,13 stroke: orange;

    %% non-login, interactive
    interactive --> etcRc --> homeRc
    linkStyle 14,15 stroke: green;

    %% non-login, non-interactive
    nonInteractive --> ENV
    linkStyle 16 stroke: blue


    %% Cross-sourcing
    systemEtcProfile -->|commonly sources| etcRc
    homeProfile -->|commonly sources| homeRc
```

## Additional Reads

- [`neovim` README](.config/nvim/README.md)

