# Skill Precedence Rules

When multiple skills cover the same functionality, use the **winner**. Never invoke both.

## Design Skills (18 overlapping)

| Skill | Sources | Winner |
|-------|---------|--------|
| frontend-design | standalone, `impeccable:`, `document-skills:`, `example-skills:` | **`impeccable:frontend-design`** |
| audit | standalone, `impeccable:` | **`impeccable:audit`** |
| polish | standalone, `impeccable:` | **`impeccable:polish`** |
| critique | standalone, `impeccable:` | **`impeccable:critique`** |
| animate | standalone, `impeccable:` | **`impeccable:animate`** |
| adapt | standalone, `impeccable:` | **`impeccable:adapt`** |
| bolder | standalone, `impeccable:` | **`impeccable:bolder`** |
| quieter | standalone, `impeccable:` | **`impeccable:quieter`** |
| colorize | standalone, `impeccable:` | **`impeccable:colorize`** |
| clarify | standalone, `impeccable:` | **`impeccable:clarify`** |
| delight | standalone, `impeccable:` | **`impeccable:delight`** |
| distill | standalone, `impeccable:` | **`impeccable:distill`** |
| extract | standalone, `impeccable:` | **`impeccable:extract`** |
| harden | standalone, `impeccable:` | **`impeccable:harden`** |
| normalize | standalone, `impeccable:` | **`impeccable:normalize`** |
| onboard | standalone, `impeccable:` | **`impeccable:onboard`** |
| optimize | standalone, `impeccable:` | **`impeccable:optimize`** |
| teach-impeccable | standalone, `impeccable:` | **`impeccable:teach-impeccable`** |

**Rule: `impeccable:*` always wins for design skills.**

## Document Skills (16 overlapping)

| Skill | Sources | Winner |
|-------|---------|--------|
| pdf | standalone, `document-skills:`, `example-skills:` | **`pdf`** (standalone) |
| pptx | standalone, `document-skills:`, `example-skills:` | **`pptx`** (standalone) |
| docx | `document-skills:`, `example-skills:` | **`document-skills:docx`** |
| xlsx | `document-skills:`, `example-skills:` | **`document-skills:xlsx`** |
| canvas-design | standalone, `document-skills:`, `example-skills:` | **`canvas-design`** (standalone) |
| brand-guidelines | standalone, `document-skills:`, `example-skills:` | **`brand-guidelines`** (standalone) |
| theme-factory | standalone, `document-skills:`, `example-skills:` | **`theme-factory`** (standalone) |
| webapp-testing | `document-skills:`, `example-skills:` | **`document-skills:webapp-testing`** |
| skill-creator | `document-skills:`, `example-skills:` | **`document-skills:skill-creator`** |
| mcp-builder | `document-skills:`, `example-skills:` | **`document-skills:mcp-builder`** |
| web-artifacts-builder | `document-skills:`, `example-skills:` | **`document-skills:web-artifacts-builder`** |
| algorithmic-art | `document-skills:`, `example-skills:` | **`document-skills:algorithmic-art`** |
| slack-gif-creator | `document-skills:`, `example-skills:` | **`document-skills:slack-gif-creator`** |
| doc-coauthoring | `document-skills:`, `example-skills:` | **`document-skills:doc-coauthoring`** |
| internal-comms | `document-skills:`, `example-skills:` | **`document-skills:internal-comms`** |
| frontend-design | `document-skills:`, `example-skills:` | Use **`impeccable:frontend-design`** instead |

**Rule: standalone wins over `document-skills:` wins over `example-skills:`. Never invoke `example-skills:*`.**

## Process Skills (6 overlapping)

| Skill | Sources | Winner |
|-------|---------|--------|
| systematic-debugging | standalone, `superpowers:` | **`superpowers:systematic-debugging`** |
| requesting-code-review | standalone, `superpowers:` | **`superpowers:requesting-code-review`** |
| brainstorming | `superpowers:` only | **`superpowers:brainstorming`** |
| writing-plans | `superpowers:` only | **`superpowers:writing-plans`** |
| executing-plans | `superpowers:` only | **`superpowers:executing-plans`** |
| verification-before-completion | `superpowers:` only | **`superpowers:verification-before-completion`** |

**Rule: `superpowers:*` always wins for process skills.**

## React/Performance (3 overlapping)

| Skill | Notes | Winner |
|-------|-------|--------|
| react-best-practices | standalone | **Use this one** |
| vercel-react-best-practices | identical content | Skip (duplicate) |
| next-best-practices | Next.js-specific | Use alongside react-best-practices when in Next.js |

## Deploy (2 overlapping)

| Skill | Sources | Winner |
|-------|---------|--------|
| vercel:deploy | `vercel:` plugin, standalone `vercel:deploy` | **`vercel:deploy`** (either — same) |
| vercel:setup | same | **`vercel:setup`** |
| vercel:logs | same | **`vercel:logs`** |

## Testing (4 overlapping)

| Skill | Best Use |
|-------|----------|
| playwright-skill | **Primary** — full browser automation with dev server detection |
| playwright-cli | CLI automation only (subset) |
| playwright-best-practices | Reference guide, invoke alongside playwright-skill |
| document-skills:webapp-testing | Use playwright-skill instead |

## Image Generation (3 overlapping)

| Skill | Best Use |
|-------|----------|
| ai-image-generation | **Primary** — 50+ models, most capable |
| nanobanana | Gemini-only image gen (subset) |
| image-enhancer | Enhancement only (not generation) — complementary |

## UI Design Intelligence (overlapping)

| Skill | Best Use |
|-------|----------|
| `impeccable:frontend-design` | **Primary for implementation** |
| `ui-ux-pro-max` | **Primary for design system decisions** (palettes, fonts, styles) |
| `superdesign` | Alternative to impeccable for draft-based workflow |
| `refero-design` | Research-first approach using Refero MCP |

Use `impeccable:frontend-design` for building. Use `ui-ux-pro-max` for design intelligence queries.

## Commit/Git (overlapping)

| Skill | Best Use |
|-------|----------|
| `commit-commands:commit` | Simple commit only |
| `commit-commands:commit-push-pr` | **Primary** — commit + push + PR in one |
| `commit-commands:clean_gone` | Branch cleanup only |
| `superpowers:finishing-a-development-branch` | End-of-branch decisions (merge vs PR vs cleanup) |
