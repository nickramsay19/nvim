-- init.lua
require('keymaps')
require('plugins')
--require('tree')
require('utils')

-- HOUSEKEEPING
vim.g.viminfo = '~/.config/nvim/'
vim.opt.swapfile = false
vim.opt.undofile = true -- keep track of undos between sessions
vim.opt.secure = true
vim.opt.exrc = true
vim.opt.autowrite = true
vim.opt.wildmenu = true
vim.opt.clipboard = 'unnamedplus'

-- EDITING
-- disable automatic comment line continuation
--vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o") 
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {'*'},
    callback = function(ev)
        vim.cmd[[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
    end
})

-- INDENTATION
vim.opt.autoindent = true
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd('filetype indent plugin on') -- enable ft indent scripts

-- UI & COLORS
vim.opt.syntax = 'yes'
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
--vim.opt.background = "dark"

-- SPELL CHECKING
--let s:SPELLLANG = "en_au"| " set language here
--autocmd FileType text call g:nickutil#ConfigureTextualFile(s:SPELLLANG)
--autocmd FileType markdown call g:nickutil#ConfigureTextualFile(s:SPELLLANG)

-- TERMINAL
--vim.cmd('autocmd BufWinEnter,WinEnter term://* startinsert')
vim.api.nvim_create_autocmd({'BufWinEnter', 'WinEnter'}, {
    pattern = {'term://*'},
    callback = function(ev)
        vim.cmd[[startinsert]]
    end
})
--vim.cmd('autocmd BufLeave term://* stopinsert')
vim.api.nvim_create_autocmd({'BufLeave'}, {
    pattern = {'term://*'},
    callback = function(ev)
        vim.cmd[[stopinsert]]
    end
})
