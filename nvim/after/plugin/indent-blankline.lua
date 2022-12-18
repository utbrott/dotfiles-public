local status, indent_blankline = pcall(require, 'indent-blankline')
if not status then return end

indent_blankline.setup({
  char = '┊',
  show_current_context = true,
  show_trailing_blankline_indent = false,
})
