# Skill Autopilot

**Universal skill router for Claude Code.** Automatically matches every user message to the best installed skill, resolves duplicates, chains multi-skill workflows, and discovers missing skills online.

## Install

```bash
npx skills add deepshal99/skill-autopilot -g
```

Or manually:

```bash
git clone https://github.com/deepshal99/skill-autopilot.git ~/.claude/skills/skill-autopilot
```

## What It Does

Skill Autopilot runs on **every message in every project**. It:

1. **Classifies intent** — reads user message, identifies what they're trying to do
2. **Matches skills** — finds the best installed skill(s) for the task
3. **Resolves duplicates** — picks the winner when multiple skills overlap (e.g., 4 versions of `frontend-design`)
4. **Chains workflows** — invokes skills in the correct order (Process → Domain → Quality → Ship)
5. **Discovers missing skills** — searches online via `npx skills find` when nothing matches

## Why You Need This

If you have more than 10 skills installed, you've probably experienced:

- **Duplicate invocations** — Claude calls `example-skills:pdf` when it should use `pdf` (standalone)
- **Wrong skill order** — jumping to `frontend-design` without `brainstorming` first
- **Missed skills** — Claude doesn't invoke a relevant skill because it didn't match the description
- **No discovery** — when no skill exists for a task, Claude doesn't search for one

Skill Autopilot fixes all of these.

## Structure

```
skill-autopilot/
├── SKILL.md                          # Core routing algorithm (155 lines)
└── references/
    ├── precedence.md                 # Duplicate resolution rules
    ├── chains.md                     # 15 pre-built multi-skill workflows
    └── discovery.md                  # Online skill search workflow
```

## How It Works

### Intent Classification

Every message is classified against a signal table:

| Signal | Intent |
|--------|--------|
| build, create, design, UI, layout | Create UI |
| fix, bug, error, broken, crash | Debug |
| plan, architect, complex, multi-step | Plan |
| commit, push, PR, deploy, ship | Ship |
| pdf, docx, pptx, xlsx | Documents |
| ... | [25+ categories] |

### Duplicate Resolution

When multiple skills cover the same thing, Autopilot picks the winner:

- `impeccable:*` > standalone > `document-skills:*` > `example-skills:*` (design)
- `superpowers:*` > standalone (process skills)
- Standalone > `document-skills:*` > `example-skills:*` (documents)

Full precedence table in `references/precedence.md`.

### Skill Chains

Complex tasks need multiple skills in sequence:

```
Feature Development:
  brainstorming → writing-plans → executing-plans → verification → commit

UI Build:
  brainstorming → design-system → frontend-design → react-best-practices → polish

Bug Fix:
  systematic-debugging → [domain skill] → verification → commit
```

15 complete recipes in `references/chains.md`.

### Online Discovery

When no installed skill matches:

```bash
npx skills find "<query>"        # Search skills.sh
npx skills add <pkg> -g -y      # Install globally
```

Includes a table of known gaps with suggested search queries.

## Complements Using-Superpowers

This skill works alongside `superpowers:using-superpowers`, not against it. Using-superpowers says "check skills before responding." Skill Autopilot tells you **which** skills to check and **in what order**.

## Global Setup

Add to `~/.claude/CLAUDE.md` for enforcement across all projects:

```markdown
## Skill Autopilot (MANDATORY)

On every user message, run the skill-autopilot routing logic:
1. Classify intent
2. Resolve duplicates (impeccable:* > standalone > document-skills:* > example-skills:*)
3. Chain skills: Process → Domain → Quality → Ship
4. If no match: search online via `npx skills find`
```

## License

MIT
