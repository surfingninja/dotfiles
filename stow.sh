#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

case "$(uname -s)" in
  Linux)   OS="linux" ;;
  Darwin)  OS="macos" ;;
  *)       OS="unknown" ;;
esac

echo "Detected OS: $OS"

stow gen

if [[ "$OS" == "linux" ]]; then
  stow linux
elif [[ "$OS" == "macos" ]]; then
  stow macos
fi