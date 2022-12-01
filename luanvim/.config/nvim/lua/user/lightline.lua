
vim.cmd [[

let g:lightline = {
	\ 'colorscheme': 'Tomorrow_Night',
	\ 'active': {
  \   'left': [ [ 'mode' ],
  \             [ 'readonly' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ] ]
  \ },
	\ }

]]

-- in right \              [ 'filetype' ] ]

