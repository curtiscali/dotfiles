-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

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
    let mapleader = "\<Space>"
    filetype on
    filetype plugin indent on
    filetype plugin on
]])

-- This line maps Shift-Tab to do what Ctrl-D does: delete one level of indentation
vim.keymap.set('i', '<S-Tab>', '<C-d>')

-- Clear latest search
vim.keymap.set('n', '<F3>', '<cmd>noh<cr>')

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

-- Visual Mode Bindings
vim.keymap.set('v', '<Tab>', '>')
vim.keymap.set('v', '<S-Tab>', '<')

-- Telescope bindings
vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<cr>', { silent = true })
vim.keymap.set('n', '<Leader>fg', '<cmd>Telescope live_grep<cr>', { silent = true })
vim.keymap.set('n', '<Leader>fb', '<cmd>Telescope buffers<cr>', { silent = true })
vim.keymap.set('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>', { silent = true })
