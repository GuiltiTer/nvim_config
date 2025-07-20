return {
  "Wansmer/treesj",
  keys = {
    { "gJ", mode = { "n" }, function() require("treesj").join() end, desc = "Join lines" },
    { "gS", mode = { "n" }, function() require("treesj").split() end, desc = "Split lines" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup {
      use_default_keymaps = false,
      notify = false,
    }
  end,
}
