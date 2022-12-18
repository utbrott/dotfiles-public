local ok, telescope = pcall(require, 'telescope')
if not ok then
  print('telescope failed')
  return
end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local keymap = vim.keymap.set

telescope.setup({
  defaults = {
    initial_mode = 'normal',
    color_devicons = true,
    mappings = {
      n = {
        ['q'] = actions.close,
        ['/'] = function() vim.cmd('startinsert') end,
      },
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Keymaps
keymap('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recent files' })
keymap('n', '<leader><Space>', builtin.buffers, { desc = '[ ] Find exisiting buffers' })
keymap(
  'n',
  '<leader>/',
  function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end,
  { desc = '[/] Fuzzy search in current buffer' }
)
keymap('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]iles' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = '[f]ind [h]elp' })
keymap('n', '<leader>fw', builtin.grep_string, { desc = '[f]ind current [w]ord' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = '[f]ind via [g]rep' })
keymap('n', '<leader>fd', builtin.diagnostics, { desc = '[f]ind: [d]iagnostics' })
