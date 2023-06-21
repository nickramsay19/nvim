-- lua/keymaps.lua

vim.g.mapleader = " "

-- file navigation
--vim.keymap.set('n', '<leader>ex', ':Ex')

-- quick escape from insert mode
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true }) -- quick escape from insert mode

-- use window lines not file lines
vim.keymap.set('n', 'k', 'gk', { noremap = true }) -- up window line
vim.keymap.set('n', 'j', 'gj', { noremap = true })

-- allow continuous new lines
vim.keymap.set('n', 'o', 'o<ESC>', { noremap = true })
vim.keymap.set('n', 'O', 'O<ESC>', { noremap = true })

-- prevent d/D commands from copying into buffer
vim.keymap.set('n', 'dd', '"_dd', { noremap = true }) -- dont copy into buffer on dd
vim.keymap.set('n', 'cc', 'dd', { noremap = true }) -- replace old dd with cc
vim.keymap.set('n', 'D', '"_D', { noremap = true }) -- dont copy into buffer on D

-- text block jump navigation with uppercase variants of h,j,k,l
vim.keymap.set({'n', 'v'}, 'H', 'g^', { noremap = true }) -- jump to window line left
vim.keymap.set({'n', 'v'}, 'L', 'g$', { noremap = true })
vim.keymap.set({'n', 'v'}, 'K', '{', { noremap = true }) -- jump up a paragraph
vim.keymap.set({'n', 'v'}, 'J', '}', { noremap = true })

-- swap/shift single lines
vim.keymap.set('n', '<A-k>', 'ddkP', { noremap = true }) -- swap line up
vim.keymap.set('n', '<A-j>', 'ddjP', { noremap = true })

-- move between windows
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- escape a terminal
vim.keymap.set({'n', 't'}, '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true }) -- force exit from terminal
vim.keymap.set({'n', 't'}, '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true })
vim.keymap.set({'n', 't'}, '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true })
vim.keymap.set({'n', 't'}, '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true })

-- move between buffers
vim.keymap.set('n', '<A-b>', '<ESC>:bn<CR>', { noremap = true })
vim.keymap.set('n', '<A-S-B>', '<ESC>:bp<CR>', { noremap = true })

-- allow mistaken capitalisation of :w, :wq, :q
vim.api.nvim_create_user_command('W', vim.cmd.write, {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Q', vim.cmd.quit, {})

