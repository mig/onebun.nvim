vim.api.nvim_command("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.api.nvim_command("syntax reset")
end

vim.g.colors_name = "onebun"
vim.o.background = "dark"

for _, mod in ipairs({
	"onebun",
	"onebun.util",
	"onebun.palette",
	"onebun.highlights",
}) do
	package.loaded[mod] = nil
end

require("onebun").load()
