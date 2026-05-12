# Progressive Style Extraction & Consumption Reference

> Version: 0.1.0
> Consumed by: intake_agent (P0), structure_architect_agent (P2), argument_builder_agent (P3), draft_writer_agent (P3.5, P4)
> Authoritative reference for the v3.8.0 progressive style extraction mechanism

---

## 1. Overview

Style rules are extracted **progressively** in three layers. Each layer analyzes the exemplar at a different scope, producing a fixed-size file. Because later layers split the paper into more files (1 → N → N), the total context budget grows and depth increases.

**Depth escalation principle**: Same file size budget × narrower scope = deeper analysis.

```
Layer  Scope      Files  Depth   Extracts
L1     Full text  1      Coarse  Section architecture, word ratios, structural rules
L2     Per-section N      Deep    Argumentation strategy per section (tension, positioning, contribution, rebuttal)
L3     Per-section N      Deeper  Paragraph move sequence per section (M-ID, citation fusion, transition chain)
```

Each layer's file has the same approximate size budget — but L1 stretches it across the whole paper while L2/L3 focus it on one section, producing proportionally deeper analysis.

**Language**: All three layers are language-agnostic (structure, argumentation logic, and rhetorical moves transfer across languages). L3 does not extract sentence-level language features (word choice, rhythm, signposting vocabulary) — those are language-bound and not captured.

**Core principle**: Extract once per layer, consume immediately. Never extract all layers upfront.

---

## 2. Multi-Exemplar Confidence

When 2+ exemplars are provided, each extracted rule receives a confidence level:

| Observation | Confidence | Handling |
|-------------|-----------|---------|
| All exemplars share this feature | HIGH | Hard constraint — must follow |
| Only 1 exemplar has this feature | MEDIUM | Soft constraint — recommend, user may override at Framework stage |
| Exemplars contradict each other | LOW | Author choice — present options, user decides |

---

## 3. File Layout

```
style_guides/
  <journal>_<topic>_<date>/
    exemplar_manifest.md            ← P0 output
    style_L1_structure.md           ← P2 output (1 file)
    style_L2_introduction.md        ← P3 output
    style_L2_background.md          ← P3 output
    style_L2_<section>.md           ← P3 output (N files, one per outline section)
    style_L3_introduction.md        ← P3.5 output
    style_L3_background.md          ← P3.5 output
    style_L3_<section>.md           ← P3.5 output (N files, one per outline section)
```

Total: 1 (L1) + N (L2) + N (L3) = 2N+1 files. No framework files — L3 serves as the direct paragraph-level reference during drafting.

---

## 4. Phase 0: Exemplar Manifest

**Agent**: `intake_agent` (Step 3.5)
**Action**: Select exemplar papers. No style extraction.
**Output**: `exemplar_manifest.md`

### Format

```markdown
# Exemplar Manifest: <journal>

## Target Journal
- Name: <journal name>
- Track: <track>

## Selected Exemplars
| # | Paper | Role | Why Selected |
|---|-------|------|-------------|
| 1 | <citation> | Deep exemplar | Same domain + same journal + exemplary writing |
| 2 | <citation> | Spot exemplar | Validate feature is journal convention, not single-paper style |
| 3 | <citation> | Spot exemplar | Reduce single-paper bias |

## Exemplar Files
- <path/to/exemplar1>
- <path/to/exemplar2>

## Confidence Assessment
- L1 Structure: TBD (assessed at P2)
- L2 Argumentation: TBD (assessed at P3)
- L3 Paragraph Moves: TBD (assessed at P3.5)
```

### Role Definitions

| Role | Depth | Purpose |
|------|-------|---------|
| **Deep exemplar** | Full text, all layers | Primary extraction source |
| **Spot exemplar** | Corresponding sections only | Validate features are journal conventions |

Minimum: 1 deep + 1 spot. More spot exemplars = higher confidence.

### Activation Condition

Step 3.5 activates when `target_journal` is set in Paper Configuration Record AND the user confirms they have venue exemplars. If declined, set `exemplar_manifest: null` — downstream Phases fall back to existing flat style guide or skip style constraints entirely.

---

## 5. Phase 2: Layer 1 Structure Extraction

**Agent**: `structure_architect_agent` (pre-outline step)
**Input**: exemplar_manifest.md + exemplar full texts
**Extraction scope**: Full text — section headings, sub-section patterns, word count ratios, structural rules
**Output**: `style_L1_structure.md`

### Extraction Method

