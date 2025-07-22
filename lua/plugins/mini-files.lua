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
        vim.keymap.set("n", "H", refresh, { buffer = args.data.buf_id, desc = "Toggle dot files" })
      end,
    })

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        local cur_target = MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
          vim.cmd(direction .. " split")
          return vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target)
      end

      local desc = "Split " .. direction
      vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, "<C-s>", "belowright horizontal")
        map_split(buf_id, "<C-v>", "belowright vertical")
      end,
    })

    local yank_path = function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then return vim.notify "Cursor is not on valid entry" end
      vim.fn.setreg(vim.v.register, path)
    end

    local ui_open = function() vim.ui.open(MiniFiles.get_fs_entry().path) end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local b = args.data.buf_id
        vim.keymap.set("n", "gx", ui_open, { buffer = b, desc = "OS open" })
        vim.keymap.set("n", "gy", yank_path, { buffer = b, desc = "Yank path" })
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
        use_as_default_explorer = true,
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
