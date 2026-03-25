#!/bin/bash
# Hourly cron: regenerate Chad context, diff, commit, push
# Crontab: 7 * * * * /bin/bash ~/chad-context/cron-chad-context.sh >> ~/chad-context/logs/cron.log 2>&1

set -euo pipefail
REPO="$HOME/chad-context"
SNAPSHOT="$REPO/snapshots/CHAD-CONTEXT.md"
CHANGELOG="$REPO/snapshots/CHANGELOG.md"
LOGFILE="$REPO/logs/cron.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')

echo "[$TIMESTAMP] Starting context refresh"

# 1. Regenerate context (output goes to openclaw/outputs/ AND we copy here)
bash "$REPO/generate-chad-context.sh" 2>&1
cp "$HOME/openclaw/outputs/CHAD-CONTEXT.md" "$SNAPSHOT"

# 2. Check if anything changed
cd "$REPO"
if git diff --quiet -- snapshots/CHAD-CONTEXT.md 2>/dev/null; then
    echo "[$TIMESTAMP] No changes detected, skipping commit"
    exit 0
fi

# 3. Generate diff summary for changelog
DIFF_SUMMARY=$(git diff --stat -- snapshots/CHAD-CONTEXT.md 2>/dev/null | tail -1)
DIFF_SECTIONS=$(git diff -- snapshots/CHAD-CONTEXT.md 2>/dev/null | grep '^[+-]###' | head -10 | sed 's/^[+-]//' | tr '\n' ', ' | sed 's/, $//')

# 4. Append to changelog
[ -f "$CHANGELOG" ] || echo "# Chad Context Changelog" > "$CHANGELOG"
{
    echo ""
    echo "## $TIMESTAMP"
    echo "- Stats: $DIFF_SUMMARY"
    [ -n "$DIFF_SECTIONS" ] && echo "- Sections touched: $DIFF_SECTIONS"
} >> "$CHANGELOG"

# Keep changelog under 500 lines (trim oldest entries)
if [ "$(wc -l < "$CHANGELOG")" -gt 500 ]; then
    tail -400 "$CHANGELOG" > "$CHANGELOG.tmp" && mv "$CHANGELOG.tmp" "$CHANGELOG"
fi

# 5. Commit and push
COMMIT_MSG="snapshot: $TIMESTAMP"
[ -n "$DIFF_SECTIONS" ] && COMMIT_MSG="snapshot: $TIMESTAMP — $DIFF_SECTIONS"
# Truncate commit message to 72 chars
COMMIT_MSG=$(echo "$COMMIT_MSG" | cut -c1-72)

git add snapshots/
git commit -m "$COMMIT_MSG" --quiet
git push --quiet origin main 2>&1

echo "[$TIMESTAMP] Committed and pushed: $COMMIT_MSG"
