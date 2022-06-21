
metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"


-- Enable Scala Metals on *.scala files
vim.cmd [[
   augroup lsp
   au!
   au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)
   augroup end
   autocmd BufWritePre *.scala lua vim.lsp.buf.formatting_sync(nil, 1000)
]]
--
Utils.map("n", "<leader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>")
