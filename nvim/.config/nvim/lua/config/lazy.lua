-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    {
	'Mofiqul/vscode.nvim',
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
    	priority = 1000, -- make sure to load this before all the other start plugins
    	config = function()
	    -- load the colorscheme here
	    vim.cmd([[colorscheme vscode]])
	end,
    },
    {
	'windwp/nvim-autopairs',
	config = function()
	    require("nvim-autopairs").setup {}
	end
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { theme = 'vscode' }
    },
    {
        'nvim-treesitter/nvim-treesitter',
	config = function() 
	    vim.cmd([[TSUpdate]])
	end
    },
    {
        'ryanoasis/vim-devicons'
    },
    {
        'voldikss/vim-floaterm'
    },
    {
        'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'tanvirtin/vgit.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' }
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "vscode" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
