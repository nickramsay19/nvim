-- lua/plugins.lua

vim.cmd[[packadd packer.nvim]] -- required if packer configured as `opt`

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    ---- nvim-lspconfig ----
    --use 'neovim/nvim-lspconfig'
    --local lspconfig = require('lspconfig')
    --lspconfig.hls.setup({
    --    cmd = {'haskell-language-server-wrapper'}
    --})

    --use 'MrcJkb/haskell-tools.nvim'

    ---- nvim-treesitter ----
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup{
                indent = {
                    enable = true
                }
            }
        end
    }

    use 'tree-sitter/tree-sitter-haskell' -- didn't do anything, but TSInstall haskell did?

    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.o.foldenable = false -- disable on startup

    ---- hop ----
    use {
        'phaazon/hop.nvim',
        branch = 'v2',
        config = function()
            local hop = require('hop')
        
            hop.setup{ 
                keys = 'etovxqpdygfblzhckisuran'
            }

            local directions = require('hop.hint').HintDirection

            vim.keymap.set('', 'f', function()
                hop.hint_char1({ current_line_only = true })
            end, {remap=true})

            vim.keymap.set('', '<S-F>', hop.hint_char1, { remap = true })
            vim.keymap.set('', '<C-f>', function() hop.hint_words({ current_line_only = true }) end, { remap = true })
            vim.keymap.set('', '<C-S-F>', hop.hint_words, { remap = true })
        end
    }

    ---- surround ----
    use({
        'kylechui/nvim-surround',
        tag = '*', -- use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                keymaps = {
                    --insert = '<NOP>', --'<C-g>s',
                    --insert_line = '<NOP>', --'<C-g>S',
                    normal = 'ys',
                    --normal_cur = 'yS', --'yss',
                    normal_line = 'yS',
                    --normal_cur_line = '<NOP>', --'ySS',
                    visual = 's', --'S',
                    visual_line = 's', --'gS',
                    delete = 'ds',
                    change = 'cs',
                    --change_line = '<NOP>', --'cS',
                }
            })

            vim.keymap.set('n', 'ss', 'ys', { noremap = false })
            vim.keymap.set('n', 'sc', 'cs', { noremap = false })
            vim.keymap.set('n', 'sd', 'ds', { noremap = false })
        end
    })

    ---- nkterm ----
    use '~/Documents/Projects/nkterm.nvim'
    vim.keymap.set({'n', 't'}, '<C-,>', [[<C-\><C-n>:NkTermToggle<CR>]], { noremap = true })

    ---- tokyonight - colorscheme ----
    use 'folke/tokyonight.nvim'
    --vim.cmd[[colorscheme tokyonight-night]]

    use { "catppuccin/nvim", as = "catppuccin" }
    vim.cmd[[colorscheme catppuccin-mocha]]

    ---- nvim-tree ----
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

    ---- nvim-web-devicons - nice icons for nvim-tree ----
    use 'nvim-tree/nvim-web-devicons' 

    ---- indent-blankline - indent guard lines ----
    use 'lukas-reineke/indent-blankline.nvim'

    ---- barbar - buffer tab line ----
    --use 'romgrk/barbar.nvim'

    -- automatically sync
    vim.cmd([[
        augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
        augroup end
    ]])
end)
