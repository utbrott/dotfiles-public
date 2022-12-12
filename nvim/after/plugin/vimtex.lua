local g = vim.g

g.tex_flavor = "latex"
g.tex_comment_nospell = 1
g.vimtex_compiler_latexmk = {
  ["options"] = {
    "-file-line-error",
    "-interaction=nonstopmode",
    "-shell-escape",
    "-synctex=1",
    "-verbose",
  },
}
