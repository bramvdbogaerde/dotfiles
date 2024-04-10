
-- Configuration about the editor itself. Includes support for things like NerdTree, 
-- ctrlp and color schemes
--
--
require("nvim-tree").setup()
local telescope = require('telescope.builtin');

Utils.nremap_key("<C-d>", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-p>", telescope.find_files)
Utils.nremap_key("<C-e>", ":wa | :mksession! .vimsession.vim | :qa<CR>")
for i = 1, 10 do 
   Utils.nremap_key("<leader>" .. (i-1), (i) .. "gt")
end

Utils.tremap_key("<Esc>", "<C-\\><C-n>")

require 'nordic'.setup {
   override = {
      Visual = {
         bg = "#3A515D",
         bold = false
      },
      Comment = {
         fg = "darkgrey",
         bold = false,
         italic = false
      }
   }
}

-- Set some editor specific Vim settings
vim.cmd [[
   set relativenumber
   set termguicolors
   syntax on
   colorscheme nordic
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

-- TreeSitter support

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = "all",
  highlight = {
	  enable = true, -- false will disable the whole extension
	  disable = { }, -- list of language that will be disabled
	  use_languagetree=true,
  },
  indent = {
	  enable = true
  },
}

--
-- Setup git integration
--

local neogit = require('neogit')
neogit.setup {}
