
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


require("plugins")
require("editor")
require("scala")
require("lsp")
require("statusline")
