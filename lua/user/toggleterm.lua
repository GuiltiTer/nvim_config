local Terminal = require("toggleterm.terminal").Terminal

local lazydocker = Terminal:new { cmd = "lazydocker", hidden = true }

return {
  lazydocker = function() lazydocker:toggle() end,
}
