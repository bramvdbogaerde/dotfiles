local lspconfig = require("lspconfig")
local configs = require 'lspconfig.configs'

vim.cmd [[
   autocmd BufNewFile,BufRead *.actor.scm setfiletype actor-scheme
]]

if not configs.actor_lsp then 
   configs.actor_lsp = {
      default_config = {
         cmd = {"/Users/bram/Seafile/code/maf-actor-lsp/run.sh"},
         filetypes = {"actor-scheme"},
         root_dir = lspconfig.util.root_pattern("actors-project"),
         settings = {},
         single_file_support = true
      }
   }
end

lspconfig.actor_lsp.setup{}
