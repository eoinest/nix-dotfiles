#!/usr/bin/env bash
# Pull, then apply this repo's config to this Mac.
#
# Usage: ./scripts/utils/switch.sh TARGET   (e.g. work-macbook)
# The `rebuild` alias (modules/darwin.nix) runs this with the right TARGET.

set -euo pipefail

[ $# -eq 1 ] || { echo "usage: switch.sh TARGET" >&2; exit 1; }

# The repo root, two folders up from this script.
root="$(cd -P "$(dirname "$0")/../.." && pwd -P)"

# Get changes pushed from other machines first. --ff-only never merges.
git -C "$root" pull --ff-only --quiet \
  || echo "switch: git pull failed; using the local checkout as-is" >&2

sudo darwin-rebuild switch --flake "$root#$1"
