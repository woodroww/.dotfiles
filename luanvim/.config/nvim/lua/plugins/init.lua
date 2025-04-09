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
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  -- https://github.com/szw/vim-g
  { 'szw/vim-g' }, -- :Google from the command line thing
  -- https://github.com/tpope/vim-surround
  { 'tpope/vim-surround' },
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
  -- https://github.com/rust-lang/rust.vim
  --{ 'rust-lang/rust.vim' },
  -- https://github.com/simrat39/rust-tools.nvim
  --{ 'simrat39/rust-tools.nvim' },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- https://github.com/nvim-lua/plenary.nvim
  { 'nvim-lua/plenary.nvim' },
  -- https://github.com/j-hui/fidget.nvim
  { 'j-hui/fidget.nvim', tag = 'legacy' },
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- https://github.com/nvim-telescope/telescope-file-browser.nvim
  { 'nvim-telescope/telescope-file-browser.nvim' },
  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
  { 'nvim-telescope/telescope-fzf-native.nvim',
    run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
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
  { 'williamboman/mason.nvim' },
  -- https://github.com/williamboman/mason-lspconfig.nvim
  { 'williamboman/mason-lspconfig.nvim' },
  -- https://github.com/neovim/nvim-lspconfig
  { 'neovim/nvim-lspconfig' },

  { 'tpope/vim-commentary' },
  -- https://github.com/averms/black-nvim
    -- pip install pynvim black
    -- /home/matt/.dotfiles/luanvim/.config/nvim/lua/user/options.lua
      -- black_virtualenv and python3_host_prog
  { 'averms/black-nvim' },
  -- https://github.com/preservim/vim-markdown
  -- use 'preservim/vim-markdown'
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
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "personal",
            path = "~/obsidian",
          },
        },
        ---completion = {
        ---  nvim_cmp = true,
        ---  min_chars = 2,
        ---},
        follow_url_func = function(url)
          vim.fn.jobstart({"open", url})
        end,
      })
    end,
  },
{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  -- version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
}
