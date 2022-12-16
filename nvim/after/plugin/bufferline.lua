local status, bufferline = pcall(require, "bufferline")
if not status then return end

bufferline.setup({
  options = {
    numbers = "none",
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d", -- Right click to close
    left_trunc_marker = "",
    right_truc_marker = "",
    max_name_length = 30,
    tab_size = vim.o.columns / 8, -- 8 tabs from all the available columns
    offsets = {
      {
        filetype = "NvimTree",
        text = "EXPLORER",
        text_align = "left",
        separator = true,
      },
    },
  },
})
