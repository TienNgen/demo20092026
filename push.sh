#!/usr/bin/env bash
# One-shot publisher for this repository.
#
#   ./push.sh                 # prompts for your GitHub username
#   ./push.sh <username>      # non-interactive
#
# Uses the gh CLI when it is installed (creates the private repo for you).
# Otherwise it assumes you have already created an EMPTY private repo named
# ntg-agent-capstone-presentation and just wires up the remote and pushes.

set -euo pipefail
cd "$(dirname "$0")"

REPO="ntg-agent-capstone-presentation"
USER_NAME="${1:-}"

if [ -z "$USER_NAME" ] && command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  echo "==> gh CLI is authenticated - creating the private repo and pushing"
  gh repo create "$REPO" --private --source=. --remote=origin --push
  echo
  echo "Done: $(gh repo view --json url -q .url)"
  exit 0
fi

if [ -z "$USER_NAME" ]; then
  read -rp "GitHub username (the one in your profile URL, not your display name): " USER_NAME
fi
[ -n "$USER_NAME" ] || { echo "No username given, stopping."; exit 1; }

URL="https://github.com/${USER_NAME}/${REPO}.git"

echo "==> Remote: $URL"
echo "    This must already exist as an EMPTY PRIVATE repo."
echo "    Create one at: https://github.com/new"
echo "    Name: ${REPO}   Visibility: Private   Do NOT add a README."
echo
read -rp "Press Enter once that repo exists (Ctrl-C to abort)... " _

if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$URL"
else
  git remote add origin "$URL"
fi

echo "==> Pushing"
git push -u origin main

echo
echo "Done: https://github.com/${USER_NAME}/${REPO}"
echo "Check it is marked Private before sharing the link."
