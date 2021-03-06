
-- Configuration about the editor itself. Includes support for things like NerdTree, 
-- ctrlp and color schemes
--

Utils.nremap_key("<C-d>", ":NERDTreeToggle<CR>")
Utils.nremap_key("<C-p>", ":CtrlP")
Utils.nremap_key("<C-e>", ":wa | :mksession! .vimsession.vim | :qa<CR>")
Utils.tremap_key("<Esc>", "<C-\\><C-n>")

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

   augroup CoqtailHighlights
     autocmd!
     autocmd ColorScheme *
       \  hi def CoqtailChecked ctermbg=lightgreen guibg=Green
       \| hi def CoqtailSent    ctermbg=lightblue guibg=LimeGreen
   augroup END

   syntax on

]]
