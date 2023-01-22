-- https://github.com/nvim-telescope/telescope.nvim

local action_layout = require('telescope.actions.layout')
local actions = require('telescope.actions')
local previewers = require("telescope.previewers")
local browser = require "telescope".extensions.file_browser

require('telescope').setup {
	defaults = {
		path_display = { "truncate" },
		previewer = true,
		file_previewer = previewers.vim_buffer_cat.new,
		layout_strategy = "vertical",
		pickers = {
			find_files = {
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
				['<C-f>'] = actions.close, -- keys from pressing <C-/>
			},
		},
	}
}

-- https://github.com/nvim-telescope/telescope-file-browser.nvim
require("telescope").load_extension("file_browser")

require("telescope").load_extension("neoclip")

require("neoclip").setup {
	requires = {
		--{'tami5/sqlite.lua', module = 'sqlite'},
		-- you'll need at least one of these
		{ 'nvim-telescope/telescope.nvim' },
		-- {'ibhagwan/fzf-lua'},
	},
	keys = {
		telescope = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	}

}
