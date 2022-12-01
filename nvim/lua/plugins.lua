vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
   -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   use 'NLKNguyen/papercolor-theme'

   -- Scala
   use({'scalameta/nvim-metals'})

   -- Coq
   use({"whonore/Coqtail"})

   -- Editor support
   use({'preservim/nerdtree'})
   use({'morhetz/gruvbox'})
   use {
      'kyazdani42/nvim-tree.lua',
      requires = {
         'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
   }
   -- use({'vim-airline/vim-airline'})
   use {
     'hoob3rt/lualine.nvim',
     requires = {'kyazdani42/nvim-web-devicons', opt = true}
   }
   use('ctrlpvim/ctrlp.vim')


   -- Auto completion
   use('hrsh7th/cmp-nvim-lsp')
   use('hrsh7th/cmp-buffer')
   use('hrsh7th/cmp-path')
   use { 
     'hrsh7th/nvim-cmp',
     requires = { 
        {"kdheepak/cmp-latex-symbols"}
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
       cmp.setup.filetype('scala', {
          sources = cmp.config.sources({
             {name = "latex_symbols"},
             {name = "nvim_lsp"},
             {name = "path"},
             {name = "buffer"}
          })
       })
     end
   }

   use('L3MON4D3/LuaSnip')
   use { 'saadparwaiz1/cmp_luasnip' }

   -- use { 'ms-jpq/coq_nvim', branch = "coq" }
   -- use { 'ms-jpq/coq.artifacts', branch = "artifacts" }

   -- LSP
   use {
      "folke/trouble.nvim",
      config = function()
         require("trouble").setup {
            icons = false,
            signs = {
               -- icons / text used for a diagnostic
               error = "error",
               warning = "warn",
               hint = "hint",
               information = "info"
            },
            use_lsp_diagnostic_signs = false
         }
      end
   }

   use('neovim/nvim-lspconfig')
   use('nvim-lua/lsp-status.nvim')
   use('mattn/emmet-vim')
   use('mhinz/vim-signify')

   use {
     'nvim-telescope/telescope.nvim',
     requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
   }
   use {'nvim-telescope/telescope-ui-select.nvim' }

   use('tpope/vim-fugitive')
   use('fatih/vim-go')
   use('nono/vim-handlebars')
   use('tpope/vim-surround')
end)
