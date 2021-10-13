require'compe'.setup({
   enabled = true,
   min_length = 1,
   source = {
      path = true,
      buffer = true,
      nvim_lsp = {
         priority = 1000,
         filetypes = { "scala", "sbt", "java" },
      },
   }
})


vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")

Utils.nremap_key("<space>a", ":TroubleToggle<CR>")

require'lspconfig'.rust_analyzer.setup{}

Utils.map("n", "<space>o", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
Utils.map("n", "<space>s", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>")
Utils.map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
Utils.map("n", "<leader>ef", "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>")
Utils.map("i", "<CR>", 'compe#confirm("\\<CR>")', { expr = true })
Utils.map("n", "<leader>en", "<cmd>lua vim.lsp.diagnostic.goto_next { wrap = true }<CR>")
Utils.map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
