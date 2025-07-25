local logo = [[
                 ▄   ▄                 
             ▄█▄ █▀█▀█ ▄█▄             
            ▀▀████▄█▄████▀▀            
                 ▀█▀█▀                 
                                       
                                       
    █▀▀ █░█ █ █░░ ▀█▀ █ ▀█▀ █▀▀ █▀█    
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    █▄█ █▄█ █ █▄▄ ░█░ █ ░█░ ██▄ █▀▄    
]]

local arrow_files = function()
  local persist = require "arrow.persist"
  local icons = require "arrow.integration.icons"
  local config = require "arrow.config"

  persist.load_cache_file()

  local section = {}
  for i, v in pairs(vim.g.arrow_filenames) do
    local key = config.getState("index_keys"):sub(i, i)
    local icon, hl = icons.get_file_icon(v)
    table.insert(section, {
      key = tostring(key),
      icon = { icon, hl = hl },
      desc = { v, hl = "Normal" },
      action = function() persist.go_to(i) end,
      indent = 2,
    })
  end
  return section
end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = logo,
      },
      sections = {
        { section = "header" },
        { icon = "󱡁 ", title = "Arrow Files", padding = 2, arrow_files },
        { section = "startup" },
        { key = "q", action = ":qa", hidden = true },
      },
    },
  },
}
