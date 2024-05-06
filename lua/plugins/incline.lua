return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  config = function()
    local get_diagnostic_label = function(props)
      local label = {}
      for _, severity in ipairs { "Error", "Warn", "Info", "Hint" } do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then table.insert(label, { " " .. n .. " ", group = "DiagnosticSign" .. severity }) end
      end
      return label
    end

    require("incline").setup {
      render = function(props) return { get_diagnostic_label(props) } end,
      window = { padding = { right = 0, left = 1 }, margin = { horizontal = 0 } },
    }
  end,
}
