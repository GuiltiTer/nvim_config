return {
  "echasnovski/mini.files",
  version = "*",
  opts = function()
    local MiniFiles = require "mini.files"

    local dot_file_filter = {
      toggle = function(self)
        self.is_hide = not self.is_hide
        return self:get_filter()
      end,
      get_filter = function(self) return self.is_hide and self.hide_filter or self.show_filter end,

      is_hide = true,
      hide_filter = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end,
      show_filter = function(fs_entry) return true end,
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local refresh = function() MiniFiles.refresh { content = { filter = dot_file_filter:toggle() } } end
        vim.keymap.set("n", "H", refresh, { buffer = args.data.buf_id })
      end,
    })

    local opts = {
      content = {
        filter = dot_file_filter.hide_filter,
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
        show_help = "?",
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
    }
    return opts
  end,
  dependencies = {
    { "echasnovski/mini.icons", version = "*", opts = {} },
  },
}
