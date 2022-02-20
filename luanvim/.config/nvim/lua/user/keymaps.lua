local opts = { noremap = true , silent = true }
local keymap = vim.api.nvim_set_keymap
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   select mode = "s"
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
    --like after you press y for yank or d for delete then you want to make a move
--	 operator pending mode = "o"
-- keymap(mode, key you want to remap, to do what)

keymap("n", "0", "$", opts)
keymap("n", "$", "0", opts)
keymap("v", "0", "$", opts)
keymap("v", "$", "0", opts)
keymap("o", "0", "$", opts)
keymap("o", "$", "0", opts)

keymap("n", "l", "<Down>", opts)
keymap("n", "j", "h", opts)
keymap("n", ";", "l", opts)
keymap("v", "l", "<Down>", opts)
keymap("v", "j", "h", opts)
keymap("v", ";", "l", opts)

keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)
keymap("v", "jk", "<Esc>", opts)
keymap("v", "kj", "<Esc>", opts)

keymap("n", "i", "a", opts)
keymap("n", "a", "i", opts)
keymap("n", "I", "A", opts)
keymap("n", "A", "I", opts)

keymap("n", "<c-l>", "<c-d>", opts)
keymap("n", "<c-k>", "<c-u>", opts)

-- keep selected when indenting with >> or <<
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<c-w>j", "<c-w>h", opts)
keymap("n", "<c-w>l", "<c-w>j", opts)
--keymap("n", "<c-w>k", "<c-w>k", opts)
keymap("n", "<c-w>;", "<c-w>l", opts)

keymap("n", "<M-Left>", ":vertical resize +3<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize -3<CR>", opts)
keymap("n", "<M-Up>", ":resize -3<CR>", opts)
keymap("n", "<M-Down>", ":resize +3<CR>", opts)

-- move line(s) up or down
keymap("n", "<M-l>", ":m .+1<cr>", opts)
keymap("n", "<M-k>", ":m .-2<cr>", opts)
keymap("i", "<M-l>", "<Esc>:m .+1<cr>==gi", opts)
keymap("i", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<M-l>" ,":m '>+1<CR>gv-gv", opts)
keymap("v", "<M-k>" ,":m '<-2<CR>gv-gv", opts)

-- escape from the terminal
-- maybe try leader and something
keymap("t", "<c-[>", "<c-\\><c-n><c-w><c-w>", opts)


--------------------------------------------------------------------------------
-- Leader things
--------------------------------------------------------------------------------
-- :lua vim.lsp.buf.rename()

--[[
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
--]]

--keymap("n", "<leader>t", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)
keymap("n", "<leader>t", "<cmd>lua _TERMINAL()<cr>", opts)
--keymap("n", "<leader>t", "", opts)


keymap("n", "<leader>g", ":set nocursorline nocursorcolumn nohlsearch<cr>", opts)

-- find python def
keymap("n", "<leader>fu", ":g/^def<cr>", opts)
-- go to previous buffer
keymap("n", "<leader>bb", "<c-^>", opts)
-- delete visual selection without putting that in the register
-- it sends it to the void register _
-- then paste from implicit " register
-- Chris@machine just remapped this to p
-- does this need a visual mode too?
keymap("v", "<leader>p", "\"_dP", opts)
-- toggle nerd tree
keymap("n", "<leader>n", ":NERDTreeToggle<CR>", opts)
-- format line to 80 chars set somewhere but where?
keymap("n", "<leader>v", "Vgq", opts)

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
		new_file:write("# Matt's Daily Note " .. today)
		new_file:close()
	end
	return command
end
keymap("n", "<leader>qn", todays_note() .. "Go", opts)


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

--[[
function M.find_notes()
  require("telescope.builtin").find_files {
    prompt_title = " Find Notes",
    path_display = { "smart" },
    cwd = "~/notes/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end
--]]

-- Telescope
keymap("n", "<leader>f", ":Telescope<cr>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
--keymap("n", "<leader>b", ":Telescope buffers<cr>", opts)
keymap("n", "<C-f>", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>ft", ":lua require('telescope.builtin').treesitter()<cr>", opts)
--keymap("n", "<leader>ft", ":Telescope treesitter<cr>", opts)
keymap("n", "<leader>fp", ":Telescope oldfiles<cr>", opts)
--keymap("n", "<leader>fd", ":lua require'telescope.builtin'.file_browser({hidden=true})<cr>", opts)
keymap("n", "<leader>fd", ":lua require('telescope').extensions.file_browser.file_browser()<cr>", opts)
keymap("n", "<leader>fn", ":Telescope find_files cwd=~/Documents/notes<cr>", opts)
keymap("n", "<leader>fnn", ":Telescope live_grep cwd=~/Documents/notes<cr>", opts)
local thepath = "~/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/Obsidian\\ Notes"
keymap("n", "<leader>fo", ":Telescope find_files cwd=" .. thepath .. "<cr>", opts)

--keymap("n", "<leader>foo", ":Telescope live_grep cwd=" .. thepath .. "<cr>", opts)
--keymap("n", "<leader>foo", ":lua require('telescope.builtin').live_grep(note_opts)<cr>", opts)

keymap("n", "<leader>foo", [[<Cmd>lua grep_notes()<CR>]], opts)

-- change current working directory to current file and print change
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)
-- open the nvim main config file
keymap("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<CR>", opts)

-- to open a little window with the errors
keymap("n", "<leader>es", ":lua vim.diagnostic.open_float()<CR>", opts)
-- to turn on and off annoying erros (e)rror (f)alse and (e)rror (t)true
keymap("n", "<leader>ef", ":lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false, })<cr>", opts)
keymap("n", "<leader>et", ":lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true, })<cr>" , opts)
-- code actions error action
--keymap("n", "<leader>ea", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>ea", ":Telescope lsp_code_actions<CR>", opts)

-- buffer delete without closing window
-- "nmap <C-W>! <Plug>Kwbd
keymap("n", "<leader>w", ":Kwbd<CR>", opts)

--[[ old non lua vim
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

map <Leader>tp :new term://zsh<CR>ipython3<CR><C-\><C-n><C-w>k
--]]
