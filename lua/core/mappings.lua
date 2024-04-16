function is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end


vim.cmd('source ~/.config/nvim/lua/.vimrc')

-- NeoTree
if is_available "neo-tree.nvim" then
    vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>')
    vim.keymap.set('n', '<leader>o', '<cmd>Neotree float git_status<CR>')
end

vim.keymap.set('n', '<leader><leader>', '<cmd>HopWord<CR>')

-- Navigation
vim.keymap.set('n', '<c-k>', '<cmd>wincmd k<CR>')
vim.keymap.set('n', '<c-j>', '<cmd>wincmd j<CR>')
vim.keymap.set('n', '<c-h>', '<cmd>wincmd h<CR>')
vim.keymap.set('n', '<c-l>', '<cmd>wincmd l<CR>')
vim.keymap.set('n', '<leader>/', '<cmd>CommentToggle<CR>')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Splits
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>\\', '<cmd>split<CR>')

-- Other
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>qq', '<cmd>quitall!<CR>')

-- Tabs
vim.keymap.set('n', '<leader>x', '<cmd>BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>BufferLineCloseOthers<CR>')
vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', '<cmd>BufferLineCyclePrev<CR>')

-- Terminal
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>')


vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>')
