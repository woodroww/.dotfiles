-- ~/.dotfiles/luanvim/.config/nvim/lua/user/plugins.lua
require "user.plugins"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/keymaps.lua
require "user.keymaps"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/options.lua
require "user.options"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/mason-config.lua
require "user.mason-config"
-- ~/.dotfiles/luanvim/.config/nvim/lua/user/lsp/init.lua
-- mason calls require "user.lsp"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/cmp.lua
require "user.cmp"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/lightline.lua
require "user.lightline"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/colorscheme.lua
require "user.colorscheme"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/navic_config.lua
require("user.navic_config")
vim.o.winbar = "%{%v:lua.require'user.navic_config'.eval()%}"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/send_to_window.vim
vim.cmd('source ~/.dotfiles/luanvim/.config/nvim/lua/user/send_to_window.vim')

-- ~/.dotfiles/luanvim/.config/nvim/bclose.vim
vim.cmd('source ~/.dotfiles/luanvim/.config/nvim/bclose.vim')

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/toggleterm.lua
require "user.toggleterm"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/treesitter_playground.lua
require "user.treesitter_playground"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/treesyntax.lua
require "user.treesyntax"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/telescope_config.lua
require "user.telescope_config"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/startify.lua
require "user.startify"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/plug-colorizer.lua
require "user.plug-colorizer"
