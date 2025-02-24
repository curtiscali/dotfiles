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
        opts = {}
    },
    {
        'nvim-tree/nvim-web-devicons'
    },
    {
        'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { theme = 'vscode' },
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
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() 
            vim.fn["mkdp#util#install"]() 
        end,
    },
    {
        'nanozuki/tabby.nvim',
        event = 'VimEnter', -- if you want lazy load, see below
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            -- configs...
            local theme = {
                fill = 'TabLineFill',
                -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
                head = 'TabLine',
                current_tab = 'TabLineSel',
                tab = 'TabLine',
                win = 'TabLine',
                tail = 'TabLine',
            }

            require('tabby').setup({
                line = function(line)
                    return {
                        {
                            { '  ', hl = theme.head },
                            line.sep('', theme.head, theme.fill),
                        },
                        line.tabs().foreach(function(tab)
                            local hl = tab.is_current() and theme.current_tab or theme.tab
                            return {
                                line.sep('', hl, theme.fill),
                                tab.is_current() and '' or '󰆣',
                                tab.number(),
                                tab.name(),
                                tab.close_btn(''),
                                line.sep('', hl, theme.fill),
                                hl = hl,
                                margin = ' ',
                            }
                        end),
                        line.spacer(),
                        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                            return {
                                line.sep('', theme.win, theme.fill),
                                win.is_current() and '' or '',
                                win.buf_name(),
                                line.sep('', theme.win, theme.fill),
                                hl = theme.win,
                                margin = ' ',
                            }
                        end),
                        {
                            line.sep('', theme.tail, theme.fill),
                            { '  ', hl = theme.tail },
                        },
                        hl = theme.fill,
                    }
                end,
                -- option = {}, -- setup modules' option,
            })
        end,
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "vscode" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
