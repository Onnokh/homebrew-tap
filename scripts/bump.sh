#!/bin/sh
# Points a cask at a new release: sets its version and the sha256 of the DMG, checks that Homebrew can download the
# DMG and that it matches, then commits and pushes. Run it after the DMG is live, from the tapped copy:
#
#   "$(brew --repo onnokh/tap)/scripts/bump.sh" <cask> <version> <dmg>
set -eu
[ $# -eq 3 ] || { echo "usage: $0 <cask> <version> <dmg>" >&2; exit 2; }
cask=$1
version=$2
sha=$(shasum -a 256 "$3" | cut -d' ' -f1)
cd "$(dirname "$0")/.."
file="Casks/$cask.rb"
[ -f "$file" ] || { echo "no cask $file" >&2; exit 1; }

git pull -q --ff-only
sed -i '' -e "s/^  version \".*\"/  version \"$version\"/" -e "s/^  sha256 \".*\"/  sha256 \"$sha\"/" "$file"
if git diff --quiet -- "$file"; then
  echo "$cask is already at $version"
  exit 0
fi
brew fetch --cask --force --quiet "./$file" || { git checkout -- "$file"; exit 1; }
git commit -q -m "$cask $version" -- "$file"
git push -q
echo "bumped $cask to $version"
