local key = vim.keymap.set

key({ "n", "x", "v" }, "<C-p>", '"0p', { desc = "Put last yanked" })
key({ "n", "x", "v" }, "H", "^", { desc = "Beginning of the line" })
key({ "n", "x", "v" }, "L", "$", { desc = "End of the line" })
key({ "n", "x", "v" }, "<leader>w", "<cmd>wa<cr>", { desc = "Write all" })

key({ "t" }, "<esc><esc>", "<c-\\><c-n>", { desc = "Escapce" })
