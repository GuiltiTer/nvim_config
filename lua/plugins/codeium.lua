return {
  "Exafunction/codeium.nvim",
  event = "InsertEnter",
  config = function()
    require("codeium").setup()
    local config = require("cmp").get_config()

    table.insert(config.sources, 1, {
      name = "codeium",
      group_index = 1,
      priority = 100,
      format = require("lspkind").cmp_format { symbol_map = { Codeium = "" } },
    })
  end,
}
