#!/usr/bin/env bash

set -euo pipefail

QUARTO_VERSION="1.9.38"
QUARTO_DIRECTORY="$PWD/.quarto-cli"
QUARTO_ARCHIVE="/tmp/quarto.tar.gz"

if [ ! -x "$QUARTO_DIRECTORY/bin/quarto" ]; then
  echo "Installing Quarto ${QUARTO_VERSION}..."

  curl -fsSL \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" \
    -o "$QUARTO_ARCHIVE"

  mkdir -p "$QUARTO_DIRECTORY"

  tar -xzf "$QUARTO_ARCHIVE" \
    -C "$QUARTO_DIRECTORY" \
    --strip-components=1
fi

echo "Rendering Matteo's Lab..."
"$QUARTO_DIRECTORY/bin/quarto" render
