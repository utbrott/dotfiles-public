local status, git = pcall(require, "git")
if not status then return end

git.setup({
  keymaps = {
    -- Open git blame window
    blame = "<leader>gb",
    -- Open file/folder in git repository
    browse = "<leader>go",
  },
})
