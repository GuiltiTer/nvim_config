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

local function rerun_last()
  local overseer = require "overseer"
  local task = overseer.list_tasks({ recent_first = true })[1]
  if not task then
    vim.notify("No task found", vim.log.levels.WARN, { title = "Overseer" })
    return
  end
  overseer.run_action(task, "restart")
end

return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun" },
  keys = {
    { "<leader>;t", mode = { "n" }, "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>;n", mode = { "n" }, "<cmd>OverseerBuild<cr>", desc = "New task" },
    { "<leader>;o", mode = { "n" }, "<cmd>OverseerToggle<cr>", desc = "Run task" },
    { "<leader>;a", mode = { "n" }, "<cmd>OverseerQuickAction<cr>", desc = "Action" },
    { "<leader>;r", mode = { "n" }, rerun_last, desc = "Rerun last task" },
  },
  opts = function()
    load_dir_templates "plugins/overseer/templates"
    return {
      task_list = {
        direction = "right",
        bindings = {
          ["?"] = "ShowHelp",
          ["a"] = "RunAction",
          ["e"] = "Edit",
          ["p"] = "TogglePreview",
          ["l"] = "IncreaseDetail",
          ["h"] = "DecreaseDetail",
          ["k"] = "PrevTask",
          ["j"] = "NextTask",
          ["dd"] = "Dispose",
          ["v"] = "OpenVsplit",
          ["s"] = "OpenSplit",
          ["f"] = "OpenFloat",
          ["<cr>"] = "OpenFloat",
          ["<C-u>"] = "ScrollOutputUp",
          ["<C-d>"] = "ScrollOutputDown",
          ["q"] = "Close",
          ["<C-l>"] = false,
          ["<C-h>"] = false,
          ["o"] = false,
        },
      },
    }
  end,
}
