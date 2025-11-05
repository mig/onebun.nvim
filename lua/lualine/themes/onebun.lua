local palette = require("onebun").palette()

local theme = {
	normal = {
		a = { fg = palette.bg, bg = palette.blue, gui = "bold" },
		b = { fg = palette.fg, bg = palette.bg_dark },
		c = { fg = palette.fg, bg = palette.bg_statusline },
	},
	insert = {
		a = { fg = palette.bg, bg = palette.green, gui = "bold" },
		b = { fg = palette.fg, bg = palette.bg_dark },
		c = { fg = palette.fg, bg = palette.bg_statusline },
	},
	visual = {
		a = { fg = palette.bg, bg = palette.magenta, gui = "bold" },
		b = { fg = palette.fg, bg = palette.bg_dark },
		c = { fg = palette.fg, bg = palette.bg_statusline },
	},
	replace = {
		a = { fg = palette.bg, bg = palette.red, gui = "bold" },
		b = { fg = palette.fg, bg = palette.bg_dark },
		c = { fg = palette.fg, bg = palette.bg_statusline },
	},
	command = {
		a = { fg = palette.bg, bg = palette.yellow, gui = "bold" },
		b = { fg = palette.fg, bg = palette.bg_dark },
		c = { fg = palette.fg, bg = palette.bg_statusline },
	},
	inactive = {
		a = { fg = palette.comment, bg = palette.bg_statusline, gui = "bold" },
		b = { fg = palette.comment, bg = palette.bg_statusline },
		c = { fg = palette.comment, bg = palette.bg_statusline },
	},
}

return theme
