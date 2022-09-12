
function Get_MetalsStatus() 
   return string.gsub((vim.g["metals_status"] or ""), "%%", "%%%%")
end

require('lualine').setup {
   options = {
       icons_enabled = false,
   },
   sections = {
      lualine_b = {{Get_MetalsStatus, icon = nil}, {"branch", icon = nil}},
      lualine_z = {"location", require'lsp-status'.status}
   }
}

