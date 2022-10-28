-- https://github.com/neovim/nvim-lspconfig/
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	print("Something has gone wrong with lspconfig")
	return
end

-- This is the famous on attach function
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

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
end

local cc = vim.lsp.protocol.make_client_capabilities()
cc.textDocument.completion.completionItem.snippetSupport = true
-- local capabilities = require'cmp_nvim_lsp'.update_capabilities(cc)
local capabilities = require'cmp_nvim_lsp'.default_capabilities(cc)

vim.cmd [[
let g:lsc_server_commands = {'java': '/Users/matt/external_code/java-language-server/dist/lang_server_mac.sh'}
]]

require("lspconfig").java_language_server.setup{}

require("lspconfig").pyright.setup{}


require("lspconfig").tsserver.setup{
	capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}

--[[
require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
}
]]--
--[[
add a jsconfig.json or tsconfig.json in the root of your project
{
  "compilerOptions": {
    "module": "commonjs",
    "target": "es6",
    "checkJs": false
  },
  "exclude": [
    "node_modules"
  ]
}
]]--


require'lspconfig'.clangd.setup{
	capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
--[[
--rust-tools calls this
require'lspconfig'.rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  }
}--]]
require('rust-tools').setup({
  server = {
    on_attach = on_attach
  }
})

--require'lspconfig'.pylsp.setup{}
--require'lspconfig'.pyright.setup{}
--require'lspconfig'.r_language_server.setup{}

-- Swift c/c++/objective-c
-- https://github.com/apple/sourcekit-lsp
require'lspconfig'.sourcekit.setup{
  capabilities = capabilities,
  filetypes = { "swift" },
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

require'lspconfig'.cssls.setup{
  capabilities = capabilities,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
		checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require("lspconfig").wgsl_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { vim.fn.expand("$HOME") .. "/.cargo/bin/wgsl_analyzer" },
	filetypes = { "wgsl" },
	root_dir = require("lspconfig").util.root_pattern(".git", "wgsl"),
	settings = {},
})

