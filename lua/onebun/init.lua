-- Colorscheme name:    onebun.nvim
-- Description:         Port of doom-onebun-theme for neovim
-- Author:              https://github.com/shaunsingh

local util = require("onebun.util")

local bufferline = require("bufferline.theme")

-- Load the theme
local set = function()
	util.load()
end

return { set = set, bufferline = bufferline }
