local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local keymap = vim.keymap.set

keymap("n", "<leader>a", mark.add_file)
keymap("n", "<C-e>", ui.toggle_quick_menu)

keymap("n", "<C-8>", function() ui.nav_file(1) end)
keymap("n", "<C-9>", function() ui.nav_file(2) end)
keymap("n", "<C-0>", function() ui.nav_file(3) end)
keymap("n", "<C-->", function() ui.nav_file(4) end)
