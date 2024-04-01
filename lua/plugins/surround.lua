return {
  "kylechui/nvim-surround",
  version = "*",
  event = "BufRead",
  config = function()
    ---@diagnostic disable: missing-fields
    require("nvim-surround").setup {
      keymaps = {
        normal = "s",
        normal_cur = "ss",
        visual = "s",
        delete = "ds",
        change = "cs",
      },
    }
  end,
}
