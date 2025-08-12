return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun" },
  keys = { { "<leader>r", mode = { "n" }, "<cmd>OverseerRun<cr>", desc = "Run" } },
  lazy = true,
  config = function()
    local overseer = require "overseer"
    overseer.setup {}
    local templates_dir = "plugins/overseer/templates"
    local files = vim.fn.glob(vim.fn.stdpath "config" .. "/lua/" .. templates_dir .. "/*.lua", false, true)
    local modules = vim.tbl_map(
      function(file) return templates_dir:gsub("/", ".") .. "." .. vim.fn.fnamemodify(file, ":t:r") end,
      files
    )
    vim.tbl_map(function(mod) overseer.register_template(require(mod)) end, modules)
  end,
}
