local utils = require "user.utils"

local jupynium_config = function()
  require("jupynium").setup {
    python_host = "python",
    default_notebook_URL = "localhost:8888/nbclassic",
    jupyter_command = "jupyter",

    notebook_dir = nil,
    firefox_profiles_ini_path = nil,
    firefox_profile_name = nil,
    auto_start_server = {
      enable = false,
      file_pattern = { "*.ju.*" },
    },
    auto_attach_to_server = {
      enable = true,
      file_pattern = { "*.ju.*", "*.md" },
    },
    auto_start_sync = {
      enable = false,
      file_pattern = { "*.ju.*", "*.md" },
    },
    auto_download_ipynb = false,
    auto_close_tab = true,
    autoscroll = {
      enable = true,
      mode = "always",
      cell = { top_margin_percent = 20 },
    },

    scroll = {
      page = { step = 0.5 },
      cell = { top_margin_percent = 20 },
    },
    jupynium_file_pattern = { "*.ju.*" },
    use_default_keybindings = false,
    textobjects = { use_default_keybindings = false },

    syntax_highlight = { enable = true },
    shortsighted = false,
    kernel_hover = {
      floating_win_opts = {
        max_width = 84,
        border = "none",
      },
    },
  }

  vim.cmd [[
      hi! link JupyniumCodeCellSeparator CursorLine
      hi! link JupyniumMarkdownCellSeparator CursorLine
      hi! link JupyniumMarkdownCellContent CursorLine
      hi! link JupyniumMagicCommand Keyword
  ]]

  local notebook = require("toggleterm.terminal").Terminal:new {
    cmd = "jupyter notebook  --no-browser --NotebookApp.token='' --NotebookApp.password=''",
    hidden = true,
  }

  utils.register_local_keymap {
    name = "jupynium",
    pattern = "*.ju.*",
    mappings = {
      { "<localleader>", "Run" },
      { "<localleader>r", "<cmd>JupyniumExecuteSelectedCells<cr>", "Jupynium run cell", mode = { "n", "v" } },
      { "<localleader>a", "o# %%<esc>o", "Add cell" },

      { "<localleader>s", "Server" },
      { "<localleader>sn", function() notebook:toggle() end, "Start notebook server" },
      { "<localleader>sa", "<cmd>JupyniumStartAndAttachToServer<cr>", "Jupynium start & attach" },
      { "<localleader>ss", "<cmd>JupyniumStartSync<cr>", "Jupynium start sync" },
      { "<localleader>sS", "<cmd>JupyniumStopSync<cr>", "Jupynium stop sync" },

      { "<localleader>k", "Kernel" },
      { "<localleader>kr", "<cmd>JupyniumKernelRestart<cr>", "Restart" },
      { "<localleader>ki", "<cmd>JupyniumKernelInterrupt<cr>", "Interrupt" },
    },
  }
end

return {
  "kiyoon/jupynium.nvim",
  ft = { "python" },
  config = jupynium_config,
}
