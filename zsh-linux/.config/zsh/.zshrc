export ZDOTDIR=$HOME/.config/zsh
export SUDO_EDITOR=nvim
export EDITOR=nvim

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Completions
fpath+=${ZDOTDIR:-~}/.zsh_functions

source $ZDOTDIR/zsh-functions

# Add in any custom files I need here
zsh_add_file "zsh-prompt"
zsh_add_file "zsh-aliases"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-completions"
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger\n'
bindkey -s '^f' 'zi\n'
bindkey -s '^s' 'ncdu\n'
bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi\n'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Add Code to enable proper functioning of Ruby Gems (Needed for Jekyll Dev)
export GEM_HOME="$HOME/gems"
export PATH="$HOME/bin:$HOME/gems/bin:$HOME/.cargo/bin:$PATH"

