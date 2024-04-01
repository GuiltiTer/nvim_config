return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require "notify"
    ---@diagnostic disable: missing-fields
    notify.setup {
      render = "compact",
      stages = "fade",
      timeout = 3000,
      fps = 60,
    }
    vim.notify = notify
  end,
}
