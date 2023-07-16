-- init.lua
require('keymaps')
require('plugins')
require('folds')
require('utils')

---- HOUSEKEEPING ----
vim.g.viminfo = '~/.config/nvim/'
vim.opt.swapfile = false
vim.opt.undofile = true -- keep track of undos between sessions
vim.opt.secure = true
vim.opt.exrc = true
vim.opt.autowrite = true
vim.opt.wildmenu = true
vim.opt.clipboard = 'unnamedplus'

---- INDENTATION ----
vim.opt.autoindent = true
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd('filetype indent plugin on') -- enable ft indent scripts

---- UI & COLORS ----
vim.opt.syntax = 'yes'
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
--vim.opt.background = "dark"

---- SPELL CHECKING ----
--let s:SPELLLANG = "en_au"| " set language here
--autocmd FileType text call g:nickutil#ConfigureTextualFile(s:SPELLLANG)
--autocmd FileType markdown call g:nickutil#ConfigureTextualFile(s:SPELLLANG)

---- TWEAKS ----
-- always start in insert mode while in a terminal buffer
vim.api.nvim_create_autocmd({'BufWinEnter', 'WinEnter'}, {
    pattern = {'term://*'},
    callback = function(ev)
        vim.cmd[[startinsert]]
    end
})

-- always start in normal mode after leaving a terminal buffer
vim.api.nvim_create_autocmd({'BufLeave'}, {
    pattern = {'term://*'},
    callback = function(ev)
        vim.cmd[[stopinsert]]
    end
})
-- disable automatic comment line continuation
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {'*'},
    callback = function(ev)
        vim.cmd[[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
    end
})

-- automatically create directories in :w commands
--vim.api.nvim_create_autocmd('BufWritePre', {
--    pattern = {'*'},
--    callback = function(ev)
--        local dir = vim.fn.expand('<afile>:p:h')
--
--        -- This handles URLs using netrw. See ':help netrw-transparent' for details.
--        if dir:find('%l+://') == 1 then
--            return
--        end
--
--        if fn.isdirectory(dir) == 0 then
--            vim.fn.mkdir(dir, 'p')
--        end
--    end
--})

-- use vim a man page viewer
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {'man'},
    callback = function(ev)
        vim.cmd[[Man!]] 
    end
})
