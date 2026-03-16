#!/usr/bin/env bash

case "$(uname)" in
  Darwin)
    tmux show-buffer | pbcopy
    tmux display-message "Copied tmux buffer to system clipboard"
    ;;
  Linux)
    tmux show-buffer | xclip -selection clipboard -in
    tmux display-message "Copied tmux buffer to system clipboard"
    ;;
  *)
    tmux display-message "Clipboard copy not supported on this OS"
    ;;
esac
