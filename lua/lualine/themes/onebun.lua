local colors = require("onebun.colors")

local onebun = {}

onebun.normal = {
	a = { fg = colors.nord1_gui, bg = colors.nord9_gui },
	b = { fg = colors.nord5_gui, bg = colors.nord2_gui },
	c = { fg = colors.nord4_gui, bg = colors.nord1_gui },
}

onebun.insert = {
	a = { fg = colors.nord1_gui, bg = colors.nord4_gui },
	b = { fg = colors.nord6_gui, bg = colors.nord2_gui },
	y = {  fg = colors.nord5_gui, bg = colors.nord2_gui },
}

onebun.visual = {
	a = { fg = colors.nord0_gui, bg = colors.nord7_gui },
	b = { fg = colors.nord4_gui, bg = colors.nord2_gui },
	y = {  fg = colors.nord5_gui, bg = colors.nord2_gui },
}

onebun.replace = {
	a = { fg = colors.nord0_gui, bg = colors.nord11_gui },
	b = { fg = colors.nord4_gui, bg = colors.nord2_gui },
	y = {  fg = colors.nord5_gui, bg = colors.nord2_gui },
}

onebun.command = {
	a = { fg = colors.nord0_gui, bg = colors.nord15_gui, gui = "bold" },
	b = { fg = colors.nord4_gui, bg = colors.nord2_gui },
	y = {  fg = colors.nord5_gui, bg = colors.nord2_gui },
}

onebun.inactive = {
	a = { fg = colors.nord4_gui, bg = colors.nord0_gui, gui = "bold" },
	b = { fg = colors.nord4_gui, bg = colors.nord0_gui },
	c = { fg = colors.nord4_gui, bg = colors.nord1_gui },
}

return onebun
