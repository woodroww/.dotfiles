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

vim.api.nvim_set_hl(0,"@text.reference" , { link = "TSUri" })
vim.api.nvim_set_hl(0, "@text.literal", { link = "TSLiteral" })
vim.api.nvim_set_hl(0, "@text.title", { link = "TSTitle" })
vim.api.nvim_set_hl(0, "@text.emphasis", { link = "TSEmphasis" })
vim.api.nvim_set_hl(0, "@text.strong", { link = "TSStrong" })
vim.api.nvim_set_hl(0, "@string.escape", { link = "TSStringEscape" })
vim.api.nvim_set_hl(0, "@punctuation.special", { link = "TSPunctSpecial" })

-- treesitter and LSP links to default groups
local links = {
  ["@lsp.type.namespace"] = "@namespace",
  ["@lsp.type.type"] = "@type",
  ["@lsp.type.class"] = "@type",
  ["@lsp.type.enum"] = "@type",
  ["@lsp.type.interface"] = "@type",
  ["@lsp.type.struct"] = "@structure",
  ["@lsp.type.parameter"] = "@parameter",
  ["@lsp.type.variable"] = "@variable",
  ["@lsp.type.property"] = "@property",
  ["@lsp.type.enumMember"] = "@constant",
  ["@lsp.type.function"] = "@function",
  ["@lsp.type.method"] = "@method",
  ["@lsp.type.macro"] = "@macro",
  ["@lsp.type.decorator"] = "@function",
  ["@lsp.mod.defaultLibrary"] = "@function.builtin",
  ["@lsp.mod.readonly"] = "@constant",
  ["@lsp.typemod.function.defaultLibrary"] = "@function.builtin",
  ["@lsp.typemod.variable.defaultLibrary"] = "@variable.builtin",
  ["@lsp.typemod.variable.readonly"] = "@constant",
}

for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
