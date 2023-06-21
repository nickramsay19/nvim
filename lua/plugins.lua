-- lua/plugins.lua

vim.cmd[[packadd packer.nvim]] -- required if packer configured as `opt`

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use '~/Documents/Projects/nkterm.nvim'
    vim.keymap.set({'n', 't'}, '<C-,>', [[<C-\><C-n>:NkTermToggle<CR>]], { noremap = true })

    use 'folke/tokyonight.nvim'
    vim.cmd[[colorscheme tokyonight-night]]

    -- file tree side bar
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrw = 1
    use 'nvim-tree/nvim-tree.lua'
    require('nvim-tree').setup({
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
        on_attach = function(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return { 
                    desc = 'nvim-tree: ' .. desc, 
                    buffer = bufnr, 
                    noremap = true, 
                    silent = true, 
                    nowait = true 
                }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
        end
    })

    vim.keymap.set('n', '<A-,>', '<ESC>:NvimTreeToggle<CR>', { noremap = true })

    -- nice icons for nvim-tree
    use 'nvim-tree/nvim-web-devicons' 
    
    -- indent guard lines
    use 'lukas-reineke/indent-blankline.nvim'
    
    -- tab lines
    --use 'romgrk/barbar.nvim'

    -- tree-sitter syntax highlighting
    -- use 'nvim-treesitter/nvim-treesitter'
    -- Check supported languages: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
    -- run :TSInstall <language_to_install>

    -- automatically sync
    vim.cmd([[
      augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]])
end)
