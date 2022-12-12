local status, trouble = pcall(require, "trouble")
if not status then return end

trouble.setup({})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { silent = true })
