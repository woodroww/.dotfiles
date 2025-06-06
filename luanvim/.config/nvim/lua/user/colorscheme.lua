-- colorschemes
-- ~/.local/share/nvim/plugged/base16-vim/colors

--[[
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
--]]

vim.cmd [[
" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
set background=dark
let base16colorspace=256
let tinted_colorspace=256
let base16_colorspace=256
let g:base16_shell_path="~/dev/others/base16/templates/shell/scripts/"

" colorscheme gruvbox
colorscheme base16-tomorrow-night
" colorscheme base16-tokyo-city-dark


syntax on
hi Normal ctermbg=NONE
]]
