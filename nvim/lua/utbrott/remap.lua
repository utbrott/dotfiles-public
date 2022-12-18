---@diagnostic disable: missing-parameter
local keymap = vim.keymap.set

-- <Space> as leader
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- Better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap('n', 'Q', '<Nop>', { silent = true })

-- Do not yank with x
keymap('n', 'x', '"_x')

-- Do not replace pasted word
keymap('n', '<leader>p', '"_dP')

-- Yank to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y')
keymap('n', '<leader>Y', '"+Y')

-- Select all
keymap('n', '<C-a>', 'ggVG')

-- File explorer
keymap('n', '<C-Bslash>', '<cmd>NvimTreeToggle<CR>', { silent = true })
-- Create & delete windows
keymap('n', '<leader>ws', '<C-w>s', { silent = true })
keymap('n', '<leader>wv', '<C-w>v', { silent = true })
keymap('n', '<leader>wd', '<C-w>c', { silent = true })

-- Move to window
keymap('n', '<C-h>', '<C-w>h', { silent = true })
keymap('n', '<C-j>', '<C-w>j', { silent = true })
keymap('n', '<C-k>', '<C-w>k', { silent = true })
keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- Resize window
keymap('n', '<S-Up>', '<cmd>resize +5<CR>')
keymap('n', '<S-Down>', '<cmd>resize -5<CR>')
keymap('n', '<S-Left>', '<cmd>vertical resize -5<CR>')
keymap('n', '<S-Right>', '<cmd>vertical resize +5<CR>')

-- Switch open buffers (not bufferline) with <ctrl> arrows
keymap('n', '<S-h>', '<cmd>bprevious<CR>')
keymap('n', '<S-l>', '<cmd>bnext<CR>')
keymap('n', '<C-w>', '<cmd>Bdelete!<CR>', { silent = true })

-- Move lines
keymap('n', '<A-j>', ':m .+1<CR>==')
keymap('v', '<A-j>', ":m '>+1<CR>gv=gv")
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
keymap('n', '<A-k>', ':m .-2<CR>==')
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv")
keymap('i', '<A-k>', '<Esc> :m .-2<CR>==gi')

-- Cursor in the middle with moving with <C-d> and <C-u>
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-d>', '<C-d>zz')

-- Clear search with <Esc>
keymap('n', '<Esc>', '<cmd>noh<CR><Esc>')
keymap('i', '<Esc>', '<cmd>noh<CR><Esc>')

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap('n', 'n', "'Nn'[v:searchforward]", { expr = true })
keymap('x', 'n', "'Nn'[v:searchforward]", { expr = true })
keymap('o', 'n', "'Nn'[v:searchforward]", { expr = true })
keymap('n', 'N', "'nN'[v:searchforward]", { expr = true })
keymap('x', 'N', "'nN'[v:searchforward]", { expr = true })
keymap('o', 'N', "'nN'[v:searchforward]", { expr = true })

-- Save with <C-s>
keymap({ 'n', 'i', 'x' }, '<C-s>', '<Esc><cmd>up!<CR>', { silent = true })

-- Better indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')
