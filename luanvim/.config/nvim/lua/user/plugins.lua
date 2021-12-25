-- plugins

local Plug = vim.fn['plug#']

-- https://github.com/junegunn/vim-plug
vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug 'mhinz/vim-startify' -- A start menu for vim
Plug 'gruvbox-community/gruvbox'
Plug 'preservim/nerdtree'            -- side bar file tree
Plug 'itchyny/lightline.vim'         -- minmal status bar
Plug 'tpope/vim-fugitive'            -- allows git commands in vim session
Plug 'airblade/vim-gitgutter'        -- shows git changes in gutter
Plug 'yuttie/comfortable-motion.vim' -- scrolling 'C-d' or 'C-u'
Plug 'norcalli/nvim-colorizer.lua' -- colorize color names/number in text 

-- Telescope
Plug('nvim-telescope/telescope-fzf-native.nvim', {
	['do'] = function()
		vim.cmd('make')
	end
})
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = function()
		vim.cmd(':TSUpdate')
	end
})  -- We recommend updating the parsers on update

Plug 'nvim-treesitter/playground'


-- Plug('neoclide/coc.nvim', {branch = 'release'})

-- LSP config Base plugin
-- https://github.com/neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'
-- Chris@Machine
-- https://github.com/williamboman/nvim-lsp-installer
-- Plug 'williamboman/nvim-lsp-installer'

-- code completions chrisatmachine
Plug 'hrsh7th/nvim-cmp'
--Plug 'hrsh7th/cmp-buffer'
--Plug 'hrsh7th/cmp-path'
--Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
--Plug 'hrsh7th/cmp-vsnip'
--Plug 'rafamadriz/friendly-snippets'


-- Cheat sheet
-- Plug 'dbeniamine/cheat.sh-vim'

-- Rust
--Plug 'rust-lang/rust.vim'
--Plug 'simrat39/rust-tools.nvim'



vim.call('plug#end')

