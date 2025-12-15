#!/usr/bin/env bash
set -e pipefail
# cd to script's directory
cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

nix develop --command playit-cli --secret_path playit.toml
