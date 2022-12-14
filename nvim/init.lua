
Utils = {}

-- Remap a key in normal mode
function Utils.nremap_key(key, command) 
	vim.api.nvim_set_keymap("n", key, command, {})
end

-- Remap a key in terminal mode 
function Utils.tremap_key(key, command)
       vim.api.nvim_set_keymap("t", key, command, {})
end

function Utils.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Preset some Coqtail defaults
vim.cmd [[
augroup CoqtailHighlights
  autocmd!
  autocmd ColorScheme *
    \  hi def CoqtailChecked ctermbg=18 guibg=DarkBlue
    \| hi def CoqtailSent    ctermbg=17 guibg=Blue
augroup END

command Fs :syntax sync fromstart
]]

require("plugins")
require("editor")
require("scala")
require("lsp")
require("statusline")
require("actor_lsp")
