#!/usr/bin/env bash
set -e pipefail
# Exit on Ctrl+C
trap 'exit 130' INT

# Set up playit if needed
playit_secret_regex='secret_key = "[0-9abcdef]{64}"'
if [[ ! " $( cat "playit.toml" 2>/dev/null ) " =~ $playit_secret_regex ]] then
  touch ./playit.toml
  playit-cli setup
fi

# Start tunnel
playit-cli start
