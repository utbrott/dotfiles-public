local opt = vim.opt

-- General
opt.backup = false -- no backup file
opt.swapfile = false -- no swap file
opt.confirm = true -- confirm to save before leaving modified buffer
opt.clipboard = 'unnamedplus' -- enable system clipboard
opt.cmdheight = 2 -- more space in command line
opt.completeopt = { 'menuone', 'noselect' } -- for cmp
opt.conceallevel = 0 -- makes `` visible in markdown
opt.fileencoding = 'utf-8'
opt.updatetime = 50 -- snappier performance faster completion
opt.timeoutlen = 300 -- time to wait for mapped sequence to complete (ms)
opt.mouse = 'a' -- allow mouse in all modes
opt.backspace = { 'start', 'eol', 'indent' }
opt.wildmode = 'longest:full,full' -- command-line completion mode

-- Indents
opt.shiftwidth = 2 -- size of indent
opt.tabstop = 2 -- spaces tab counts for
opt.expandtab = true -- change tabs to spaces
opt.shiftround = true
opt.smartindent = true
opt.autoindent = true

-- Display
opt.wrap = false -- disable line wraps
opt.splitbelow = true -- split down not up
opt.splitright = true -- split right not left
opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers
opt.signcolumn = 'yes' -- always show sign column otherwise text shifts
opt.scrolloff = 8 -- lines of context
opt.sidescrolloff = 8 -- columns of context
opt.showmode = false -- disable mode display in command-line statusline does that
opt.background = 'dark'
opt.cursorline = true -- enable highlight of line where cursor is
opt.termguicolors = true
opt.winblend = 0 -- disable transparency of floats
opt.pumblend = 10 -- enable transparecy of popups
opt.pumheight = 10 -- height of the popup window
opt.wildoptions = 'pum'

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false -- highlight all search matches
opt.incsearch = true -- highlight matches while typing
opt.path:append({ '**' })
opt.wildignore:append({ '*/node_modules/* ' }) -- dont search node_modules with wildcard search

-- Formatting
opt.formatoptions:append('r') -- add * in block comments
opt.formatoptions:remove({ 'c', 'o' }) -- disable comment auto wrapping on <Enter>

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Use proper syntax highlighting in code blocks
local fences = {
  'lua',
  -- "vim",
  'json',
  'typescript',
  'javascript',
  'js=javascript',
  'ts=typescript',
  'shell=sh',
  'python',
  'sh',
  'console=sh',
}
vim.g.markdown_fenced_languages = fences
vim.g.markdown_recommended_style = 0

-- Don't load the plugins below
local builtins = {
  'gzip',
  'zip',
  'zipPlugin',
  'fzf',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'matchit',
  'matchparen',
  'logiPat',
  'rrhelper',
}

for _, plugin in ipairs(builtins) do
  vim.g['loaded_' .. plugin] = 1
end
