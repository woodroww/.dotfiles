vim.cmd [[
let g:vimwiki_list = [
\{'path': '/Users/matt/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian\ Notes/','auto_tags':1}
\]
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '/Users/matt/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian\ Notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
autocmd FileType vimwiki setlocal syntax=markdown
let g:vimwiki_conceallevel = 2

]]


