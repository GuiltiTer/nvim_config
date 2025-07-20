return {
  "kylechui/nvim-surround",
  version = "*",
  event = "BufRead",
  opts = {
    keymaps = {
      normal = "S",
      normal_cur = "Ss",
      visual = "S",
      delete = "ds",
      change = "cs",
    },
  },
}
