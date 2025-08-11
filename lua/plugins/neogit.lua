return {
  "NeogitOrg/neogit",
  keys = { { "<Leader>gn", mode = { "n" }, function() require("neogit").open() end, desc = "Neogit" } },
  opts = {
    graph_style = "kitty",
    kind = "auto",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  lazy = true,
}
