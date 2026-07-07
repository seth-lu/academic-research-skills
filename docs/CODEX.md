# Codex Packaging

This branch packages Academic Research Skills as a Codex plugin while preserving the original
Claude Code plugin files.

## What Changed

- `.codex-plugin/plugin.json` is the Codex plugin manifest.
- `skills/*/SKILL.md` are Codex discovery shims. Each shim points Codex to the canonical top-level
  skill implementation, such as `academic-paper/SKILL.md`.
- `commands/ars-*.md` no longer pin Anthropic model names. Commands inherit the active Codex
  session model.
- `hooks/hooks.json` accepts Codex's `PLUGIN_ROOT` and keeps the old `CLAUDE_PLUGIN_ROOT`
  fallback for the original Claude Code packaging path.

## Local Install

From this repository root:

```powershell
codex plugin marketplace add .
codex plugin add academic-research-skills@academic-research-skills-codex
```

Then start a new Codex thread so the plugin manifest and skill entries are loaded.

## GitHub Install Pattern

After pushing this branch:

```powershell
codex plugin marketplace add <owner>/<repo> --ref codex
codex plugin add academic-research-skills@academic-research-skills-codex
```

Replace `<owner>/<repo>` with the GitHub repository that receives this branch.

## Compatibility Notes

The ARS write-scope guard was designed around Claude Code hook payloads. In Codex, it is kept as an
optional hardening layer and degrades to pass-through if the hook payload shape is not recognized.
The prompt-driven skills and slash commands remain usable without the guard.
