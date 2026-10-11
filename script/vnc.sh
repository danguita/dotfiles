#!/usr/bin/env bash

set -e

say() {
  printf "[%s] %s\n" "$(basename "$0")" "$1"
}

install() {
  if ! command -v vncpasswd >/dev/null 2>&1; then
    say "warning: vncpasswd not found. Skipping VNC setup."
    return 0
  fi

  if [ ! -f "$HOME/.config/systemd/user/vncserver@.service" ]; then
    say "warning: vncserver@.service not found. Run 'make dotfiles-install' first."
    return 0
  fi

  if [ ! -f "$HOME/.config/tigervnc/passwd" ]; then
    say "VNC password file not found. Running vncpasswd..."
    vncpasswd
  else
    say "VNC password file already exists."
  fi

  systemctl --user daemon-reload
  systemctl --user enable vncserver@:1.service
  systemctl --user start vncserver@:1.service || true
  say "install: done."
}

clean() {
  systemctl --user stop vncserver@:1.service 2>/dev/null || true
  systemctl --user disable vncserver@:1.service 2>/dev/null || true
  say "clean: done."
}

"$1"
