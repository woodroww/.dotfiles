vim.cmd [[

let g:vimwiki_list = [{'path': '/Users/matt/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian\ Notes/','auto_tags':1}]

set nocompatible
filetype plugin on
syntax on

let g:vimwiki_list = [{'path': '/Users/matt/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian\ Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

autocmd FileType vimwiki setlocal syntax=markdown

let g:vimwiki_conceallevel = 2

let g:vimwiki_key_mappings = {
\   'all_maps': 1,
\   'global': 0,
\   'headers': 0,
\   'text_objs': 0,
\   'table_format': 0,
\   'table_mappings': 0,
\   'lists': 0,
\   'links': 0,
\   'html': 0,
\   'mouse': 0,
\ }
]]
