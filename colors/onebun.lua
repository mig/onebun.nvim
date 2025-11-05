vim.api.nvim_command("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.api.nvim_command("syntax reset")
end

vim.g.colors_name = "onebun"
vim.o.background = "dark"

require("onebun").load()
