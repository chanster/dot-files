# Neovim Config

## Requirements

The plugins like `telescope` and `Mason` use external tools in order to function properly.

- `git`
- `unzip`
- `curl`
- `python3` with `neovim` package
- `nodejs`
- build tools (ubuntu: `build-essential`, fedora: groupinstall "Development Tools"`, `mac: `xcode`)
- `go`
- `ripgrep`


## Installing

ubuntu + mise-en-place
```
apt install git unzip curl

mise use --global python3 node ripgrep
python -m pip install neovim
```

brew + mise-en-place
```
brew install git curl unzip
```

If you add addtional LSPs, you may need to install additional tools to support them.
