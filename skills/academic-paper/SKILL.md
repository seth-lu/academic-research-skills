---
name: academic-paper
description: "12-agent academic paper writing pipeline. 11 modes (full/plan/outline/revision/revision-coach/abstract/lit-review/format-convert/citation-check/disclosure/rebuttal-audit). 6 paper types, 5 citation formats, bilingual abstracts, LaTeX/DOCX-via-Pandoc/PDF output. Style Calibration + Writing Quality Check + Source-to-Prose Firewall + Anti-Patterns with IRON RULE markers. Triggers: write paper, academic paper, guide my paper, parse reviews, audit my rebuttal, check my response draft, AI disclosure, 寫論文, 學術論文, 引導我寫論文, 審查意見, 評估回覆."
---

# Academic Paper Codex Entry

This is a Codex plugin entrypoint. The canonical skill implementation lives at
`../../academic-paper/SKILL.md` relative to this file.

When this skill is invoked:

1. Open and follow `../../academic-paper/SKILL.md` as the authoritative instruction set.
2. Resolve all referenced `agents/`, `references/`, `templates/`, and `examples/` paths relative to `../../academic-paper/`.
3. Treat this file only as a packaging shim for Codex skill discovery.
