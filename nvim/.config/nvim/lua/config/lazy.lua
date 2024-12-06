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
        'navarasu/onedark.nvim',
	    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    	priority = 1000, -- make sure to load this before all the other start plugins
    	config = function()
            require('onedark').setup {
                style = 'darker'
            }
    	    -- load the colorscheme here
	        vim.cmd([[colorscheme onedark]])
    	end,
    },
    {
	    'windwp/nvim-autopairs',
        opts = {}
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { theme = 'onedark' },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
		    require('nvim-treesitter.configs').setup({
                -- A list of parser names, or "all" 
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
    	end
    },
    {
        'ryanoasis/vim-devicons'
    },
    {
        'voldikss/vim-floaterm'
    },
    {
        'tanvirtin/vgit.nvim',
    	dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {}
    },
    {
        'junegunn/fzf',
        config = function()
            vim.cmd([[call fzf#install()]])
        end
    },
    {
    	'nvim-telescope/telescope.nvim', tag = '0.1.8',
      	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'neoclide/coc.nvim',
        branch = 'release'
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "onedark" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
