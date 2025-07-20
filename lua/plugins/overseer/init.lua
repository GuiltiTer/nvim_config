return {
  "stevearc/overseer.nvim",
  config = function()
    local overseer = require "overseer"
    overseer.setup {}
    overseer.register_template(require "plugins.overseer.templates.pandoc")
  end,
}
