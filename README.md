# Modular dotfiles repository

This repository is a Makefile-managed dotfiles collections, allowing to symlink either individual or a group of dotfiles packages.
They are meant for fast deployment, specific softwares and system genericity (if possible).

## Dependencies

- GNU Make
- GNU Stow
- Node.js (Visual Studio Code scripts)

## Softwares

- Alacritty
- Neovim
- Visual Studio Code
- Zsh

## Plugins

Some softwares (IDEs) also rely on plugins.
Neovim handle the installation in its make rule, but it may not be for your needs.
Neovim uses vim-plug for plugin handling, and you can change as you want, though I do not plan to reconsider the provided ones if I do not use it.
Visual Studio Code is not forcing extensions, but some settings rely on them (themes, lsp), same as above.
