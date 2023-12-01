# How to backup current config

## Make a backup of your current nvim folder
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

## Clean neovim folders
```bash
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

## Restore your backup
```bash
mv ~/.config/nvim.bak ~/.config/nvim
```

## Restore neovim folders
```bash
mv ~/.local/share/nvim.bak ~/.local/share/nvim
mv ~/.local/state/nvim.bak ~/.local/state/nvim
mv ~/.cache/nvim.bak ~/.cache/nvim
```
