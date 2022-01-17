vim.cmd [[
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_no_extensions_in_markdown = 1

" let g:mkdp_markdown_css = '/Users/matt/Documents/gruvbox.css'
]]

--[[
vim.cmd [[
" To enable pandoc functionality for markdown files while using the markdown
" filetype and syntax, use
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
" For example, some people prefer not to use folds, so they would want to
" disable the `folding` module, which creates folds for headers and some special
" cases. To disable the module they should put
let g:pandoc#modules#disabled = ["folding"]
]]
--]]

