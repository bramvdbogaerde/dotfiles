require("mason").setup()
require("mason-lspconfig").setup()

vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
-- vim.opt_global.shortmess:remove("F"):append("c")


local lspconfig = require("lspconfig")
local lspservers = { "ccls", "pyright" , "hls", "tsserver"}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in pairs(lspservers) do
   lspconfig[lsp].setup{ capabilities = capabilities }
end

-- texlab
lspconfig.texlab.setup({
   settings = {
      texlab = {
         forwardSearch = {
            executable = "/Applications/Skim.app/Contents/SharedSupport/displayline", 
            args = {'%l', '%p', '%f'}
         }
      }
   }
})

require("telescope").setup {
  extensions = {
    ["ui-select"] = {}
   }
}

require("telescope").load_extension("ui-select")

local telescope = require('telescope.builtin');

vim.keymap.set("n", "<space>a", telescope.diagnostics)
vim.keymap.set("n", "<space>o", telescope.lsp_document_symbols)
Utils.map("n", "<space>s", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<CR>")
Utils.map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
Utils.map("n", "<leader>ef", "<cmd>lua vim.lsp.buf.code_action()<CR>")
Utils.map("n", "<leader>en", "<cmd>lua vim.diagnostic.goto_next { wrap = true }<CR>")
Utils.map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
Utils.map("n", "<leader>i", "<cmd>lua vim.lsp.buf.hover()<CR>")
