local buffer_picker = function()
  local actions = require "telescope.actions"
  require("telescope.builtin").buffers {
    sort_lastused = true,
    ignore_current_buffer = true,
    sort_mru = true,
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function() actions.delete_buffer(prompt_bufnr) end
      map("n", "<C-d>", delete_buf)
      map("i", "<C-d>", delete_buf)
      return true
    end,
  }
end

return {
  buffers = buffer_picker,
}
