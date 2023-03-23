require("mason").setup()
require("mason-lspconfig").setup()
local config = require("user.lsp")

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
  --[[
  ["rust_analyzer"] = function()
    require('rust-tools').setup({
      server = {
        capabilities = config.capabilities,
        on_attach = config.on_attach
      }
    })
  end,
  --]]

  ["lua_ls"] = function()
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
    runtime_path = vim.split(package.path, ';')
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
}

-- outside of mason

require('rust-tools').setup {
  server = {
    capabilities = config.capabilities,
    on_attach = config.on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
}

