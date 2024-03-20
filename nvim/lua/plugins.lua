
------------------------------------------------------------
-- Bootstrap lazy.nvim
------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

------------------------------------------------------------

function use(opts) 
   return opts
end

------------------------------------------------------------
-- Define which plugins to Load
------------------------------------------------------------

if vim.loop.os_uname().sysname == 'Darwin' then 
   mac_plugins = {dir = '/opt/homebrew/opt/fzf'}
else 
   mac_plugins = {}
end

plugins = {
   mac_plugins,
   use 'NLKNguyen/papercolor-theme',
   -- Scala
   use({'scalameta/nvim-metals'}),
   -- Coq
   use({"whonore/Coqtail"}),
   -- Agda
   use('ashinkarov/nvim-agda'),
   -- Editor support
   use({'preservim/nerdtree'}),
   use({'morhetz/gruvbox'}),
   use {
      'kyazdani42/nvim-tree.lua',
      dependencies = {
         'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
   },
   use {
     'hoob3rt/lualine.nvim',
     dependencies = {'kyazdani42/nvim-web-devicons', lazy = true}
   },
   use('tpope/vim-surround'),
   use('ctrlpvim/ctrlp.vim'), -- todo: remove and replace by telecope's fuzzy finder
   -- Terminal
   use {
    's1n7ax/nvim-terminal',
    config = function()
        vim.o.hidden = true
        require('nvim-terminal').setup()
    end,
   },
   -- Telescope
   use {
     'nvim-telescope/telescope.nvim',
     dependencies = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
   },
   use {'nvim-telescope/telescope-ui-select.nvim' },
   -- Lsp
   use('neovim/nvim-lspconfig'),
   use('williamboman/mason.nvim'),
   use({
      'williamboman/mason-lspconfig.nvim',
      dependencies = "williamboman/mason.nvim"
   }),

   use('nvim-lua/lsp-status.nvim'),
   -- Git 
   use('tpope/vim-fugitive'),
   use { 'TimUntersberger/neogit', dependencies = 'nvim-lua/plenary.nvim' },
   -- Auto completion
   use('hrsh7th/cmp-nvim-lsp'),
   use('hrsh7th/cmp-buffer'),
   use('hrsh7th/cmp-path'),
   use { 
     'hrsh7th/nvim-cmp',
     dependencies = { 
        "kdheepak/cmp-latex-symbols"
     },
     config = function ()
       local cmp = require 'cmp'
       cmp.setup {
          snippet = {
            expand = function(args)
              require'luasnip'.lsp_expand(args.body)
            end
          },
        
          sources = {
            { name = 'luasnip' },
            { name = 'nvim_lsp' },
            { name = "buffer" },
            { name = "path" },
            -- more sources
          },
          mapping = cmp.mapping.preset.insert({
             ['<C-Space>'] = require('cmp').mapping(require('cmp').mapping.complete(), { 'i', 'c' }),
             ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
          })
       }
       cmp.setup.filetype('coq', {
          sources = cmp.config.sources({
             {name = "latex_symbols"}
          })
       })
       cmp.setup.filetype('scheme', {
          sources = cmp.config.sources({
             {name = "latex_symbols"}
          })
       })
       cmp.setup.filetype('racket', {
          sources = cmp.config.sources({
             {name = "latex_symbols"}
          })
       })

       cmp.setup.filetype('haskell', {
          sources = cmp.config.sources({
             {name = "latex_symbols"}
          })
       })
       cmp.setup.filetype('scala', {
          sources = cmp.config.sources({
             {name = "latex_symbols"},
             {name = "nvim_lsp"},
             {name = "path"},
             {name = "buffer"}
          })
       })
     end
   },
   use {
       'f3fora/nvim-texlabconfig',
       config = function()
           require('texlabconfig').setup(config)
       end,
       ft = { 'tex', 'bib' }, 
       build = 'go build'
  }
}

-- Load the plugin system
require("lazy").setup(plugins)
