local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback

nvim_tree.setup({
  view = {
    side = "right",
    width = 36,
    mappings = {
      list = {
        { key = { "n" }, cb = tree_cb("create") },
        { key = { "r" }, cb = tree_cb("full_rename") },
        { key = { "<" }, cb = tree_cb("dir_up") },
        { key = { "<C-r>" }, cb = tree_cb("refresh") },
      },
    },
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          untracked = "?",
          deleted = "",
          ignored = "",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
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
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
})
