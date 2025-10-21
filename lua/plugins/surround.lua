return {
  "kylechui/nvim-surround",
  version = "*",
  event = "BufRead",
  opts = {
    keymaps = {
      normal = "s",
      normal_cur = "ss",
      visual = "s",
      delete = "ds",
      change = "cs",
    },
  },
}
