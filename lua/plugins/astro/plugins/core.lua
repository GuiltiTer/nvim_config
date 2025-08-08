---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 },
      autopairs = true,
      cmp = true,
      highlighturl = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      notifications = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = { current_line = true, prefix = "" },
      virtual_lines = { current_line = true },
      underline = true,
    },
    options = {
      opt = {
        relativenumber = false,
        number = false,
        spell = false,
        wrap = false,

        showtabline = 0,
        mousescroll = "ver:1,hor:1",
        foldcolumn = "0",
        scrolloff = 10,
      },
      g = {},
    },
    mappings = {
      n = {
        ["<Leader>c"] = false,
        ["<Leader>C"] = false,
        ["<Leader>h"] = false,
        ["<Leader>n"] = false,
        ["<Leader>Q"] = false,
      },
    },
  },
}
