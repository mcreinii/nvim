# Neovim Configuration

A modern, minimal Neovim configuration focused on LSP, completion, and code navigation.

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - loads lazy.nvim
├── lua/
│   ├── config/                # Core Neovim configuration
│   │   ├── options.lua        # Vim options (UI, indentation, search)
│   │   ├── keymaps.lua        # Global keybindings
│   │   └── lazy.lua           # Plugin manager bootstrap
│   ├── helpers/               # Utility modules
│   │   └── hl.lua            # Highlight color extraction helper
│   ├── plugins/               # Plugin specifications (lazy.nvim)
│   │   ├── blink-cmp.lua     # Completion engine
│   │   ├── colorscheme.lua   # Theme configuration (Jellybeans)
│   │   ├── comfy-rln.lua     # Comfortable relative line numbers
│   │   ├── conform.lua       # Code formatter (Stylua, Prettier)
│   │   ├── fidget.lua        # LSP progress notifications
│   │   ├── flash.lua         # Motion/jump navigation
│   │   ├── gitsigns.lua      # Git integration
│   │   ├── lazydev.lua       # Lua development tools
│   │   ├── lualine.lua       # Statusline & winbar
│   │   ├── markdown.lua      # Markdown rendering
│   │   ├── mason-lspconfig.lua # LSP server management
│   │   ├── notification.lua  # Notification system (mini.notify)
│   │   ├── telescope.lua     # Fuzzy finder
│   │   └── treesitter.lua    # Syntax highlighting
│   ├── development/           # Development-only plugins
│   │   └── plugins.lua       # Local plugin loader
│   └── combo/                 # Custom combo tracking plugin
│       └── init.lua          # Keypress streak gamification
├── stylua.toml                # Lua code formatter config
└── lazy-lock.json            # Plugin version lockfile
```

## Features

### Core Features
- **LSP Integration**: Full language server protocol support with mason.nvim
- **Completion**: Fast completion with blink-cmp
- **Fuzzy Finding**: Telescope for files, buffers, and live grep
- **Git Integration**: Gitsigns for git status in gutter
- **Syntax Highlighting**: Treesitter-based highlighting

### UI Features
- **Statusline**: Custom lualine configuration with mode display and diagnostics
- **Colorscheme**: Jellybeans high-contrast theme
- **Notifications**: Transparent floating notifications with mini.notify
- **Relative Line Numbers**: Comfortable relative line numbers with comfy-rln
- **Markdown Rendering**: Beautiful markdown preview with render-markdown

### Code Quality
- **Formatting**: Automatic code formatting with conform.nvim
  - Lua: Stylua
  - JavaScript/TypeScript: Prettier
- **LSP Progress**: Visual LSP progress indicators with fidget

### Navigation
- **Flash**: Lightning-fast motion with `s`, `S`, `r`, `R`, `<c-s>` keybinds
- **Telescope**: Fuzzy search everything
  - `<leader>ff` - Find files
  - `<leader>fg` - Live grep
  - `<leader>fb` - Find buffers
  - And more...

## Plugin Management

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.

### Adding a New Plugin

Create a new file in `lua/plugins/` with the lazy.nvim spec:

```lua
-- lua/plugins/my-plugin.lua
return {
    'author/plugin-name',
    opts = {
        -- plugin configuration
    },
    -- optional: lazy-loading
    event = 'VeryLazy',
    -- optional: custom setup
    config = function(_, opts)
        require('plugin-name').setup(opts)
    end,
}
```

The plugin will be automatically loaded by lazy.nvim.

### Lazy-Loading Strategies

- `lazy = false` - Load immediately (colorschemes, treesitter)
- `event = 'VeryLazy'` - Load after startup (motion plugins)
- `ft = 'filetype'` - Load for specific filetypes (language-specific tools)
- No specification - Let lazy.nvim auto-determine

## Key Bindings

### Global Keymaps (config/keymaps.lua)

| Key | Mode | Action |
|-----|------|--------|
| `<C-s>` | Normal/Insert | Save file |
| `<C-q>` | Normal | Quit |
| `<C-j>` | Normal | Next buffer |
| `<C-k>` | Normal | Previous buffer |
| `<A-j>` | Normal/Visual | Move line down |
| `<A-k>` | Normal/Visual | Move line up |
| `<leader>q` | Normal | Delete buffer (keep window) |

### LSP Keymaps (mason-lspconfig.lua)

Available when LSP is attached to a buffer:

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Find references |
| `gi` | Go to implementation |
| `K` | Show hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format buffer |

### Telescope Keymaps (telescope.lua)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help tags |
| `<leader>fr` | Find recent files |
| `<leader>fc` | Find git commits |
| `<leader>fs` | Find git status |
| `<leader>fw` | Grep word under cursor |

### Flash Keymaps (flash.lua)

| Key | Mode | Action |
|-----|------|--------|
| `s` | Normal/Operator/Visual | Flash forward |
| `S` | Normal/Operator/Visual | Flash backward (treesitter) |
| `r` | Operator | Remote flash |
| `R` | Operator/Visual | Treesitter search |
| `<c-s>` | Insert | Toggle flash search |

## Customization

### Changing Options

Edit `lua/config/options.lua` to modify Neovim settings.

### Adding Keymaps

Edit `lua/config/keymaps.lua` for global keybindings.

### Configuring Plugins

Each plugin has its own file in `lua/plugins/`. Edit the relevant file to customize plugin behavior.

### Changing Theme

Edit `lua/plugins/colorscheme.lua` to change the color scheme.

## LSP Server Configuration

LSP servers are managed by mason-lspconfig.nvim. Servers are automatically installed and configured when needed.

To add a new language server:

1. Open a file of that language type
2. Mason will prompt to install the server, or run `:MasonInstall <server-name>`
3. The server will be auto-configured with sensible defaults

For custom LSP server configurations, edit `lua/plugins/mason-lspconfig.lua`.

## Formatters

Formatters are configured in `lua/plugins/conform.lua`:

- **Lua**: Stylua (config in `stylua.toml`)
- **JavaScript/TypeScript/JSON/CSS/HTML/Markdown**: Prettier

To add a new formatter:

```lua
-- In lua/plugins/conform.lua
formatters_by_ft = {
    your_filetype = { "formatter_name" },
}
```

## Development Features

### Combo Plugin

The `lua/combo/` directory contains a custom plugin that tracks keypress combos and displays a streak counter in a floating window. This is a gamification feature for fun.

### Local Plugin Development

The `lua/development/plugins.lua` file loads local plugins for development. This is useful for testing plugins before publishing.

## Design Decisions

### Why lazy.nvim?

- Modern, fast plugin manager with lazy-loading
- Declarative plugin specifications
- Automatic plugin updates and lockfile support
- Great developer experience

### Why separate plugin files?

- Modularity: Each plugin is self-contained
- Easy to enable/disable plugins
- Better organization and navigation
- Clear dependencies and lazy-loading per plugin

### Why minimal configuration?

- Faster startup time
- Less complexity to maintain
- Easier to understand and customize
- Focus on essential features

## Contributing

Feel free to customize this configuration to your needs. This is a personal configuration template designed for clarity and ease of modification.

## License

This configuration is provided as-is for personal use.
