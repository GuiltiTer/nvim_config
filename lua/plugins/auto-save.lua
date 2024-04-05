return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle",
  event = "BufRead",
  opts = {
    enabled = true,
    execution_message = {
      enabled = false,
      message = function() return "󱣪 " end,
    },
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_defered_save = { "InsertEnter" },
    },
    write_all_buffers = true,
    debounce_delay = 60000,
    condition = function(buf)
      local fn = vim.fn

      -- don't save for special-buffers
      if fn.getbufvar(buf, "&buftype") ~= "" then return false end
      return true
    end,
  },
}
