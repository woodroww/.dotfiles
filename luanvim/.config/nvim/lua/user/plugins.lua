-- https://github.com/wbthomason/packer.nvim

-- snapshot dir ~/.cache/nvim/packer.nvim
-- :PackerSnapshot name

-- automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- automatically call PackerSync when saving this file
--[[
local group = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = { "plugins.lua" }, callback = function()
  vim.cmd("source")
  vim.cmd("PackerSync")
end, group = group })
--]]

local packer = require("packer")

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'
  -- https://github.com/aymericbeaumet/vim-symlink
  -- because linux doesn't follow links and just writes new files idk???
  use { 'aymericbeaumet/vim-symlink', requires = { 'moll/vim-bbye' } }

  -- https://github.com/gruvbox-community/gruvbox
  use 'gruvbox-community/gruvbox'
  -- https://github.com/itchyny/lightline.vim
  use 'itchyny/lightline.vim'
  -- https://github.com/tpope/vim-fugitive
  use 'tpope/vim-fugitive'
  -- https://github.com/airblade/vim-gitgutter
  use 'airblade/vim-gitgutter'
  -- https://github.com/sindrets/diffview.nvim
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  -- https://github.com/szw/vim-g
  use 'szw/vim-g' -- :Google from the command line thing
  -- https://github.com/tpope/vim-surround
  use 'tpope/vim-surround'
  -- https://github.com/mbbill/undotree
  use 'mbbill/undotree'
  -- https://github.com/junegunn/goyo.vim
  use 'junegunn/goyo.vim'
  -- https://github.com/junegunn/limelight.vim
  use 'junegunn/limelight.vim'
  -- https://github.com/AckslD/nvim-neoclip.lua
  use 'AckslD/nvim-neoclip.lua'
  -- https://github.com/base16-project/base16-vim
  use { 'base16-project/base16-vim', commit = '88a1e73e5358fefe0288538e6866f99d5487c5a0' }
  -- https://github.com/norcalli/nvim-colorizer.lua
  use 'norcalli/nvim-colorizer.lua' -- colorize color names/number in text
  -- https://github.com/mhinz/vim-startify
  use 'mhinz/vim-startify' -- A start menu for vim
  -- https://github.com/iamcco/markdown-preview.nvim
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  -- https://github.com/nvim-tree/nvim-web-devicons
  use 'nvim-tree/nvim-web-devicons'
  -- https://github.com/SmiteshP/nvim-navic
  use 'SmiteshP/nvim-navic'
  -- https://github.com/rust-lang/rust.vim
  use 'rust-lang/rust.vim'
  -- https://github.com/simrat39/rust-tools.nvim
  use 'simrat39/rust-tools.nvim'
  -- https://github.com/nvim-lua/plenary.nvim
  use { 'nvim-lua/plenary.nvim', commit = '9ac3e9541bbabd9d73663d757e4fe48a675bb054' }
  -- https://github.com/j-hui/fidget.nvim
  use { 'j-hui/fidget.nvim', tag = 'legacy' }
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- https://github.com/nvim-telescope/telescope-file-browser.nvim
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    commit = 'dad1b7cd6606ffaa5c283ba73d707b4741a5f445',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  -- https://github.com/nvim-treesitter/playground
  use 'nvim-treesitter/playground'
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- https://github.com/williamboman/mason.nvim
  use 'williamboman/mason.nvim'
  -- https://github.com/williamboman/mason-lspconfig.nvim
  use 'williamboman/mason-lspconfig.nvim'
  -- https://github.com/neovim/nvim-lspconfig
  use 'neovim/nvim-lspconfig'
  -- https://github.com/hrsh7th/nvim-cmp
  use 'hrsh7th/nvim-cmp'
  -- https://github.com/hrsh7th/cmp-nvim-lsp
  use 'hrsh7th/cmp-nvim-lsp'
  -- https://github.com/hrsh7th/cmp-buffer
  use 'hrsh7th/cmp-buffer'
  -- https://github.com/hrsh7th/cmp-path
  use 'hrsh7th/cmp-path'
  -- https://github.com/hrsh7th/cmp-cmdline
  use 'hrsh7th/cmp-cmdline'
  -- https://github.com/saadparwaiz1/cmp_luasnip
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  -- https://github.com/L3MON4D3/LuaSnip
  use 'L3MON4D3/LuaSnip' -- snippet engine
  -- https://github.com/rafamadriz/friendly-snippets
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets
  -- https://github.com/tpope/vim-commentary
  use 'tpope/vim-commentary'
  -- https://github.com/averms/black-nvim
  -- use 'averms/black-nvim'
  -- https://github.com/preservim/vim-markdown
  -- use 'preservim/vim-markdown'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

