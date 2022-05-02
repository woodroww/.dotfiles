local action_layout = require('telescope.actions.layout')
local actions = require('telescope.actions')
local previewers = require("telescope.previewers")
local browser = require "telescope".extensions.file_browser

require('telescope').setup{
  defaults = {
	path_display={ "truncate" },
    previewer = true,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    layout_strategy = "flex",
    pickers = {
        find_files = {
	    theme = "dropdown",
		},
		colorscheme = {
	    	theme = "dropdown",
		},
    },
    mappings = {
      n = {
        ['<M-p>'] = action_layout.toggle_preview
      },
      i = {
        ['<M-p>'] = action_layout.toggle_preview,
		['<M-s>'] = browser.actions.sort_by_date,
		['<C-j>'] = actions.move_selection_next,
		['<C-k>'] = actions.move_selection_previous,
		['<C-/>'] = actions.which_key, -- keys from pressing <C-/>
	  },
    },
  }
}

-- https://github.com/nvim-telescope/telescope-file-browser.nvim
require("telescope").load_extension("file_browser")


--[[
require('telescope').setup {
  extensions = {
    bookmarks = {
      -- Available: 'brave', 'google_chrome', 'safari', 'firefox'
      selected_browser = 'google_chrome',

      -- Either provide a shell command to open the URL
      url_open_command = 'open',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,

      -- Provide a custom profile name for Firefox
      firefox_profile_name = nil,
    },
  }
}
require('telescope').load_extension('bookmarks')
--]]





