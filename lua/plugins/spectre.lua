return {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  keys = {
    { "<Leader>s", desc = " Spectre" },
    { "<Leader>sp", mode = { "n" }, function() require("spectre").toggle() end, desc = "Search project" },
    { "<Leader>sf", mode = { "n" }, function() require("spectre").open_file_search() end, desc = "Search file" },
  },
  opts = {
    open_cmd = "new",
    default = { replace = { cmd = "sd" } },
    mapping = {
      ["quit"] = { map = "q", cmd = "<cmd>q<cr>", desc = "quit" },
      ["quit2"] = { map = "<leader>q", cmd = "<cmd>q<cr>", desc = "quit" },
      ["send_to_qf"] = {
        map = "<c-q>",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix",
      },
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
}
