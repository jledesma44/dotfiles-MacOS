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

-- ColorPicker
vim.keymap.set("n", "<leader>cp", ":CccPick<CR>", { desc = "ColorPicker", noremap = true, silent = true })

-- Toggle px to rem
vim.keymap.set("n", "<leader>pt", ":TogglePxRem<CR>", { desc = "Toggle_Px_To_Rem", noremap = true, silent = true })
