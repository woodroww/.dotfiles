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
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- keymap(mode, key you want to remap, to do what)

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


-- Leader things

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

keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>ft", ":Telescope treesitter<cr>", opts)
keymap("n", "<leader>fp", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>fd", ":lua require'telescope.builtin'.file_browser({hidden=true})<cr>", opts)

-- change current working directory to current file and print change
keymap("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)

keymap("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<cr>", opts)

--[[ old non lua vim
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

map <Leader>tp :new term://zsh<CR>ipython3<CR><C-\><C-n><C-w>k
--]]
