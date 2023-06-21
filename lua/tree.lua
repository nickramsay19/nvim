local tree = {}

local tree_buf = nil
local edit_win = nil

function tree.get_tree_buf()
    return tree_buf
end

function tree.get_edit_win()
    return edit_win
end

function tree.configure()

    local tree_win = vim.api.nvim_get_current_win()

    vim.cmd('wincmd H') -- move to the left 

    -- win number changes after being moved
    vim.g.netrw_chgwin = vim.api.nvim_win_get_number(edit_win)

    vim.api.nvim_win_set_width(tree_win, 30)
    
    -- remove netrw mappings that conflict with mine
    vim.api.nvim_buf_del_keymap(tree_buf, 'n', '<C-L>')
end

function tree.create()
    -- assme current window is the edit window
    edit_win = vim.api.nvim_get_current_win()

    vim.cmd.split()
    vim.cmd.edit('.')
    tree_buf = vim.api.nvim_get_current_buf()

    tree.configure()
end

function tree.toggle()
    tree.create() 
end

function tree.setup()
    -- global tree configuration
    vim.g.netrw_banner = 0
    vim.g.netrw_hide = 0 -- show hidden files
    vim.g.netrw_liststyle = 3 -- display like a tree

    --vim.g.netrw_browse_split = 4
    --vim.g.netrw_preview = 1 -- preview window (if created) shown in a vertically split window
    --vim.g.netrw_winsize = 30 -- make tree 30% width when preview window is created

    vim.api.nvim_create_autocmd({'BufEnter', 'BufLeave'}, {
        pattern = {'**/*/NetrwTreeListing'},
        callback = function(ev)
            vim.api.nvim_buf_del_keymap(0, 'n', '<C-L>')
            vim.g.netrw_chgwin = vim.api.nvim_win_get_number(edit_win)
            print('ya')
        end
    })
    vim.api.nvim_create_user_command('NkTreeToggle', tree.toggle, {})
end

tree.setup()

return tree
