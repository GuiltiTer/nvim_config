local buffer_picker = function()
  local actions = require "telescope.actions"
  require("telescope.builtin").buffers {
    sort_lastused = true,
    ignore_current_buffer = true,
    sort_mru = true,
    previewer = false,
    layout_config = { width = 0.5, height = 0.5, prompt_position = "top" },
    attach_mappings = function(prompt_bufnr, map)
      map({ "i", "n" }, "<Tab>", function() actions.move_selection_next(prompt_bufnr) end)
      map({ "i", "n" }, "<S-Tab>", function() actions.move_selection_previous(prompt_bufnr) end)
      map({ "i", "n" }, "<C-d>", function() actions.delete_buffer(prompt_bufnr) end)
      return true
    end,
  }
end

return {
  buffers = buffer_picker,
}
