vim.g.mapleader = " "
local keymap = vim.keymap.set

local wk = require("which-key")
wk.register({
  ["<leader>e"] = { "<cmd>Ex<CR>", "Explorer"},

  ["<leader>q"] = { name = "+Quit"},
  ["<leader>qq"] = { "<cmd>q<CR>", "Quit"},
  ["<leader>qw"] = { "<cmd>wq<CR>", "Save and quit" },

  [";"] = { ":", "remap ; to :" },

  ["<C-s>"] = { "<cmd>w<CR>", "Save file" },

  ["J"] = { "mzJ`z", "Backspace line under cursor" },

  ["<C-u>"] = { "<C-u>zz", "Go up and put cursor @ middle" },
  ["<C-d>"] = { "<C-d>zz", "Go down and put cursor @ middle" },

  ["n"] = { "nzz", "Go next word and cursor @ middle" },
  ["N"] = { "Nzz", "Go previous word and cursor @ middle" },

  ["<leader>y"] = { '"+y', "Yank to system keyboard" },
  ["<leader>Y"] = { '"+Y', "Yank to system keyboard" },

  ["<leader>d"] = { '"_d', "Delete without new yanking" },

  ["Q"] = { "<nop>" },

  ["<C-f>"] = { "<cmd>silent !tmux neww tmux-sesssionizer<CR>", "New tmux window" },

  ["<C-k>"] = { "<cmd>cnext<CR>zz", "Navigation up error" },
  ["<C-j>"] = { "<cmd>cprev<CR>zz", "Naviagtion down error"},

  ["<leader>k"] = { "<cmd>lnext<cr>zz", "Navigation up list" },
  ["<leader>j"] = { "<cmd>lprev<cr>zz", "Navigation down list" },

  ["<leader>s"] = { ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace every word under to cursor" },

  ["<leader>x"] = { "<cmd>!chmod +x %<CR>", { silent = true }, "Chmod buffer file" },

  -- lspconfig mapping
  ["gd"] = { function () vim.lsp.buf.definition() end, "buf definition" },
  ["K"] = { function () vim.lsp.buf.hover() end, "buf hover" },
  ["<leader>vws"] = { function () vim.lsp.buf.workspace_symbol() end, "workspace symbol" },
  ["<leader>vd"] = { function () vim.lsp.buf.open_float() end, "open float" },
  ["[d"] = { function () vim.lsp.buf.goto_next() end, "goto next" },
  ["]d"] = { function () vim.lsp.buf.goto_prev() end, "goto prev" },
  ["<leader>vca"] = { function () vim.lsp.buf.code_action() end, "code action" },
  ["<leader>vrr"] = { function () vim.lsp.buf.references() end, "references" },
  ["<leader>vrn"] = { function () vim.lsp.buf.rename() end, "rename" },

  ["<leader>/"] = { vim.cmd.AutoInlineComment, "Line Comment"},
})

-- navigate within insert mode
keymap("i", "<C-h>", "<Left>")
keymap("i", "<C-j>", "<Down>")
keymap("i", "<C-k>", "<Up>")
keymap("i", "<C-l>", "<Right>")

-- go to beginning and end of line
keymap("i", "<C-b>", "<ESC>^i")
keymap("i", "<C-e>", "<End>")

-- like the <ESC> but different
keymap("i", "<C-c>", "<ESC>")

--- v mode
-- move a highlight block
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- clip to the system clipboard (see i mode too)
keymap("v", "<leader>y", '"+y')

--- x mode
-- better paste
keymap("x", "<leader>p", '"_dP')
