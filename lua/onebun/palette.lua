local util = require("onebun.util")

local M = {
	state = {
		palette = nil,
	},
}

local defaults = {
	none = "NONE",
	bg = "#282c34",
	fg = "#eeffe0",
	black = "#282c34",
	red = "#fa6161",
	green = "#beff33",
	yellow = "#deff99",
	blue = "#fa9861",
	magenta = "#ff6694",
	cyan = "#69ffea",
	white = "#eeffe0",
}

local function with_derived(colors, opts)
	opts = opts or {}

	colors.orange = opts.orange or util.blend(colors.yellow, colors.red, 0.55)
	colors.purple = opts.purple or util.blend(colors.magenta, colors.blue, 0.6)
	colors.teal = opts.teal or util.blend(colors.cyan, colors.green, 0.6)

	colors.bright_black = opts.bright_black or util.lighten(colors.black, 0.15)
	colors.bright_red = opts.bright_red or util.lighten(colors.red, 0.12)
	colors.bright_green = opts.bright_green or util.lighten(colors.green, 0.08)
	colors.bright_yellow = opts.bright_yellow or util.lighten(colors.yellow, 0.08)
	colors.bright_blue = opts.bright_blue or util.lighten(colors.blue, 0.12)
	colors.bright_magenta = opts.bright_magenta or util.lighten(colors.magenta, 0.12)
	colors.bright_cyan = opts.bright_cyan or util.lighten(colors.cyan, 0.1)
	colors.bright_white = opts.bright_white or util.lighten(colors.white, 0.05)

	colors.bg_dark = opts.bg_dark or util.darken(colors.bg, 0.2)
	colors.bg_darker = opts.bg_darker or util.darken(colors.bg, 0.3)
	colors.bg_highlight = opts.bg_highlight or util.lighten(colors.bg, 0.1)
	colors.bg_float = opts.bg_float or util.lighten(colors.bg, 0.05)
	colors.bg_visual = opts.bg_visual or util.blend(colors.blue, colors.bg, 0.2)
	colors.bg_statusline = opts.bg_statusline or util.blend(colors.bg, colors.bg_dark, 0.6)
	colors.bg_sidebar = opts.bg_sidebar or colors.bg_dark

	colors.border = opts.border or util.lighten(colors.bg, 0.12)
	colors.border_shadow = opts.border_shadow or util.darken(colors.border, 0.4)
	colors.selection = opts.selection or util.blend(colors.magenta, colors.bg, 0.18)
	colors.selection_lighter = opts.selection_lighter or util.lighten(colors.selection, 0.2)

	colors.comment = opts.comment or util.blend(colors.fg, colors.bg, 0.35)
	colors.comment_strong = opts.comment_strong or util.blend(colors.fg, colors.bg, 0.5)

	colors.git = vim.tbl_extend("force", {
		add = colors.green,
		change = colors.blue,
		delete = colors.red,
		ignore = colors.comment,
		text = colors.yellow,
	}, opts.git or {})

	colors.diag = vim.tbl_extend("force", {
		error = colors.red,
		warn = colors.yellow,
		info = colors.cyan,
		hint = colors.teal,
		ok = colors.green,
	}, opts.diag or {})

	colors.todo = vim.tbl_extend("force", {
		fix = { fg = colors.bg, bg = colors.red },
		todo = { fg = colors.bg, bg = colors.yellow },
		hack = { fg = colors.bg, bg = colors.magenta },
		note = { fg = colors.bg, bg = colors.blue },
	}, opts.todo or {})

	return colors
end

---@param opts? table
function M.setup(opts)
	opts = opts or {}
	local overrides = opts.palette or opts.colors or {}
	local colors = vim.tbl_deep_extend("force", {}, defaults, overrides)

	with_derived(colors, opts.derived or {})

	M.state.palette = colors

	return colors
end

function M.get()
	if not M.state.palette then
		return M.setup({})
	end
	return M.state.palette
end

return M
