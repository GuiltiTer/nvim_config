return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  lazy = true,
  opts = {
    sources = { "filesystem" },
    source_selector = { winbar = false },
    default_component_configs = {
      git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "",
          untracked = "",
          conflict = "󰘭",
          renamed = "󰪹",
          staged = "",
          unstaged = "",
          ignored = "󰈉",
        },
      },
    },
  },
}
