#!/usr/bin/env bash
# sync-upstream.sh — fetch upstream Imbad0202/academic-research-skills and rebase
# the local customization commits on top of the new upstream HEAD.
#
# Usage:
#   bash scripts/sync-upstream.sh
#
# Prereqs:
#   - `upstream` remote points at https://github.com/Imbad0202/academic-research-skills.git
#   - `origin` remote points at your fork (e.g. seth-lu/academic-research-skills)
#   - You are on the `main` branch with your customization commits on top of upstream
#
# What this does:
#   1. Fetches upstream/main
#   2. Shows you the new upstream commits since your last rebase base
#   3. Rebases main onto upstream/main (replays your local commits on the new base)
#   4. Stops if conflicts arise — you resolve, then `git rebase --continue`
#   5. Reminds you to push with --force-with-lease (history was rewritten)
#
# Conflict expectations:
#   The customization layer is APPEND-ONLY to 8 files; conflicts only happen
#   when upstream edits the same anchor lines. Resolution is usually
#   "keep both" (your additions go after upstream's).

set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

current_branch=$(git symbolic-ref --short HEAD)
if [[ "$current_branch" != "main" ]]; then
  echo "ERROR: must be on 'main' branch (currently on '$current_branch')"
  exit 1
fi

if ! git remote get-url upstream >/dev/null 2>&1; then
  echo "ERROR: 'upstream' remote not configured."
  echo "Run: git remote add upstream https://github.com/Imbad0202/academic-research-skills.git"
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "ERROR: working tree has uncommitted changes. Commit or stash first."
  git status --short
  exit 1
fi

echo "=== Fetching upstream ==="
git fetch upstream

echo ""
echo "=== Local commits ahead of upstream/main ==="
git log --oneline upstream/main..main

echo ""
echo "=== New upstream commits since your last sync ==="
new_count=$(git log --oneline main..upstream/main | wc -l)
if [[ "$new_count" -eq 0 ]]; then
  echo "Already up to date with upstream. Nothing to rebase."
  exit 0
fi
git log --oneline main..upstream/main | head -20
echo "(showing up to 20; total: $new_count)"

echo ""
echo "=== Rebasing main onto upstream/main ==="
echo "Press Enter to proceed, Ctrl-C to abort."
read -r

if git rebase upstream/main; then
  echo ""
  echo "✅ Rebase clean. To publish:"
  echo "    git push origin main --force-with-lease"
else
  echo ""
  echo "⚠️  Rebase has conflicts. Resolve them in the listed files, then:"
  echo "    git add <resolved-files>"
  echo "    git rebase --continue"
  echo ""
  echo "Or abort:"
  echo "    git rebase --abort"
  exit 1
fi
