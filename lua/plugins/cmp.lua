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
    mapping = cmp.mapping.preset.cmdline {
      ["<C-j>"] = {
        c = function()
          if cmp.visible() then cmp.select_next_item() end
        end,
      },
      ["<C-k>"] = {
        c = function()
          if cmp.visible() then cmp.select_prev_item() end
        end,
      },
    },
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline {
      ["<C-j>"] = {
        c = function()
          if cmp.visible() then cmp.select_next_item() end
        end,
      },
      ["<C-k>"] = {
        c = function()
          if cmp.visible() then cmp.select_prev_item() end
        end,
      },
    },
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

    opts.matching = {
      disallow_fuzzy_matching = false,
      disallow_fullfuzzy_matching = false,
      disallow_partial_fuzzy_matching = false,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = false,
      disallow_symbol_nonprefix_matching = false,
    }
  end,

  dependencies = { "hrsh7th/cmp-cmdline" },
}
