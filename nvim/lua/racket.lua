local lspconfig = require("lspconfig")
local configs = require 'lspconfig.configs'

if not configs.racket_lsp then 
   configs.racket_lsp = {
      default_config = {
         cmd = {"/Applications/Racket_Current/bin/racket",  "-l", "racket-langserver"},
         filetypes = {"scheme"},
         -- root_dir = lspconfig.util.root_pattern("actors-project"),
         settings = {},
         single_file_support = true
      }
   }
end

lspconfig.racket_lsp.setup{}

