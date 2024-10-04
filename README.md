# Dotfiles Repo
Just some dotfiles containing common configurations for linux and MacOS systems to speed up machine setup

## Dependencies (Ensure these are installed before stowing certain modules):
* Git (required by all modules)
* GNU Stow (Look up distro-specific instructions for installation) 
* ZSH (Only if you want to use any of the zsh dotfiles)
* [Starship Prompt](https://starship.rs/) if you want to use the starship config
* [The Kitty Terminal](https://sw.kovidgoyal.net/kitty/) if you want to install the kitty module
* Sway Window Manager (If you wish to install sway config)
* Waybar for Sway
* Tofi
* Swayimg
* Wofi
* [The Alacritty Terminal](https://alacritty.org/) if you want to install the alacritty terminal
* [Mako Notifications](https://github.com/emersion/mako)
* Vim
* Neovim
* Hyprland

### Hyprland
Be sure utilities such as hypridle, hyprpaper, & hyprlock are installed in addition to hypland

### Vim
Ensure that [Vim Plug](https://github.com/junegunn/vim-plug) is installed.
* Open vim and run `:PlugInstall` 

### Neovim
[Lazy.nvim](https://github.com/folke/lazy.nvim) should automatically handle loading all neovim plugins
#### [COC.NVIM](https://github.com/neoclide/coc.nvim)
Run `:CocInstall` for each of the following modules:
* [coc-rust-analyzer](https://github.com/fannheyward/coc-rust-analyzer)
* [coc-sumneko-lua](https://github.com/xiyaowong/coc-sumneko-lua)
* [coc-markdown-preview-enhanced](https://github.com/weirongxu/coc-markdown-preview-enhanced)
* [coc-pyright](https://github.com/fannheyward/coc-pyright)

## To setup:
Thanks to the wonderful discovery of [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html), this project is set up to use GNU Stow to install various dotfiles where needed.

To do so, simply run `stow *` to install all config files or `stow <name of module>` to install only the modules you need

### Available Modules for Installation
* bash
* starship
* vim
* nvim
* zsh-linux (for setting up zsh on any specific linux distribution)
* zsh-macos (for setting up zsh on MacOS)
* kitty
* sway
* waybar
* tofi
* swayimg
* alacritty 
* wofi
* mako
* hyprland
* ssh
* systemd

## Notes for SSH & Systemd Config
Following the guide [here](https://www.lorenzobettini.it/2023/09/hyprland-and-ssh-agent/), be sure to run `systemctl enable --user ssh-agent.service` after you've done stow for your SSH & Systemd services.

