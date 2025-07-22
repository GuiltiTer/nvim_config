return {
  x = {
    ["<C-p>"] = { '"0p', desc = "Put last yanked" },
    ["L"] = { "$", desc = "End of line" },
    ["H"] = { "^", desc = "Beginning of line" },
  },
  n = {
    ["<Leader>w"] = { "<cmd>wa<cr>", desc = "Save All" },
    ["Q"] = { "<cmd>q<cr>", desc = "Quit" },
    ["<C-p>"] = { '"0p', desc = "Put last yanked" },
    ["L"] = { "$", desc = "End of line" },
    ["H"] = { "^", desc = "Beginning of line" },

    ["<Leader>e"] = { function() require("mini.files").open(vim.api.nvim_buf_get_name(0)) end, desc = "Files" },
  },
}
