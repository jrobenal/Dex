---
inclusion: always
---

# Kiro-Native Workflows

## How Dex Uses Kiro's Features

### Steering Files (This Directory)

Steering files in `.kiro/steering/` load automatically every session and give Dex persistent context. You can also manually load any steering file:

- Type `#` in chat → select from the list (e.g., `#tech` to load the tech architecture doc)
- Type `/steering-name` in chat to load a specific file

**Files available:**
- `#product` — Identity, jobs, role adaptation
- `#behaviors` — Core behaviors and MCP tools
- `#sales` — Sales context, BANT, pillars, quota awareness
- `#structure` — Vault layout and file conventions
- `#tech` — Technical architecture (load when troubleshooting)
- `#kiro-workflows` — This file

### Custom Agents (Type `/` in Chat)

Sales-specific subagents that run focused, multi-step workflows:

| Agent | Invoke | What It Does |
|---|---|---|
| **Deal Reviewer** | `/deal-reviewer` | Full MEDDIC/BANT qualification on a specific deal. Reads deal folder, outputs qualification score, gaps, and next actions. |
| **Pipeline Analyst** | `/pipeline-analyst` | Pipeline health across all active deals. Coverage ratio, forecast breakdown, at-risk flags, recommended actions. |
| **Sales Coach** | `/sales-coach` | Coaching session prep for managers. Reads rep activity, surfaces coaching moments, recognition opportunities, and skill gaps. |
| **Account Researcher** | `/account-researcher` | Pre-call research package. Attendee bios, account history, open items, suggested talk tracks. |

These agents have access to your full vault and are optimized for sales workflows. Run them before important meetings or reviews.

### Skills (Type `/` in Chat)

Daily workflow commands:

| Skill | Best For |
|---|---|
| `/daily-plan` | Start the day — surfaces pipeline priorities, meetings, tasks |
| `/daily-review` | End of day — captures wins, learning, tomorrow setup |
| `/week-plan` | Monday morning — set top 3 priorities against pipeline reality |
| `/week-review` | Friday — concrete accomplishments, pipeline progress, patterns |
| `/quarter-plan` | New quarter — quota goal setting, territory strategy |
| `/quarter-review` | End of quarter — QBR prep, wins/losses, next quarter plan |
| `/meeting-prep` | Before any customer call — attendee context, talk tracks, objection prep |
| `/process-meetings` | Process meeting notes — extract BANT, action items, update person pages |
| `/career-coach` | Career development — evidence review, skill gaps, promotion readiness |
| `/project-health` | Deal and account health check across all active projects |
| `/triage` | Clear inbox — route captures, extract tasks |
| `/getting-started` | Onboarding tour — set up integrations and learn the system |

### Hooks (Fire Automatically)

These hooks run without you doing anything:

| Hook | Trigger | What Happens |
|---|---|---|
| **Sales Meeting Auto-Extract** | New file in `00-Inbox/Meetings/` | Auto-extracts BANT, action items, objections, next steps. Flags missing next step. |
| **Person Context Injector** | Editing a meeting note or deal file | Looks up person pages for everyone referenced and injects their context |
| **Company Context Injector** | Editing a meeting note or deal file | Looks up company pages and injects ARR, stage, deal history |
| **Deal Stale Detector** | You ask about pipeline/forecast | Scans for deals with no activity in 14+ days and surfaces them as at-risk |

### Kiro Specs for Deal Planning

Kiro's **Specs** feature (`.kiro/specs/`) is powerful for complex deal planning. Use it for:

- **Major account plans** — requirements (what we need to win) → design (the account strategy) → tasks (execution steps)
- **QBR preparation** — requirements (what the customer needs to see) → design (the narrative) → tasks (data gathering, slide building)
- **Territory plans** — requirements (quota coverage needs) → design (segmentation strategy) → tasks (outreach sequences)

Start a spec session: type "Let's plan the [Account Name] account strategy" in Kiro chat and switch to Spec mode.

### Autopilot vs Supervised Mode

**Autopilot** — Use for:
- Processing meeting notes (`/process-meetings`)
- Running daily/weekly plans
- Batch updating person pages
- Generating reports from existing data

**Supervised** — Use for:
- Creating new deal folders or account pages (review before saving)
- Editing tasks or priorities (high-stakes changes)
- Any operation touching `03-Tasks/Tasks.md` directly

### Context Providers (Type `#` in Chat)

| Context | When to Use |
|---|---|
| `#file` | Include a specific file for analysis (e.g., `#04-Projects/Deals/Acme/account-plan.md`) |
| `#folder` | Include all files in a directory (e.g., `#04-Projects/Deals/Acme/`) |
| `#spec` | Include all files from a Kiro spec |
| `#codebase` | Full vault index — use sparingly, CPU-intensive |
| `#terminal` | Recent terminal output (useful for troubleshooting) |

### MCP Tools (Available in All Interactions)

Work MCP tools you can invoke directly:
- `lookup_person` — Fast person lookup by name
- `build_people_index` — Rebuild the people search index
- `work_mcp_create_task` — Create a task with pillar, priority, and cross-file sync
- `update_task_status` — Complete or update a task everywhere it's referenced

Improvements MCP:
- `capture_idea` — Save a system improvement idea to the backlog
- `get_pending_update_notification` — Check for Dex updates

Career MCP:
- Aggregates evidence from `05-Areas/Career/Evidence/`
- Tracks competency progression over time
