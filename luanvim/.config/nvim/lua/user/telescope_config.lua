local action_layout = require('telescope.actions.layout')
local actions = require('telescope.actions')
local previewers = require("telescope.previewers")

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
        ['<M-p>'] = action_layout.toggle_preview
      },
--      i = {
--        ["<esc>"] = actions.close
--      },
    },
  }
}
