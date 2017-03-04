# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2500
setopt extendedglob nomatch
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/computer/.zshrc'

autoload -Uz  promptinit compinit
promptinit
compinit
# End of lines added by compinstall
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/sudo
    zgen load chrissicool/zsh-256color 
    zgen load peterhurford/up.zsh
    # completions
    zgen load zsh-users/zsh-completions src

    # theme

    # save all to init script
    zgen save
fi
