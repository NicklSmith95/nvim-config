vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<C-c>", '"+y')


-- Key mappings
vim.keymap.set("n", "<leader>ts", require("template_vault").save_template, { desc = "Save Template" })
vim.keymap.set("v", "<leader>ts", require("template_vault").save_template, { desc = "Save Selection as Template" })
vim.keymap.set("n", "<leader>tt", function() require("telescope").extensions.template_vault.template_vault() end, { desc = "Browse Templates" })
