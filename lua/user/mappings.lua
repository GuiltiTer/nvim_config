return {
  x = {
    -- refactoring
    ["<leader>R"] = { function() require("telescope").extensions.refactoring.refactors() end, desc = "Refactor menu" },
  },
  n = {
    -- basics
    ["<Leader>w"] = { "<cmd>wa<cr>", desc = "Save All" },
    ["Q"] = { "<cmd>q<cr>", desc = "Quit" },
    ["<C-y>"] = { '"qy', desc = "Yank to register q" },
    ["<C-p>"] = { '"qp', desc = "Pase to register q" },

    -- bufjump
    ["go"] = { function() require("bufjump").backward() end, desc = "Go out" },
    ["gi"] = { function() require("bufjump").forward() end, desc = "Go in" },

    -- undotree
    ["<Leader>U"] = { "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
    ["<Leader>fu"] = { "<cmd>Telescope undo<cr>", desc = "Find undo" },

    -- File Manager
    ["<Leader>o"] = { function() require("tfm").open() end, desc = "File Manager" },

    -- cliapps
    ["<Leader>td"] = { function() require("user.toggleterm").lazydocker() end, desc = "ToggleTerm LazyDocker" },

    -- searchbox
    ["<Leader>r"] = { "<cmd>SearchBoxReplace confirm=menu<cr>", desc = "SearchBox" },

    -- telescope
    ["<Leader>h"] = { function() require("user.telescope").buffers() end, desc = "Buffers" },
    ["?"] = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "search" },

    -- refactoring
    ["<Leader>R"] = { function() require("telescope").extensions.refactoring.refactors() end, desc = "Refactor Menu" },

    -- zen mode
    ["<Leader>uz"] = { function() require("zen-mode").toggle() end, desc = "Toggle zen mode" },

    -- neogit
    ["<Leader>gn"] = { function() require("neogit").open() end, desc = "Neogit" },

    -- diffview
    ["<Leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "Diff" },
    ["<Leader>gH"] = { desc = "History" },
    ["<Leader>gHb"] = { "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
    ["<Leader>gHf"] = { "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },

    -- treesj
    ["gJ"] = { function() require("treesj").join() end, desc = "Join lines" },
    ["gS"] = { function() require("treesj").split() end, desc = "Split lines" },
  },
}
