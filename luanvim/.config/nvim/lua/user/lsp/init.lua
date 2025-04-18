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
  --  buf_set_keymap('n', '<space>w', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', ':lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', ':lua vim.diagnostic.setloclist()<CR>', opts)
  --  buf_set_keymap('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>', opts)
  --print("on attach called")

  -- Since rust_analyzer now has some semantic highlights and treesitter was working fine for me
  -- https://github.com/TheLeoP/nvim-config/blob/79d79dc0da0123d0d64d646fdbd41a9c2bab7612/after/plugin/highlight.lua#L98
  -- Hide all semantic highlights
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
  end
  --client.server_capabilities.semanticTokensProvider = vim.NIL
end

local cc = vim.lsp.protocol.make_client_capabilities()
cc.textDocument.completion.completionItem.snippetSupport = true
--- M.capabilities = require 'cmp_nvim_lsp'.default_capabilities(cc)

M.capabilities = require('blink.cmp').get_lsp_capabilities()

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = false, })

--vim.highlight.priorities.semantic_tokens = 95
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>e', ':lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', ':lua vim.diagnostic.setloclist()<CR>', opts)
    end,
    capabilities = M.capabilities,
  },
}

-- Swift c/c++/objective-c
-- https://github.com/apple/sourcekit-lsp
require 'lspconfig'.sourcekit.setup {
  capabilities = M.capabilities,
  filetypes = { "swift" },
  on_attach = M.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}
-- https://github.com/svenstaro/glsl-language-server
require 'lspconfig'.glslls.setup {
  capabilities = M.capabilities,
  filetypes = { "glsl" },
  on_attach = M.on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

return M
