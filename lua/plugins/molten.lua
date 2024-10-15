local utils = require "user.utils"

local set_keys = function()
  utils.register_local_keymap {
    name = "molten",
    pattern = "*.py",
    exclude = ".ju.",
    mappings = {
      { lhs = "<localleader>", desc = "Run" },
      { lhs = "<localleader>r", rhs = "<cmd>MoltenEvaluateLine<cr>", desc = "Evaluate line" },
      { lhs = "<localleader>r", rhs = ":<c-u>MoltenEvaluateVisual<cr>", desc = "Evaluate visual", mode = { "v" } },
      { lhs = "<localleader>R", rhs = ":<c-u>MoltenEvaluateVisual<cr>", desc = "Re-evaluate cell" },
      { lhs = "<localleader><localleader>", rhs = "<cmd>MoltenEvaluateOperator<cr>", desc = "Evaluate operator" },
      { lhs = "<localleader>o", rhs = ":noautocmd MoltenEnterOutput<cr>", desc = "Open output" },
      { lhs = "<localleader>i", rhs = "<cmd>MoltenImagePopup<cr>", desc = "Image popup" },

      { lhs = "<localleader>k", desc = "Kernel" },
      { lhs = "<localleader>kr", rhs = "<cmd>MoltenRestart<cr>", desc = "Restart" },
      { lhs = "<localleader>ki", rhs = "<cmd>MoltenInterrupt<cr>", desc = "Interrupt" },
    },
  }
end

return {
  enabled = true,
  "benlubas/molten-nvim",
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  ft = { "python" },
  dependencies = { "willothy/wezterm.nvim", config = true },
  init = function()
    local opts = {
      molten_output_win_border = "none",
      molten_virt_text_output = true,
      molten_auto_open_output = false,
      molten_enter_output_behavior = "open_and_enter",
      molten_image_provider = "wezterm",
      molten_split_size = 20,
    }
    for k, v in pairs(opts) do
      vim.g[k] = v
    end
  end,

  config = function() set_keys() end,
}
