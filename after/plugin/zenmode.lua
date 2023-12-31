local keymap = vim.keymap.set
local wk = require("which-key")

wk.register({
  ["<leader>z"] = { name = "Zen mode" },
  ["<leader>zz"] = {
    function ()
      require("zen-mode").setup {
        window = {
          width = 90,
          options = { }
        },
      }
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
      ColorMyPencils()
    end, "Zen mode"
  },

  ["<leader>zZ"] = { function ()
    require("zen-mode").setup {
      window = {
        width = 80,
        options = { }
      },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
    ColorMyPencils()
  end, "Zen mode bis"}
})

