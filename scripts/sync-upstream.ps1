<#
.SYNOPSIS
    Sync and check latest upstream updates for all 18 repositories in Mcsock-AI-repo.
.DESCRIPTION
    Fetches the latest commits from all 18 upstream GitHub repositories, displays commit
    SHA and timestamp, and updates the corresponding folders in the monorepo.
#>

[CmdletBinding()]
param()

$env:PATH = "C:\Program Files\Git\cmd;C:\Program Files\GitHub CLI;" + $env:PATH
$base = Split-Path -Parent $PSScriptRoot

$repos = @(
    [PSCustomObject]@{ Cat = "skills";      Name = "karpathy-skills";   Url = "https://github.com/multica-ai/andrej-karpathy-skills.git" },
    [PSCustomObject]@{ Cat = "skills";      Name = "replica-skills";    Url = "https://github.com/Jakeschincariol/replica-skill.git" },
    [PSCustomObject]@{ Cat = "skills";      Name = "spec-kit";          Url = "https://github.com/github/spec-kit.git" },
    [PSCustomObject]@{ Cat = "skills";      Name = "universal-modder";  Url = "https://github.com/rehan-remade/universal-modder.git" },
    [PSCustomObject]@{ Cat = "skills";      Name = "mattpocock-skills"; Url = "https://github.com/mattpocock/skills.git" },
    [PSCustomObject]@{ Cat = "skills";      Name = "fable-5-skills";    Url = "https://github.com/kpab/claude-fable-5-skills.git" },
    [PSCustomObject]@{ Cat = "skills";      Name = "ui-ux-pro-max";     Url = "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git" },
    [PSCustomObject]@{ Cat = "mcp-servers"; Name = "context7";          Url = "https://github.com/upstash/context7.git" },
    [PSCustomObject]@{ Cat = "mcp-servers"; Name = "chrome-devtools";   Url = "https://github.com/ChromeDevTools/chrome-devtools-mcp.git" },
    [PSCustomObject]@{ Cat = "mcp-servers"; Name = "rea";               Url = "https://github.com/morluto/rea.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "graphify";          Url = "https://github.com/Graphify-Labs/graphify.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "agent-reach";       Url = "https://github.com/Panniantong/Agent-Reach.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "skillspector";      Url = "https://github.com/NVIDIA/SkillSpector.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "ponytail";          Url = "https://github.com/DietrichGebert/ponytail.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "skill-autopilot";   Url = "https://github.com/deepshal99/skill-autopilot.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "agent-desktop";     Url = "https://github.com/vercel-labs/agent-desktop.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "auto-ontology";     Url = "https://github.com/NVIDIA/auto-ontology.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "design-md";         Url = "https://github.com/google-labs-code/design.md.git" }
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Mcsock-AI-repo: Syncing 18 upstream repositories" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

$tempDir = Join-Path $env:TEMP ("sync_upstream_" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

try {
    foreach ($r in $repos) {
        $targetDir = Join-Path (Join-Path $base $r.Cat) $r.Name
        $cloneDir = Join-Path $tempDir $r.Name
        Write-Host "-> Checking $($r.Cat)/$($r.Name) ($($r.Url))..." -ForegroundColor Yellow
        git clone --depth 1 $r.Url $cloneDir 2>$null
        if (Test-Path "$cloneDir\.git") {
            $commitInfo = git -C $cloneDir log -1 --format="%h | %ci | %s"
            Write-Host "   Latest upstream: $commitInfo" -ForegroundColor Gray
            Remove-Item -Recurse -Force "$cloneDir\.git"
        }
        if (Test-Path $targetDir) {
            Remove-Item -Recurse -Force $targetDir
        }
        Copy-Item -Recurse -Force $cloneDir $targetDir
        Write-Host "   [OK] Synced: $($r.Cat)/$($r.Name)" -ForegroundColor Green
    }
}
finally {
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
    }
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  All 18 repositories are synced to latest upstream!" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
