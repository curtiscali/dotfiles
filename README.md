# Dotfiles Repo
Just some dotfiles containing common configurations for linux systems to speed up machine setup

## Plugins to install for Vim
* Pathogen
* sensible.vim
* auto-pairs

## Dependencies (Ensure these are installed before stowing certain modules):
* GNU Stow (Look up distro-specific instructions for installation) 
* ZSH (Only if you want to use any of the zsh dotfiles)
* [Starship Prompt](https://starship.rs/) if you want to use the starship config
* [The Kitty Terminal](https://sw.kovidgoyal.net/kitty/) if you want to install the kitty module
* Sway Window Manager (If you wish to install sway config)
* Waybar for Sway
* Tofi
* Swayimg

## To setup:
Thanks to the wonderful discovery of [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html), this project is set up to use GNU Stow to install various dotfiles where needed.

To do so, simply run `stow <name of module>`
### Available Modules for Installation
* bash
* starship
* vim
* zsh-linux (for setting up zsh on any specific linux distribution)
* zsh-macos (for setting up zsh on MacOS)
* kitty
* sway
* waybar
* tofi
* swayimg
