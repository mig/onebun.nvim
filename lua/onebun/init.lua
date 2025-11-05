local palette = require("onebun.palette")
local util = require("onebun.util")
local make_highlights = require("onebun.highlights")

local M = {}

local defaults = {
	transparent = false,
	dim_inactive = false,
	styles = {},
	palette = {},
	derived = {},
}

M.options = vim.deepcopy(defaults)

---@param opts table
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", {}, M.options or defaults, opts or {})
end

---@param opts? table
function M.load(opts)
	if opts then
		M.setup(opts)
	end

	local palette_opts = {
		palette = M.options.palette,
		derived = M.options.derived,
	}

	local colors = palette.setup(palette_opts)

	util.set_terminal_colors(colors)

	local highlight_opts = {
		transparent = M.options.transparent,
		dim_inactive = M.options.dim_inactive,
		styles = M.options.styles,
	}

	local highlights = make_highlights.setup(colors, highlight_opts)
	util.apply_highlights(highlights)
end

function M.palette()
	return palette.get()
end

return M
