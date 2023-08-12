local keymap = vim.keymap.set

keymap("n", "<leader>gs", vim.cmd.Git)

local mimivalsi_fugitive = vim.api.nvim_create_augroup("mimivalsi_fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
  group = mimivalsi_fugitive,
  pattern = "*",
  callback = function ()
    if vim.bo.ft ~= "fugitive" then
      return
    end
    local bufnr = vim.api.nvim_get_current_buf()
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>p", function ()
      vim.cmd.Git('push')
    end, opts)

    -- set the branch working on
    vim.keymap.set("n", "<leader>t", ":Git push -u origin", opts)
  end
})
