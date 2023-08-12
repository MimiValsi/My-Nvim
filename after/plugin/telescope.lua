local builtin = require('telescope.builtin')
local keymap = vim.keymap.set

keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<C-p>', builtin.git_files, {})
keymap('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
