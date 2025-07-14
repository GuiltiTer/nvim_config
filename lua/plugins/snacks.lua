return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      icons = {
        error = "",
        warn = "",
        info = "",
        debug = "",
        trace = "",
      },
      keep = function(notif) return vim.fn.getcmdpos() > 0 end,
      style = "minimal",
      more_format = " ↓ %d lines ",
    },
  },
}
