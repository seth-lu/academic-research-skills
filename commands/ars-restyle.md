---
description: Stage 2 of the Style Reasoning Pipeline. Applies a style thinking guide to a draft, producing per-paragraph diff + rationale citing which guide rule motivated each suggestion. Dual-mode (standalone or pipeline-invoked from Stage 4.3).
model: opus
---

Apply a venue-specific writing-thinking guide to a draft. Produces per-paragraph diff + rationale, with the user accepting or rejecting each paragraph individually.

## When to use

- **Standalone**: user has an existing draft and a guide produced by `/ars-style-extract`. Wants to align the draft to venue style without going through the full pipeline.
- **Pipeline-invoked**: orchestrator triggers at Stage 4.3 when (a) a guide exists in passport AND (b) reviewer comments mention clarity/style/exposition.

## Inputs

| Field | Required | Description |
|---|---|---|
| `draft_path` | yes | Path to draft file (.md / .docx / .tex). |
| `guide_path` | yes | Path to a style_guides/<name>.md produced by `/ars-style-extract`. |
| `mode` | no | `interactive` (default) / `roadmap-only` / `apply-all`. |
| `output_dir` | no | Where to write the diff file. Default: same dir as draft. |
| `pipeline_mode` | no | `false` (default) / `true`. Pipeline mode writes diff metadata back to passport. |

## Mode definitions

- **`interactive`**: walks through each paragraph with the user; user accepts / rejects / modifies each suggestion; accepted versions written back to draft as in-place edits.
- **`roadmap-only`**: produces the diff file without touching the draft. User reads it and rewrites manually. Use this when user wants to learn from suggestions without auto-applying.
- **`apply-all`**: applies every suggestion automatically, no per-paragraph approval. Use only when user has already reviewed the diff once in `roadmap-only` and wants to apply.

Default is `interactive` because the whole point of the pipeline is user-controllable rewriting, not black-box editing.

## Protocol

### Phase 0 — Schema check

Validate the loaded guide against `shared/contracts/style_thinking_guide.schema.md` § Schema enforcement checklist (11 checks). If any fail:

```
[STYLE-GUIDE-INVALID] Missing or malformed: <field>.
Re-run /ars-style-extract or fix the guide manually at <path>.
```

ABORT — do not proceed to draft analysis.

If guide's `Anti-mimicry audit` field is FAILED (rather than PASSED): abort unless user passes `--allow-failed-audit` flag. Failed-audit guides are too surface-oriented to give useful suggestions.

### Phase A — Draft annotation

Walk the draft section-by-section, paragraph-by-paragraph. For each paragraph, emit:

```yaml
section: <section-name as it appears in draft>
position: <paragraph-index-within-section>
current_primary_move: <ID from rhetorical_move_taxonomy.md>
current_secondary_moves: [<up to 2 IDs>]
current_logic_chain_position: "<one sentence: what role this ¶ plays in the section's argument>"
current_vocabulary_signals:
  hedges: [<list>]
  boosters: [<list>]
  reporting_verbs: [<list>]
  transitions: [<list>]
  citations: {narrative: N, parenthetical: N}
word_count: N
```

Same closed-vocabulary rule as `/ars-style-extract`: paragraphs that don't classify above 60% confidence are flagged `UNCLASSIFIED` and surfaced to the user as "this paragraph doesn't match any standard rhetorical move — consider whether it should be split, merged, or repurposed."

### Phase B — Gap analysis

For each draft paragraph, look up the guide's expectation for this section + position. Compute the gap on three axes:

1. **Move mismatch** (axis A): draft does Move-X, guide says default at this position is Move-Y.
2. **Sub-move missing** (axis B): right move, but skips an essential sub-component the guide flags.
3. **Vocabulary / hedging drift** (axis C): paragraph realizes the right move but uses forbidden phrases or wrong hedge density.

Compute a **gap score** per paragraph: 0 (perfect alignment) to 1 (complete mismatch). The score determines the rewrite proposal scope.

