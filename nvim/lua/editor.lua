
-- Configuration about the editor itself. Includes support for things like NerdTree, 
-- ctrlp and color schemes
--

Utils.nremap_key("<C-d>", ":NERDTreeToggle<CR>")
Utils.nremap_key("<C-p>", ":CtrlP")

-- Set some editor specific Vim settings
vim.cmd [[
   set termguicolors
   syntax on
   colorscheme gruvbox
   set smartindent " Do smart indenting when starting a new line
   set autoindent  " Copy indent from current line, over to the new line
   set expandtab
   set shiftwidth=3
   set softtabstop=3
]]
