vim.cmd [[
let g:startify_custom_header = [
\ '      ::::    ::: :::::::::: ::::::::  :::     ::: :::::::::::   :::   ::: ',
\ '     :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:      :+:+: :+:+: ',
\ '    :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+ ',
\ '   +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+  ',
\ '  +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+   ',
\ ' #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#    ',
\ '###    #### ########## ########      ###     ########### ###       ###     ',
\ ]


let g:startify_bookmarks = [
	\ ]

let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Recent:']            },
	\ ]
]]

vim.api.nvim_set_hl(0, 'StartifyHeader', { bg = '#1d1f21', fg = '#fe8019' })
vim.api.nvim_set_hl(0, 'StartifySection', { bg = '#1d1f21', fg = '#d5c4a1' })