```
1. Read each exemplar's structure (section headings only, not prose)
2. Record per section: sub-sections? naming pattern? approximate word ratio?
3. Identify structural rules (e.g., "Introduction narrative paragraphs precede sub-headings")
4. Compare across exemplars → assign confidence
5. Output style_L1_structure.md
```

### Output Format

```markdown
# Layer 1 Style: <journal> — Structure

> Extracted at: Phase 2
> From: <exemplar1>, <exemplar2>
> Consumed by: structure_architect_agent

## Section Architecture

| Section | Sub-sections? | Pattern | Word % | Notes | Confidence |
|---------|--------------|---------|--------|-------|-----------|
| ... | ... | ... | ... | ... | ... |

## Structural Rules

| ID | Rule | Why | Anti-Pattern | Confidence |
|----|------|-----|-------------|-----------|
| S-1 | ... | ... | ... | HIGH/MEDIUM/LOW |
| ... | ... | ... | ... | ... |
```

### Consumption

`structure_architect_agent` reads Layer 1 before generating Outline:
- Section architecture table → outline section structure
- Structural rules → hard constraints on outline shape
- Violation of any HIGH-confidence S-* rule → outline not deliverable

---

## 6. Phase 3: Layer 2 Argumentation Extraction

**Agent**: `argument_builder_agent` (pre-CER step)
**Input**: exemplar_manifest.md + exemplar texts + P2 Outline
**Extraction scope**: Per outline section → read exemplar corresponding section → argumentation patterns
**Output**: `style_L2_<section>.md` (one per outline section)

### Extraction Method

```
For each section in the P2 outline:
  1. Locate corresponding section in each exemplar
  2. Read only that section's prose
  3. Extract argumentation patterns:
     - Core argument framework (tension? gap? research question?)
     - Literature positioning (embedded? standalone review?)
     - Differentiation writing (narrative paragraph? numbered list?)
     - Contribution declaration structure
     - Pre-emptive rebuttal presence and pattern
     - Two-sided acknowledgment pattern
  4. Compare across exemplars → assign confidence
  5. Output style_L2_<section>.md
```

### Output Format

```markdown
# Layer 2 Style: <journal> — <Section> Argumentation

> Extracted at: Phase 3
> From: <exemplar1 §X>, <exemplar2 §X>
> Consumed by: argument_builder_agent

## Argumentation Rules for <Section>

| ID | Rule | Why | Exemplar Evidence | Confidence |
|----|------|-----|-------------------|-----------|
| A-1 | ... | ... | <exemplar §X ¶N: "quote"> | HIGH/MEDIUM/LOW |
| ... | ... | ... | ... | ... |
```

### Consumption

`argument_builder_agent` reads the corresponding section's Layer 2 file before building CER chains:
- Argumentation rules → hard constraints on CER chain construction
- HIGH-confidence rules → must follow
- MEDIUM-confidence rules → recommend, flag if not followed
- Violation of any HIGH-confidence A-* rule → blueprint not deliverable

---

## 7. Phase 3.5: Layer 3 Paragraph Move Extraction

**Agent**: `draft_writer_agent` (Phase 3.5)
**Input**: exemplar_manifest.md + exemplar texts + P2 Outline + P3 Argument Blueprint
**Extraction scope**: Per outline section → read exemplar corresponding section's paragraphs → paragraph-level rhetorical patterns
**Output**: `style_L3_<section>.md` (N files, one per outline section)

L3 extracts paragraph-level writing patterns. With the same file size budget as L2 but focused at the paragraph level (not section level), it captures deeper detail: the rhetorical move sequence, how citations are fused into arguments, and how transitions chain paragraphs together.

### Extraction Method

```
For each section in the P2 outline:
  1. Locate corresponding section in each exemplar
  2. For each paragraph in that section:
     a. Identify rhetorical function (M1-M34 move ID from rhetorical_move_taxonomy.md)
     b. Record sentence count and approximate word count
     c. Extract citation integration method — how sources are embedded (narrative, parenthetical, block quote)
     d. Map in-paragraph argument progression (topic → evidence → analysis → transition)
     e. Identify transition role — how this paragraph connects to the next
  3. Build the paragraph move sequence as a table
  4. Extract cross-paragraph patterns (citation fusion, transition chain)
  5. Compare across exemplars → assign confidence
  6. Write style_L3_<section>.md
```

### Output Format

