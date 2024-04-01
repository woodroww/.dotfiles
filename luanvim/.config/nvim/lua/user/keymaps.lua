local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--[[----------------------------------------------------------------------------
 Key mappings
--------------------------------------------------------------------------------
keymap(mode, key you want to remap, to do what)
keymap("", "", "", opts)

How to list the current keymappings with help from romainl on StackOverflow:

:map

:verbose map <leader>  " all mapping in all modes that use <leader>, 
                       " and where they are defined
:verbose map <buffer>  " all mappings defined for the current buffer,
                       " and where they are defined
:verbose nmap <leader> " all normal mode mappings that use <leader>,
                       " and where they are defined

Modes:
normal_mode = "n",
insert_mode = "i",
visual_mode = "v",
select mode = "s"
visual_block_mode = "x",
term_mode = "t",
command_mode = "c",
operator pending mode = "o"
operator pending mode like after you press y for yank or d for delete then
you want to make a move

--]]


--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open the nvim main config file
keymap("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<CR>", opts)

-- save buffer
keymap("n", "<F8>", ":w<cr>", opts)

-- scrolling
-- keymap("n", "<C-d>", ":call comfortable_motion#flick(100)<CR>", opts)
-- keymap("n", "<C-u>", ":call comfortable_motion#flick(-100)<CR>", opts)

keymap("n", "<c-p>", "<c-i>", opts)

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
-- keymap("t", "<c-Left>", "<CMD>vertical resize +3<CR>", opts)
-- keymap("t", "<c-Right>", "<CMD>vertical resize -3<CR>", opts)
keymap("t", "<c-Up>", "<CMD>resize -3<CR>", opts)
keymap("t", "<c-Down>", "<CMD>resize +3<CR>", opts)

-- move line(s) up or down
keymap("n", "<m-j>", ":m .+1<cr>", opts)
keymap("n", "<m-k>", ":m .-2<cr>", opts)
keymap("i", "<m-j>", "<Esc>:m .+1<cr>==gi", opts)
keymap("i", "<m-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<m-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<m-k>", ":m '<-2<CR>gv=gv", opts)


--[[----------------------------------------------------------------------------
 Leader things
------------------------------------------------------------------------------]]

-- junegunn things
keymap("n", "<leader>gy", "<cmd>Goyo<cr>", opts)
keymap("n", "<leader>ll", "<cmd>Limelight!!<cr>", opts)

