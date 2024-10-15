local utils = require "user.utils"
local pandoc = require "user.pandoc"

utils.register_local_keymap {
  name = "pandoc",
  pattern = "*.md",
  mappings = {
    { lhs = "<localleader>b", rhs = function() pandoc.build { auto_open = true } end, desc = "Buld file" },
  },
}
