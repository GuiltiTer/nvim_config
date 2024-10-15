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

  local textobj = require "jupynium.textobj"
  utils.register_local_keymap {
    name = "jupynium",
    pattern = "*.ju.*",
    mappings = {
      {
        lhs = "<localleader>r",
        rhs = "<cmd>JupyniumExecuteSelectedCells<cr>",
        desc = "Jupynium run cell",
        mode = { "n", "v" },
      },
      { lhs = "<localleader>a", rhs = "o<esc>i# %%<cr><esc>", desc = "Add cell" },
      { lhs = "<localleader>d", rhs = "<cmd>JupyniumScrollDown<cr>", desc = "Scroll down" },
      { lhs = "<localleader>u", rhs = "<cmd>JupyniumScrollUp<cr>", desc = "Scroll up" },
      { lhs = "]c", rhs = function() textobj.goto_next_cell_separator() end, desc = "Goto next cell" },
      { lhs = "[c", rhs = function() textobj.goto_previous_cell_separator() end, desc = "Goto prev cell" },

      { lhs = "<localleader>s", desc = "Server" },
      { lhs = "<localleader>sn", rhs = function() notebook:toggle() end, desc = "Start notebook server" },
      { lhs = "<localleader>sa", rhs = "<cmd>JupyniumStartAndAttachToServer<cr>", desc = "Jupynium start & attach" },
      { lhs = "<localleader>ss", rhs = "<cmd>JupyniumStartSync<cr>", desc = "Jupynium start sync" },
      { lhs = "<localleader>sS", rhs = "<cmd>JupyniumStopSync<cr>", desc = "Jupynium stop sync" },

      { lhs = "<localleader>k", desc = "Kernel" },
      { lhs = "<localleader>kr", rhs = "<cmd>JupyniumKernelRestart<cr>", desc = "Restart" },
      { lhs = "<localleader>ki", rhs = "<cmd>JupyniumKernelInterrupt<cr>", desc = "Interrupt" },
    },
  }
end

return {
  enabled = true,
  "kiyoon/jupynium.nvim",
  ft = { "python" },
  config = jupynium_config,
}
