return {
  "folke/flash.nvim",
  event = "BufRead",
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
  },
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    label = { uppercase = true },
    prompt = { enabled = false },

    search = { mode = "fuzzy" },
    modes = {
      search = {
        enabled = false,
        highlight = { backdrop = true },
      },
      char = {
        jump_labels = true,
        highlight = { backdrop = false },
      },
    },
  },
}
