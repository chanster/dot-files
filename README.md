# Dot Files

My dot files.

## Requirements

- `git`
- [`stow`](https://www.gnu.org/software/stow/manual/html_node/)


```shell
$ sudo apt install git stow 
```

## Stow files

```
stow --target $HOME .
```

## Troubleshooting

**issue**: `existing target is neither a link nor a directory: ...`

**resolution**:
```
git pull origin main
stow --target $HOME --adopt .
git restore .
```

