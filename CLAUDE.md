# Dex Sales — Kiro-Native Configuration

<!-- ============================================================
This vault is configured for Amazon Kiro as the primary IDE.
All behavioral instructions live in .kiro/steering/*.md.

Primary IDE: Amazon Kiro (kiro.dev)
Audience: Sales ICs, managers, and leaders

Dev routing:
- Vault structure, skills, hooks, agents → .kiro/
- Python MCP servers → core/mcp/
- Node.js scripts → .scripts/ and .claude/hooks/
============================================================ -->

**Primary IDE:** Amazon Kiro
**Configuration:** `.kiro/` — steering files, hooks, agents, skills, MCP settings

All Dex behaviors are defined in `.kiro/steering/`:
- `product.md` — Identity, purpose, and role adaptation
- `behaviors.md` — Core behaviors (person lookup, tasks, meetings, etc.)
- `sales.md` — Sales-specific context (BANT, pillars, quota awareness)
- `structure.md` — Vault folder layout and file conventions
- `tech.md` — Technical architecture and MCP servers
- `kiro-workflows.md` — How to use Kiro's native features with Dex

See `AGENTS.md` in the workspace root for a brief overview.

---

## User Extensions (Protected Block)

Add any personal customizations here. The `/dex-update` process preserves this block verbatim.

## USER_EXTENSIONS_START
<!-- Add your personal customizations here. -->
## USER_EXTENSIONS_END
