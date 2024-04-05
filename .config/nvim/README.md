# Neovim Config

## Requirements

The plugins like `telescope` and `Mason` use external tools in order to function properly.

- `git`
- `unzip`
- `curl`
- `python3` with `neovim` package
- `nodejs`
- build tools (ubuntu: `build-essential`, fedora: `groupinstall "Development Tools"`, mac: `xcode-select --install`)
- `go`
- `ripgrep`
- `lazygit`
- `lazydocker`
- `k9s`

## Installing

> WIP

### ubuntu + mise-en-place

```shell
apt update && apt install -y git unzip curl

# ubuntu does not have the latest packages so we use mise
mise use --global python3 go node ripgrep lazygit lazydocker k9s
python -m pip install neovim # this for some LSPs
```

### brew

```shell
brew install python go node git curl unzip neovim ripgrep lazygit lazydocker k9s
python -m pip install neovim # this for some LSPs
```

If you add addtional LSPs, you may need to install additional tools to support them.
