-- https://github.com/williamboman/mason-lspconfig.nvim
-- servers are stored in:
-- ~/.local/share/nvim/mason/packages
-- servers are listed at:
-- https://mason-registry.dev/registry/list
require("mason").setup()
require("mason-lspconfig").setup()

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/lsp/init.lua
local config = require("user.lsp")

-- require("mason-lspconfig").setup({
--   ensure_installed = { "lua_ls", "cssls", "gopls", "tsserver", "emmet_ls", "volar", "pyright", "clangd" },
-- maybe eslint
--   installation = true,
-- })

require("mason-lspconfig").setup_handlers {
  -- default handler
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = config.capabilities,
      on_attach = config.on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end,

  -- Next, you can provide a dedicated handler for specific servers.

  ["lua_ls"] = function()
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    require 'lspconfig'.lua_ls.setup {
      capabilities = config.capabilities,
      on_attach = config.on_attach,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path,
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
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
  end,

  -- cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgsl_analyzer
  ["wgsl_analyzer"] = function()
    require("lspconfig").wgsl_analyzer.setup({
      on_attach = config.on_attach,
      capabilities = config.capabilities,
      cmd = { vim.fn.expand("$HOME") .. "/.cargo/bin/wgsl_analyzer" },
      filetypes = { "wgsl" },
      root_dir = require("lspconfig").util.root_pattern(".git", "wgsl"),
      settings = {},
    })
  end,
  
  -- https://github.com/aca/emmet-ls
  ["emmet_ls"] = function()
    require("lspconfig").emmet_ls.setup({
      --on_attach = config.on_attach,
      capabilities = config.capabilities,
      filetypes = { "css", "html", "vue" },
      root_dir = function(fname)
        return vim.loop.cwd()
      end,
    })
  end,
}
