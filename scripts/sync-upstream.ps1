[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

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
    [PSCustomObject]@{ Cat = "tools";       Name = "design-md";         Url = "https://github.com/google-labs-code/design.md.git" },
    [PSCustomObject]@{ Cat = "tools";       Name = "cli-anything";      Url = "https://github.com/HKUDS/CLI-Anything.git" }
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Mcsock-AI-repo: Syncing $($repos.Count) upstream repositories" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

$tempDir = Join-Path $env:TEMP ("sync_upstream_" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$failures = @()
$updated = 0
try {
    foreach ($r in $repos) {
        $targetDir = Join-Path (Join-Path $base $r.Cat) $r.Name
        $cloneDir = Join-Path $tempDir $r.Name
        $backupDir = Join-Path $tempDir ($r.Name + '.previous')
        $expectedTarget = [IO.Path]::GetFullPath($targetDir)
        if (-not $expectedTarget.StartsWith($base + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
            throw "Upstream target is outside the repository: $targetDir"
        }
        Write-Host "-> Checking $($r.Cat)/$($r.Name) ($($r.Url))..." -ForegroundColor Yellow
        try {
            $localChanges = git -C $base status --porcelain -- "$($r.Cat)/$($r.Name)"
            if ($LASTEXITCODE -ne 0) { throw 'Cannot inspect local changes.' }
            if ($localChanges) { throw 'Local changes must be preserved before syncing this folder.' }
            git clone --depth 1 --quiet $r.Url $cloneDir
            if ($LASTEXITCODE -ne 0 -or -not (Test-Path -LiteralPath (Join-Path $cloneDir '.git'))) {
                throw 'Upstream clone failed. The existing folder was preserved.'
            }
            $commitInfo = git -C $cloneDir log -1 --format="%h | %ci | %s"
            if ($LASTEXITCODE -ne 0) { throw 'Cannot verify upstream commit.' }
            Write-Host "   Latest upstream: $commitInfo" -ForegroundColor Gray
            $gitDirectory = (Resolve-Path -LiteralPath (Join-Path $cloneDir '.git')).ProviderPath
            if ($gitDirectory -ne (Join-Path $cloneDir '.git') -or
                    -not $gitDirectory.StartsWith($tempDir + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
                throw 'Unexpected clone metadata path.'
            }
            Remove-Item -LiteralPath $gitDirectory -Recurse -Force
            if (Test-Path -LiteralPath $targetDir) {
                $resolvedTarget = (Resolve-Path -LiteralPath $targetDir).ProviderPath
                if ($resolvedTarget -ne $expectedTarget -or
                        ((Get-Item -LiteralPath $resolvedTarget -Force).Attributes -band [IO.FileAttributes]::ReparsePoint)) {
                    throw 'Unexpected upstream target path.'
                }
                Move-Item -LiteralPath $resolvedTarget -Destination $backupDir
            }
            Move-Item -LiteralPath $cloneDir -Destination $targetDir
            $updated++
            Write-Host "   [OK] Synced: $($r.Cat)/$($r.Name)" -ForegroundColor Green
        }
        catch {
            if ((Test-Path -LiteralPath $backupDir) -and -not (Test-Path -LiteralPath $targetDir)) {
                Move-Item -LiteralPath $backupDir -Destination $targetDir
            }
            $failures += "$($r.Name): $($_.Exception.Message)"
            Write-Warning $failures[-1]
        }
    }
}
finally {
    # Keep previous copies available for recovery after a completed sync.
    Write-Host "Staging and previous copies: $tempDir" -ForegroundColor Gray
}

Write-Host "Synced $updated/$($repos.Count) upstream repositories." -ForegroundColor Cyan
if ($failures.Count) { throw ($failures -join [Environment]::NewLine) }
