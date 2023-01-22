-- automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer = require("packer")

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'gruvbox-community/gruvbox'
  use 'itchyny/lightline.vim'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
	use 'szw/vim-g' -- :Google from the command line thing
	use 'tpope/vim-surround'
	use 'mbbill/undotree'
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'
	use 'AckslD/nvim-neoclip.lua'
	use 'base16-project/base16-vim'
	use 'norcalli/nvim-colorizer.lua' -- colorize color names/number in text
	use 'mhinz/vim-startify' -- A start menu for vim
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'nvim-tree/nvim-web-devicons'
  use "SmiteshP/nvim-navic"
	use 'rust-lang/rust.vim'
	use 'simrat39/rust-tools.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'j-hui/fidget.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip' -- snippet completions
	use 'L3MON4D3/LuaSnip' -- snippet engine
	use 'rafamadriz/friendly-snippets' -- a bunch of snippets


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- https://github.com/sindrets/diffview.nvim

