local utils = require "user.utils"

return {
  "benlubas/molten-nvim",
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  ft = { "python" },
  dependencies = { "willothy/wezterm.nvim", config = true },
  init = function()
    local opts = {
      molten_output_win_border = { "", "", "", "" },
      molten_output_win_cover_gutter = false,
      molten_virt_text_output = true,
      molten_auto_open_output = false,
      molten_enter_output_behavior = "no_open",
      molten_image_provider = "wezterm",
      molten_split_size = 20,
    }
    for k, v in pairs(opts) do
      vim.g[k] = v
    end

    utils.register_local_keymap("molten", { "*.py" }, {
      ["<localleader>"] = {
        name = "Run",
        k = {
          name = "Kernel",
          i = { "<cmd>MoltenInterrupt<cr>", "Molten kernel interrupt" },
        },
        ["<localleader>"] = { "<cmd>MoltenEvaluateOperator<cr>", "Evaluate operator" },
        l = { "<cmd>MoltenEvaluateLine<cr>", "Evaluate line" },
        e = { ":<c-u>MoltenEvaluateVisual<cr>", "Evaluate visual", mode = { "v" } },
      },
    })
  end,
}
