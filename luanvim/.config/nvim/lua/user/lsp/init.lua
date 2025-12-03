local M = {}

-- https://github.com/neovim/nvim-lspconfig/
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("Something has gone wrong with lspconfig")
  return
end

-- This is the famous on attach function
-- Use an on_attach function to  map the following keys only after the language
-- server attaches to the current buffer

function M.on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- turn off lsp highlighting
  client.server_capabilities.semanticTokensProvider = nil

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-s>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', ':lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', ':lua vim.diagnostic.setloclist()<CR>', opts)
end

--for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--  vim.api.nvim_set_hl(0, group, {})
--end

local cc = vim.lsp.protocol.make_client_capabilities()
cc.textDocument.completion.completionItem.snippetSupport = true
--M.capabilities = require('blink.cmp').get_lsp_capabilities(cc)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = false, })

vim.g.rustaceanvim = {
  server = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
  },
}

-- Swift c/c++/objective-c
-- https://github.com/apple/sourcekit-lsp
vim.lsp.config.sourcekit = {
-- require 'lspconfig'.sourcekit.setup {
  capabilities = M.capabilities,
  filetypes = { "swift" },
  on_attach = M.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
-- https://github.com/svenstaro/glsl-language-server

vim.lsp.config.glslls = {
-- require 'lspconfig'.glslls.setup {
  capabilities = M.capabilities,
  filetypes = { "glsl" },
  on_attach = M.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

return M
