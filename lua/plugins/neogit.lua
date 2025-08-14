return {
  "NeogitOrg/neogit",
  keys = { { "<Leader>gn", mode = { "n" }, function() require("neogit").open() end, desc = "Neogit" } },
  opts = {
    graph_style = "kitty",
    kind = "auto",
    notification_icon = "",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  lazy = true,
}
