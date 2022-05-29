local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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
local keymaps = {
  -- Normal --
  n = {
    -- Better window navigation
    ["<C-h>"] = "<C-w>h",
    ["<C-j>"] = "<C-w>j",
    ["<C-k>"] = "<C-w>k",
    ["<C-l>"] = "<C-w>l",
    ["<leader>e"] = ":Lex 30<CR>",
    ["<leader>q"] = ":q<cr>",
    ["<leader>w"] = ":w<CR>",
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
  },
  -- Insert --
  i = {
    -- Press jk fast to enter
    ["jk"] = "<ESC>",
    ["kj"] = "<ESC>",
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
  },
  -- Visual --
  v = {
    -- Stay in indent mode
    ["<"] = "<gv",
    [">"] = ">gv",
    -- Move text up and down
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",
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
    keymap(mode, k, v, opts)
  end
end

-- -- Terminal --
-- -- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
