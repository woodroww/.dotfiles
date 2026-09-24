require('nvim-treesitter').install { "markdown", "markdown_inline", "vim", "javascript", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua", "glsl", "toml", "wgsl" }

-- for syntax highlighting
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = { "markdown", "markdown_inline", "vim", "javascript", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua", "glsl", "toml", "wgsl" },
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "html", "checkhealth" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    --additional_vim_regex_highlighting = { "markdown" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml", "html", "javascript" } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<m-f>',
      node_incremental = '<m-d>',
      scope_incremental = '<m-s>',
      node_decremental = '<m-a>',
    },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install { "markdown", "markdown_inline", "vim", "javascript", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua", "glsl", "toml", "wgsl" }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "markdown", "markdown_inline", "vim", "javascript", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua", "glsl", "toml", "wgsl" },
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim (I don't like folds)
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

  end
 }
