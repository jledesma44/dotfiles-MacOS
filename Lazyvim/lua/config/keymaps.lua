-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps e

-- For conciseness
local opts = { noremap = true, silent = true }

--Zen Mode
vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>") -- toggle Zen Mode
vim.keymap.set("n", "<leader>ps", ":PencilSoft<CR>") -- toggle PencilSoft

-- Use jj to esc insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "escapes with jj" })

vim.keymap.set("n", "<leader>ww", ":w!<CR>") -- save

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<C-i>", ":bnext<CR>", opts({ desc = "Next Buffer" }))
vim.keymap.set("n", "<C-u>", ":bprevious<CR>", opts({ desc = "Previous Buffer" }))
vim.keymap.set("n", "<leader>c", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" }) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

vim.keymap.set("n", "<leader>wh", "<C-w>s", opts({ desc = "Split Window Below", remap = true }))
vim.keymap.set("n", "<leader>wv", "<C-w>v", opts({ desc = "Split Window Right", remap = true }))
