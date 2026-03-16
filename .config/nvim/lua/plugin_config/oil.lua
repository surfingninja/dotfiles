require("oil").setup()
vim.keymap.set("l", "-", require("oil").open, { desc = "Open parent directory" })
