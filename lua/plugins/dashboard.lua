local logo = [[
                 ▄   ▄                 
             ▄█▄ █▀█▀█ ▄█▄             
            ▀▀████▄█▄████▀▀            
                 ▀█▀█▀                 
                                       
                                       
    █▀▀ █░█ █ █░░ ▀█▀ █ ▀█▀ █▀▀ █▀█    
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    █▄█ █▄█ █ █▄▄ ░█░ █ ░█░ ██▄ █▀▄    
]]

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = logo,
      },
      sections = {
        { section = "header" },
        { section = "startup" },
        { key = "q", action = ":qa", hidden = true },
      },
    },
  },
}
