-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
local keymaps = {
  -- Normal --
  n = {
    -- Better window navigation
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",
    ["<leader>e"] = ":NvimTreeToggle<CR>",
    ["<leader>q"] = ":q<CR>",
    ["<leader>w"] = ":w<CR>",
    ["<leader>c"] = ":bd!<CR>",
    -- Resize with arrows
    ["<A-Up>"] = ":resize -2<CR>",
    ["<A-Down>"] = ":resize +2<CR>",
    ["<A-Left>"] = ":vertical resize -2<CR>",
    ["<A-Right>"] = ":vertical resize +2<CR>",
    -- Navigate buffers
    ["<S-l>"] = ":bnext<CR>",
    ["<S-h>"] = ":bprevious<CR>",
    -- Move text up and down
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",
    -- Personal ones
    ["N"] = "Nzzzv",
    ["n"] = "nzzzv",
    ["J"] = "mzJ`z",
    -- Telescope
    ["<leader>f"] = ":Telescope find_files<CR>",
    ["<leader>lf"] = ":Format<CR>",
    ["<leader>sf"] = ":Telescope find_files<CR>",
    ["<leader>st"] = ":Telescope live_grep<CR>",
  },
  -- Insert --
  i = {
    -- Press jk fast to enter
    ["jk"] = "<ESC>",
    ["kj"] = "<ESC>",
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
  },
  -- Visual --
  v = {
    -- Stay in indent mode
    ["<"] = "<gv",
    [">"] = ">gv",
    ["p"] = '"_dP',
  },
  -- Visual Block --
  x = {
    -- Move text up and down
    ["J"] = ":move '>+1<CR>gv-gv",
    ["K"] = ":move '<-2<CR>gv-gv",
    ["<A-j>"] = ":move '>+1<CR>gv-gv",
    ["<A-k>"] = ":move '<-2<CR>gv-gv",
  },
}
for mode, mappings in pairs(keymaps) do
  for k, v in pairs(mappings) do
    keymap(mode, k, v)
  end
end
