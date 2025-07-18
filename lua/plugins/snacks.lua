return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      margin = { top = 0, right = 0, bottom = 0 },
      width = { min = 0, max = 0.4 },
      padding = true,
      icons = {
        error = "  ",
        warn = "  ",
        info = "  ",
        debug = "  ",
        trace = "  ",
      },
      keep = function(notif) return vim.fn.getcmdpos() > 0 end,
      style = "minimal",
    },
  },
}
