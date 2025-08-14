local function load_dir_templates(dir)
  local overseer = require "overseer"
  local files = vim.fn.glob(vim.fn.stdpath "config" .. "/lua/" .. dir .. "/*.lua", false, true)
  local modules = vim.tbl_map(
    function(file) return dir:gsub("/", ".") .. "." .. vim.fn.fnamemodify(file, ":t:r") end,
    files
  )
  local templates = {}
  vim.tbl_map(function(mod)
    local content = require(mod)
    if vim.islist(content) then
      vim.list_extend(templates, content)
    else
      table.insert(templates, content)
    end
  end, modules)
  vim.tbl_map(function(template) overseer.register_template(template) end, templates)
end

return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun" },
  keys = { { "<leader>rr", mode = { "n" }, "<cmd>OverseerRun<cr>", desc = "Run" } },
  lazy = true,
  config = function()
    local overseer = require "overseer"
    overseer.setup {}
    load_dir_templates "plugins/overseer/templates"
  end,
}
