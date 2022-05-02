-- this is where you set all the options
-- like word wrap and such and termcolors and tabspaces
--[[
vim.cmd [[
set rtp+=/Users/matt/.config/base16-vim/colors
" let g:base16_shell_path="/Users/matt/.config/base16-shell/scripts"
let g:base16_shell_path="/Users/matt/.local/share/nvim/plugged/base16-vim/colors"
colorscheme base16-gruvbox-dark-hard
" colorscheme base16-gruvbox-dark-medium
" colorscheme base16-gruvbox-dark-pale
" colorscheme base16-gruvbox-dark-soft
" colorscheme base16-gruvbox-light-hard
" colorscheme base16-gruvbox-light-medium
" colorscheme base16-gruvbox-light-soft
" base16colorspace=256,
]]--

local options = {
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  background = 'dark',					   -- this isn't necessary as I think nvim get info from the terminal as to what it is using
  termguicolors = true,                    -- set term gui colors (most terminals support this)
--  cursorline = true,                       -- highlight the current line
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  scrolloff = 5,                           -- is one of my fav
  sidescrolloff = 8,
  mouse = "a",                             -- allow the mouse to be used in neovim
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  tabstop = 4,                             -- insert 2 spaces for a tab
  wrap = false,                            -- display lines as one long line
  colorcolumn = '80',					   -- 80 char line
  hlsearch = false,                        -- highlight all matches on previous search pattern
  completeopt = { "menuone", "noselect", "preview" }, -- mostly just for cmp
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  errorbells = false,
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  conceallevel = 2,						   -- for hiding markdown 
  swapfile = false,                        -- creates a swapfile
  backup = false,                          -- creates a backup file
  autoindent = true,                       -- the :help said this should normally be on with smartindent
  cindent = true,
  smartindent = true,                      -- make indenting smarter again
--[[
  undofile = true,                         -- enable persistent undo
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  ignorecase = true,                       -- ignore case in search patterns
  pumheight = 10,                          -- pop up menu height
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
--]]
}

for k, v in pairs(options) do
  vim.opt[k] = v
end



vim.cmd [[
" this disables completly highlighting matchin parenthesis
" comment it out to have highlighting
let g:loaded_matchparen = 1
" then you can use these to turn it on and off
" :NoMatchParen :DoMatchParen

" vimwiki
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '/Users/matt/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian\ Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" goyo
let g:goyo_width = 80
let g:limelight_default_coefficient = 0.7
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" stop the commenting on a <cr>
set formatoptions-=cro

]]

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- turn on cursorline, cursorcolumn when searching, sync with hlsearch
--  [[
--vim.api.nvim_exec(
--augroup nvim-incsearch-cursorline
--	autocmd!
--	autocmd CmdlineEnter /,\? :set cursorline cursorcolumn hlsearch
--augroup END
  --false
--]],
--)

--[[
" rust
filetype plugin indent on

" to auto source on save
au! BufWritePost $MYVIMRC source %
--]]

