---
inclusion: auto
description: Technical architecture, MCP servers, Python backend, Node.js scripts, and environment setup. Load when troubleshooting, configuring integrations, or discussing system internals.
---

# Technical Architecture

## MCP Servers (Python)

Dex runs 9 Python MCP servers defined in `.kiro/settings/mcp.json`. They require `VAULT_PATH` environment variable set to the vault root.

| Server | File | Purpose |
|---|---|---|
| `work-mcp` | `core/mcp/work_server.py` | Task sync, deduplication, pillar alignment, priority enforcement |
| `calendar-mcp` | `core/mcp/calendar_server.py` | Calendar integration (Mac: Apple Calendar via AppleScript) |
| `granola-mcp` | `core/mcp/granola_server.py` | Meeting transcript integration (Granola desktop app) |
| `career-mcp` | `core/mcp/career_server.py` | Evidence aggregation, competency mapping, promotion scoring |
| `dex-improvements-mcp` | `core/mcp/dex_improvements_server.py` | Idea capture, duplicate detection, AI ranking |
| `resume-mcp` | `core/mcp/resume_server.py` | Resume builder with session state |
| `update-checker` | `core/mcp/update_checker.py` | Daily update notifications |
| `onboarding-mcp` | `core/mcp/onboarding_server.py` | Setup flow with validation |
| `dex-analytics` | `core/mcp/analytics_server.py` | Usage tracking (opt-out model) |

**Requirements:** Python 3.10+, `mcp>=1.0.0,<2.0.0`, `pyyaml`, `python-dateutil`

## Node.js Scripts

| Script | Purpose |
|---|---|
| `.scripts/auto-link-people.cjs` | Convert names to WikiLinks in markdown files |
| `.scripts/meeting-intel/sync-from-granola.cjs` | Background meeting sync from Granola |
| `.claude/hooks/person-context-injector.cjs` | Person context lookup (backing script) |
| `.claude/hooks/company-context-injector.cjs` | Company context lookup (backing script) |
| `.claude/hooks/post-meeting-person-update.cjs` | Update person pages after meeting processing |
| `.claude/hooks/career-evidence-capture.cjs` | Capture career evidence after coaching session |
| `.claude/hooks/meeting-summary-generator.cjs` | Generate meeting summary after processing |
| `.claude/hooks/maintenance.cjs` | Vault health checks (stale files, broken links) |

**Requirements:** Node.js 18+, npm dependencies installed (`npm install` in vault root)

## Semantic Search (QMD — Optional)

QMD provides hybrid semantic search (BM25 + vectors + LLM reranking). Check availability with `qmd_status`. If unavailable, fall back to grep/glob keyword search — system degrades gracefully.

Setup: `/enable-semantic-search`

## Environment Variables

| Variable | Purpose | Where Set |
|---|---|---|
| `VAULT_PATH` | Absolute path to this vault folder | `.env` or system environment |
| `GOOGLE_CLIENT_ID` / `GOOGLE_CLIENT_SECRET` | Google Workspace integration | `.env` |
| `ATLASSIAN_SITE` / `ATLASSIAN_TOKEN` | Jira/Confluence integration | `.env` |
| `TODOIST_API_KEY` | Todoist task sync | `.env` |
| `ZOOM_CLIENT_ID` / `ZOOM_CLIENT_SECRET` | Zoom integration | `.env` |

## Configuration Files

- `.kiro/settings/mcp.json` — MCP server definitions (Kiro reads this)
- `System/user-profile.yaml` — User identity, preferences, sales config
- `System/pillars.yaml` — Strategic pillars with keyword lists
- `System/.mcp.json.example` — Template for MCP config (reference copy)

## Troubleshooting

**MCP servers not loading:**
```bash
python3 -m pip install --upgrade pip
pip3 install --user "mcp>=1.0.0,<2.0.0" pyyaml python-dateutil
```
Then restart Kiro.

**Node scripts failing:**
```bash
npm install
```
Run from the vault root directory.

**Python version check:**
```bash
python3 --version  # Must be 3.10 or higher
```
