
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

plugins = {
   use 'google/vim-jsonnet',
   -- Color schemes
   use 'NLKNguyen/papercolor-theme',
   use "rebelot/kanagawa.nvim",
   use 'AlexvZyl/nordic.nvim',
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
   { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
   -- Lsp
   use('neovim/nvim-lspconfig'),
   use('williamboman/mason.nvim'),
   use({
      'williamboman/mason-lspconfig.nvim',
      dependencies = "williamboman/mason.nvim"
   }),
   use('nvim-lua/lsp-status.nvim'),
   -- Git 
   use { 'NeogitOrg/neogit', dependencies = 'nvim-lua/plenary.nvim', config = true },
   -- Auto completion
   use('hrsh7th/cmp-nvim-lsp'),
   use('hrsh7th/cmp-buffer'),
   use('hrsh7th/cmp-path'),
   {
   	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp"
   },
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
              -- require'luasnip'.lsp_expand(args.body)
            end
          },
          sources = {
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
             {name = "latex_symbols"},
             {name = "nvim_lsp"}
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
  -- Syntax highlighting
  use 'nvim-treesitter/nvim-treesitter',
}

-- Load the plugin system
require("lazy").setup(plugins)
-- Load the fzf extension for telescope
require('telescope').load_extension('fzf')
