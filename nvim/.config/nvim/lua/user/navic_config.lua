require("nvim-navic").setup()

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%%}"

vim.api.nvim_set_hl(0, 'WinBarPath', { bg = '#1d1f21', fg = '#969896' })
-- vim.api.nvim_set_hl(0, 'WinBarModified', { bg = '#1d1f21', fg = '#7d0000' })

local M = {}

function M.eval()
  --local full_path = vim.api.nvim_buf_get_name()
  local file_path = vim.api.nvim_eval_statusline('%f', {}).str
  local modified = vim.api.nvim_eval_statusline('%M', {}).str

  return '%#WinBarPath#'
    .. file_path
	.. ' '
	.. modified
	.. ' '
    .. require'nvim-navic'.get_location()
end

return M
