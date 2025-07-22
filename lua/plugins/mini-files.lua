return {
  "echasnovski/mini.files",
  version = "*",
  opts = {
    content = {
      filter = nil,
      prefix = nil,
    },

    mappings = {
      close = "q",
      go_in = "",
      go_in_plus = "l",
      go_out = "",
      go_out_plus = "h",
      mark_goto = "'",
      mark_set = "m",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },

    options = {
      permanent_delete = true,
      use_as_default_explorer = false,
    },

    windows = {
      preview = false,
      width_focus = 50,
      width_nofocus = 10,
      width_preview = 80,
    },
  },
  dependencies = {
    { "echasnovski/mini.icons", version = "*", opts = {} },
  },
}
