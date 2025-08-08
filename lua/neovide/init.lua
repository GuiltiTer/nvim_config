vim.g.my_neovide_default_font_size = 16
vim.g.my_neovide_font_size_adjust_step = 2
vim.o.guifont = "Cascadia Code:h" .. vim.g.my_neovide_default_font_size
vim.o.termguicolors = true
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_theme = require("env").colorscheme
vim.g.neovide_refresh_rate = 100
vim.opt.linespace = 0

require "neovide.mappings"
