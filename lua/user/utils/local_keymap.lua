local M = {}

---@param opts {name: string, pattern: string | string[], mappings: any, exclude: string | string[]}
function M.register_local_keymap(opts)
  local function matches(str, pattern)
    -- check if a string matches the given pattern(s)
    local type_map = {
      ["string"] = function(s, p)
        if string.find(s, p) then return true end
        return false
      end,

      ["table"] = function(s, ps)
        for _, p in ipairs(ps) do
          if string.find(s, p) then return true end
        end
        return false
      end,
    }

    return type_map[type(pattern)](str, pattern)
  end

  vim.api.nvim_create_autocmd("BufEnter", {
    desc = string.format("%s local buffer keymap", opts.name),
    pattern = opts.pattern,
    group = vim.api.nvim_create_augroup(string.format("%s_keymap", opts.name), { clear = true }),
    callback = function(acmd)
      if opts.exclude and matches(acmd.file, opts.exclude) then return true end -- exclude matching file names

      for _, mapping in ipairs(opts.mappings) do
        vim.keymap.set(
          mapping.mode or "n",
          mapping.lhs,
          mapping.rhs or "<Nop>",
          { desc = mapping.desc, buffer = 0, silent = true }
        )
      end
    end,
  })
end

return M
