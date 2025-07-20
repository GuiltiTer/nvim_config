return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun" },
  lazy = true,
  config = function()
    local overseer = require "overseer"
    overseer.setup {}
    overseer.register_template(require "plugins.overseer.templates.pandoc")
  end,
}
