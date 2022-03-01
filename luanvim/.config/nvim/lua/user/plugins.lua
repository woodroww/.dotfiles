-- plugins
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

local Plug = vim.fn['plug#']

-- https://github.com/junegunn/vim-plug
vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify' -- A start menu for vim

-- https://github.com/gruvbox-community/gruvbox
Plug 'gruvbox-community/gruvbox'

-- https://github.com/morhetz/gruvbox
--Plug 'morhetz/gruvbox'
--Plug 'chriskempson/base16-vim'

-- https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'            -- side bar file tree
-- https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'         -- minmal status bar
-- https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'            -- allows git commands in vim session
-- https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'        -- shows git changes in gutter
-- https://github.com/yuttie/comfortable-motion.vim
Plug 'yuttie/comfortable-motion.vim' -- scrolling 'C-d' or 'C-u'
-- https://github.com/norcalli/nvim-colorizer.lua
--Plug 'norcalli/nvim-colorizer.lua' -- colorize color names/number in text 
-- https://github.com/szw/vim-g
Plug 'szw/vim-g' -- :Google from the command line thing
-- https://github.com/dhruvmanila/telescope-bookmarks.nvim
Plug 'dhruvmanila/telescope-bookmarks.nvim'
-- https://github.com/akinsho/toggleterm.nvim
Plug 'akinsho/toggleterm.nvim'


-- Markdown --
-- https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'

-- https://github.com/plasticboy/vim-markdown
--Plug 'plasticboy/vim-markdown'

-- https://github.com/tpope/vim-markdown
--Plug 'tpope/vim-markdown'

-- https://github.com/SidOfc/mkdx
--Plug 'SidOfc/mkdx'

-- https://github.com/vim-pandoc/vim-pandoc
--Plug 'vim-pandoc/vim-pandoc'
-- https://github.com/vim-pandoc/vim-pandoc-syntax
--Plug 'vim-pandoc/vim-pandoc-syntax'


-- https://github.com/iamcco/markdown-preview.nvim
-- usage :MarkdownPreview
Plug('iamcco/markdown-preview.nvim', {
	['do'] = function()
		vim.cmd('cd app && yarn install')
	end
})

-- Telescope --
Plug('nvim-telescope/telescope-fzf-native.nvim', {
	['do'] = function()
		vim.cmd('make')
	end
})
-- https://github.com/nvim-lua/plenary.nvim
Plug 'nvim-lua/plenary.nvim'
-- https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope.nvim'
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
Plug 'nvim-telescope/telescope-file-browser.nvim'

-- Treesitter --
-- https://github.com/nvim-treesitter/nvim-treesitter
Plug('nvim-treesitter/nvim-treesitter', {
	['do'] = function()
		vim.cmd(':TSUpdate')
	end
})  -- We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'


--Plug('neoclide/coc.nvim', {branch = 'release'})

-- LSP config Base plugin --
-- https://github.com/neovim/nvim-lspconfig
Plug 'neovim/nvim-lspconfig'

-- completions
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip' -- snippet completions
--Plug 'hrsh7th/cmp-vsnip'
-- https://github.com/L3MON4D3/LuaSnip
Plug 'L3MON4D3/LuaSnip' -- snippet engine
-- https://github.com/rafamadriz/friendly-snippets
Plug 'rafamadriz/friendly-snippets' -- a bunch of snippets

-- Cheat sheet
-- Plug 'dbeniamine/cheat.sh-vim'
-- https://github.com/keith/swift.vim
--Plug 'keith/swift.vim'

-- debugger dap
-- https://github.com/mfussenegger/nvim-dap
-- Plug 'mfussenegger/nvim-dap'

-- Rust
-- https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'
-- https://github.com/simrat39/rust-tools.nvim
Plug 'simrat39/rust-tools.nvim'



vim.call('plug#end')

