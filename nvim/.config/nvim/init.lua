require 'plugins'

local Plug = require 'usermod.vim-plug'
Plug.begin('~/.config/nvim/plugged')

Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug.ends()

vim.cmd.colorscheme('nightfox')

vim.opt.updatetime = 100
vim.opt.cc = '80'
vim.opt.ts = 4
vim.opt.et = true
vim.opt.sw = 4
vim.opt.number = true

vim.cmd([[
    filetype plugin indent on
    filetype plugin on
    let g:NERDCreateDefaultMappings = 1
    let g:airline#extensions#tabline#enabled = 1
]])

-- NERDTree Mappings
vim.keymap.set('', '<F5>', '<cmd>NERDTreeToggle<cr>')

-- Floaterm Mappings
vim.keymap.set('n', '<F7>', '<cmd>FloatermNew<cr>', { silent = true })
vim.keymap.set('t', '<F7>', '<cmd>FloatermNew<cr>', { silent = true })
vim.keymap.set('n', '<F8>', '<cmd>FloatermPrev<cr>', { silent = true })
vim.keymap.set('t', '<F8>', '<cmd>FloatermPrev<cr>', { silent = true })
vim.keymap.set('n', '<F9>', '<cmd>FloatermNext<cr>', { silent = true })
vim.keymap.set('t', '<F9>', '<cmd>FloatermNext<cr>', { silent = true })
vim.keymap.set('n', '<F12>', '<cmd>FloatermToggle<cr>', { silent = true })
vim.keymap.set('t', '<F12>', '<cmd>FloatermToggle<cr>', { silent = true })

-- Tab Bindings
vim.keymap.set('', '<C-n>', '<cmd>tabnew<cr>')
vim.keymap.set('', '<C-w>', '<cmd>tabclose<cr>')
vim.keymap.set('', '<C-S-Left>', '<cmd>-tabmove<cr>')
vim.keymap.set('', '<C-S-Right>', '<cmd>+tabmove<cr>')