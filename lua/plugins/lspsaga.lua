return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  keys = { { "gp", mode = { "n" }, "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" } },
  opts = {
    lightbulb = { enable = false },
    ui = { border = "rounded" },
    symbol_in_winbar = { enable = false },
    definition = {
      keys = {
        edit = "<C-e>",
        vsplit = "<C-v>",
        split = "<C-s>",
      },
    },
    finder = {
      layout = "float",
      default = "def+ref+imp",
      keys = {
        vsplit = "<C-v>",
        split = "<C-s>",
      },
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
}
