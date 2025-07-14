return {
  "NeogitOrg/neogit",
  config = true,
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
