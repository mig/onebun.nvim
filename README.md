
# onebun.nvim

## Neovim theme based on doom-onebun-theme

A vibrant dark theme for Neovim featuring bright cyan, lime green, and magenta accents on a dark background. Ported from the Emacs doom-onebun-theme.

## ⚡️ Requirements

+ Neovim >= 0.5.0

## 🌙 Installation

Install via your favourite package manager:

```vim
" If you are using Vim-Plug
Plug 'mig/onebun.nvim'
```

```lua
-- If you are using Packer
use 'mig/onebun.nvim'
```

## 🌓 Usage

Enable the colorscheme:

```vim
"Vim-Script:
colorscheme onebun
```

```lua
--Lua:
vim.cmd[[colorscheme onebun]]
```

To enable the `onebun` theme for `Lualine`, simply specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'onebun'
    -- ... your lualine config
  }
}
```

## ⚙️ Configuration

| Option                              | Default     | Description                                                                                                                                                     |
| ----------------------------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| onebun_contrast                   | `false`      | Make sidebars and popup menus like nvim-tree and telescope have a different background                                                                                       |
| onebun_borders                    | `false`     | Enable the border between verticaly split windows visable
| onebun_disable_background         | `false`     | Disable the setting of background color so that NeoVim can use your terminal background
| onebun_cursorline_transparent     | `false`     | Set the cursorline transparent/visible
| onebun_enable_sidebar_background  | `false`     | Re-enables the background of the sidebar if you disabled the background of everything
| onebun_italic                     | `true`      | enables/disables italics
| onebun_uniform_diff_background    | `false`     | enables/disables colorful backgrounds when used in *diff* mode
| onebun_bold                       | `true`      | enables/disables bold

```lua
-- Example config in lua
vim.g.onebun_contrast = true
vim.g.onebun_borders = false
vim.g.onebun_disable_background = false
vim.g.onebun_italic = false
vim.g.onebun_uniform_diff_background = true
vim.g.onebun_bold = false

-- Load the colorscheme
require('onebun').set()
```

```vim
" Example config in Vim-Script
let g:onebun_contrast = v:true
let g:onebun_borders = v:false
let g:onebun_disable_background = v:false
let g:onebun_italic = v:false
let g:onebun_uniform_diff_background = v:true
let g:onebun_bold = v:false

" Load the colorscheme
colorscheme onebun
```

### headlines support

To support [headlines]("https://github.com/lukas-reineke/headlines.nvim"), you should add these code to your settings:

```lua
require("headlines").setup({
    markdown = {
        headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
    },
})

```

It should look like this

![26B3E551-FD57-458C-BE85-C8945BCE37DF](https://user-images.githubusercontent.com/61075605/197376829-43c30172-2528-47a0-b23f-ab63f73c0851.png)

### bufferline support

To support [BufferLine](https://github.com/akinsho/nvim-bufferline.lua), you can add these code to your settings:

```lua
local highlights = require("onebun").bufferline.highlights({
    italic = true,
    bold = true,
})

require("bufferline").setup({
    options = {
        separator_style = "thin",
    },
    highlights = highlights,
})

```

Or you can use slant separator:

```lua
local highlights = require("onebun").bufferline.highlights({
    italic = true,
    bold = true,
    fill = "#181c24"
})

require("bufferline").setup({
    options = {
        separator_style = "slant",
    },
    highlights = highlights,
})

```

The default setting of bufferline highlights is

```lua
{
    fill = colors.nord0_gui,
    indicator = colors.nord9_gui,
    bg = colors.nord0_gui,
    buffer_bg = colors.nord0_gui,
    buffer_bg_selected = colors.nord1_gui,
    buffer_bg_visible = "#2A2F3A",
    bold = true,
    italic = true,
}
```

## 🙏 Acknowledgments

This theme was created using [nord.nvim](https://github.com/shaunsingh/nord.nvim) as a template. The color palette is based on the [doom-onebun-theme](https://github.com/doomemacs/themes) for Emacs.
