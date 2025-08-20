return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  keys = {
    {
      mode = { "n" },
      "mm",
      function()
        local harpoon = require "harpoon"
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Show menu",
    },
    { mode = { "n" }, "ma", function() require("harpoon"):list():add() end, desc = "Add mark" },
    { mode = { "n" }, "mf", function() require("harpoon"):list():next { ui_nav_wrap = true } end, desc = "Next mark" },
    { mode = { "n" }, "md", function() require("harpoon"):list():prev { ui_nav_wrap = true } end, desc = "Prev mark" },
  },
  config = function()
    local harpoon = require "harpoon"
    local harpoon_extensions = require "harpoon.extensions"

    harpoon:setup {
      settings = { save_on_toggle = true, sync_on_ui_close = true },
      default = { display = function(item) return "./" .. vim.fn.fnamemodify(item.value, ":.") end },
    }

    harpoon:extend {
      UI_CREATE = function(ctx)
        local key = vim.keymap.set
        key("n", "<C-v>", function() harpoon.ui:select_menu_item { vsplit = true } end, { buffer = ctx.bufnr })
        key("n", "<C-s>", function() harpoon.ui:select_menu_item { split = true } end, { buffer = ctx.bufnr })
      end,
    }

    harpoon:extend {
      UI_CREATE = function(ctx)
        for line_number, file in pairs(ctx.contents) do
          if string.find("./" .. vim.fn.fnamemodify(ctx.current_file, ":."), file, 1, true) then
            vim.api.nvim_buf_add_highlight(ctx.bufnr, -1, "CursorLineNr", line_number - 1, 0, -1)
            vim.api.nvim_win_set_cursor(ctx.win_id, { line_number, 0 })
          end
        end
      end,
    }
    harpoon:extend(harpoon_extensions.builtins.navigate_with_number())
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
