-- https://github.com/neovim/nvim-lspconfig/
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

require'lspconfig'.pylsp.setup{}
--require'lspconfig'.pyright.setup{}

require('rust-tools').setup(opts)


require'lspconfig'.clangd.setup{}


--require'lspconfig'.r_language_server.setup{}

-- Swift c/c++/objective-c
-- https://github.com/apple/sourcekit-lsp
-- require'lspconfig'.sourcekit.setup{}










--local status_ok, _ = pcall(require, "lspconfig")
--if not status_ok then
--	return
--end

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/lsp/lsp-installer.lua
--require("user.lsp.lsp-installer")

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/lsp/handlers.lua
--require("user.lsp.handlers").setup()
