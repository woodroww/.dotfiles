-- search settings <leader>fs

vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })

-- ~/.config/nvim/lua/user/options.lua
require "user.options"

-- ~/.config/nvim/lua/plugins/init.lua
require "config.lazy"

require("nvim-treesitter").setup()
require("nvim-treesitter").install { "markdown", "markdown_inline", "vim", "javascript", "rust", "c", "go", "html", "python", "yaml", "css", "cpp", "lua", "glsl", "toml", "wgsl" }

-- ~/.config/nvim/lua/user/mason-config.lua
-- calls ~/.dotfiles/nvim/.config/nvim/lua/user/lsp/init.lua
require "user.mason-config"

-- ~/.config/nvim/lua/user/keymaps.lua
require "user.keymaps"

-- ~/.config/nvim/lua/user/lightline.lua
require "user.lightline"

-- ~/.config/nvim/lua/user/telescope_config.lua
require "user.telescope_config"

-- ~/.config/nvim/lua/user/bclose.vim
vim.cmd('source ~/.config/nvim/lua/user/bclose.vim')

-- ~/.config/nvim/lua/user/navic_config.lua
require("user.navic_config")
vim.o.winbar = "%{%v:lua.require'user.navic_config'.eval()%}"

-- ~/.config/nvim/lua/user/lsp/init.lua
require("user.lsp")

