# Dex Sales — AI Chief of Staff for Sales Teams

**A personal operating system for sales professionals, built for Amazon Kiro.** Pipeline intelligence, meeting extraction, relationship tracking, daily planning, and career development — configured for sales ICs, managers, and leaders.

**Primary IDE:** [Amazon Kiro](https://kiro.dev) — AI-native IDE where Dex lives and runs.

---

## What Dex Does for Sales Teams

| Job | What Happens |
|---|---|
| **Daily Focus** | `/daily-plan` surfaces your top deals, key meetings, and priority tasks every morning |
| **Meeting Intelligence** | New meeting notes auto-trigger BANT extraction, action item creation, and person page updates |
| **Pipeline Health** | `/pipeline-analyst` gives you coverage ratio, forecast breakdown, and at-risk deal flags |
| **Deal Review** | `/deal-reviewer` runs a full MEDDIC/BANT scorecard on any deal before your review meeting |
| **Pre-Call Prep** | `/account-researcher` or `/meeting-prep` builds a briefing package before every customer call |
| **Rep Coaching** | `/sales-coach` prepares coaching agendas from actual call and pipeline activity |
| **Career Growth** | `/career-coach` captures evidence and tracks your path to the next level |
| **Weekly Rhythm** | `/week-plan` and `/week-review` keep you anchored to quota and pipeline reality |

---

## Setup (~10 minutes)

### What You Need

1. **[Amazon Kiro](https://kiro.dev/)** — Download and install (free during preview). This is your IDE and Dex command center.
2. **[Git](https://git-scm.com)** — Required for setup and updates
   - Mac: installs automatically when needed (you'll see a prompt)
   - Windows: download from [git-scm.com/download/win](https://git-scm.com/download/win)
3. **[Node.js 18+](https://nodejs.org/)** — Download the "LTS" version
4. **[Python 3.10+](https://www.python.org/downloads/)** — Required for MCP servers
   - Windows: ⚠️ Check "Add Python to PATH" during installation
   - Mac: If you have Python 3.9 or older, download fresh from python.org

### Step 1: Get the Code into Kiro

1. Open **Amazon Kiro**
2. Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows)
3. Type **"Git: Clone"** and press Enter
4. Paste this URL and press Enter:
   ```
   https://github.com/davekilleen/dex.git
   ```
5. Choose where to save it (Documents folder works great)
6. Click **Open** when Kiro asks if you want to open the folder

**Manual alternative:**
1. Go to [github.com/davekilleen/dex](https://github.com/davekilleen/dex)
2. Click the green **Code** button → **Download ZIP**
3. Unzip to Documents
4. In Kiro: **File → Open Folder** → select the `dex-main` folder

### Step 2: Set VAULT_PATH

Dex's MCP servers need to know where your vault lives. Set the `VAULT_PATH` environment variable to the full path of the folder you just opened.

**Mac/Linux** — add to your shell profile (`~/.zshrc` or `~/.bashrc`):
```bash
export VAULT_PATH="/Users/yourname/Documents/dex"
```
Then run `source ~/.zshrc` (or open a new terminal).

**Windows** — in PowerShell:
```powershell
[System.Environment]::SetEnvironmentVariable("VAULT_PATH", "C:\Users\yourname\Documents\dex", "User")
```
Then restart Kiro.

### Step 3: Run the Installer

In Kiro, open the terminal panel (**View → Terminal**) and run:

```bash
./install.sh
```

This installs Python and Node.js dependencies. Takes 1-2 minutes. You'll see text scrolling — that's normal.

**If you get Python errors:**
```bash
python3 -m pip install --upgrade pip
pip3 install --user "mcp>=1.0.0,<2.0.0" pyyaml python-dateutil
```

### Step 4: Verify MCP Servers

Kiro should automatically detect `.kiro/settings/mcp.json` and load the MCP servers. Look for the MCP panel in Kiro — you should see server names (work-mcp, calendar-mcp, etc.) with green indicators.

If servers show errors, see the [Troubleshooting](#troubleshooting) section below.

### Step 5: Configure Your Role

In Kiro's chat panel, type:
```
/getting-started
```

This runs the onboarding tour. Dex will ask about your role (Sales AE, Account Manager, Sales Manager, VP Sales, etc.), company, and setup preferences. Takes about 5 minutes.

**What gets configured:**
- Your role level (IC / manager / leader) — adapts Dex's tone and focus
- Sales pillars — pre-configured with Pipeline Development, Deal Execution, Customer Success & Expansion, Team & Coaching, Revenue Strategy & Operations
- Meeting intelligence — BANT, competitive intel, objection tracking, deal signals (all on by default for sales)
- Email domain — routes people to Internal vs External folders

---

## How Dex Works in Kiro

### Steering Files (`.kiro/steering/`)

Steering files load automatically every Kiro session and give Dex persistent context about who you are and how to behave. You don't need to think about them — they just work.

To manually load one, type `#` in chat:
- `#product` — Identity and role adaptation
- `#sales` — BANT extraction, pillar keywords, quota awareness
- `#behaviors` — Core Dex behaviors and MCP tools
- `#structure` — Vault folder layout
- `#tech` — Technical architecture (load when troubleshooting)

### Skills (Type `/` in Chat)

Skills are commands you invoke for specific workflows:

| Skill | When to Use |
|---|---|
| `/daily-plan` | Every morning — surfaces pipeline priorities, meetings, tasks |
| `/daily-review` | End of day — captures wins, action items, learning |
| `/week-plan` | Monday morning — set top 3 priorities vs pipeline reality |
| `/week-review` | Friday — concrete accomplishments, pipeline progress |
| `/quarter-plan` | Start of quarter — quota goals, territory strategy |
| `/quarter-review` | End of quarter — QBR prep, wins/losses, next quarter |
| `/meeting-prep` | Before any customer call — attendee context, talk tracks |
| `/process-meetings` | After meetings — extract BANT, action items, update pages |
| `/career-coach` | Career development — evidence, skill gaps, promotion readiness |
| `/project-health` | Deal and account health check |
| `/triage` | Clear inbox — route captures, extract tasks |
| `/getting-started` | First-time setup and feature tour |

### Custom Agents (Type `/` in Chat)

Agents run focused multi-step workflows with specialized intelligence:

| Agent | When to Use |
|---|---|
| `/deal-reviewer` | Before deal review meetings — full MEDDIC/BANT scorecard, gaps, next actions |
| `/pipeline-analyst` | Before forecast calls — coverage ratio, at-risk flags, forecast breakdown |
| `/sales-coach` | Before rep 1:1s — coaching agenda from actual call and pipeline activity |
| `/account-researcher` | Before any important customer call — full briefing package |

### Hooks (Automatic)

These fire automatically without you doing anything:

| Hook | Trigger | What Happens |
|---|---|---|
| **Meeting Auto-Extract** | New file in `00-Inbox/Meetings/` | Extracts BANT, action items, objections, next steps. Flags missing next step. |
| **Person Context** | Editing a meeting note or deal file | Looks up person pages for everyone referenced |
| **Company Context** | Editing a meeting note or deal file | Looks up account pages and injects deal history |
| **Deal Stale Detector** | You ask about pipeline/forecast | Flags deals with no activity in 14+ days |

### Kiro Specs for Deal Planning

Use Kiro's built-in **Specs** feature (`.kiro/specs/`) for complex account plans and QBR prep:
- Start a spec: tell Kiro "Let's build an account plan for [Company Name]"
- Kiro walks you through requirements → design → tasks → execution
- Version-controlled, shareable deal artifacts

---

## Vault Structure

```
00-Inbox/Meetings/        Meeting notes (hooks process these automatically)
01-Quarter_Goals/         Quota targets and quarterly OKRs
02-Week_Priorities/       Weekly top 3 priorities
03-Tasks/Tasks.md         Task backlog (synced across all files)
04-Projects/Deals/        Active deals (one folder per deal)
05-Areas/People/
  Internal/               Teammates, managers, direct reports
  External/               Prospects, customers, partners
05-Areas/Companies/       Account pages
06-Resources/
  Competitive/            Competitor battle cards
  Playbooks/              Sales playbooks
07-Archives/              Closed deals, past accounts
System/                   Configuration (user-profile.yaml, pillars.yaml)
.kiro/                    Kiro configuration (steering, hooks, agents, skills)
```

---

## Integrations

Connect your tools via the MCP servers in `.kiro/settings/mcp.json`. Enable by setting `"disabled": false`:

| Tool | Server | What It Adds |
|---|---|---|
| **Granola** | `granola-mcp` | Auto-sync meeting transcripts (enabled by default) |
| **Google Calendar** | `calendar-mcp` | Show real meetings in daily plans (Mac — enabled by default) |
| **Slack** | `slack-mcp` | Slack context in meeting prep |
| **Google Workspace** | `google-workspace-mcp` | Gmail and Docs integration |
| **Salesforce / HubSpot** | `/integrate-mcp` | CRM data in deal reviews |
| **Zoom** | `zoom-mcp` | Meeting recording context |
| **Atlassian** | `atlassian-mcp` | Jira/Confluence integration |
| **Todoist / Things** | `todoist-mcp`, `things3-mcp` | Bi-directional task sync |

For Salesforce and HubSpot, use `/integrate-mcp` to find and configure the right MCP server from the Smithery.ai marketplace.

---

## Troubleshooting

<details>
<summary><strong>MCP Servers Not Loading in Kiro</strong></summary>

If you see red error indicators next to MCP server names:

**"No server info found" or Python errors:**
```bash
python3 -m pip install --upgrade pip
pip3 install --user "mcp>=1.0.0,<2.0.0" pyyaml python-dateutil
```
Then restart Kiro completely.

**"Command 'python' not found":**
Open `.kiro/settings/mcp.json` and change `"command": "python"` to `"command": "python3"` (or vice versa on Windows). Restart Kiro.

**VAULT_PATH not set:**
Ensure you've set the `VAULT_PATH` environment variable (Step 2 above) and restarted Kiro after setting it.

</details>

<details>
<summary><strong>Mac: "Command Line Developer Tools" prompt</strong></summary>

If you see a popup asking to install "Command Line Developer Tools":
1. Click **Install** — safe and required for git
2. Wait 2-3 minutes for it to complete
3. Run `./install.sh` again

If you accidentally clicked Cancel: run `xcode-select --install` then retry.

</details>

<details>
<summary><strong>Windows: Python or Git not recognized</strong></summary>

**Python not recognized:**
1. Uninstall Python (Control Panel → Programs)
2. Download fresh from [python.org](https://www.python.org/downloads/)
3. ⚠️ Check "Add Python to PATH" on the first installer screen
4. Restart your terminal
5. Run `./install.sh` again

**Git not recognized:**
1. Download from [git-scm.com/download/win](https://git-scm.com/download/win)
2. Install with default options
3. Restart terminal
4. Run `./install.sh` again

</details>

<details>
<summary><strong>Mac: Calendar empty or wrong dates</strong></summary>

1. Open **Calendar** (Mac's built-in app) → **Calendar menu** → **Add Account** → **Google** → sign in
2. Open **System Settings** → **Privacy & Security** → **Calendars** → turn on **Kiro** → set to **Full** access
3. Restart Kiro

If you installed Python packages manually (not via `./install.sh`): run `pip3 install --user pyobjc-framework-EventKit` then restart Kiro.

Full guide: `06-Resources/Dex_System/Calendar_Setup.md`

</details>

<details>
<summary><strong>Hooks Not Firing</strong></summary>

If meeting notes aren't being auto-processed or context isn't being injected:

1. Check that hook files exist: `.kiro/hooks/*.kiro.hook`
2. In Kiro, go to **Settings** and verify hooks are enabled for the workspace
3. Try manually running `/process-meetings` as a fallback

Note: The backing scripts for context injection are in `.claude/hooks/*.cjs` — these require Node.js to be installed.

</details>

---

## Keeping Dex Updated

```
/dex-update
```

Run this anytime in Kiro chat. It checks for updates, shows what changed, and updates with your confirmation. Your personal customizations in `CLAUDE.md` (the `USER_EXTENSIONS` block) are always preserved.

To undo an update: `/dex-rollback`

---

## System Files

| File | Purpose |
|---|---|
| `AGENTS.md` | Brief overview (auto-loaded by Kiro) |
| `.kiro/steering/` | Full behavioral instructions (auto-loaded) |
| `.kiro/hooks/` | Event-driven automation (auto-triggered) |
| `.kiro/agents/` | Sales subagents (`/deal-reviewer`, etc.) |
| `.kiro/skills/` | Workflow commands (`/daily-plan`, etc.) |
| `.kiro/settings/mcp.json` | MCP server configuration |
| `System/user-profile.yaml` | Your role, preferences, sales config |
| `System/pillars.yaml` | Strategic pillars with keyword lists |
| `CLAUDE.md` | Minimal redirect (full instructions in `.kiro/steering/`) |

---

*Powered by [Claude](https://anthropic.com) · Built for [Amazon Kiro](https://kiro.dev)*