### Phase C — Rewrite proposal

For each paragraph with gap score > 0.1, generate a rewrite proposal containing:

```markdown
### Paragraph N (Section: <section>, Position: <position>)

**Current move**: M-X (<name>)
**Guide default**: M-Y (<name>) at this position
**Gap axes triggered**: A (move mismatch), C (vocabulary)

**Original**:
> <draft paragraph text>

**Proposed**:
> <rewritten paragraph text>

**Rationale**:
- Rule G-MR-3 from guide § Per-Section Move Patterns: "<rule body verbatim>"
- Rule G-MR-7 from guide § Vocabulary: "<rule body verbatim>"
- Word-count delta: -23 words (within 5% of original)
- Move change: M-X → M-Y at position <position>

**Reviewer-facing impact**: <one sentence on what reviewer concern this addresses>
```

Every rationale MUST cite a specific guide rule by ID. If a suggestion cannot cite a rule, it should not be made.

### Phase D — Anti-overreach guard

Before emitting the diff, compute the **rewrite ratio** per paragraph: `(words changed) / (original word count)`.

- **ratio ≤ 0.4**: emit normally
- **0.4 < ratio ≤ 0.6**: emit with warning flag `[HEAVY-REWRITE]`
- **ratio > 0.6**: DO NOT emit the rewrite. Instead emit a flag:

```markdown
### Paragraph N — FLAGGED FOR USER REVIEW

This paragraph requires more than 60% rewrite to align with the guide. At this
ratio, automated rewrite likely changes your argument, not just the style.
Recommendation: rewrite manually, OR reconsider whether this paragraph should
be split / merged / removed.

**Identified gaps**: [list]
**Cannot safely propose**: rewrite would substitute argument
```

The user can override with `--accept-heavy-rewrites` flag, but the default is to flag-and-ask.

### Phase E — Output

1. Write `restyle_diff_<draft-stem>_<YYYY-MM-DD>.md` to `output_dir`. Structure:
   - Header: draft path, guide path, gap score summary (mean / max / count of paragraphs with gap > 0.1)
   - Per-paragraph diffs in section order
   - Footer: "How to apply" section listing the modes (interactive/roadmap-only/apply-all)

2. **Interactive mode**: walk the user through each paragraph with the diff visible. Accept (write to draft), reject (skip), modify (user edits proposed version). Persist user choices to `restyle_session_<date>.log` for resume.

3. **Pipeline-mode hook**: if `pipeline_mode=true`, additionally write to passport:
   ```yaml
   style_alignment_artifact:
     guide_path: <path>
     diff_path: <path>
     accepted_count: N
     rejected_count: N
     modified_count: N
     unflagged_count: N
     heavy_rewrite_flagged: N
     timestamp: <ISO-8601>
   ```
   Then signal Stage 4.5 (final integrity) to re-check citations and factual claims for drift. Per-paragraph rewrites can introduce subtle citation re-attribution or claim weakening that integrity must catch.

## Failure paths

- **Guide schema invalid**: see Phase 0.
- **Draft format unsupported**: only .md / .tex / .docx supported. .pdf input rejected — ask user to convert to .md first.
- **Gap analysis produces zero suggestions**: report to user "Your draft already aligns well with the guide (mean gap score: <N>). No suggestions." Exit success.
- **>50% of paragraphs UNCLASSIFIED**: stop. Either the draft is structurally unusual (chat-format, slide-format, etc.) or the move taxonomy needs extension. Report to user.

## Cross-references

- Move taxonomy: `shared/references/rhetorical_move_taxonomy.md`
- Guide schema: `shared/contracts/style_thinking_guide.schema.md`
- Producer of input guide: `commands/ars-style-extract.md`
- Pipeline integration point: `academic-pipeline/SKILL.md` § Stage 4.3 STYLE ALIGNMENT
- Priority hierarchy: `shared/style_calibration_protocol.md` § Priority 2 Implementation
- Storage location for guides: `style_guides/`
