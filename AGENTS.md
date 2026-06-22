# AGENTS.md

## Quick start

- `make install` — Symlink dotfiles (via `MANIFEST`) and install Neovim plugins/extensions.
- `make update` — `git pull origin master`, then update Neovim plugins/extensions.
- `make clean` — Remove symlinks and `~/.vim`.
- `make help` — List all targets.

## Verification

- The only automated check is **ShellCheck** in CI (`.github/workflows/main.yml`):
  - Run locally: `shellcheck -s bash script/*.sh`

## Architecture

- **Dotfiles manifest**: `MANIFEST` is the single source of truth for symlinks. Each line is `repo_path|symlink_path` relative to `$DOTFILES` and `$NS` (default `$HOME`). Managed by `script/dotfiles.sh`.
- **Neovim** (`config/nvim/`): Primary editor config. Uses `lazy.nvim` for plugins and `coc.nvim` for LSP/completion.
- **Legacy Vim** (`vimrc`): Uses `vim-plug`. The Makefile/scripts do *not* manage its plugins; run `:PlugInstall` manually in Vim if needed.
- **User scripts**: `bin/` contains standalone utility scripts.
- **App configs**: `config/` holds configs for `dunst`, `fontconfig`, `gtk-3.0`, `nvim`, `ranger`.

## Toolchain quirks

- **Neovim plugin management requires `EDITOR=nvim`**. `script/vim.sh` defaults `EDITOR` to `vim`, but the `Lazy!` and `Coc*` commands are Neovim-specific. The install/update targets will fail unless `EDITOR` resolves to Neovim (e.g., `EDITOR=nvim make install`).
- **Git submodules**: `tmux/plugins/tmux-resurrect` is a submodule. Clone with `--recurse-submodules`.
- **Vim plugin script installs hardcoded `coc` extensions**: `coc-snippets`, `coc-tsserver`, `coc-solargraph`, `coc-json`, `coc-rust-analyzer` (see `script/vim.sh`).
