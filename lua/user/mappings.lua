local toggle_mini_files = function()
  if not require("mini.files").close() then require("mini.files").open(vim.api.nvim_buf_get_name(0)) end
end

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

    ["<Leader>e"] = {
      toggle_mini_files,
      desc = "Files",
    },
  },
}
