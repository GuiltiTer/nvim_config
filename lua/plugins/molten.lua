local utils = require "user.utils"

return {
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

    utils.register_local_keymap {
      name = "molten",
      pattern = "*.py",
      exclude = ".ju.",
      mappings = {
        { "<localleader>", "Run" },
        { "<localleader>r", "<cmd>MoltenEvaluateLine<cr>", "Evaluate line" },
        { "<localleader>r", ":<c-u>MoltenEvaluateVisual<cr>", "Evaluate visual", mode = { "v" } },
        { "<localleader>R", ":<c-u>MoltenEvaluateVisual<cr>", "Re-evaluate cell" },
        { "<localleader><localleader>", "<cmd>MoltenEvaluateOperator<cr>", "Evaluate operator" },
        { "<localleader>o", ":noautocmd MoltenEnterOutput<cr>", "Open output" },
        { "<localleader>i", "<cmd>MoltenImagePopup<cr>", "Image popup" },

        { "<localleader>k", "Kernel" },
        { "<localleader>kr", "<cmd>MoltenRestart<cr>", "Restart" },
        { "<localleader>ki", "<cmd>MoltenInterrupt<cr>", "Interrupt" },
      },
    }
  end,
}
