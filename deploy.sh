#!/usr/bin/env bash
set -euo pipefail

SITE_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PORT="${PORT:-8000}"
HOST="${HOST:-127.0.0.1}"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required." >&2
  exit 1
fi

echo "Serving Pawnyable from: $SITE_DIR"
echo "Open: http://${HOST}:${PORT}"
exec python3 -m http.server "$PORT" --bind "$HOST" --directory "$SITE_DIR"
