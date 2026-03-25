# chad-context

Hourly snapshot of the OpenClaw ecosystem. Gives ChatGPT (Chad) persistent knowledge of all repos, file structures, trading bots, and project state. Every commit is a timestamped record of decisions and outcomes — designed for future bots to study.

## What's Here

| File | Purpose |
|------|---------|
| `snapshots/CHAD-CONTEXT.md` | Auto-generated ecosystem context (hourly) |
| `snapshots/CHANGELOG.md` | Diff summary of what changed each hour |
| `logs/` | Generation logs |
| `generate-chad-context.sh` | The generator script |
| `cron-chad-context.sh` | Hourly cron: regenerate, commit, push |
| `chatgpt-project-instructions.md` | System prompt for ChatGPT Project |
| `chatgpt-github-setup.md` | Setup guide for GitHub connector |

## How It Works

Every hour, `cron-chad-context.sh` runs:
1. Regenerates `CHAD-CONTEXT.md` from the live filesystem
2. Diffs against the previous snapshot
3. Appends a changelog entry if anything changed
4. Commits and pushes to GitHub

## For Future Bots

The git history of `snapshots/CHAD-CONTEXT.md` is the archaeological record. Each commit message includes what changed. Use `git log --oneline snapshots/` to trace the evolution of the ecosystem over time.
