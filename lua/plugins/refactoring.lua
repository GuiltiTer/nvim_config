return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = "BufReadPost",
  ---@diagnostic disable: missing-fields
  config = function() require("refactoring").setup {} end,
}
