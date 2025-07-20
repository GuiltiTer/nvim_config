return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun" },
  keys = { { "<leader>r", mode = { "n" }, "<cmd>OverseerRun<cr>", desc = "Run" } },
  lazy = true,
  config = function()
    local overseer = require "overseer"
    overseer.setup {}
    overseer.register_template(require "plugins.overseer.templates.pandoc")
  end,
}
