local M = {}

local function clamp01(value)
	value = tonumber(value) or 0
	if value < 0 then
		return 0
	elseif value > 1 then
		return 1
	end
	return value
end

local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	if #hex == 3 then
		return {
			tonumber(hex:sub(1, 1) .. hex:sub(1, 1), 16),
			tonumber(hex:sub(2, 2) .. hex:sub(2, 2), 16),
			tonumber(hex:sub(3, 3) .. hex:sub(3, 3), 16),
		}
	end
	return {
		tonumber(hex:sub(1, 2), 16),
		tonumber(hex:sub(3, 4), 16),
		tonumber(hex:sub(5, 6), 16),
	}
end

local function rgb_to_hex(rgb)
	local r = math.floor(clamp01(rgb[1] / 255) * 255 + 0.5)
	local g = math.floor(clamp01(rgb[2] / 255) * 255 + 0.5)
	local b = math.floor(clamp01(rgb[3] / 255) * 255 + 0.5)
	return string.format("#%02x%02x%02x", r, g, b)
end

---Blend two hex colors together.
---@param top string
---@param bottom string
---@param alpha number Ratio in range [0,1]. 1 uses `top`, 0 uses `bottom`.
---@return string
function M.blend(top, bottom, alpha)
	alpha = clamp01(alpha or 0.5)
	local top_rgb = hex_to_rgb(top)
	local bottom_rgb = hex_to_rgb(bottom)

	local blended = {
		math.floor(alpha * top_rgb[1] + (1 - alpha) * bottom_rgb[1] + 0.5),
		math.floor(alpha * top_rgb[2] + (1 - alpha) * bottom_rgb[2] + 0.5),
		math.floor(alpha * top_rgb[3] + (1 - alpha) * bottom_rgb[3] + 0.5),
	}

	return rgb_to_hex(blended)
end

---Lighten a color by blending it with white.
---@param color string
---@param amount number Ratio in range [0,1]
---@return string
function M.lighten(color, amount)
	return M.blend("#ffffff", color, clamp01(amount or 0.2))
end

---Darken a color by blending it with black.
---@param color string
---@param amount number Ratio in range [0,1]
---@return string
function M.darken(color, amount)
	return M.blend("#000000", color, clamp01(amount or 0.2))
end

---Apply a map of highlight definitions.
---@param groups table<string, table>
function M.apply_highlights(groups)
	for name, opts in pairs(groups) do
		vim.api.nvim_set_hl(0, name, opts)
	end
end

---Configure :terminal palette to match the colorscheme.
---@param colors table
function M.set_terminal_colors(colors)
	vim.g.terminal_color_0 = colors.black
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_2 = colors.green
	vim.g.terminal_color_3 = colors.yellow
	vim.g.terminal_color_4 = colors.blue
	vim.g.terminal_color_5 = colors.magenta
	vim.g.terminal_color_6 = colors.cyan
	vim.g.terminal_color_7 = colors.white
	vim.g.terminal_color_8 = colors.bright_black
	vim.g.terminal_color_9 = colors.bright_red
	vim.g.terminal_color_10 = colors.bright_green
	vim.g.terminal_color_11 = colors.bright_yellow
	vim.g.terminal_color_12 = colors.bright_blue
	vim.g.terminal_color_13 = colors.bright_magenta
	vim.g.terminal_color_14 = colors.bright_cyan
	vim.g.terminal_color_15 = colors.bright_white
end

return M
