local key = vim.keymap.set
local group = function(mode, lhs, desc, opts)
  key(mode, lhs, "<Nop>", vim.tbl_deep_extend("keep", { desc = desc }, opts and opts or {}))
end

key({ "n", "x", "v" }, "<C-p>", '"0p', { desc = "Put last yanked" })
key({ "n", "x", "v" }, "H", "^", { desc = "Beginning of the line" })
key({ "n", "x", "v" }, "L", "$", { desc = "End of the line" })
key({ "n", "x", "v" }, "<leader>w", "<cmd>wa<cr>", { desc = "Write all" })
key({ "n", "x", "v" }, "<c-;>", "<c-^>", { desc = "Alternate buffer" })

key({ "t" }, "<esc><esc>", "<c-\\><c-n>", { desc = "Escapce" })

group({ "n" }, "<leader>;", "󱤵 Run")
