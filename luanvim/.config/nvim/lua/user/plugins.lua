
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

vim.cmd [[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
]]

local Plug = vim.fn['plug#']

-- https://github.com/junegunn/vim-plug
vim.call('plug#begin', '~/.local/share/nvim/plugged')
-- https://github.com/gruvbox-community/gruvbox
Plug 'gruvbox-community/gruvbox'
-- https://github.com/preservim/nerdtree
-- Plug 'preservim/nerdtree'            -- side bar file tree
-- https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'         -- minmal status bar
-- https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'            -- allows git commands in vim session
-- https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'        -- shows git changes in gutter
-- https://github.com/yuttie/comfortable-motion.vim
-- Plug 'yuttie/comfortable-motion.vim' -- scrolling 'C-d' or 'C-u'
-- https://github.com/szw/vim-g
Plug 'szw/vim-g' -- :Google from the command line thing
-- https://github.com/akinsho/toggleterm.nvim
--Plug 'akinsho/toggleterm.nvim'
-- https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
-- https://github.com/mbbill/undotree
Plug 'mbbill/undotree'
-- https://github.com/vimwiki/vimwiki
--Plug 'vimwiki/vimwiki'

-- The plugin that simplifies the interface in nvim for the purposes of writing text.
-- https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'

-- https://github.com/junegunn/limelight.vim
Plug 'junegunn/limelight.vim'



-- https://github.com/bennypowers/nvim-regexplainer
-- Plug 'bennypowers/nvim-regexplainer'

-- https://github.com/AckslD/nvim-neoclip.lua
Plug 'AckslD/nvim-neoclip.lua'

-- https://github.com/base16-project/base16-vim
Plug 'base16-project/base16-vim'

-- python code formatting
-- https://github.com/averms/black-nvim
--[[
Plug ('averms/black-nvim', {
	['do'] = function()
		vim.cmd(':UpdateRemotePlugins')
	end
})
--]]

-- https://github.com/sindrets/diffview.nvim
Plug 'sindrets/diffview.nvim'

-- https://github.com/iamcco/markdown-preview.nvim
-- usage :MarkdownPreview
-- I had to go to ~/.local/share/nvim/plugged/markdown-preview.nvim/ and
-- yarn install to get this to work so idk what the below is doing
Plug('iamcco/markdown-preview.nvim', {
	['do'] = function()
		vim.cmd('cd app && yarn install')
	end
})

-- Telescope --
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
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
-- https://github.com/nvim-treesitter/playground
Plug 'nvim-treesitter/playground'

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
-- https://github.com/L3MON4D3/LuaSnip
Plug 'L3MON4D3/LuaSnip' -- snippet engine
-- https://github.com/rafamadriz/friendly-snippets
Plug 'rafamadriz/friendly-snippets' -- a bunch of snippets

-- for chris winbar
Plug 'nvim-tree/nvim-web-devicons'
--Plug 'SmiteshP/nvim-navic'

-- https://github.com/SmiteshP/nvim-navic
Plug "SmiteshP/nvim-navic"
-- https://github.com/fgheng/winbar.nvim
-- not for with chris winbar Plug 'fgheng/winbar.nvim'

-- Cheat sheet
-- Plug 'dbeniamine/cheat.sh-vim'
-- https://github.com/keith/swift.vim
--Plug 'keith/swift.vim'

-- debugger dap
-- https://github.com/mfussenegger/nvim-dap
Plug 'mfussenegger/nvim-dap'

-- tj video https://www.youtube.com/watch?v=0moS8UHupGc&t=1767s
-- https://github.com/rcarriga/nvim-dap-ui
--Plug 'rcarriga/nvim-dap-ui'
-- https://github.com/theHamsta/nvim-dap-virtual-text
-- https://github.com/nvim-telescope/telescope-dap.nvim

-- commented out to see if speed up loading
-- https://github.com/puremourning/vimspector
Plug 'puremourning/vimspector'



-- Java

-- Rust
-- https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'
-- https://github.com/simrat39/rust-tools.nvim
Plug 'simrat39/rust-tools.nvim'


vim.call('plug#end')

