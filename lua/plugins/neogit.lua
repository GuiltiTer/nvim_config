return {
  "NeogitOrg/neogit",
  keys = { { "<Leader>gn", mode = { "n" }, function() require("neogit").open() end, desc = "Neogit" } },
  opts = {
    disable_hint = true,
    graph_style = "unicode",
    kind = "auto",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  lazy = true,
}