```markdown
# Layer 3 Style: <journal> — <Section> Paragraph Moves

> Extracted at: Phase 3.5
> From: <exemplar1 §X>, <exemplar2 §X>
> Consumed by: draft_writer_agent (Phase 4)

## Paragraph Move Sequence

| ¶ | Move ID | Rhetorical Function | Sentences | Citation Method | Transition To Next |
|----|---------|-------------------|-----------|----------------|-------------------|
| 1 | M1 | ... | ... | ... | ... |
| 2 | M2 | ... | ... | ... | ... |
| ... | ... | ... | ... | ... | ... |

## Citation Integration Patterns

| Pattern ID | How Sources Are Embedded | Exemplar Instance | When to Use |
|-----------|------------------------|-------------------|-------------|
| ... | ... | ... | ... |

## Paragraph Transition Chain

| From ¶ | To ¶ | Transition Mechanism |
|--------|------|---------------------|
| ... | ... | ... |

## Style Constraints

| ID | Rule | Why | Confidence |
|----|------|-----|-----------|
| P-1 | ... | ... | HIGH/MEDIUM/LOW |
```

### Consumption

`draft_writer_agent` reads L3 alongside L1 and L2 during Phase 4 per-section drafting:
- L1 provides section architecture and word ratios
- L2 provides argumentation strategy for the section
- L3 provides paragraph move sequence — how many paragraphs, what each does, how citations are integrated, how transitions chain

L3 does NOT prescribe exact sentence count or word choice — it describes the rhetorical skeleton, not the prose surface.

**No framework files**: L3 serves as the direct paragraph-level reference. The LLM writes prose following L1 structure + L2 argumentation + L3 paragraph moves, adapting the rhetorical pattern to the draft language naturally.

---

## 8. Phase 4: Per-Section Drafting with L1+L2+L3

**Agent**: `draft_writer_agent`
**Input per section call**: `style_L1_structure.md` + `style_L2_<section>.md` + `style_L3_<section>.md` + previous sections' prose (continuity anchor) + CER chains + bibliography subset
**Output per section call**: section prose + compliance self-check + word count + user confirmation

### Per-Section Call Structure

```
System Prompt:
  ├── style_L1_structure.md — structural rules, word ratios
  ├── style_L2_<section>.md — argumentation rules for this section
  ├── style_L3_<section>.md — paragraph move sequence for this section
  └── "Write §<N> only. Follow L1 structure + L2 argumentation + L3 paragraph moves."

User Content:
  ├── Section CER chains
  ├── Section bibliography subset
  ├── Previous sections' prose (continuity anchor)
  └── Word count constraint
```

### Style Anchor Strategy (Context Window Management)

| Section being drafted | Prose included as anchor |
|----------------------|------------------------|
| §1 | None |
| §2 | §1 full prose |
| §3 | §1-2 full prose |
| §4 | §1-3 full prose |
| §5+ | §1 first+last paragraph + most recent 3 sections' full prose |

### Compliance Self-Check

After writing each section:

1. **L1**: Verify structural rules satisfied (HIGH-confidence S-* rules are hard)
2. **L2**: Verify argumentation rules satisfied (HIGH-confidence A-* rules are hard)
3. **L3**: Verify paragraph move sequence followed (¶ count, each ¶'s rhetorical function)
4. **Citations**: Each claim has a source
5. **Word count**: Section ±15%, running total ±10%

### User Confirmation per Section

```
━━━ Section N: <Name> Draft Complete ━━━

L1+L2+L3 Compliance:
  L1 S-*: [N/N] ✓
  L2 A-*: [N/N] ✓
  L3 Moves: [N/N ¶s matched] ✓

Word Count: <N> / <Target> (<%> deviation)

Options:
1. Accept and proceed to next section
2. Request revision of specific paragraphs
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 9. Degradation Path

Two paths depending on exemplar availability:

| Phase | Normal (exemplar manifest exists) | Degraded (no exemplar) |
|-------|-----------------------------------|------------------------|
| P0 | exemplar_manifest.md | `exemplar_manifest: null` |
| P2 | Extract L1 from exemplar (1 file) | Default allocation tables |
| P3 | Extract L2 per section from exemplar (N files) | Discipline-default argumentation patterns |
| P3.5 | Extract L3 per section from exemplar (N files) | Skip Phase 3.5 entirely |
| P4 | Per-section drafting with L1+L2+L3 | Per-section drafting with outline + CER chains only |

No cross-language path — L1/L2/L3 are all language-agnostic and apply directly to drafts in any language. Sentence-level features (word choice, rhythm, signposting vocabulary) are not captured at any layer and are left to the LLM's natural target-language prose ability.
