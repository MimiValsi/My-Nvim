local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())


lsp.ensure_installed({
  'gopls',
  'clangd',
  'html',
  'cssls',
})

-- Fix undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

-- lsp.on_attach(function (_, bufnr)
--  local opts = {buffer = bufnr, remap = false}
--  local keymap = vim.keymap.set
--  local wk = require("which-key")
--  wk.register({
--    ["gd"] = { function () vim.lsp.buf.definition() end, "buf definition" },
--    ["K"] = { function () vim.lsp.buf.hover() end, "buf hover" },
--    ["<leader>vws"] = { function () vim.lsp.buf.workspace_symbol() end, "workspace symbol" },
--    ["<leader>vd"] = { function () vim.lsp.buf.open_float() end, "open float" },
--    ["[d"] = { function () vim.lsp.buf.goto_next() end, "goto next" },
--    ["]d"] = { function () vim.lsp.buf.goto_prev() end, "goto prev" },
--    ["<leader>vca"] = { function () vim.lsp.buf.code_action() end, "code action" },
--    ["<leader>vrr"] = { function () vim.lsp.buf.references() end, "references" },
--    ["<leader>vrn"] = { function () vim.lsp.buf.rename() end, "rename" },
--  })
--  keymap("n", "gd", function () vim.lsp.buf.definition() end, opts)
--  keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
--  keymap("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--  keymap("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--  keymap("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--  keymap("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--  keymap("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--  keymap("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--  keymap("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--  keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

-- end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

