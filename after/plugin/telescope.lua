local builtin = require('telescope.builtin')

local wk = require("which-key")

wk.register({
  ["<leader>f"] = { name = "Telescope"},
  ["<leader>ff"] = { builtin.find_files, {}, "Find files"},
  ["<leader>fs"] = { function ()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
  end, "Grep files"},
  ["<C-p>"] = { builtin.git_files, {}, "Git files"}
})
