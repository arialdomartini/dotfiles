PATH=$PATH:/usr/local/sbin
PATH=$PATH:/home/arialdo/.local/bin
PATH=$PATH:/home/arialdo/.ghcup/bin/:/home/arialdo/.cabal/bin
PATH=$PATH:/home/arialdo/.dotnet/tools

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
export ZDOTDIR=/home/arialdo/.config/zsh
export SHELL=/home/arialdo/.nix-profile/bin/zsh

echo $(date) " Profile executed!" >> ~/my-logins
