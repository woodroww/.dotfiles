-- Linting for python
local Plug = vim.fn['plug#']
-- https://github.com/mfussenegger/nvim-lint
Plug 'mfussenegger/nvim-lint'
vim.call('plug#end')

require('lint').linters_by_ft = {
	python = {'pylint',}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require('lint').try_lint()
	end,
})

