# onebun.nvim

Neovim colorscheme that ports the kitty palette from the [omarchy-onebun-theme](../omarchy-onebun-theme/kitty.conf) configuration. The goal is to provide a cohesive look for LazyVim users while staying close to the original terminal colors.

## Features

- Minimal, opinionated highlight groups tuned for LazyVim (LSP, Telescope, cmp, Flash, Mini, WhichKey, diagnostics, and more).
- Automatic terminal palette configuration that mirrors the kitty theme.
- Transparent background and style customisation switches.
- Companion lualine theme.

## Installation

### Lazy.nvim

```lua
{
  "onebun.nvim",
  dir = "~/src/onebun.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("onebun").setup({
      transparent = false,
      dim_inactive = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
    })
    vim.cmd.colorscheme("onebun")
  end,
}
```

### LazyVim

1. Add the spec above to `lua/plugins/colorscheme.lua` (or an equivalent module).
2. Remove/disable any other colorscheme plugins that take priority.
3. Restart Neovim: LazyVim will automatically load the `onebun` theme.

## Customisation

```lua
require("onebun").setup({
  transparent = true,
  dim_inactive = true,
  palette = {
    -- Example: tweak the foreground
    fg = "#f5ffee",
  },
  derived = {
    -- Example: change diagnostic colours
    diag = {
      warn = "#ffc966",
    },
  },
})
```

Call `require("onebun").load()` after changing options to apply them immediately.

## License

MIT
