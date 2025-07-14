return {
  {
    "echasnovski/mini.starter",
    -- version = "*",
    config = function()
      local starter = require "mini.starter"
      local hooks = {
        clear_statusline = function(buff)
          vim.opt_local.statusline = " "
          vim.cmd "highlight StatusLine ctermbg=None guibg=None"
          return buff
        end,

        local_keymap = function(buff)
          vim.keymap.set("n", "q", "<cmd>q<cr>", { buffer = 0 })
          vim.keymap.set("n", "j", "<cmd>normal <Down><cr>", { buffer = 0 })
          vim.keymap.set("n", "k", "<cmd>normal <Up><cr>", { buffer = 0 })
          return buff
        end,
      }

      starter.setup {
        autoopen = true,
        silent = true,
        evaluate_single = true,

        items = {
          {
            { name = "Files", action = function() require("snacks").picker.files() end, section = "" },
            { name = "Git", action = function() require("astrocore").toggle_term_cmd "lazygit" end, section = "" },
            { name = "Diff", action = "DiffviewOpen", section = "" },
            { name = "Explorer", action = function() require("tfm").open() end, section = "" },
          },
        },

        header = "",

        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.aligning("center", "center"),
          hooks.clear_statusline,
          hooks.local_keymap,
        },

        query_updaters = "abcdefghilmnopqrstuvwxyz0123456789_-.",
      }

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local padding = "░ "
          starter.config.footer = padding .. stats.loaded .. "/" .. stats.count .. "  "
          pcall(starter.refresh)
        end,
      })
    end,
  },
}
