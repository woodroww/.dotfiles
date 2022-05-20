local opts = { noremap = true , silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   select mode = "s"
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   operator pending mode like after you press y for yank or d for delete then
--   you want to make a move
--	 operator pending mode = "o"

-- keymap(mode, key you want to remap, to do what)
-- keymap("", "", "", opts)

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- split lines to `:set textwidth?`
keymap("n", "<leader>v", "Vgq", opts)

-- open the nvim main config file
keymap("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<CR>", opts)

-- save buffer
keymap("n", "<F8>", ":w<cr>", opts)

-- scrolling
keymap("n", "<C-d>", ":call comfortable_motion#flick(100)<CR>", opts)
keymap("n", "<C-u>", ":call comfortable_motion#flick(-100)<CR>", opts)

-- move between buffers
--keymap("n", "<c-o>", "<c-^>", opts)
keymap("n", "<c-p>", ":bnext<cr>", opts)
keymap("n", "<c-o>", ":bprev<cr>", opts)
-- remap so matches left and right of keyboard
keymap("n", "i", "a", opts)
keymap("n", "a", "i", opts)
keymap("n", "I", "A", opts)
keymap("n", "A", "I", opts)

-- keep selected when indenting with >> or <<
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- escape from the terminal
keymap("t", "<esc>", "<c-\\><c-n>", opts)

-- move between windows
keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
keymap('n', '<C-h>', '<C-W>h', opts)
keymap('n', '<C-j>', '<C-W>j', opts)
keymap('n', '<C-k>', '<C-W>k', opts)
keymap('n', '<C-l>', '<C-W>l', opts)

-- resize windows
keymap("n", "<c-Left>", ":vertical resize +3<CR>", opts)
keymap("n", "<c-Right>", ":vertical resize -3<CR>", opts)
keymap("n", "<c-Up>", ":resize -3<CR>", opts)
keymap("n", "<c-Down>", ":resize +3<CR>", opts)

-- move line(s) up or down
keymap("n", "<m-j>", ":m .+1<cr>", opts)
keymap("n", "<m-k>", ":m .-2<cr>", opts)
keymap("i", "<m-j>", "<Esc>:m .+1<cr>==gi", opts)
keymap("i", "<m-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<m-j>" ,":m '>+1<CR>gv-gv", opts)
keymap("v", "<m-k>" ,":m '<-2<CR>gv-gv", opts)

--------------------------------------------------------------------------------
-- Leader things
--------------------------------------------------------------------------------

--keymap("n", "<leader>fo", "<cmd>!open <cr>", opts)

keymap("n", "<leader>gy", "<cmd>Goyo<cr>", opts)
keymap("n", "<leader>ll", "<cmd>Limelight!!<cr>", opts)

keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>rf", "<cmd>RustFmt<cr>", opts)

keymap("n", "<leader>t", "<cmd>sp<cr>:term<cr>i", opts)
keymap("n", "<leader>i", "<cmd>sp<cr>:term<cr>i ipython<cr>", opts)

-- turn on and off the line highlighting and the search highlighting
keymap("n", "<leader>g", ":set nocursorline nocursorcolumn nohlsearch<cr>", opts)
keymap("n", "<leader>gg", ":set cursorline cursorcolumn hlsearch<cr>", opts)

-- delete visual selection without putting that in the register
-- it sends it to the void register, then paste from implicit " register
keymap("v", "p", "\"_dP", opts)
keymap("v", "<leader>p", "P", opts)

-- toggle nerd tree
keymap("n", "<leader>n", ":NERDTreeToggle<CR>", opts)
keymap("n", "<leader>nn", ":NERDTreeRefreshRoot<CR>", opts)
keymap("n", "<leader>nf", ":NERDTreeFind<cr>", opts)

local function todays_note()
	local d = os.date("*t")
	local today = string.format("%d-%d-%d", d.year, d.month, d.day)
	local directory = "/Users/matt/Library/Mobile Documents/iCloud~md~obsidian/Documents/Obsidian Notes/QuickNotes/"
	local file_name = directory .. today .. "-quick_note.md"
	local file = io.open(file_name, "r")
	local command = ":e " .. file_name .. "<cr>"
	if file ~= nil then
		io.close(file)
		--print("Found today's note")
	else
		--print("Creating today's note")
		local new_file = io.open(file_name, "w")
		if new_file~=nil then
			new_file:write("# Matt's Daily Note " .. today .. "\n\n## Acceptance:\n\n## Gratitude:\n\n## Faith:\n\n## Work notes:\n\n")
			new_file:close()
		end
	end
	return command
end
keymap("n", "<leader>qn", todays_note() .. "G", opts)

function grep_notes()
	local note_opts = {
		noremap = true,
		silent = true,
		hidden = true,
		search_dirs = {
			"~/Documents/notes/",
			"~/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian\\ Notes",
		},
		--prompt_prefix = "   ",
		prompt_title = " Grep Notes",
		path_display = { "smart" }
	}
	require("telescope.builtin").live_grep(note_opts)
end

function matts_buffer_path_display(opts, path)
	local tail = require("telescope.utils").path_tail(path)
	return string.format("%s", tail)
end

-- Telescope
keymap("n", "<leader>f", ":Telescope<cr>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
--keymap("n", "<C-f>", ":lua require('telescope.builtin').buffers({ path_display = matts_buffer_path_display })<cr>", opts)
keymap("n", "<C-f>", ":lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>ft", ":lua require('telescope.builtin').treesitter()<cr>", opts)
keymap("n", "<leader>fp", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fd", ":lua require('telescope').extensions.file_browser.file_browser()<cr>", opts)
-- find searching grepping
keymap("n", "<leader>fn", ":Telescope find_files cwd=~/Documents/notes<cr>", opts)
keymap("n", "<leader>fnn", ":Telescope live_grep cwd=~/Documents/notes<cr>", opts)
local thepath = "~/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian\\ Notes"
keymap("n", "<leader>o", ":Telescope find_files cwd=" .. thepath .. "<cr>", opts)
keymap("n", "<leader>oo", [[<Cmd>lua grep_notes()<CR>]], opts)
keymap("n", "<leader>fs", ":Telescope live_grep cwd=~/.dotfiles/luanvim/.config/nvim<cr>", opts)

-- change current working directory to current file and print change
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)
-- copy the current buffer's file path to the clipboard
keymap("n", "<leader>cp", ":let @+ = expand(\"%:p\")<CR>", opts)

-- to open a little window with the errors
keymap("n", "<leader>es", ":lua vim.diagnostic.open_float()<CR>", opts)
-- to turn on and off annoying errors (e)rror (f)alse and (e)rror (t)true
keymap("n", "<leader>ef", ":lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, })<cr>", opts)
keymap("n", "<leader>et", ":lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true, })<cr>" , opts)
-- code actions error action
keymap("n", "<leader>ea", ":lua vim.lsp.buf.code_action()<CR>", opts)

keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)
-- buffer delete without closing window
keymap("n", "<leader>w", ":Kwbd<CR>", opts)

vim.cmd [[
" inoremap " ""<Left>
" inoremap < <><Left>
" inoremap ' ''<Left>
" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>
" inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

" stop the defaults
let g:comfortable_motion_no_default_key_mappings = 1

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

nnoremap <silent> <Leader>sp :set spell!<CR>
]]
