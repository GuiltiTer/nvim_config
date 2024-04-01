local sources = {
  { name = "otter" },
}

local extend_sources = function(opts)
  for _, source in ipairs(sources) do
    table.insert(opts.sources, source)
  end
end

local apply_cmdline = function()
  local cmp = require "cmp"
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
    }),
  })
end

return {
  "hrsh7th/nvim-cmp",
  keys = { ":", "/" },
  config = function(_, opts)
    local cmp = require "cmp"
    cmp.setup(opts)
    extend_sources(opts)
    apply_cmdline()
  end,

  dependencies = { "hrsh7th/cmp-cmdline" },
}
