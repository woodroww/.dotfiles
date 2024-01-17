-- https://github.com/itchyny/lightline.vim
vim.cmd [[

let g:lightline = {
	\ 'colorscheme': 'Tomorrow_Night',
	\ 'active': {
  \   'left': [ [ 'mode' ],
  \             [ 'readonly', 'filename' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ] ]
  \ },
	\ }

]]

-- in right \              [ 'filetype' ] ]

