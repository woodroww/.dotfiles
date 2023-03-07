-- for syntax highlighting
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = { "javascript", "help", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "html" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml", "python" } },
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

vim.api.nvim_set_hl(0, "@hh1", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "@hh2", { link = "markdownH2" })
vim.api.nvim_set_hl(0, "@hh3", { link = "markdownH3" })
vim.api.nvim_set_hl(0, "@hh4", { link = "markdownH4" })
vim.api.nvim_set_hl(0, "@hh5", { link = "markdownH5" })
vim.api.nvim_set_hl(0, "@hh6", { link = "markdownH6" })
vim.api.nvim_set_hl(0, "@h1", { link = "markdownH1" })
vim.api.nvim_set_hl(0, "@h2", { link = "markdownH2" })
vim.api.nvim_set_hl(0, "@h3", { link = "markdownH3" })
vim.api.nvim_set_hl(0, "@h4", { link = "markdownH4" })
vim.api.nvim_set_hl(0, "@h5", { link = "markdownH5" })
vim.api.nvim_set_hl(0, "@h6", { link = "markdownH6" })

vim.api.nvim_set_hl(0,"@text.uri" , { link = "TSUri" })
vim.api.nvim_set_hl(0, "@text.literal", { link = "TSLiteral" })
vim.api.nvim_set_hl(0, "@text.title", { link = "TSTitle" })
vim.api.nvim_set_hl(0, "@text.emphasis", { link = "TSEmphasis" })
vim.api.nvim_set_hl(0, "@text.strong", { link = "TSStrong" })
vim.api.nvim_set_hl(0, "@string.escape", { link = "TSStringEscape" })
vim.api.nvim_set_hl(0, "@punctuation.special", { link = "TSPunctSpecial" })
