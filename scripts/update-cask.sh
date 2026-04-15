#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "usage: $0 <version> <macos-zip-path>" >&2
  exit 1
fi

version="$1"
zip_path="$2"
cask_path="$(cd "$(dirname "$0")/.." && pwd)/Casks/hormus.rb"

if [[ ! -f "$zip_path" ]]; then
  echo "zip not found: $zip_path" >&2
  exit 1
fi

sha="$(shasum -a 256 "$zip_path" | awk '{print $1}')"

perl -0pi -e 's/version "\K[^"]+/'"$version"'/g' "$cask_path"
perl -0pi -e 's/sha256 arm: "\K[^"]+/'"$sha"'/g' "$cask_path"

echo "updated $cask_path"
echo "version: $version"
echo "sha256:  $sha"