keymap("n", "<leader>m", ":lua require('telescope.builtin').lsp_document_symbols({symbols={\"function\"}})<cr>", opts)
keymap("n", "<leader>n", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>", opts)
keymap("n", "<leader>re", ":lua require('telescope.builtin').lsp_references()<cr>", opts)
keymap("n", "<leader>a", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", opts)
keymap("n", "<leader>ls", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lr", "<cmd>LspRestart<cr>", opts)
keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>rf", "<cmd>lua vim.lsp.buf.format()<cr>", opts)

-- prime replace word under cursor
--keymap("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", opts)

keymap("n", "<leader>t", "<cmd>sp<cr>:term<cr>i", opts)
keymap("n", "<leader>ip", "<cmd>sp<cr>:term<cr>i ipython<cr>", opts)

-- turn on and off the line highlighting and the search highlighting
keymap("n", "<leader>g", ":set nocursorline nocursorcolumn nohlsearch<cr>", opts)
keymap("n", "<leader>gg", ":set cursorline cursorcolumn hlsearch<cr>", opts)

-- delete visual selection without putting that in the register
-- it sends it to the void register, then paste from implicit " register
--keymap("v", "p", "\"_dP", opts)
--keymap("v", "p", '"_d"*P', opts)
-- prime latest
keymap("v", "p", "\"_dP", opts)

--keymap("v", "<leader>p", "P", opts)
keymap("n", "<leader>p", ":Telescope neoclip plus<CR>", opts)
keymap("n", "<leader>pp", ":Prettier<CR>", opts)

local function todays_note()
	local d = os.date("*t")
	local today = string.format("%d-%d-%d", d.year, d.month, d.day)
	local directory = "/home/matt/obsidian/QuickNotes/"
	local file_name = directory .. today .. "-quick_note.md"
	local file = io.open(file_name, "r")
	local command = ":e " .. file_name .. "<cr>"
	if file ~= nil then
		io.close(file)
		--print("Found today's note")
	else
		--print("Creating today's note")
		local new_file = io.open(file_name, "w")
		if new_file ~= nil then
			new_file:write("# Matt's Daily Note " .. today .. "\n\n## Acceptance:\n\n## Gratitude:\n\n## Faith:\n\n## Notes:\n\n")
			new_file:close()
		end
	end
	return command
end

keymap("n", "<leader>qn", todays_note() .. "G", opts)

-- /Users/matt/.local/share/nvim/plugged/telescope.nvim/lua/telescope
-- checks for smart display
-- utils.path_smart function
--   utils.path_smart = (function()
-- /Users/matt/.local/share/nvim/plugged/telescope.nvim/lua/telescope/utils.lua
my_path_display = function(opts, path)
  local tail = require("telescope.utils").path_tail(path)
  return string.format("%s (%s)", tail, path)
--[[
	local dirs = vim.split(path, "/")
	local last_dir = dirs[#dirs]
	local result = "" .. last_dir
	if #dirs > 1 then
		result = dirs[#dirs - 1] .. "/" .. result
	end
	return result
--]]
end

function grep_notes()
	local note_opts = {
		noremap = true,
		silent = true,
		hidden = true,
		max_results = 300,
		search_dirs = {
			"/home/matt/obsidian",
		},
		--prompt_prefix = "   ",
		prompt_title = " Grep Notes",
		path_display = { "smart" }
	}
	require("telescope.builtin").live_grep(note_opts)
end

function setAutoCmp(mode)
	local cmp = require("cmp")
	if mode then
		cmp.setup({
			completion = {
				autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
			}
		})
	else
		cmp.setup({
			completion = {
				autocomplete = false
			}
		})
	end
end

-- turn on/off the autocompletion cmp
keymap("n", "<leader>ct", ":lua setAutoCmp(true)<CR>", opts)
keymap("n", "<leader>cf", ":lua setAutoCmp(false)<CR>", opts)

keymap("n", "<leader>d", ":DiffviewFileHistory %<CR>", opts)
keymap("n", "<leader>dd", ":DiffviewClose<CR>", opts)

keymap("n", "<leader>gs", ":lua require('telescope.builtin').git_status()<cr>", opts)
keymap("n", "<leader><space>", ":Telescope resume<cr>", opts)
keymap("n", "<leader>f", ":Telescope<cr>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fD",
	":lua require('telescope').extensions.file_browser.file_browser()<cr>:lua print(vim.fn.getcwd())<cr>", opts)
keymap("n", "<leader>fd",
	":lua require('telescope').extensions.file_browser.file_browser({respect_gitignore=false})<cr>:lua print(vim.fn.getcwd())<cr>"
	, opts)
-- /Users/matt/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/make_entry.lua
-- function make_entry.gen_from_buffer(opts)
-- keymap("n", "<C-f>", ":lua require('telescope.builtin').buffers({path_display = my_path_display, bufnr_width = 0})<cr>", opts)
keymap("n", "<C-f>", ":lua require('telescope.builtin').buffers({ path_display = truncate, sort_mru = true, ignore_current_buffer = true })<cr>", opts)
--keymap("t", "<C-f>", "<c-\\><c-n>:lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>fp", ":Telescope oldfiles<cr>", opts)
keymap("n", "<c-i>", ":Telescope find_files cwd=/home/matt/obsidian<cr>", opts)
keymap("n", "<leader>oo", [[<Cmd>lua grep_notes()<CR>]], opts)
keymap("n", "<leader>fs", ":Telescope live_grep cwd=~/.dotfiles/luanvim/.config/nvim<cr>", opts)
keymap("n", "<leader>c", ":Telescope colorscheme enable_preview=true layout_config={vertical={height=0.5},top_pane={height=1}}<CR>", opts)

keymap("n", "<leader>cc", ":ColorizerToggle<CR>", opts)

-- change current working directory to current file and print change
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)
-- copy the current buffer's file path to the clipboard
keymap("n", "<leader>cp", ":let @+ = expand(\"%:p\")<CR>", opts)

-- to open a little window with the errors
keymap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
-- to turn on and off annoying errors (e)rror (f)alse and (e)rror (t)true
keymap("n", "<leader>ef",
	":lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, })<cr>"
	, opts)
keymap("n", "<leader>et",
	":lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true, })<cr>"
	, opts)

keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)
-- buffer delete without closing window
keymap("n", "<leader>w", ":Kwbd<CR>", opts)

keymap("n", "<leader>sp", ":set spell!<CR>", opts)


vim.cmd [[
" inoremap " ""<Left>
" inoremap < <><Left>
" inoremap ' ''<Left>
" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>
" inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

nnoremap n nzz
nnoremap N Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-p> <C-i>zz
" nnoremap <C-u> <C-u>zz
" nnoremap <C-d> <C-d>zz

" stop the defaults
let g:comfortable_motion_no_default_key_mappings = 1

" change nvim dir from terminal pwd
" nnoremap <M-z> pwd|pbcopy<CR><C-\><C-n>:cd <C-r>+<CR>
" tnoremap <C-A> pwd\|pbcopy -selection clipboard<CR><C-\><C-n>:cd <C-r>+<CR>i

]]
