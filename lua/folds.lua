-- lua/folds.lua

--[[
fix for packer and fold w/ nvim-treesitter
-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND
]]

local M = {}

    function M.my_foldtext()
        return vim.fn.getline(vim.v.foldstart)
    end

-- lua vim.api.nvim_set_option_value('foldtext', '', {})
-- lua vim.opt.foldtext = ''
-- lua vim.o.foldtext = ''
-- lua vim.cmd([[set foldtext='']])

function M.empty()
    return 'empty'
end

return M
