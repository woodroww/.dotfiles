-- Helpful blog for lua and nvim config
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/options.lua
require "user.options"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/keymaps.lua
require "user.keymaps"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/plugins.lua
require "user.plugins"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/lsp/init.lua
require "user.lsp"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/colorscheme.lua
require "user.colorscheme"

vim.cmd('source ~/.dotfiles/luanvim/.config/nvim/lua/user/send_to_window.vim')

--vim.cmd('source ~/.dotfiles/luanvim/.config/nvim/lua/user/lightline.vim')


-- added my python snip dir to
-- ~/.local/share/nvim/plugged/friendly-snippets/package.json
-- ~/.dotfiles/luanvim/.config/nvim/lua/user/cmp.lua
--require "user.cmp"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/treesitter_playground.lua
require "user.treesitter_playground"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/treesyntax.lua
require "user.treesyntax"

-- the colors show up when your write the hex or rgb
-- ~/.dotfiles/luanvim/.config/nvim/lua/user/plug-colorizer.lua
require "user.plug-colorizer"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/telescope_config.lua
require "user.telescope_config"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/startify.lua
require "user.startify"

-- ~/.dotfiles/luanvim/.config/nvim/lua/user/markdown.lua
require "user.markdown"
