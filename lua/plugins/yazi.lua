return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = { { "<leader>e", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open file manager" } },
  opts = {
    open_for_directories = true,
    floating_window_scaling_factor = 1,
    yazi_floating_window_border = "none",
    keymaps = {
      show_help = "g?",
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
}
