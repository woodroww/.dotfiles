" Welcome to init.vim
set cursorline
" Disable all blinking:
set guicursor+=a:blinkon0
" Remove previous setting:
":set guicursor-=a:blinkon0
" Restore default setting:
":set guicursor&

let mapleader=" " " set the leader key for user shortcuts
set clipboard=unnamedplus " Copy paste between vim and everything else
set mouse=a " Enable your mouse
set hidden " keep hidden buffers, ie. you don't need to save when switching buffers
" edit that config
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>

set termguicolors

" Mapping
" map - map
" noremap - non-recursive map
" nmap - normal mode map
" nnoremap - normal mode non-recursive map
" inoremap - insert mode non-recursive map
nnoremap 0 $
nnoremap 1 ^
nnoremap ^ 0
vnoremap 0 $
vnoremap 1 ^
vnoremap ^ 0
nnoremap l <Down>
nnoremap j h
nnoremap ; l
vnoremap l <Down>
vnoremap j h
vnoremap ; l
nnoremap <c-l> <c-d>
nnoremap <c-k> <c-u>
" find python defs
nnoremap <Leader>fu :g/^def<CR> 
nnoremap <Leader>bb <c-^> 

" delete visual selection without putting that in the register
" it sends it to the void register _
" then paste from implicit " register
vnoremap <leader>p "_dP
nnoremap <Leader>n :NERDTreeToggle<CR>
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

nnoremap i a
nnoremap a i
nnoremap I A
nnoremap A I

"noremap p P
"noremap P p

nnoremap <Leader>v Vgq

" terminal remap to escape from the comand line
" tnoremap <Esc> <c-\><c-n>
"tnoremap <m-w> <c-\><c-n><c-w>
tnoremap <c-[> <c-\><c-n><c-w><c-w>

set signcolumn=yes
set tabstop=4       " number of visual spaces per TAB
" set softtabstop=4   " number of spaces in tab when editing
" set shiftwidth=4    " number of spaces to use for autoindent
" set expandtab       " tabs are space
set autoindent
" set copyindent      " copy indent from the previous line

set scrolloff=4 " center cursor in middle when scrolling
set nowrap " word wrapping
set colorcolumn=80 " 80 char line
set number " show line numbers
set relativenumber
set noerrorbells " no error sounds
set nohlsearch " don't highlight search

" keep selected when indenting with >> or <<
vnoremap < <gv
vnoremap > >gv

" this starts the Plug section
" - For Neovim: stdpath('data') . '/plugged'
call plug#begin('~/.local/share/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
"Plug 'morhetz/gruvbox'		" theme
Plug 'preservim/nerdtree'           " side bar file tree
Plug 'itchyny/lightline.vim'         " minmal status bar
Plug 'tpope/vim-fugitive'            " allows git commands in vim session
Plug 'airblade/vim-gitgutter'        " shows git changes in gutter
Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'

" Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " for sorting
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" LSP config
" Base plugin
Plug 'neovim/nvim-lspconfig'
" code completions chrisatmachine
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" colorize color names/number in text 
Plug 'norcalli/nvim-colorizer.lua'

" Cheat sheet
Plug 'dbeniamine/cheat.sh-vim'

Plug 'rust-lang/rust.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'simrat39/rust-tools.nvim'

" Debugger Plugins from ThePrimeagen
" Plug 'puremourning/vimspector'
" Plug 'szw/vim-maximizer'

" clipboard in telescope
" Plug 'AckslD/nvim-neoclip.lua'

"Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
"Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
"Plug 'ncm2/ncm2-bufword'             " complete words in buffer
"Plug 'ncm2/ncm2-path'                " complete paths
"Plug 'ncm2/ncm2-jedi'                " Python completion
"Plug 'gaalcaras/ncm-R'               " R completion [dep]: ncm2, Nvim-R
"Plug 'jalvesaq/Nvim-R'               " required for ncm-R
"Plug 'dense-analysis/ale'            " linting [dep]: pip3 install flake8, install.packages('lintr')
"Plug 'fisadev/vim-isort'             " Python sort imports [dep]: pip3 install isort
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mhinz/vim-startify'            " A start menu for vim
"Plug 'tpope/vim-surround'            " replace surrounding characters
"Plug 'filipekiss/ncm2-look.vim'      " ncm2 spelling
"Plug 'SirVer/ultisnips'              " hotkeys for chunks of code
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
"Plug 'junegunn/fzf.vim'              " Fuzzy Finder
"Plug 'sillybun/vim-repl'


" this ends the Plug section
call plug#end()

nnoremap <silent> <C-d> :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-150)<CR>

nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>

let g:comfortable_motion_interval = 1000.0 / 60
let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 3.0


" set colorscheme to gruvbox
colorscheme gruvbox
" syntax coloring I think
syntax on
" use dark mode of gruvbox
set bg=dark

" rust
filetype plugin indent on

lua << EOF
require'lspconfig'.pyright.setup{}

require("lsp")
require("cmp_config")
require("treesitter_playground")
require("treesyntax")
require("plug-colorizer")
require("telescope_config")

--require'neoclip'.setup()
--require("clipboard")

-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
-- \ vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
-- \ { virtual_text = true, })

EOF

" nnoremap <leader>ef <cmd>lua vim.lsp.handlers["textDocument/publishDiagnostics"] =
" \ vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
" \ { virtual_text = false, })<cr>
" nnoremap <leader>et <cmd>lua vim.lsp.handlers["textDocument/publishDiagnostics"] =
" \ vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
" \ { virtual_text = true, })<cr>

nnoremap <leader>et <cmd>lua vim.diagnostic.show()<cr>
nnoremap <leader>ef <cmd>lua vim.diagnostic.hide()<cr>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
nnoremap <leader>fp <cmd>Telescope oldfiles<cr>
"nnoremap <leader>fd <cmd>Telescope file_browser<cr>
nnoremap <leader>fd :lua require'telescope.builtin'.file_browser({hidden=true})<cr>

" change current working directory to current file and print change
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" more setup for code completion
set completeopt=menu,menuone,preview ",noselect

" Window Splits
set splitright splitbelow
" Remap splits navigation
nnoremap <C-w>j <C-w>h
nnoremap <C-w>l <C-w>j
nnoremap <C-w>k <C-w>k
nnoremap <C-w>; <C-w>l

"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>


" Make adjusing split sizes a bit more friendly
"noremap <silent> <M-j> :vertical resize +3<CR>
"noremap <silent> <M-;> :vertical resize -3<CR>
"noremap <silent> <M-l> :resize -3<CR>
"noremap <silent> <M-k> :resize +3<CR>

noremap <silent> <A-Left> :vertical resize +3<CR>
noremap <silent> <A-Right> :vertical resize -3<CR>
noremap <silent> <A-Up> :resize -3<CR>
noremap <silent> <A-Down> :resize +3<CR>


" move line(s) up or dow
nnoremap <M-l> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-l> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-l> :m '>+1<CR>gv=gv
vnoremap <M-l> :m '<-2<CR>gv=gv

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Start terminals for R and Python sessions '\tr' or '\tp'
" map <Leader>tr :new term://zsh<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :new term://zsh<CR>ipython3<CR><C-\><C-n><C-w>k
" map <Leader>td :new term://zsh<CR>isqlite3<CR><C-\><C-n><C-w>k
" map <Leader>tj :new term://zsh<CR>ijulia<CR><C-\><C-n><C-w>k
" map <Leader>ts :new term://zsh<CR>iscala<CR><C-\><C-n><C-w>k
au! BufWritePost $MYVIMRC source %

