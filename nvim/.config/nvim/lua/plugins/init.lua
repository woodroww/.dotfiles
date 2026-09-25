return {
  -- https://github.com/nvim-lua/plenary.nvim
  { 'nvim-lua/plenary.nvim' },
  -- https://github.com/tinted-theming/tinted-vim
  {
    "tinted-theming/tinted-vim",
    config = function()
      vim.cmd.colorscheme 'base16-tomorrow-night'
    end,
  },

  -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.1',
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

  -- original
  -- https://github.com/epwalsh/obsidian.nvim
  -- fork for blink completion
  -- https://github.com/obsidian-nvim/obsidian.nvim
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = "personal",
          path = "~/obsidian",
        },
      },
      frontmatter = {
        enabled = false,
      },
      -- Open the URL in the default web browser.
      ---@param url string
      follow_url_func = function(url)
        vim.fn.jobstart({ "open", url }) -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
        -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
        -- vim.ui.open(url) -- need Neovim 0.10.0+
      end,

      disable_frontmatter = true,
    }
  },

  -- https://github.com/szw/vim-g
  -- :Google from the command line thing
  { 'szw/vim-g' },

  -- https://github.com/itchyny/lightline.vim
  -- status bar at bottom of page
  { 'itchyny/lightline.vim' },

  -- https://github.com/AckslD/nvim-neoclip.lua
  -- copy paste history
  { 'AckslD/nvim-neoclip.lua' },

  -- https://github.com/SmiteshP/nvim-navic
  -- for filename at top of window
  { 'SmiteshP/nvim-navic' },

  -- https://github.com/neovim/nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  -- https://github.com/williamboman/mason-lspconfig.nvim
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      -- https://github.com/williamboman/mason.nvim
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

  -- https://github.com/mrcjkb/rustaceanvim
  {
    'mrcjkb/rustaceanvim',
    version = '^9', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  -- https://github.com/j-hui/fidget.nvim
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        display = {
          render_limit = 0,
        },
      },
    },
  },

  -- https://github.com/nvim-treesitter/nvim-treesitter
  -- for compile errors check if cli is installed
  -- cargo install tree-sitter-cli
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { "markdown", "markdown_inline", "vim", "javascript", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua", "glsl", "toml", "wgsl" },
        callback = function()
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- folds, provided by Neovim (I don't like folds)
          -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- vim.wo.foldmethod = 'expr'
          -- indentation, provided by nvim-treesitter
          -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    'saghen/blink.cmp',
    -- https://github.com/saghen/blink.cmp
    -- docs https://cmp.saghen.dev
    -- optional: provides snippets for the snippet source
    version = "1.*",
    dependencies = {
      {
        'Kaiser-Yang/blink-cmp-dictionary',
        dictionary_files = { vim.fn.expand('~/.dotfiles/nvim/.config/nvim/spell/words.txt') },
        dependencies = { 'nvim-lua/plenary.nvim' }
      },
        'rafamadriz/friendly-snippets'
    },
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
      completion = {
        documentation = { auto_show = false },
        menu = { auto_show = false }
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'dictionary' },
        providers = {
            dictionary = {
                module = 'blink-cmp-dictionary',
                name = 'Dict',
                -- Make sure this is at least 2.
                -- 3 is recommended
                min_keyword_length = 3,
                opts = {
                    -- options for blink-cmp-dictionary
                },
            }
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      enabled = function()
        return not vim.tbl_contains({ "lua" }, vim.bo.filetype)
      end,
    },
  },

  -- -- https://github.com/nvim-treesitter/playground
  -- { 'nvim-treesitter/playground' },
  -- -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- { 'nvim-treesitter/nvim-treesitter-textobjects' },
  -- -- https://github.com/tidalcycles/vim-tidal
  -- { 'tidalcycles/vim-tidal' },
  -- -- https://github.com/karoliskoncevicius/vim-sendtowindow
  -- { 'karoliskoncevicius/vim-sendtowindow' },
  -- -- https://github.com/aymericbeaumet/vim-symlink
  -- -- because linux doesn't follow links and just writes new files idk???
  -- { 'aymericbeaumet/vim-symlink',         dependencies = { 'moll/vim-bbye' } },
  -- -- https://github.com/tpope/vim-fugitive
  -- { 'tpope/vim-fugitive' },
  -- -- https://github.com/airblade/vim-gitgutter
  -- { 'airblade/vim-gitgutter' },
  -- -- https://github.com/sindrets/diffview.nvim
  -- { 'sindrets/diffview.nvim',             dependencies = 'nvim-lua/plenary.nvim' },
  -- -- https://github.com/gruvbox-community/gruvbox
  -- { 'gruvbox-community/gruvbox' },
  -- -- https://github.com/mbbill/undotree
  -- { 'mbbill/undotree' },
  -- -- https://github.com/junegunn/goyo.vim
  -- --{ 'junegunn/goyo.vim' },
  -- -- https://github.com/junegunn/limelight.vim
  -- --{ 'junegunn/limelight.vim' },
  -- -- https://github.com/norcalli/nvim-colorizer
  -- -- colorize color names/number in text
  -- { 'norcalli/nvim-colorizer.lua' },
  -- -- https://github.com/mhinz/vim-startify
  -- { 'mhinz/vim-startify' },
  -- -- https://github.com/preservim/vim-markdown
  -- -- { 'preservim/vim-markdown' },
  -- -- https://github.com/iamcco/markdown-preview.nvim
  -- -- :MarkdownPreview
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   run = "cd app && npm install",
  --   setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
  --   ft = { "markdown" },
  -- },
  -- -- https://github.com/nvim-tree/nvim-web-devicons
  -- { 'nvim-tree/nvim-web-devicons' },
  -- -- https://github.com/prettier/vim-prettier
  -- {
  --   "prettier/vim-prettier",
  --   run = "yarn install",
  --   ft = { "html", "vue", "json", "js" },
  -- },
  -- { 'mfussenegger/nvim-dap' },
}
