return {
  "otavioschwanck/arrow.nvim",
  event = "VeryLazy",
  dependencies = {
    { "echasnovski/mini.icons" },
  },
  opts = {
    show_icons = true,
    leader_key = "m",
    buffer_leader_key = "M",
    separate_save_and_remove = true,
    hide_handbook = true,
    hide_buffer_handbook = true,
    index_keys = "qwertjkl12345zcbnmfgyuiop",
    mappings = {
      edit = "i",
      delete_mode = "d",
      clear_all_items = "D",
      toggle = "a",
      open_vertical = "v",
      open_horizontal = "h",
      quit = "m",
      remove = "x",
      next_item = "n",
      prev_item = "p",
    },
    window = {
      border = "rounded",
    },
  },
}
