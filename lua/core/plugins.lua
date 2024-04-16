local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath }) end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "s1n7ax/nvim-window-picker"
        }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, 
    {'cooperuser/glowbeam.nvim'}, 
    {'nvim-treesitter/nvim-treesitter'}, 
    {'neovim/nvim-lspconfig'},
    
    -- CMP Dependencies
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'lewis6991/gitsigns.nvim'},


    -- Snippets Plugin
    {'L3MON4D3/LuaSnip', config = function() require('utils.snippets') end}, 
    {'saadparwaiz1/cmp_luasnip'}, 
    {"williamboman/mason.nvim", build = ":MasonUpdate"},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    -- {'jose-elias-alvarez/null-ls.nvim'}, 
    {'windwp/nvim-autopairs'},
    {'Djancyp/outline'}, {'terrortylor/nvim-comment'},
    {'windwp/nvim-ts-autotag'},
    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
    {'hrsh7th/cmp-nvim-lsp-signature-help'}, {
        'linrongbin16/lsp-progress.nvim',
        event = {'VimEnter'},
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('lsp-progress').setup() end
    }, {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    }, {"folke/which-key.nvim"},
    { 'phaazon/hop.nvim'},
    { 'hrsh7th/vim-vsnip' },
    {'hrsh7th/vim-vsnip-integ'},
    {'aserowy/tmux.nvim'},

    -- All theme
    {'joshdick/onedark.vim'},
    {'DeviusVim/deviuspro.nvim'},
    { "catppuccin/nvim", name = "catppuccin" },
    { "almo7aya/neogruvbox.nvim" },
    {'sainnhe/everforest'},
    {'yorickpeterse/happy_hacking.vim'},
    {'Mofiqul/vscode.nvim'},
    {'rebelot/kanagawa.nvim'},
});
