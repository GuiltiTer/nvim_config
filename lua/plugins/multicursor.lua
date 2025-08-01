return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  keys = {
    { "ga", mode = { "n", "x" }, function() require("multicursor-nvim").toggleCursor() end, desc = "Cursor toggle" },
    {
      "gA",
      mode = { "n", "x" },
      function() require("multicursor-nvim").matchAllAddCursors() end,
      desc = "Cursor match visual",
    },
  },
  config = function()
    local mc = require "multicursor-nvim"
    mc.setup()

    mc.addKeymapLayer(function(layerSet)
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end,
}
