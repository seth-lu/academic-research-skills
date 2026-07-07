---
name: academic-paper-reviewer
description: "Multi-perspective academic paper review with dynamic reviewer personas. Simulates 5 independent reviewers (EIC + 3 peer reviewers + Devil's Advocate) with field-specific expertise. Supports full review, re-review (verification), quick assessment, methodology focus, Socratic guided, and calibration modes. Triggers on: review paper, peer review, manuscript review, referee report, review my paper, critique paper, simulate review, editorial review, calibrate reviewer, reviewer calibration, measure reviewer accuracy."
---

# Academic Paper Reviewer Codex Entry

This is a Codex plugin entrypoint. The canonical skill implementation lives at
`../../academic-paper-reviewer/SKILL.md` relative to this file.

When this skill is invoked:

1. Open and follow `../../academic-paper-reviewer/SKILL.md` as the authoritative instruction set.
2. Resolve all referenced `agents/`, `references/`, `templates/`, and `examples/` paths relative to `../../academic-paper-reviewer/`.
3. Treat this file only as a packaging shim for Codex skill discovery.
