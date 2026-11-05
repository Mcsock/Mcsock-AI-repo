# Skill Discovery Workflow

When no installed skill matches the user's task, search for one online.

## Decision: Should You Search?

Search if ANY of these are true:
- User explicitly asks to find/install a skill
- The task involves a technology/framework with no matching skill
- The task is specialized enough that a dedicated skill would add real value
- User says "is there a skill for X" or "how do I do X"

Do NOT search if:
- A partial match exists (use it instead)
- The task is general coding (no skill needed)
- You've already searched for this topic in this session

## Search Methods (in priority order)

### 1. Skills CLI (Primary)
```bash
npx skills find "<2-3 keywords>"
```
Returns results from skills.sh ecosystem. Install with:
```bash
npx skills add <owner/repo@skill> -g -y
```
- `-g` = global (user-level, all projects)
- `-y` = skip confirmation

### 2. GitHub Search (Fallback)
```bash
gh search repos "claude-code skill <topic>" --limit 5
```

### 3. Plugin Marketplace (if CLI unavailable)
```
/plugin marketplace search <query>
/plugin install <plugin-name>
```

## Search Tips

| User Request | Search Query |
|-------------|-------------|
| "Make my React app faster" | `npx skills find "react performance"` |
| "Help with PR reviews" | `npx skills find "pr review"` |
| "I need a changelog" | `npx skills find "changelog"` |
| "Docker deployment" | `npx skills find "docker deploy"` |
| "GraphQL API" | `npx skills find "graphql"` |
| "Email templates" | `npx skills find "email"` |

Try alternative terms if first search returns nothing: "deploy" → "deployment", "ci-cd", "hosting".

## After Finding a Skill

1. Present the skill name, what it does, and install command
2. Ask user if they want to install
3. Install with `-g -y` flags
4. Restart may be needed for the skill to appear in the skill list
5. Invoke the newly installed skill immediately if possible

## Known Coverage Gaps (No Installed Skill)

These common tasks have no dedicated skill — search online if they come up:

| Gap | Suggested Search |
|-----|-----------------|
| Unit testing (Jest, Vitest) | `npx skills find "jest testing"` or `"vitest"` |
| API design (OpenAPI, REST) | `npx skills find "openapi rest api"` |
| DevOps (Docker, K8s, CI/CD) | `npx skills find "docker deploy ci"` |
| Technical documentation | `npx skills find "docs technical writing"` |
| Analytics/APM setup | `npx skills find "analytics monitoring"` |
| i18n / Localization | `npx skills find "i18n localization"` |
| Task fan-out orchestration | `npx skills add bassimeledath/dispatch -g -y` |

## When Nothing Is Found

1. Acknowledge no skill exists for this task
2. Proceed with general capabilities
3. Suggest creating a custom skill if user does this task often: `npx skills init <name>`
