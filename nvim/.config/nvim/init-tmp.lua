require 'plugins'

local Plug = require 'usermod.vim-plug'
Plug.begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug.ends()

vim.cmd.colorscheme('monokai-pro')

local set = vim.opt

set updatetime = 100
set cc = 80
set ts = 4
set et = true
set sw = 4
set number = true

vim.cmd([[
    filetype plugin indent on
    filetype plugin on
    let g:NERDCreateDefaultMappings = 1
    let g:airline#extensions#tabline#enabled = 1
]])

vim.keymap.set('n', '<F5>', ':NERDTreeToggle<R>')
vim.keymap.set('n', '<F7>', ':FloatermNew<CR>', { silent = true })
vim.keymap.set('t', '<F7>', '<C-\><C-n>:FloatermNew<CR>', { silent = true })
