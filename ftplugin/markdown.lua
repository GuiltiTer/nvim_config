local utils = require "user.utils"
local pandoc = require "user.pandoc"

utils.register_local_keymap {
  name = "pandoc",
  pattern = "*.md",
  mappings = {
    { "<localleader>", "Pandoc" },
    { "<localleader>b", function() pandoc.build { auto_open = true } end, "Buld file" },
  },
}
