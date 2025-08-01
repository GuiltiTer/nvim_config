return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<Leader>s", mode = { "n" }, function() require("spectre").toggle() end, desc = "Spectre" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Spectre",
  config = function()
    require("spectre").setup {
      open_cmd = "new",
      default = { replace = { cmd = "sd" } },
      mapping = {
        ["quit"] = { map = "q", cmd = "<cmd>q<cr>", desc = "quit" },
        ["quit2"] = { map = "<leader>q", cmd = "<cmd>q<cr>", desc = "quit" },
        ["send_to_qf"] = {
          map = "<c-q>",
          cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
          desc = "send all items to quickfix",
        },
      },
    }
  end,
}
