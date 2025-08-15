return {
  {
    "AstroNvim/AstroNvim",
    version = "^5",
    import = "astronvim.plugins",
    opts = {
      mapleader = " ",
      maplocalleader = ",",
      icons_enabled = true,
      pin_plugins = nil,
    },
  },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },
}
