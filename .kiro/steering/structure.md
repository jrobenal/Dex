---
inclusion: always
---

# Vault Structure and File Conventions

## Folder Layout (PARA Method)

Dex uses PARA: Projects (time-bound), Areas (ongoing), Resources (reference), Archives (historical).

```
00-Inbox/           Capture zone — meetings, ideas, unprocessed notes
  Meetings/         Raw meeting notes (auto-processed by hook or /process-meetings)
  Ideas/            Quick captures
01-Quarter_Goals/   Quarterly quota targets and strategic goals
02-Week_Priorities/ Weekly top 3 priorities
03-Tasks/           Master task backlog (Tasks.md — Work MCP syncs here)
04-Projects/        Active deals and time-bound projects
  Deals/            One subfolder per active deal (e.g., 04-Projects/Deals/Acme_Corp/)
05-Areas/           Ongoing responsibilities
  People/
    Internal/       Teammates, managers, direct reports (same email domain)
    External/       Prospects, customers, partners, advisors (different domain)
  Companies/        Account pages (customers, prospects, partners, competitors)
  Career/           Career development (optional — created via /career-setup)
06-Resources/       Reference material
  Competitive/      Competitor battle cards and win/loss analysis
  Playbooks/        Sales playbooks (discovery, objection handling, exec selling)
  Dex_System/       System documentation (auto-maintained)
07-Archives/        Closed deals, completed projects, past accounts
System/             Configuration files (not for notes)
  user-profile.yaml
  pillars.yaml
  Templates/
  Session_Learnings/
```

## Sales-Specific Folder Conventions

- **Active deal** → `04-Projects/Deals/<AccountName>/` — one folder per deal, contains account plan, meeting notes, proposals
- **Named account** → `05-Areas/Companies/<CompanyName>.md` — includes ARR, stage, key contacts, deal history
- **Competitor** → `06-Resources/Competitive/<CompetitorName>.md` — battle card, win/loss patterns, objections
- **Sales playbook** → `06-Resources/Playbooks/<PlaybookName>.md` — discovery framework, objection handling, exec selling guide
- **Closed deal** → move from `04-Projects/Deals/` to `07-Archives/Deals/` with close date and outcome

## File Naming Conventions

- **Date format:** `YYYY-MM-DD`
- **Meeting notes:** `YYYY-MM-DD - Meeting Topic.md` → saved to `00-Inbox/Meetings/`
- **Person pages:** `Firstname_Lastname.md` → saved to `05-Areas/People/Internal/` or `External/`
- **Company/account pages:** `Company_Name.md` → saved to `05-Areas/Companies/`
- **Career skill tags:** Add `# Career: [skill]` to tasks/goals that develop specific skills

## People Page Routing

Person pages are automatically routed to Internal or External based on email domain:
- **Internal/** — Email domain matches your company domain (set in `System/user-profile.yaml` → `email_domain`)
- **External/** — Any other domain (prospects, customers, partners, advisors)

## Planning Hierarchy

```
Pillars (ongoing focus areas, 6-12 months)
  → Quarter Goals (quota targets, strategic OKRs)
    → Week Priorities (Top 3 this week)
      → Daily Plans (today's focus)
        → Tasks (specific follow-ups and actions)
```

Key files:
- `System/pillars.yaml` — Strategic pillars with keyword lists
- `01-Quarter_Goals/Quarter_Goals.md` — Quota and quarterly OKRs
- `02-Week_Priorities/Week_Priorities.md` — Weekly top 3
- `03-Tasks/Tasks.md` — Full task backlog (Work MCP syncs here)

## Task ID Format

Tasks created via Work MCP get a unique ID: `^task-YYYYMMDD-XXX`

Example: `Follow up with Acme on pricing ^task-20260316-001 # Career: Deal Execution`

This ID enables cross-file sync — completing a task here updates person pages, meeting notes, and project files automatically.
