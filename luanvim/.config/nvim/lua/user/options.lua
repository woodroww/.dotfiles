-- this is where you set all the options
-- like word wrap and such and termcolors and tabspaces

local options = {
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
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
  autoindent = true,                       -- the :help said this should normally be on with smartindent
--smartindent = true,                      -- make indenting smarter again
  background = 'dark',					   -- this isn't necessary as I think nvim get info from the terminal as to what it is using
  conceallevel = 2,						   -- for hiding markdown 
--[[
  undofile = true,                         -- enable persistent undo
  backup = false,                          -- creates a backup file
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  ignorecase = true,                       -- ignore case in search patterns
  pumheight = 10,                          -- pop up menu height
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  swapfile = false,                        -- creates a swapfile
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
let g:loaded_matchparen = 1
]]

 -- loaded_matchparen = 1,				   -- don't highlight matching parenthesis
--[[
" Remove previous setting:
":set guicursor-=a:blinkon0
" Restore default setting:
":set guicursor&

set hidden " keep hidden buffers, ie. you don't need to save when switching buffers
set softtabstop=4   " number of spaces in tab when editing
set autoindent
set copyindent      " copy indent from the previous line

let g:comfortable_motion_interval = 1000.0 / 60
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 3.0

colorscheme gruvbox -- set colorscheme to gruvbox
" syntax coloring I think
syntax on
" use dark mode of gruvbox
set bg=dark

" rust
filetype plugin indent on

" to auto source on save
au! BufWritePost $MYVIMRC source %
--]]

