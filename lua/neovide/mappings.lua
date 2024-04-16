local get_font_prop = function()
  local i = string.find(vim.o.guifont, ":")
  local font_family = string.sub(vim.o.guifont, 0, i - 1)
  local current_size = tonumber(string.sub(vim.o.guifont, i + 2))
  return font_family, current_size
end

local set_font = function(font_family, font_size) vim.o.guifont = font_family .. ":h" .. font_size end

local inc_font_size = function()
  local font_family, current_size = get_font_prop()
  local new_size = current_size + vim.g.my_neovide_font_size_adjust_step
  if new_size > 40 then return end
  set_font(font_family, new_size)
end

local dec_font_size = function()
  local font_family, current_size = get_font_prop()
  local new_size = current_size - vim.g.my_neovide_font_size_adjust_step
  if new_size < 2 then return end
  set_font(font_family, new_size)
end

local reset_font_size = function()
  local font_family, _ = get_font_prop()
  set_font(font_family, vim.g.my_neovide_default_font_size)
end

vim.keymap.set("n", "<D-=>", inc_font_size)
vim.keymap.set("n", "<D-->", dec_font_size)
vim.keymap.set("n", "<D-0>", reset_font_size)
