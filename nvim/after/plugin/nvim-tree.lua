local status, nvim_tree = pcall(require, "nvim-tree")
if not status then return end

local tree_cb = require("nvim-tree.config").nvim_tree_callback

nvim_tree.setup({
  view = {
    hide_root_folder = true,
    side = "right",
    width = 40,
    mappings = {
      list = {
        { key = { "n" }, cb = tree_cb("create") },
        { key = { "r" }, cb = tree_cb("full_rename") },
        { key = { "v" }, cb = tree_cb("vsplit") },
      },
    },
  },
  renderer = {
    icons = {
      git_placement = "before",
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "U",
          staged = "s",
          unmerged = "",
          renamed = "",
          untracked = "?",
          deleted = "",
          ignored = "",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    severity = {
      min = vim.diagnostic.severity.WARN,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      warning = "",
      error = "",
    },
  },
})
