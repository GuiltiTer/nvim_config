local buffer_picker = function()
  require("snacks").picker.buffers {
    finder = "buffers",
    format = "buffer",
    hidden = false,
    unloaded = true,
    current = false,
    sort_lastused = true,
    win = {
      input = {
        keys = {
          ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
          ["<Tab>"] = { "list_down", mode = { "n", "i" } },
          ["<S-Tab>"] = { "list_up", mode = { "n", "i" } },
        },
      },
      list = { keys = { ["dd"] = "bufdelete" } },
    },
  }
end

return {
  buffers = buffer_picker,
}
