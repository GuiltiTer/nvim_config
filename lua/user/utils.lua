local M = {}

function M.register_local_keymap(name, pattern, keymap)
  vim.api.nvim_create_autocmd("BufEnter", {
    desc = string.format("%s local buffer keymap", name),
    pattern = pattern,
    group = vim.api.nvim_create_augroup(string.format("%s_keymap", name), { clear = true }),
    callback = function() require("which-key").register(keymap, { buffer = 0 }) end,
  })
end

return M
