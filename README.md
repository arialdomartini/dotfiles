dotfiles
========

Just my Linux dot files

## Install

Run:
```bash
stow -v MODULE -t ~
```

to create symbolic links of all the files in the home directories for
module `MODULE`. For example:

```bash
stow -v starship -t ~
```
