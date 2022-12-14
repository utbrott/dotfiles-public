local ok, telescope = pcall(require, "telescope")
if not ok then
  print("telescope failed")
  return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local map = vim.keymap.set

telescope.setup({
  defaults = {
    initial_mode = "normal",
    color_devicons = true,
    mappings = {
      n = {
        ["q"] = actions.close,
        ["/"] = function()
          vim.cmd("startinsert")
        end,
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})

-- Keymaps
local opts = { silent = true }
map("n", "\\\\", builtin.buffers, opts)
map("n", "<leader>fh", builtin.help_tags, opts)
map("n", "<leader>fs", builtin.live_grep, opts)
map("n", "<leader>ff", function() builtin.find_files({ no_ignore = false, hidden = true }) end, opts)
