# OpenClaw Ecosystem — Master Context for ChatGPT

> Auto-generated 2026-04-16T14:07:00-07:00. Do not edit manually.
> For live code, use the GitHub MCP connector to read repos directly.

Generated: 2026-04-16T14:07:00-07:00
Machine: Jordan's MacBook Pro M2 Max (96GB)
User: nayslayer

## System Overview

OpenClaw is the operator shell for Jordan's web-based businesses. Claude Code is the build plane. Local Ollama models (14 models, ~264GB) handle inference at zero API cost. Three trading bots compete head-to-head:

| Bot | Path | Architecture | Status |
|-----|------|-------------|--------|
| Clawmpson | ~/openclaw/ | 4 strategies, 5 feeds, graduation engine, 13 agents | Active, Phase 5 |
| RivalClaw | ~/rivalclaw/ | 8 strategies + hedge engine, self-tuner, 3 feeds | Active, daily runs |
| ArbClaw | ~/arbclaw/ | Lean single-strategy arb, 5-min cycle | Not yet built |

**Gonzoclaw Dashboard:** FastAPI + HTML at localhost:7080, exposed via Cloudflare tunnel at https://www.asdfghjk.lol
**Database:** ~/.openclaw/clawmson.db (SQLite, 8 tables)
**GitHub:** https://github.com/nayslayer143/openclaw

## Directory Structure

### openclaw (/Users/nayslayer/openclaw)
```
~/openclaw
~/openclaw/autoresearch
~/openclaw/autoresearch/core
~/openclaw/autoresearch/github-intel
~/openclaw/autoresearch/meta
~/openclaw/autoresearch/outputs
~/openclaw/improvements
~/openclaw/logs
~/openclaw/outputs
```

## Project Instructions (CLAUDE.md files)

## README Files

## Tech Stack Fingerprint

## Git Status

## Environment Files (names only, NO values)
```
```

## Trading State (if available)

---
End of context. Generated 2026-04-16T14:07:00-07:00.
For live code, use GitHub MCP connector -> github.com/nayslayer143/openclaw
