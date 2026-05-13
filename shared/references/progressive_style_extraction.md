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

### 1.1 Content Isolation Principle (IRON RULE)

**All three layers extract rhetorical FORM, never exemplar CONTENT.**

Style rules describe HOW to write, not WHAT to write. The exemplar's specific citations, quotes, case studies, named initiatives, and data are the exemplar author's evidence — they must never appear in any style file output or leak into the draft through style constraints.

| Layer | Extracts (FORM) | Does NOT extract (CONTENT) |
|-------|-----------------|---------------------------|
| L1 | Section architecture, word ratios, structural rules | Specific section topics, model names |
| L2 | Argumentation strategy (tension→rebuttal→contribution), literature positioning pattern, contribution declaration structure | Specific authors cited, specific quotes, specific initiatives/examples |
| L3 | Paragraph move sequence (M1→M8→M3→M4), citation integration method (narrative/parenthetical/block), transition pattern | Specific citations embedded in those moves, specific quote content |

**Extraction rule**: When describing a pattern in L2/L3 output, use generic descriptors (e.g., "authoritative policy document", "block quote from regulator", "real-world initiative example") — never the exemplar's actual author names, quote text, or named entities.

**Drafting rule**: Phase 4 uses L3 for paragraph-level rhetorical skeleton only. ALL content — citations, quotes, examples, case studies — must come from the draft's own CER chains and Annotated Bibliography. If L3 mentions an exemplar-specific entity (e.g., "BWWC"), that is an extraction defect and must be ignored.

**Violation consequence**: Draft content that replicates exemplar citations or examples constitutes accidental plagiarism and must be rewritten before the section is accepted.

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

| ID | Rule | Why | Pattern Description (abstract form only — no exemplar names/quotes) | Confidence |
|----|------|-----|-------------------|-----------|
| A-1 | ... | ... | e.g., "Section opens with policy quote from regulator, then counters with two academic sources" — NOT "Baudino 2018 says..." | HIGH/MEDIUM/LOW |
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
     c. Extract citation integration method — HOW sources are embedded (narrative, parenthetical, block quote), not WHICH sources
     d. Map in-paragraph argument progression (topic → evidence → analysis → transition)
     e. Identify transition role — how this paragraph connects to the next
  3. Build the paragraph move sequence as a table — use generic descriptors, strip exemplar author names
  4. Extract cross-paragraph patterns (citation fusion, transition chain) — abstract form only
  5. Compare across exemplars → assign confidence
  6. Write style_L3_<section>.md — **verify no exemplar-specific names, quotes, or entities remain**
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

| Pattern ID | How Sources Are Embedded | Abstract Form (generic — no exemplar author names) | When to Use |
|-----------|------------------------|-------------------|-------------|
| ... | ... | ... | ... |

## Paragraph Transition Chain

| From ¶ | To ¶ | Transition Mechanism |
|--------|------|---------------------|
| ... | ... | ... |

## Style Constraints

| ID | Rule | Why | Confidence |
|----|------|-----|-----------|
| P-1 | Write generic pattern (e.g., "Implications anchored by concrete initiative example") — NOT exemplar-specific (e.g., NOT "Include BWWC example") | ... | HIGH/MEDIUM/LOW |
```

### Consumption

`draft_writer_agent` reads **only L3** during Phase 4 per-section drafting. L1 and L2 were already consumed upstream and baked into their respective deliverables:

| Layer | Consumed at | Baked into | Validated by |
|-------|------------|------------|--------------|
| L1 | Phase 2b | Outline (section structure, word ratios) | `structure_architect_agent` S-* rules before delivery |
| L2 | Phase 3b | Argument Blueprint (CER chains, argument strategy) | `argument_builder_agent` A-* rules before delivery |
| L3 | Phase 4 | Section prose (paragraph sequence) | `draft_writer_agent` per-section |

L3 provides the paragraph move sequence — how many paragraphs, what each does, how citations are integrated, how transitions chain. It does NOT prescribe exact sentence count or word choice — it describes the rhetorical skeleton, not the prose surface.

**No framework files**: L3 serves as the direct paragraph-level reference. The LLM writes prose following the L3 paragraph moves, adapting the rhetorical pattern to the draft language naturally.

---

## 8. Phase 4: Per-Section Drafting with L3

**Agent**: `draft_writer_agent`
**Input per section call**: `style_L3_<section>.md` + previous sections' prose (continuity anchor) + CER chains + bibliography subset
**Output per section call**: section prose + compliance self-check + word count + user confirmation

L1 and L2 are NOT consumed in Phase 4. They were already consumed upstream:
- L1 → `structure_architect_agent` validated S-* rules before Outline delivery (Phase 2b)
- L2 → `argument_builder_agent` validated A-* rules before Argument Blueprint delivery (Phase 3b)

Phase 4 only needs L3 for the paragraph move sequence. The outline and CER chains already carry the baked-in L1 and L2 constraints.

### Per-Section Call Structure

```
System Prompt:
  ├── style_L3_<section>.md — paragraph move sequence for this section
  └── "Write §<N> only. Follow the paragraph move sequence."

User Content:
  ├── Section CER chains (L2 already baked into argument structure)
  ├── Section bibliography subset
  ├── Previous sections' prose (continuity anchor)
  └── Word count constraint (L1 already baked into section allocation)
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

1. **L3**: Verify paragraph move sequence followed (¶ count, each ¶'s rhetorical function)
2. **Citations**: Each claim has a source
3. **Word count**: Section ±15%, running total ±10%

### User Confirmation per Section

```
━━━ Section N: <Name> Draft Complete ━━━

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
| P4 | Per-section drafting with L3 | Per-section drafting with outline + CER chains only |

No cross-language path — L1/L2/L3 are all language-agnostic and apply directly to drafts in any language. Sentence-level features (word choice, rhythm, signposting vocabulary) are not captured at any layer and are left to the LLM's natural target-language prose ability.
