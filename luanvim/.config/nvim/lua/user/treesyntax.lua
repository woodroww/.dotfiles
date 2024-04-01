-- for syntax highlighting
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = { "markdown", "markdown_inline", "vim", "javascript", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua", "glsl" },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "html" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    --additional_vim_regex_highlighting = { "markdown" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "yaml", "python", "html", "javascript" } },
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
