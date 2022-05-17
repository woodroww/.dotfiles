local Plug = vim.fn['plug#']
-- https://github.com/NTBBloodbath/rest.nvim
Plug 'NTBBloodbath/rest.nvim'
vim.call('plug#end')

--require "nvim-lua/plenary.nvim"
require("rest-nvim").setup({
  -- Open request results in a horizontal split
  result_split_horizontal = false,
  -- Keep the http file buffer above|left when split horizontal|vertical
  result_split_in_place = false,
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = false,
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    -- toggle showing URL, HTTP info, headers at top the of result window
    show_url = true,
    show_http_info = true,
    show_headers = true,
  },
  -- Jump to request line on run
  jump_to_request = false,
  env_file = '.env',
  custom_dynamic_variables = {},
  yank_dry_run = true,
})
-- https://github.com/adalessa/dotfiles/blob/fa5d1655b78f6d0cf396ab576392862e12fafcaa/nvim/.config/nvim/after/plugin/rest.lua
local opts = { noremap = true , silent = true }
vim.api.nvim_set_keymap("n", "<leader>y", "<cmd>lua require('rest-nvim').run()<cr>" , opts)
vim.api.nvim_set_keymap("n", "<leader>yp", "<cmd>lua require('rest-nvim').preview()<cr>" , opts)
vim.api.nvim_set_keymap("n", "<leader>yl", "<cmd>lua require('rest-nvim').last()<cr>" , opts)
