-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'plugins'

local Plug = require 'usermod.vim-plug'
Plug.begin('~/.config/nvim/plugged')

Plug 'ryanoasis/vim-devicons'

Plug('junegunn/fzf', {
    run = function()
        vim.fn['fzf#install']()
    end
})

Plug('nvim-treesitter/nvim-treesitter', {
    run = function()
        vim.cmd('TSUpdate')
    end
})

Plug.ends()

require('vscode').load()

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.incsearch = false
vim.wo.signcolumn = 'yes'
vim.opt.cc = '80'
vim.opt.ts = 4
vim.opt.et = true
vim.opt.sw = 4
vim.opt.number = true
vim.opt.encoding = 'UTF-8'

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.cmd([[
    set nofoldenable
    let mapleader = "\<Alt>"
    filetype plugin indent on
    filetype plugin on
]])

require('vgit').setup()
require('nvim-tree').setup()
require('lualine').setup({
    options = {
        theme = 'vscode'
    }
})

require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        'python',
        'ruby',
        'javascript',
        'css',
        'c',
        'rust',
        'lua',
        'vim',
        'markdown',
        'markdown_inline',
        'json',
        'json5',
        'yaml'
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,
    }
})

-- NvimTree Mappings
vim.keymap.set('', '<F5>', '<cmd>NvimTreeToggle<cr>')
vim.keymap.set('', '<F6>', '<cmd>NvimTreeFocus<cr>')

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
