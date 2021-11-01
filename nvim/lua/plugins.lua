vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()

   -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   -- Scala
   use({'scalameta/nvim-metals'})

   -- Coq
   use({"whonore/Coqtail"})

   -- Editor support
   use({'preservim/nerdtree'})
   use({'morhetz/gruvbox'})
   -- use({'vim-airline/vim-airline'})
   use {
     'hoob3rt/lualine.nvim',
     requires = {'kyazdani42/nvim-web-devicons', opt = true}
   }
   use('ctrlpvim/ctrlp.vim')

   -- Auto completion
   -- use('hrsh7th/nvim-compe')
   use('hrsh7th/cmp-nvim-lsp')
   use('hrsh7th/cmp-buffer')
   use('hrsh7th/cmp-path')
   use { 
     'hrsh7th/nvim-cmp',
     config = function ()
       require'cmp'.setup {
       snippet = {
         expand = function(args)
           require'luasnip'.lsp_expand(args.body)
         end
       },
     
       sources = {
         { name = 'luasnip' },
         { name = 'nvim_lsp' },
         { name = "buffer" },
         { name = "path" }
         -- more sources
       },
       mapping = {
          ['<C-Space>'] = require('cmp').mapping(require('cmp').mapping.complete(), { 'i', 'c' }),
          ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
       }
     }
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

   use {
     'nvim-telescope/telescope.nvim',
     requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
   }
end)
