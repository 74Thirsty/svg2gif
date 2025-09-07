#!/usr/bin/env bash
# svg2gif.sh — interactive SVG→GIF capture with spinner
set -euo pipefail

read -rp "Path to input SVG: " SVG
read -rp "Path to output GIF: " OUT

DUR="${DUR:-4}"
FPS="${FPS:-15}"
W="${W:-1600}"
H="${H:-600}"
OUTW="${OUTW:-600}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

need() { command -v "$1" >/dev/null 2>&1 || { echo "Missing $1. Install it."; exit 1; }; }
need node
need npm
need ffmpeg

# Ensure puppeteer is installed locally, suppress logs
if [ ! -d "$SCRIPT_DIR/node_modules/puppeteer" ]; then
  echo "Installing puppeteer (first run)..."
  ( cd "$SCRIPT_DIR" && npm init -y >/dev/null 2>&1 || true
    npm i puppeteer >/dev/null 2>&1 )
fi

echo "Rendering GIF, please wait..."

# Run recorder in background, silence stdout/stderr
node "$SCRIPT_DIR/record-svg.js" "$SVG" "$OUT" \
  --dur "$DUR" --fps "$FPS" --w "$W" --h "$H" --outw "$OUTW" >/dev/null 2>&1 &

PID=$!

# Spinner
spin='|/-\'
i=0
while kill -0 "$PID" 2>/dev/null; do
  i=$(( (i+1) %4 ))
  printf "\r[%c] Working..." "${spin:$i:1}"
  sleep 0.2
done

wait "$PID"
printf "\r[✔] Done! GIF saved to: %s\n" "$OUT"
