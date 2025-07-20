return {
  "rolv-apneseth/tfm.nvim",
  lazy = true,
  keys = { { "<Leader>fe", mode = { "n" }, function() require("tfm").open() end, desc = "File Manager" } },
  opts = {
    -- TFM to use
    -- Possible choices: "ranger" | "nnn" | "lf" | "yazi" (default)
    file_manager = "yazi",
    -- Commands:
    --   Tfm: selected file(s) will be opened in the current window
    --   TfmSplit: selected file(s) will be opened in a horizontal split
    --   TfmVsplit: selected file(s) will be opened in a vertical split
    --   TfmTabedit: selected file(s) will be opened in a new tab page
    enable_cmds = true,
    ui = {
      border = "rounded",
      height = 0.80,
      width = 0.88,
      x = 0.5,
      y = 0.5,
    },
  },
}
