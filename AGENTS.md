# AGENTS.md

## Quick start

- `make install` — Symlink dotfiles (via `MANIFEST`) and install Neovim plugins/extensions.
- `make update` — `git pull origin master`, then update Neovim plugins/extensions.
- `make clean` — Remove symlinks and `~/.vim`.
- `make help` — List all targets.

## Verification

- **ShellCheck** runs in CI (`.github/workflows/main.yml`) and should be run locally on shell scripts:
  - `shellcheck -s bash script/*.sh xinitrc`

## Runtime

- **Login manager**: `lemurs` on TTY, then `startx`.
- **X11 D-Bus**: Arch uses `dbus-broker` via systemd. Do not wrap `dwm` with `dbus-launch` (it spawns a private bus). Source `/etc/X11/xinit/xinitrc.d/` so the systemd user session gets `DISPLAY`/`XAUTHORITY`. If needed, explicitly set `DBUS_SESSION_BUS_ADDRESS` to `unix:path=/run/user/$(id -u)/bus`.

## Architecture

- **Dotfiles manifest**: `MANIFEST` is the single source of truth for symlinks. Each line is `repo_path|symlink_path` relative to `$DOTFILES` and `$NS` (default `$HOME`). Managed by `script/dotfiles.sh`.
- **Neovim** (`config/nvim/init.lua`): Primary editor config. Uses `lazy.nvim` for plugins and `coc.nvim` for LSP/completion. Sources `shared.vim` for all settings, keymaps, and plugin configuration.
- **Legacy Vim** (`vimrc`): Uses `vim-plug`. Sources `~/.config/nvim/shared.vim` for all settings, keymaps, and plugin configuration. The Makefile/scripts do *not* manage its plugins; run `:PlugInstall` manually in Vim if needed.
- **Shared config** (`config/nvim/shared.vim`): Single source of truth for editor settings, keymaps, and plugin configuration (`let g:...`) shared between Neovim and Vim. Do not put plugin manager code here.
- **User scripts**: `bin/` contains standalone utility scripts.
- **App configs**: `config/` holds configs for `dunst`, `fontconfig`, `gtk-3.0`, `nvim`, `ranger`.

## Conventions

- **Commits**: Use `(scope) Description` style — e.g., `(vim)`, `(x11)`, `(doc)`.

## Toolchain quirks

- **Neovim plugin management requires `EDITOR=nvim`**. `script/vim.sh` defaults `EDITOR` to `vim`, but the `Lazy!` and `Coc*` commands are Neovim-specific. The install/update targets will fail unless `EDITOR` resolves to Neovim (e.g., `EDITOR=nvim make install`).
- **Vim plugin list parity**: Adding or removing a plugin requires updating both `vimrc` (vim-plug) and `config/nvim/init.lua` (lazy.nvim). `shared.vim` is for settings and config only — it does not declare plugins.
- **Git submodules**: `tmux/plugins/tmux-resurrect` is a submodule. Clone with `--recurse-submodules`.
- **Vim plugin script installs hardcoded `coc` extensions**: `coc-snippets`, `coc-tsserver`, `coc-solargraph`, `coc-json`, `coc-rust-analyzer` (see `script/vim.sh`).
