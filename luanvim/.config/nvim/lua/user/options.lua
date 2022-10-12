-- this is where you set all the options
-- like word wrap and such and termcolors and tabspaces

local options = {
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  background = 'dark',					   -- this isn't necessary as I think nvim get info from the terminal as to what it is using
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  scrolloff = 3,                           -- number of lines cursor is away from top or bottom before scroll starts
  sidescrolloff = 8,
  mouse = "a",                             -- allow the mouse to be used in neovim
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  tabstop = 4,                             -- insert 4 spaces for a tab
  wrap = false,                            -- display lines as one long line
  colorcolumn = '80',					   -- 80 char line
  hlsearch = true,                        -- highlight all matches on previous search pattern
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
  smartindent = true,                      -- make indenting smarter again
  undofile = true,                         -- enable persistent undo across saves and sessions
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case, use case sensitive if capital letters are used in search string
--[[
  cindent = true,
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  fileencoding = "utf-8",                  -- the encoding written to a file
  pumheight = 10,                          -- pop up menu height
  showtabline = 2,                         -- always show tabs
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

let g:python3_host_prog = '/Users/matt/.pyenv/versions/daniel_torch/bin/python'
let g:black_virtualenv = '/Users/matt/.pyenv/versions/daniel_torch'

" default
" set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
" all block all the time
" set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20

set spell spelllang=en_us,es,de
set nospell
" this disables completly highlighting matchin parenthesis
" comment it out to have highlighting
let g:loaded_matchparen = 1
" then you can use these to turn it on and off
" :NoMatchParen :DoMatchParen

" goyo
let g:goyo_width = 82
let g:limelight_default_coefficient = 0.7

autocmd BufRead,BufNewFile *.wgsl setfiletype wgsl

augroup MyAutoCommands
	autocmd!
	autocmd User GoyoEnter Limelight
	autocmd User GoyoEnter set wrap
	autocmd User GoyoEnter set linebreak
	autocmd User GoyoLeave Limelight!
	autocmd User GoyoLeave set nowrap

	" because trunk wasm watch server doesn't recognize when nvim saves
	" autocmd BufWritePost * !touch <afile>
	" stop the commenting on a <cr>
	autocmd FileType * setlocal formatoptions-=cro
	" for some reason rust files were much wider fix that here
	" autocmd FileType rust set textwidth=80
	autocmd FileType rust set colorcolumn=99
augroup end

augroup MyYamlFiles
	autocmd!
	autocmd FileType yaml set shiftwidth=2
	autocmd FileType yaml set noautoindent
	autocmd FileType yaml set nosmartindent
	autocmd FileType yaml set tabstop=2
augroup end
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

