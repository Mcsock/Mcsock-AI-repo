# Skill Chain Recipes

Pre-built multi-skill sequences for common workflows. Invoke skills in the listed order.

## Feature Development (New Feature)

```
1. superpowers:brainstorming          → understand scope, get design approval
2. superpowers:writing-plans          → create implementation plan
3. superpowers:executing-plans        → execute with checkpoints
   └─ Per-step: domain skills below
4. superpowers:verification-before-completion → prove it works
5. superpowers:requesting-code-review → final review
6. commit-commands:commit-push-pr     → ship it
```

## UI Build (Component/Page)

```
1. superpowers:brainstorming          → understand what to build
2. design-system                      → load project tokens (if project has one)
3. impeccable:frontend-design         → build the UI
4. react-best-practices               → verify React patterns (if React)
5. impeccable:polish                  → final detail pass
6. superpowers:verification-before-completion → verify
```

## UI Review/QA

```
1. impeccable:audit                   → comprehensive issue scan
2. impeccable:critique                → UX effectiveness
3. impeccable:harden                  → error/edge case resilience
4. impeccable:polish                  → final fixes
```

## Bug Fix

```
1. superpowers:systematic-debugging   → root cause investigation (THE IRON LAW)
2. [domain skill for the area]        → react-best-practices, next-best-practices, etc.
3. superpowers:verification-before-completion → prove the fix works
4. commit-commands:commit             → commit the fix
```

## Landing Page / Marketing

```
1. superpowers:brainstorming          → scope and messaging
2. copywriting                        → write the copy
3. impeccable:frontend-design         → build the page
4. seo-geo                            → optimize for search + AI engines
5. impeccable:polish                  → final pass
```

## Pitch Deck

```
1. superpowers:brainstorming          → narrative structure
2. pitch-deck-visuals                 → slide framework and data viz
3. pptx                               → build the .pptx file
4. presentation-master                → design polish (if applicable)
```

## Deploy

```
1. superpowers:verification-before-completion → prove build passes
2. commit-commands:commit-push-pr     → commit + push + PR
3. vercel:deploy                      → deploy to production
```

## Document Creation

```
1. [file-type skill]                  → pdf, docx, xlsx, pptx
2. theme-factory                      → apply styling (optional)
```

## Research

```
1. web-search OR firecrawl            → gather information
2. [platform skill]                   → twitter, reddit, producthunt (if specific)
3. requesthunt                        → demand analysis (if applicable)
```

## Design System Work

```
1. design-system                      → load current tokens
2. impeccable:extract                 → identify reusable patterns
3. impeccable:normalize               → ensure consistency
4. impeccable:teach-impeccable        → persist context (one-time)
```

## Mobile App

```
1. superpowers:brainstorming          → scope
2. sleek-design-mobile-apps           → design screens (if Sleek)
   OR swiftui-pro                     → SwiftUI implementation
3. impeccable:adapt                   → responsive/device adaptation
```

## Image/Media Creation

```
1. ai-image-generation                → generate images (primary)
   OR logo-creator                    → logos specifically
   OR banner-creator                  → banners specifically
2. image-enhancer                     → upscale/sharpen (optional)
```

## MCP/API Development

```
1. superpowers:brainstorming          → scope the integration
2. document-skills:mcp-builder        → build the MCP server
   OR claude-api                      → Claude API integration
   OR claude-cookbooks                → agent SDK patterns
3. superpowers:verification-before-completion → verify
```

## Automation (n8n)

```
1. n8n-workflow-patterns              → choose architecture
2. n8n-mcp-tools-expert               → use MCP tools
3. n8n-code-javascript OR n8n-code-python → write code nodes
4. n8n-expression-syntax              → validate expressions
5. n8n-validation-expert              → fix validation errors
```

## Figma → Code

```
1. figma:implement-design             → translate design to code
2. design-system                      → map to project tokens
3. impeccable:frontend-design         → polish implementation
4. impeccable:normalize               → ensure consistency
```

## Skill Creation

```
1. document-skills:skill-creator      → follow the skill creation guide
2. superpowers:writing-skills         → verify skill structure
```

---

## Chain Selection Heuristic

If unsure which chain applies, ask: **What is the primary deliverable?**

| Deliverable | Chain |
|-------------|-------|
| Working code (feature) | Feature Development |
| Visual component/page | UI Build |
| Fixed bug | Bug Fix |
| .pdf/.docx/.pptx/.xlsx file | Document Creation |
| Deployed app | Deploy |
| Design improvements | UI Review/QA |
| Information/analysis | Research |
| Image/logo/banner | Image/Media Creation |
