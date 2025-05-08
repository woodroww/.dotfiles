return {
  -- https://github.com/aymericbeaumet/vim-symlink
  -- because linux doesn't follow links and just writes new files idk???
  { 'aymericbeaumet/vim-symlink', dependencies = { 'moll/vim-bbye' } },

  -- https://github.com/gruvbox-community/gruvbox
  { 'gruvbox-community/gruvbox' },
  -- https://github.com/itchyny/lightline.vim
  { 'itchyny/lightline.vim' },
  -- https://github.com/tpope/vim-fugitive
  { 'tpope/vim-fugitive' },
  -- https://github.com/airblade/vim-gitgutter
  { 'airblade/vim-gitgutter' },
  -- https://github.com/sindrets/diffview.nvim
  { 'sindrets/diffview.nvim',     dependencies = 'nvim-lua/plenary.nvim' },
  -- https://github.com/szw/vim-g
  { 'szw/vim-g' }, -- :Google from the command line thing
  -- https://github.com/mbbill/undotree
  { 'mbbill/undotree' },
  -- https://github.com/junegunn/goyo.vim
  { 'junegunn/goyo.vim' },
  -- https://github.com/junegunn/limelight.vim
  { 'junegunn/limelight.vim' },
  -- https://github.com/AckslD/nvim-neoclip.lua
  { 'AckslD/nvim-neoclip.lua' },
  -- https://github.com/base16-project/base16-vim
  -- https://github.com/tinted-theming/tinted-vim
  {
    "tinted-theming/tinted-vim",
    config = function()
      vim.cmd.colorscheme 'base16-tomorrow-night'
    end,
  },
  -- https://github.com/norcalli/nvim-colorizer
  -- use 'norcalli/nvim-colorizer.lua' -- colorize color names/number in text
  -- https://github.com/mhinz/vim-startify
  { 'mhinz/vim-startify' },

  -- https://github.com/preservim/vim-markdown
  -- { 'preservim/vim-markdown' },

  -- https://github.com/iamcco/markdown-preview.nvim
  -- :MarkdownPreview
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },
  -- https://github.com/nvim-tree/nvim-web-devicons
  { 'nvim-tree/nvim-web-devicons' },
  -- https://github.com/SmiteshP/nvim-navic
  { 'SmiteshP/nvim-navic' },
  -- does this rust.vim provide better syntax highlighting idk
  -- https://github.com/rust-lang/rust.vim
  --{ 'rust-lang/rust.vim' },
  -- https://github.com/mrcjkb/rustaceanvim
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },

  -- https://github.com/nvim-lua/plenary.nvim
  { 'nvim-lua/plenary.nvim' },

  -- https://github.com/j-hui/fidget.nvim
  { 'j-hui/fidget.nvim',                        tag = 'legacy' },

  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- https://github.com/nvim-telescope/telescope.nvim
  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim'
    },
    config = function()
      require('telescope').load_extension('fzf')
    end
  },
  -- https://github.com/nvim-telescope/telescope-file-browser.nvim
  { 'nvim-telescope/telescope-file-browser.nvim' },

  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  },
  -- https://github.com/nvim-treesitter/playground
  { 'nvim-treesitter/playground' },
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  -- https://github.com/williamboman/mason.nvim
  { 'mason-org/mason.nvim' },
  -- https://github.com/williamboman/mason-lspconfig.nvim
  { 'mason-org/mason-lspconfig.nvim' },
  -- https://github.com/neovim/nvim-lspconfig
  { 'neovim/nvim-lspconfig' },

  -- https://github.com/prettier/vim-prettier
  {
    "prettier/vim-prettier",
    run = "yarn install",
    ft = { "html", "vue", "json", "js" },
  },
  -- https://github.com/epwalsh/obsidian.nvim
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/obsidian",
        },
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url })
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,
      follow_img_func = function(img)
        vim.fn.jobstart { "qlmanage", "-p", img } -- Mac OS quick look preview
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,
    }
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },
    build = 'cargo build --release',
    opts = {
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'enter',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
      },
      appearance = {
        nerd_font_variant = 'Nerd Font Mono'
      },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      enabled = function()
        return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
      end,
    },

    opts_extend = { "sources.default" },
    menu = {
      auto_show = false,
    },
  },
}
