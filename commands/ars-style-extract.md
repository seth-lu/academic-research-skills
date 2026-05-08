---
description: Stage 1 of the Style Reasoning Pipeline. Reads N exemplar PDFs of a target venue, extracts a writing-thinking guide (markdown reasoning model — not surface mimicry). Dual-mode (standalone or pipeline-invoked from intake Phase 0).
model: opus
---

Extract a venue-specific writing-thinking guide from exemplar papers. Produces an editable markdown reasoning model conformant to `shared/contracts/style_thinking_guide.schema.md`.

## When to use

- **Standalone**: user has 1+ PDFs of a target venue and wants to extract a reusable style guide. Run before drafting (informs writer) or before restyle (informs polish).
- **Pipeline-invoked**: `intake_agent` Phase 0 Step 9.5 fires this when target_journal is set and no guide exists yet for that venue.

## Inputs

| Field | Required | Description |
|---|---|---|
| `pdf_paths` | yes | 1–N PDF paths. ≥3 recommended for HIGH confidence. |
| `target_journal` | yes | Display name (e.g., "Management Science", "MIS Quarterly", "INFORMS Journal on Computing"). |
| `topic_scope` | no | One sentence narrowing the topic (e.g., "Privacy-preserving analytics in financial markets"). Default: derive from exemplar abstracts. |
| `output_path` | no | Default: `style_guides/<journal-slug>_<topic-slug>_<YYYY-MM-DD>.md`. |
| `mode` | no | `standalone` (default) or `pipeline`. Pipeline mode writes guide path back to passport. |

## Iron rule (MUST appear verbatim in the analysis prompt)

> **Extract REASONING, not surface features.** For every observation about what the venue does, you MUST state the inferred *why* in one sentence. The *why* must be a reviewer-facing or argumentation-facing reason — something a reviewer would care about, or something that affects how the argument lands. If you cannot state a defensible *why* in one sentence, DROP the observation. "MS uses shorter sentences" with no *why* is FORBIDDEN. "MS uses shorter sentences in Theorem-statement paragraphs because reviewers must verify each claim against the formal statement" is REQUIRED format.

## Protocol

### Phase A — Single-paper analysis

For each PDF, walk **section-by-section, paragraph-by-paragraph**:

1. Read the PDF (use built-in Read tool with `pages` parameter for large files).
2. Identify the section structure (Intro / Lit / Model / Methods / Results / Discussion / Conclusion). Use the paper's actual section names.
3. For each paragraph, emit a structured annotation:

```yaml
section: <section-name>
position: <paragraph-index-within-section>
primary_move: <ID from shared/references/rhetorical_move_taxonomy.md>
secondary_moves: [<up to 2 IDs>]
cross_cutting_moves: [<X1-X4 IDs realized>]
why_after_previous: "<one sentence: why this paragraph follows the previous one in argument flow>"
author_choice: "<one sentence: what alternative the author DID NOT choose, and why this choice was likely better here>"
vocabulary_signals:
  hedges: [<list>]
  boosters: [<list>]
  reporting_verbs: [<list>]
  transitions: [<list>]
  citations: {narrative: N, parenthetical: N}
```

4. If a paragraph cannot be classified into any move with confidence > 60%: log as `UNCLASSIFIED` and add to "Open Questions" — do NOT invent a new move.

### Phase B — Cross-paper aggregation (only when N ≥ 2)

1. For each section + position, compare across papers:
   - **Default** = move that appears in ≥ majority of exemplars at that position
   - **Variant** = move that appears in 1 < count < majority
   - **Conflict** = different majorities or genuine disagreement → goes to Open Questions
2. For vocabulary: aggregate frequencies, mark as preferred only if appearance rate is significantly above baseline (≥2× across exemplars).
3. For Author Choice Rubrics: extract patterns that recur across multiple paragraphs in multiple papers. Single-paper observations are too thin.
4. **Do not average away conflicts.** When two papers genuinely disagree, surface the disagreement in the guide rather than picking one arbitrarily.

### Phase C — Guide synthesis

Compose the per-section, per-position annotations into the schema at `shared/contracts/style_thinking_guide.schema.md`. Required sections:

- Provenance (with all fields)
- Section-Level Rhythm (one entry per section)
- Per-Section Move Patterns (table per section)
- Author Choice Rubrics (numbered with stable G-MR-N IDs)
- Vocabulary & Phrasing
- Citation-Integration Style
- Per-Section Worked Example (one annotated paragraph per section)
- Open Questions / Low-Confidence Areas
- Versioning (version 0.1, today's date)

Confidence levels per section based on N:
- HIGH: ≥3 exemplars, ≤2 conflicts in this section
- MEDIUM: 2 exemplars, OR 3+ exemplars with 3+ conflicts in this section
- LOW: 1 exemplar OR section appears in fewer than half of exemplars

### Phase D — Anti-mimicry audit

Before writing the guide to disk, run a **second LLM pass** over the draft guide with this prompt:

> Audit the following style guide for surface-only rules. For each rule in Per-Section Move Patterns, Author Choice Rubrics, and Vocabulary, check: does the rationale explain a reviewer-facing or argumentation-facing reason? Or is it just a surface feature with no *why*? Flag any rule where the rationale is generic ("uses formal language") or absent. Output: list of rule IDs to drop or rewrite, with the reason for each flag.

Apply the audit's recommendations. Then mark the guide's `Anti-mimicry audit: PASSED (date)`.

If the audit flags > 30% of rules: STOP, report to user, recommend re-extraction with a refined prompt or additional exemplars. The guide is too surface-oriented to ship.

### Phase E — Output

1. Write the guide to `output_path`.
2. **Pipeline-mode hook**: if `mode=pipeline`, additionally write the guide path to `passport.style_profile.priority_2_source` (open-extension Material Passport field, no schema change required).
3. Emit a 1-page user summary covering:
   - Guide location
   - N exemplars used and confidence level
   - **Top 5 highest-confidence rules** with their G-MR-N IDs
   - Top 3 Open Questions if any
   - Pointer: "You can edit this guide at `<path>` before drafting if you want to override any rule. The guide is reusable — same MS guide can drive multiple drafts."

## Failure paths

- **PDF unreadable**: skip with warning, continue with remaining exemplars. If 0 readable, abort.
- **Exemplar in wrong language** (e.g., Chinese paper as MS exemplar): warn user, ask whether to proceed (style might transfer poorly).
- **Anti-mimicry audit FAILED**: abort guide write; report to user with recommendation.
- **Schema validation FAIL** at the end: abort, dump partial guide to `<output_path>.draft` for inspection.

## Cross-references

- Move taxonomy (closed vocabulary): `shared/references/rhetorical_move_taxonomy.md`
- Output schema: `shared/contracts/style_thinking_guide.schema.md`
- Storage location: `style_guides/`
- Consumer of the produced guide: `commands/ars-restyle.md`
- Pipeline integration: `academic-paper/agents/intake_agent.md` Step 9.5 + `academic-pipeline/SKILL.md` § Stage 4.3
- Priority hierarchy this fills: `shared/style_calibration_protocol.md` § Priority 2 Implementation
