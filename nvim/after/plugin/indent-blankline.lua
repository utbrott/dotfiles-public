local status, indent_blankline = pcall(require, "indent-blankline")
if not status then return end

indent_blankline.setup({
  indent_blankline_char = "▏",
  show_current_context = true,
})
