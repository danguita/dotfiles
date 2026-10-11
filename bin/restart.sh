#!/usr/bin/env bash
#
# Bring back what does not start automatically after a reboot.
#
# Not handled here because they already auto-start:
#   - systemd: plexmediaserver, tailscaled, libvirtd(+virtlogd), transmission-daemon
#   - docker:  computerzinho-home (restart=unless-stopped)
#
# GUI / session apps are printed as reminders at the end.

set -euo pipefail

log() {
  printf '[restart] %s\n' "$1"
}

compose_up() {
  local file=$1
  if [ ! -f "$file" ]; then
    log "skip: compose file not found: $file"
    return
  fi
  log "compose up: $file"
  docker compose -f "$file" up -d
}

# Start a standalone container, creating it if it does not exist yet.
ensure_container() {
  local name=$1
  shift
  if docker inspect "$name" >/dev/null 2>&1; then
    log "start: $name"
    docker start "$name" >/dev/null
  else
    log "run: $name"
    docker run -d --name "$name" "$@" >/dev/null
  fi
}

if ! docker info >/dev/null 2>&1; then
  log "error: docker is not running"
  exit 1
fi

# Docker Compose projects
compose_up "$HOME/workspace/rm.davidanguita.name/invoicing/docker-compose.yml"
compose_up "$HOME/workspace/stuff/tapioca-project/dev/db/docker-compose.yml"

# Standalone containers
ensure_container crazy_visvesvaraya \
  -p 4567:4567 -v "$HOME/workspace/davidanguita.name:/app" \
  danguita/davidanguita.name:latest
ensure_container open-webui \
  -p 3080:8080 -v open-webui:/app/backend/data \
  ghcr.io/open-webui/open-webui:main

cat <<'EOF'

[restart] Start these by hand (GUI / session apps):
  - LM Studio                          (port 1234)
  - BrowserOS / browserclaw            (ports 9000-9011, 9201, 9300)
  - opencode serve --hostname 0.0.0.0  (port 4096)
  - Next.js dev servers (in tmux): tapioca-project :3000, tapioca-gateway :3001, kozowu-blog :3002

[restart] done.
EOF
