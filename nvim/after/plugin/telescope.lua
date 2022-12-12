local ok, telescope = pcall(require, "telescope")
if not ok then
  print("telescope failed")
  return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

local function telescope_buffer_dir() return vim.fn.expand("%:p:h") end

local file_browser = require("telescope").extensions.file_browser

telescope.setup({
  defaults = {
    initial_mode = "normal",
    prompt_prefix = ">",
    color_devicons = true,
    mappings = {
      n = {
        ["q"] = actions.close,
        ["/"] = function() vim.cmd("startinsert") end,
      },
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- Disable netrw and use telescope-file-browser instead
      hijack_netrw = true,
      mappings = {
        -- Insert mode mappings
        i = {},
        n = {
          -- Normal mode mappings
          ["N"] = file_browser.actions.create,
          ["h"] = file_browser.actions.goto_parent_dir,
          ["/"] = function() vim.cmd("startinsert") end,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")

-- Keymaps
keymap("n", "<leader>fb", function() builtin.buffers() end, { silent = true })
keymap("n", "<leader>fh", function() builtin.help_tags() end, { silent = true })
keymap("n", "<leader>fs", function() builtin.live_grep() end, { silent = true })
keymap("n", "<leader>fe", function() builtin.diagnostics() end, { silent = true })
keymap("n", "<leader>f.", function() builtin.find_files({ no_ignore = false, hidden = true }) end, { silent = true })
keymap(
  "n",
  "<C-Bslash>",
  function()
    file_browser.file_browser({
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      layout_config = { height = 40 },
    })
  end,
  { silent = true }
)
