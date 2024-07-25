local M = {}

local function partition(values, predicate)
  local satisfies, dissatisfies = {}, {}
  for _, v in ipairs(values) do
    if predicate(v) then
      table.insert(satisfies, v)
    else
      table.insert(dissatisfies, v)
    end
  end
  return satisfies, dissatisfies
end

---@param opts {name: string, pattern: string | string[], mappings: any, exclude: string | string[]}
function M.register_local_keymap(opts)
  local function register_keys(keys)
    for _, key in ipairs(keys) do
      vim.keymap.set(key.mode or "n", key[1], key[2], { desc = key[3], buffer = 0 })
    end
  end

  local function register_descs(descs)
    local wk_keys = {}
    for _, desc in ipairs(descs) do
      wk_keys[desc[1]] = { name = desc[2], mode = desc.mode or "n" }
    end
    require("which-key").add(wk_keys, { buffer = 0 })
  end

  local function contains(str, pattern)
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
      -- exclude matching file names
      if opts.exclude and contains(acmd.file, opts.exclude) then return true end

      -- is keymap if it has 3 members(lhs, rhs, desc)
      local keys, descs = partition(opts.mappings, function(key) return #key == 3 end)
      register_keys(keys)
      register_descs(descs)
    end,
  })
end

return M
