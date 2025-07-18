return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function() return require("snacks").git.get_root() ~= nil end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 2,
        },
        { section = "startup" },
        { hidden = true, key = "q", action = ":qa" },
      },
    },
  },
}
