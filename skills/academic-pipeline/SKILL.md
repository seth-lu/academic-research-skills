---
name: academic-pipeline
description: "Orchestrator for the full academic research pipeline: research -> write -> integrity check -> review -> revise -> re-review -> re-revise -> final integrity check -> finalize. Coordinates deep-research, academic-paper, and academic-paper-reviewer into a seamless 10-stage workflow with mandatory integrity verification, two-stage peer review, and reproducible quality gates. Triggers on: academic pipeline, research to paper, full paper workflow, paper pipeline, end-to-end paper, research-to-publication, complete paper workflow."
---

# Academic Pipeline Codex Entry

This is a Codex plugin entrypoint. The canonical skill implementation lives at
`../../academic-pipeline/SKILL.md` relative to this file.

When this skill is invoked:

1. Open and follow `../../academic-pipeline/SKILL.md` as the authoritative instruction set.
2. Resolve all referenced `agents/`, `references/`, `templates/`, and `examples/` paths relative to `../../academic-pipeline/`.
3. Treat this file only as a packaging shim for Codex skill discovery.
