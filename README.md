# Dex Sales — AI Chief of Staff for Sales Teams

**A personal operating system for sales professionals, built for Amazon Kiro.** Pipeline intelligence, deal reviews, meeting extraction, relationship tracking, daily planning, and career development — for sales ICs, managers, and leaders.

→ **[QUICKSTART.md](QUICKSTART.md) — Get running in 5 minutes**

---

## What Dex Does

| What you ask | What happens |
|---|---|
| `/daily-plan` | Surfaces your top deals, key meetings, and priority tasks for today |
| `/meeting-prep` | Pulls attendee context, deal history, and talk tracks before any call |
| `/deal-reviewer` | Runs a full MEDDIC/BANT scorecard on any deal before your review |
| `/pipeline-analyst` | Coverage ratio, forecast breakdown, and at-risk flags for your pipeline |
| `/sales-coach` | Coaching agenda built from real call and deal activity (managers) |
| `/account-researcher` | Full pre-call briefing: bios, history, open items, recommended questions |
| `/week-plan` + `/week-review` | Weekly rhythm anchored to quota and pipeline reality |
| `/career-coach` | Evidence capture, skill tracking, promotion readiness |
| New meeting note saved | Auto-extracts BANT, action items, objections, next steps — flags if no next step was set |

---

## Setup

**[→ See QUICKSTART.md](QUICKSTART.md)** for the fast path.

### Prerequisites

| Tool | Minimum version | Download |
|---|---|---|
| **Amazon Kiro** | Latest | [kiro.dev](https://kiro.dev) |
| **Git** | Any | [git-scm.com](https://git-scm.com) |
| **Node.js** | 18+ | [nodejs.org](https://nodejs.org) |
| **Python** | 3.10+ | [python.org](https://www.python.org/downloads/) |

> **Windows:** When installing Python, check ✅ "Add Python to PATH" on the first installer screen.

### Install

**1. Clone into Kiro**

`Cmd+Shift+P` → Git: Clone → paste `https://github.com/davekilleen/dex.git` → Open

**2. Run setup** (from Kiro's terminal — View → Terminal)

```bash
# Mac / Linux
./dex-setup.sh

# Windows
dex-setup.bat
```

The script: installs Python + Node dependencies, configures MCP servers with your vault path, sets environment variables. ~60 seconds.

**3. Restart Kiro**, then type `/getting-started` in chat.

---

## How It Works in Kiro

### Steering Files (`.kiro/steering/`) — Always Active
Load automatically every session. Give Dex persistent context about your role, your deals, and how to behave. No setup required — they just work.

Manually load any steering file by typing `#` in chat (e.g., `#sales`, `#tech`).

### Skills (type `/` in chat) — On Demand
72 commands covering the full sales workflow. The most useful:

**Daily workflow:** `/daily-plan`, `/daily-review`
**Deal work:** `/deal-review`, `/call-prep`, `/account-plan`, `/meeting-prep`
**Pipeline:** `/pipeline-health`, `/pipeline-analyst`
**Weekly/Quarterly:** `/week-plan`, `/week-review`, `/quarter-plan`, `/quarter-review`
**Career:** `/career-coach`, `/resume-builder`, `/identity-snapshot`
**System:** `/dex-update`, `/health-check`, `/integrate-mcp`

### Custom Agents (type `/` in chat) — Deep Analysis
Specialized agents that read your full vault and run multi-step analysis:

- `/deal-reviewer` — MEDDIC/BANT scorecard, gaps, recommended next actions
- `/pipeline-analyst` — Coverage, forecast categories, at-risk deals
- `/sales-coach` — Rep coaching agenda from actual activity
- `/account-researcher` — Pre-call briefing package

### Hooks (Automatic)
- **New meeting note** → auto-extracts BANT, action items, objections, and next steps. Flags if no next step was agreed.

### MCP Servers (Background)
9 Python servers that power task sync, calendar integration, meeting intelligence, career tracking, and more. Configured in `.kiro/settings/mcp.json`.

---

## Vault Structure

```
00-Inbox/Meetings/       Drop meeting notes here — hooks process automatically
01-Quarter_Goals/        Quota targets and quarterly OKRs
02-Week_Priorities/      Weekly top 3
03-Tasks/Tasks.md        Task backlog (syncs across all files)
04-Projects/Deals/       Active deals — one folder per deal
05-Areas/People/
  Internal/              Your team
  External/              Prospects, customers, partners
05-Areas/Companies/      Account pages
06-Resources/
  Competitive/           Competitor battle cards
  Playbooks/             Sales playbooks
07-Archives/             Closed deals, past accounts
System/                  Config (user-profile.yaml, pillars.yaml)
.kiro/                   Kiro config (steering, hooks, agents, skills, mcp)
```

---

## Connecting Your Tools

Edit `.kiro/settings/mcp.json` — change `"disabled": true` to `"disabled": false` for any integration:

| Integration | What it adds |
|---|---|
| Granola | Auto-sync meeting transcripts (enabled by default) |
| Google Calendar | Real meetings in daily plans (Mac, enabled by default) |
| Slack | Slack context in meeting prep |
| Google Workspace | Gmail + Docs |
| Zoom | Meeting recording context |
| Salesforce/HubSpot | Run `/integrate-mcp` to connect your CRM |
| Atlassian | Jira + Confluence |
| Todoist / Things | Bi-directional task sync |

---

## Troubleshooting

<details>
<summary><strong>MCP servers not loading in Kiro</strong></summary>

Re-run the setup script — it will re-configure the paths:
```bash
./dex-setup.sh
```

Then restart Kiro. If still broken, try:
```bash
python3 -m pip install --upgrade pip
pip3 install --user "mcp>=1.0.0,<2.0.0" pyyaml python-dateutil
```

Check server output in Kiro's MCP panel → click the error indicator → Show Output.

</details>

<details>
<summary><strong>Mac: "Command Line Developer Tools" prompt</strong></summary>

Click **Install** — safe, takes 2-3 minutes. Re-run `./dex-setup.sh` after.

If you clicked Cancel: `xcode-select --install` → re-run setup.

</details>

<details>
<summary><strong>Windows: Python or pip not recognized</strong></summary>

Uninstall Python, re-download from [python.org](https://www.python.org/downloads/), and check **"Add Python to PATH"** on the first installer screen. Restart your terminal, re-run `dex-setup.bat`.

</details>

<details>
<summary><strong>Mac: Calendar not showing meetings</strong></summary>

1. Open **Calendar** app → Calendar menu → **Add Account** → Google → sign in
2. **System Settings** → Privacy & Security → **Calendars** → Kiro → **Full Access**
3. Restart Kiro

</details>

<details>
<summary><strong>Meeting hook not firing on new notes</strong></summary>

Check that `.kiro/hooks/meeting-capture.kiro.hook` exists. In Kiro settings, verify workspace hooks are enabled. Fallback: run `/process-meetings` manually.

</details>

---

## Keeping Dex Updated

```
/dex-update
```

Type this in Kiro chat anytime. Shows what's new and updates with your confirmation. Your personal customizations are always preserved.

To undo: `/dex-rollback`

---

*Powered by [Claude](https://anthropic.com) · Built for [Amazon Kiro](https://kiro.dev)*
