return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<Leader>td",
      mode = { "n" },
      function()
        require("toggleterm.terminal").Terminal
          :new({
            cmd = "lazydocker",
            hidden = true,
          })
          :toggle()
      end,
      desc = "ToggleTerm LazyDocker",
    },
  },
  version = "*",
  opts = {},
}
