# Dex Sales — Quick Start

**Up and running in 5 minutes.**

---

## Step 1: Install Kiro

Download **[Amazon Kiro](https://kiro.dev)** and install it. Free during preview.

---

## Step 2: Install prerequisites (one-time)

You need **Git**, **Node.js 18+**, and **Python 3.10+** installed.

| What | Download |
|---|---|
| Git | [git-scm.com](https://git-scm.com) |
| Node.js (LTS) | [nodejs.org](https://nodejs.org) |
| Python 3.10+ | [python.org](https://www.python.org/downloads/) |

> **Windows users:** When installing Python, check ✅ "Add Python to PATH" on the first screen.

---

## Step 3: Get the code

Open Kiro → press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows) → type **Git: Clone** → paste:

```
https://github.com/davekilleen/dex.git
```

Choose a location (Documents works great) and click **Open** when prompted.

---

## Step 4: Run setup (one command)

Open the terminal in Kiro (**View → Terminal**) and run:

**Mac / Linux:**
```bash
./dex-setup.sh
```

**Windows:**
```bat
dex-setup.bat
```

This installs dependencies, configures the MCP servers, and sets everything up automatically. Takes about 60 seconds.

---

## Step 5: Start using Dex

1. **Restart Kiro** (important — picks up the new config)
2. **Open this folder** in Kiro if not already open
3. **Type in chat:**
   ```
   /getting-started
   ```

Dex will ask a few questions about your role and you're off.

---

## What to do next

| Command | When |
|---|---|
| `/daily-plan` | Every morning |
| `/meeting-prep` | Before any customer call |
| `/deal-reviewer` | Before deal review meetings |
| `/pipeline-analyst` | Before forecast calls |
| `/sales-coach` | Before rep 1:1s (managers) |
| `/week-plan` | Monday morning |
| `/week-review` | Friday |

---

## Something not working?

See the **Troubleshooting** section in [README.md](README.md), or type `/health-check` in Kiro chat.
