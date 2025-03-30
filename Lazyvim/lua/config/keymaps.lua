-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps e

--Zen Mode
vim.keymap.set("n", "<leader>zz", ":ZenMode<CR>") -- toggle Zen Mode
vim.keymap.set("n", "<leader>ps", ":PencilSoft<CR>") -- toggle PencilSoft

-- Use jj to esc insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "escapes with jj" })

vim.keymap.set("n", "<leader>ww", ":w!<CR>") -- save

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", { desc = "resize-up", noremap = true, silent = true })
vim.keymap.set("n", "<Down>", ":resize +2<CR>", { desc = "resize-down", noremap = true, silent = true })
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", { desc = "resize-vertical", noremap = true, silent = true })
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", { desc = "resize-horizontal", noremap = true, silent = true })

-- Buffers
vim.keymap.set("n", "<C-i>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-u>", ":bprevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>c", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" }) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", { desc = "New buffer", noremap = true, silent = true }) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Split window verticall", noremap = true, silent = true }) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", { desc = "Split window horizontially", noremap = true, silent = true }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal H & W", noremap = true, silent = true }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", { desc = "Close current split window", noremap = true, silent = true }) -- close current split window

vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split Window Below", silent = true })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split Window Right", silent = true })
