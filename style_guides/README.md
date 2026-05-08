# Style Guides

This directory holds **venue-specific writing-thinking guides** produced by `/ars-style-extract`. Each guide is a markdown reasoning model — not a static rule list — extracted from user-supplied exemplar papers.

These guides fill the **Priority 2** slot of `shared/style_calibration_protocol.md` (target journal conventions). They are consumed by `academic-paper/agents/draft_writer_agent` during initial drafting and by `commands/ars-restyle.md` for post-draft style alignment.

## What lives here

Files matching the convention:

```
<journal-slug>_<topic-slug>_<YYYY-MM-DD>.md
```

Examples (none ship with the repo — produce yours):

- `management-science_privacy-finance_2026-05-08.md`
- `misq_dsr-fintech_2026-05-08.md`
- `informs-joc_mpc-protocols_2026-05-08.md`
- `isr_econ-modeling_2026-05-08.md`

Each guide conforms to `shared/contracts/style_thinking_guide.schema.md`.

## What does NOT live here

- **No pre-shipped guides.** The whole point of `/ars-style-extract` is that YOU choose the exemplars and the resulting reasoning model reflects YOUR target. A pre-shipped MS guide would defeat the design.
- **No exemplar PDFs.** Copyrighted; not redistributable. Keep them in your own KB / Zotero library and pass paths to `/ars-style-extract`.
- **No `restyle_diff_*.md` files.** Those go alongside the draft they were applied to, not here.

## How to produce your first guide

1. Pick 2–3 papers published in your target venue on a topic close to yours. More exemplars → higher confidence; aim for ≥3 for HIGH confidence.
2. Have the PDFs accessible at known paths.
3. Run:

```
/ars-style-extract <pdf1.pdf> <pdf2.pdf> <pdf3.pdf> "Management Science" "privacy computing in financial markets"
```

4. Review the produced guide at `style_guides/management-science_<topic>_<date>.md`.
5. **Edit it if you disagree.** The guide is your model of MS style — argue with it. Strengthen weak rationales, demote rules you find wrong, add Open Questions.
6. Use the guide for drafting (auto-loaded if present at pipeline start) or polishing (`/ars-restyle <draft> <guide>`).

## How guides are reused

- **Across drafts**: One MS guide drives multiple papers targeting MS. The reasoning is venue-level, not topic-level (though `topic_scope` narrows applicability).
- **Across versions**: Edit the guide as you learn more about the venue. Increment version (0.1 → 0.2 → 1.0) and add a row to the Versioning table.
- **Across collaborators**: Check guides into git. Co-authors' edits to the guide accumulate the team's understanding of venue conventions.

## When to refresh

| Trigger | Action |
|---|---|
| New year | Re-extract — venue style drifts; check for new editorial conventions |
| New EIC at the journal | Re-extract — house style often shifts with leadership |
| Your topic shifts substantially | Produce a new guide with `topic_scope` matching new topic |
| Reviewer feedback contradicts a guide rule | Edit the contradicted rule with the reviewer's evidence |
| Confidence is LOW and you've added new exemplars | Re-extract |

## How guides plug into the pipeline

```
intake_agent Phase 0 Step 9.5
   │ asks "venue exemplars?"; runs /ars-style-extract if yes
   ▼
draft_writer_agent in Stage 2
   │ loads guide via shared/style_calibration_protocol.md § Priority 2
   ▼
Stage 3-4' reviewer / revision loop
   │ may produce reviewer comments mentioning style/clarity
   ▼
Stage 4.3 STYLE ALIGNMENT (optional, auto-suggested)
   │ orchestrator invokes /ars-restyle <draft> <guide>
   │ user accepts paragraph-by-paragraph
   ▼
Stage 4.5 final integrity (re-runs to catch any drift)
```

Standalone use (no pipeline) is always available:

```
/ars-restyle <draft.md> <style_guides/management-science_*.md>
```

## Quality conventions

When editing a guide manually, keep:

- Every rule in Per-Section Move Patterns has a *why* in the reasoning column.
- Every rule in Author Choice Rubrics has a stable `G-MR-N` ID.
- Every forbidden vocabulary item has a reasoning beyond "AI-sounding".
- Open Questions section lists genuine conflicts/ambiguities, not nitpicks.
- Versioning table is current.

`/ars-restyle` validates the guide against the schema before consuming it. Malformed guides are rejected with a pointer to fix or re-extract.

## Cross-references

- Producer command: `commands/ars-style-extract.md`
- Consumer command: `commands/ars-restyle.md`
- Schema: `shared/contracts/style_thinking_guide.schema.md`
- Move taxonomy: `shared/references/rhetorical_move_taxonomy.md`
- Priority hierarchy: `shared/style_calibration_protocol.md` § Priority 2 Implementation
- Pipeline integration points:
  - `academic-paper/agents/intake_agent.md` § Step 9.5 (extract)
  - `academic-pipeline/SKILL.md` § Stage 4.3 (restyle)
