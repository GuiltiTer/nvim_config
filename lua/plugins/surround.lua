return {
  "kylechui/nvim-surround",
  version = "*",
  event = "BufRead",
  opts = {
    keymaps = {
      normal = "gs",
      normal_cur = "gss",
      visual = "gs",
      delete = "gds",
      change = "gcs",
    },
  },
}
