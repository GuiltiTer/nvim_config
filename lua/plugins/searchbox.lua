return {
  "VonHeikemen/searchbox.nvim",
  keys = {
    { "<Leader>r", mode = { "n" }, "<cmd>SearchBoxReplace confirm=menu<cr>", desc = "SearchBox" },
  },
  dependencies = {
    { "MunifTanjim/nui.nvim" },
  },
  event = "BufReadPost",
}
