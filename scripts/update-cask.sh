#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "usage: $0 <release-tag-version> <artifact-version> <macos-zip-path>" >&2
  exit 1
fi

release_tag_version="$1"
artifact_version="$2"
zip_path="$3"
cask_path="$(cd "$(dirname "$0")/.." && pwd)/Casks/hormus.rb"

if [[ ! -f "$zip_path" ]]; then
  echo "zip not found: $zip_path" >&2
  exit 1
fi

sha="$(shasum -a 256 "$zip_path" | awk '{print $1}')"

perl -0pi -e 's/version "\K[^"]+/'"$release_tag_version,$artifact_version"'/g' "$cask_path"
perl -0pi -e 's/sha256 arm: "\K[^"]+/'"$sha"'/g' "$cask_path"

echo "updated $cask_path"
echo "release tag:      $release_tag_version"
echo "artifact version: $artifact_version"
echo "sha256:  $sha"
