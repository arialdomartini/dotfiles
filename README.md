# Arialdo's dotfiles

## NixOS
NixOS configuration is in [nixos](./nixos). To install, run:

```
sudo nixos-rebuild switch --flake ./nixos/#arixos
```

or run `switch.sh`.

## Install (from dotfiles to home)

```
stow [-Rv] <PACKAGE>
```


## Uninstall (Delete)

```
stow -Dv <PACKAGE>
```

## Create symlinks (from home to dotfiles)

Assuming `cd dotfiles`:

```
# 1. Create the stow directory
mkdir -p ./<package>/.config/

# 2. Move the original files
mv ~/.config/<package> ./<package>/.config/

# 3. Create symlinks
stow bar
```
