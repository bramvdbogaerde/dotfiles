vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")

Utils.nremap_key("<space>a", ":TroubleToggle<CR>")

local lspconfig = require("lspconfig")
local lspservers = { "rust_analyzer", "ccls", "pyright" , "hls"}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in pairs(lspservers) do
   lspconfig[lsp].setup{ capabilities = capabilities }
end

require("telescope").setup {
  extensions = {
    ["ui-select"] = {}
   }
}

require("telescope").load_extension("ui-select")


Utils.map("n", "<space>o", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
Utils.map("n", "<space>s", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>")
Utils.map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
Utils.map("n", "<leader>ef", "<cmd>lua vim.lsp.buf.code_action()<CR>")
Utils.map("n", "<leader>en", "<cmd>lua vim.lsp.diagnostic.goto_next { wrap = true }<CR>")
Utils.map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
Utils.map("n", "<leader>i", "<cmd>lua vim.lsp.buf.hover()<CR>")
