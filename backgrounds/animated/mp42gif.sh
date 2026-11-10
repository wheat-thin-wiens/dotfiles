#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 input.mp4 [output.gif] [fps]"
  exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.*}.gif}"
FPS="${3:-15}"
PALETTE="$(mktemp --suffix=.png)"
trap 'rm -f "$PALETTE"' EXIT

# No scale filter, so the original resolution (3440x1440) is kept
FILTERS="fps=${FPS}"

# Pass 1: generate an optimized palette
ffmpeg -v warning -y -i "$INPUT" \
  -vf "${FILTERS},palettegen=stats_mode=diff" "$PALETTE"

# Pass 2: create the GIF using the palette
ffmpeg -v warning -y -i "$INPUT" -i "$PALETTE" \
  -lavfi "${FILTERS} [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" \
  "$OUTPUT"

echo "Created $OUTPUT"
