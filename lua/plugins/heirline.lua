local components = {
  visual_counter = {
    static = {
      get_word_count = function() return vim.fn.wordcount() end,
      get_buffer_line_count = function() return vim.fn.line "$" end,
      get_visual_line_count = function()
        local starts, ends = vim.fn.line "v", vim.fn.line "."
        local lines = (starts <= ends and ends - starts or starts - ends) + 1
        return lines
      end,
    },
    provider = function(self)
      local wc = self.get_word_count()
      local visual_lines = self.get_visual_line_count()
      local buff_lines = self.get_buffer_line_count()
      local l_str = "Lines:" .. tostring(visual_lines) .. "|" .. tostring(buff_lines)
      local w_str = "Words:" .. tostring(wc["visual_words"]) .. "|" .. tostring(wc["words"])
      local c_str = "Chars:" .. tostring(wc["visual_chars"]) .. "|" .. tostring(wc["chars"])
      return "(" .. l_str .. " " .. w_str .. " " .. c_str .. ")"
    end,
    condition = function() return vim.fn.mode():find "[Vv]" ~= nil end,
  },
}

return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = {
      hl = { fg = "fg", bg = "bg" },
      status.component.git_branch {
        git_branch = { icon = { kind = "GitBranch", padding = { right = 1, left = 1 } } },
      },
      status.component.file_info {
        file_modified = { padding = { left = 0, right = 0 } },
        filename = { padding = { left = 0, right = 0 } },
        file_icon = { padding = { left = 1, right = 1 } },
        filetype = false,
      },
      status.component.git_diff(),
      status.component.fill(),
      status.component.cmd_info(),
      status.component.fill(),
      components.visual_counter,
      status.component.lsp(),
      status.component.virtual_env(),
      status.component.treesitter {
        str = {
          str = " ",
          icon = { kind = "ActiveTS", padding = { right = 0 } },
        },
      },
    }
    opts.winbar = nil
    return opts
  end,
}
