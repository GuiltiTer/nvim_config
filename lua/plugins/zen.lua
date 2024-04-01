return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 120,
        height = 1,
        options = {
          relativenumber = true,
        },
      },
      plugins = {
        kitty = {
          enabled = true,
          font = "+4",
        },
        wezterm = {
          enabled = true,
          font = "+2",
        },
      },
    },
  },
}
