---------------------------------------------------------------
-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ███████╗███████╗ █████╗  --
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗ --
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝███████╗█████╗  ███████║ --
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗╚════██║██╔══╝  ██╔══██║ --
-- ██║  ██║   ██║   ██║     ██║  ██║███████║███████╗██║  ██║ --
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝ --
---------------------------------------------------------------

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.g.mapleader = " "

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>")
map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- Windows
map("n", "<leader>ñ", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
