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

   -- LSP
   use('hrsh7th/nvim-compe')
   -- use { 'ms-jpq/coq_nvim', branch = "coq" }
   -- use { 'ms-jpq/coq.artifacts', branch = "artifacts" }

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
