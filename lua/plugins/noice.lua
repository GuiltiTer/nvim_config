return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      messages = {
        view = "mini",
        view_error = "notify",
        view_warn = "notify",
      },
      lsp = { progress = { enabled = false } },
    },
  },
}
