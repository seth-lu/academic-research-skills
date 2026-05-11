# Local Customizations

This fork adds two project-local customization layers on top of `Imbad0202/academic-research-skills`. See `.claude/CLAUDE.md` § Domain Customizations for details.

## Layers

1. **Privacy Computing × Finance UTD24 layer** (commit `feat(domain): ...`)
   Targets MISQ / ISR / Management Science / INFORMS JoC. Entry point: `/ars-utd24-full`.

2. **Progressive Style Extraction** (commit `feat(style): ...`)
   Four-phase venue-aware writing-style extraction embedded in `academic-paper`'s writing flow. Entry point: `intake_agent` Step 3.5 (exemplar manifest), then L1→L2→L3+4→framework extracted by `structure_architect_agent`, `argument_builder_agent`, and `draft_writer_agent` at each phase.

Both layers are **purely additive** — removing the new files and reverting the appended sections in the modified files restores upstream behavior byte-for-byte.

## Sync workflow

To pull upstream updates and replay local commits on the new base:

```bash
bash scripts/sync-upstream.sh
```

The script:
1. Fetches `upstream/main`
2. Shows you what's new
3. Rebases your local commits on the new upstream HEAD
4. Stops on conflicts so you can resolve

After successful rebase, publish with:

```bash
git push origin main --force-with-lease
```

## Conflict-prone files (8)

All edits in these files are append-only blocks. Conflicts only arise if upstream edits the same anchor lines.

- `MODE_REGISTRY.md`
- `.claude/CLAUDE.md`
- `academic-paper-reviewer/references/top_journals_by_field.md`
- `academic-paper-reviewer/agents/field_analyst_agent.md`
- `academic-paper/references/citation_format_switcher.md`
- `academic-paper/agents/intake_agent.md`
- `academic-pipeline/SKILL.md`
- `shared/style_calibration_protocol.md`

Conflict resolution is almost always "keep both" — your additions go after upstream's.

## Remote setup

```
upstream → https://github.com/Imbad0202/academic-research-skills.git  (fetch only)
origin   → git@github.com:seth-lu/academic-research-skills.git        (your fork)
```
