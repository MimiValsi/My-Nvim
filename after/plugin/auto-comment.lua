local keymap = vim.keymap.set

keymap("n", "<leader>/", vim.cmd.AutoInlineComment)
keymap("v", "<leader>/", vim.cmd.AutoBlockComment)
