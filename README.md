# nvim config

My personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Structure

```
.
├── init.lua            # Entry point
├── lazy-lock.json      # Plugin lockfile
├── lsp/                # LSP server configs
└── lua/
    ├── keymaps.lua
    ├── options.lua
    ├── lsp.lua
    ├── colorscheme.lua
    └── plugins/        # Plugin specs
```

## Install

```bash
git clone git@github.com:Ekansh38/nvim-config.git ~/.config/nvim
```

Open Neovim — lazy.nvim will bootstrap and install everything automatically.
