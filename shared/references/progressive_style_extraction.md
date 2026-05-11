# Progressive Style Extraction & Consumption Reference

> Version: 0.1.0
> Consumed by: intake_agent (P0), structure_architect_agent (P2), argument_builder_agent (P3), draft_writer_agent (P3.5, P4)
> Authoritative reference for the v3.8.0 progressive style extraction mechanism

---

## 1. Overview

Style rules are extracted **progressively** — each Phase extracts only the granularity it needs, from the exemplar papers selected at Phase 0. Later Phases extract at finer granularity because the context (outline, argument blueprint) becomes more specific.

**Core principle**: Extract once per granularity level, consume immediately. Never extract all four levels upfront.

```
P0  Select exemplars           → exemplar_manifest.md (no style content)
P2  Full-text → structure      → style_L1_structure.md
P3  Per-section → argumentation → style_L2_<section>.md (one per section)
P3.5 Per-paragraph → paragraph+ narrative → style_L3L4_<section>.md + framework_<section>.md
P4  No extraction, only consume → per-section prose output
```

Every extracted rule must include a **Why** — without it, the rule is surface mimicry and the LLM cannot make judgment calls at the boundary.

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
  <journal>_<date>/
    exemplar_manifest.md           ← P0 output
    style_L1_structure.md          ← P2 output
    style_L2_introduction.md       ← P3 output
    style_L2_method.md             ← P3 output
    style_L2_<section>.md          ← P3 output (one per outline section)
    style_L3L4_introduction.md     ← P3.5 output
    style_L3L4_method.md           ← P3.5 output
    style_L3L4_<section>.md        ← P3.5 output (one per outline section)
    framework_introduction.md      ← P3.5 output
    framework_method.md            ← P3.5 output
    framework_<section>.md         ← P3.5 output (one per outline section)
```

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
- L3+4 Paragraph+Narrative: TBD (assessed at P3.5)
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

## 7. Phase 3.5: Layer 3+4 Paragraph & Narrative Extraction + Writing Framework

**Agent**: `draft_writer_agent` (Phase 3.5 sub-step)
**Input**: exemplar_manifest.md + exemplar texts + P2 Outline + P3 Argument Blueprint
**Extraction scope**: Per outline section per paragraph → read exemplar corresponding paragraph → paragraph-level + narrative-level features
**Output**: `style_L3L4_<section>.md` + `framework_<section>.md` (one pair per section)

### Extraction Method

```
For each section in the P2 outline:
  For each paragraph position in that section:
    1. Locate exemplar corresponding section, corresponding paragraph
       (match by rhetorical function, not by position number)
    2. Read that paragraph's prose
    3. Extract:
       a. Paragraph-level (Layer 3):
          - Rhetorical function (M1-M34 move ID)
          - Sentence count / approximate word count
          - Citation integration method + specific attribution verbs
          - In-paragraph argument progression
          - Transition role (how this paragraph connects to the next)
       b. Narrative-level (Layer 4):
          - Person usage ("we" vs "this paper")
          - Sentence length rhythm pattern
          - Conversational signposting words used
          - Vivid vocabulary choices
          - Long sentence construction method
    4. Compare across exemplars → assign confidence
    5. Write findings into style_L3L4_<section>.md
    6. Write paragraph spec into framework_<section>.md
```

### style_L3L4 Output Format

```markdown
# Layer 3+4 Style: <journal> — <Section> Paragraph & Narrative

> Extracted at: Phase 3.5
> From: <exemplar1 §X>, <exemplar2 §X>
> Consumed by: draft_writer_agent (Phase 4)

## Paragraph Move Sequence

| Exemplar ¶ | Move ID | Rhetorical Function | Sentences | Key Feature |
|-----------|---------|-------------------|-----------|-------------|
| ... | ... | ... | ... | ... |

## Citation Integration Patterns

| Pattern ID | Exemplar Instance | Template | When to Use |
|-----------|-----------------|---------|-------------|
| ... | ... | ... | ... |

## Narrative Features

### Voice / Sentence Rhythm / Signposting / Vocabulary / AI Blacklist
(see full format in layered_style_guide_schema.md §4)
```

### framework Output Format

```markdown
# Section Writing Framework: <Section Name>

> Section: §<N> <Section Name>
> Source Exemplar: <exemplar> §<corresponding_section>
> Source Blueprint: <blueprint_section_summary>
> Word Allocation: <N> words

### Framework Overview
(structure overview + word allocation)

### ¶<N>
**Move**: <M-ID> — <rhetorical function>
**Exemplar Anchor**: <exemplar §X ¶N, function=...>
  → Observed: <key features from exemplar paragraph>
**Claim**: <one-sentence claim from CER chains>
**Required Content**:
  - [ ] <item 1>
  - [ ] <item 2>
**Style Constraints** (from exemplar anchor):
  - <constraint 1>
  - <constraint 2>
**Transition**: <how this paragraph connects to the next>
**Word Target**: <N> words (±20%)
```

### Exemplar Anchor Iron Rule

Exemplar Anchor records **how** the exemplar writes, not **what** it writes.

| Allowed (style learning) | Forbidden (content copying) |
|--------------------------|---------------------------|
| Observe rhetorical progression pattern | Copy specific cases/data/institutions |
| Observe citation integration verb choice | Copy verbatim sentences |
| Observe sentence length rhythm | Replace exemplar content with our content in same sentence slots |
| Observe transition word placement | Use exemplar's institutional examples |

**Claim** and **Required Content** come from Phase 3 CER chains + the user's own research. Exemplar provides only the writing pattern.

### User Confirmation

After all framework files are produced for a section, present to the user:

```
━━━ Phase 3.5: §<N> <Section Name> Writing Framework ━━━

Paragraphs: <N>
Exemplar anchors: <N> (all matched)
Word allocation: <N> words

Options:
1. Approve framework → proceed to Phase 4 drafting
2. Modify specific paragraph specs
3. Add/remove paragraphs
4. Re-extract from different exemplar section
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 8. Phase 4: Per-Section Drafting (Plan C)

**Agent**: `draft_writer_agent`
**Input per section call**: framework_<section>.md (hard) + style_L3L4_<section>.md narrative rules (hard) + previous sections' prose (style anchor) + CER chains + bibliography subset
**Output per section call**: section prose + compliance self-check + word count + user confirmation

### Per-Section Call Structure

```
System Prompt:
  ├── style_L3L4_<section>.md narrative features
  ├── framework_<section>.md paragraph specs
  └── "Draft this section following the framework specs exactly"

User Content:
  ├── Section CER chains
  ├── Section bibliography subset
  ├── Previous sections' prose (style anchor + inter-section continuity)
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

1. **Required Content**: tick each [ ] item — any missing → `[FRAMEWORK VIOLATION]` → rewrite that paragraph
2. **Style Constraints**: verify each constraint from exemplar anchor
3. **Move function**: verify each paragraph's rhetorical function matches spec
4. **Word count**: section ±15%, running total ±10%

### User Confirmation per Section

```
━━━ Section N: <Name> Draft Complete ━━━

Framework Compliance:
  ¶1: [4/4 required] [3/3 style] ✓
  ¶2: [4/4 required] [2/2 style] ✓
  ...

Exemplar Anchor Match:
  ¶1: M1 anchor → ✓
  ¶3: M2 anchor → ✓
  ...

Word Count: <N> / <Target> (<%> deviation)

Options:
1. Accept and proceed to next section
2. Request revision of specific paragraphs
3. Adjust framework (modify spec, then rewrite)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

Option 3 enables "fix structural problems at the framework level, fix prose problems at the prose level."

---

## 9. Stage 4.3 Downgrade

`academic-pipeline` Stage 4.3 (Style Alignment) is **downgraded** from "primary style fix mechanism" to "final polish pass":

| Aspect | Before | After |
|--------|--------|-------|
| Purpose | Fix style problems in draft | Polish minor issues that slipped through framework |
| Trigger | Reviewer mentions style + guide exists | Same trigger, but only handles micro-adjustments |
| Scope | Per-paragraph diff + rationale | Sentence-level tweaks (word choice, transition phrasing) |
| Cannot fix | Structural style problems | Same — but these should now be rare since P2/P3/P3.5 handled them |

---

## 10. Degradation Path

When exemplars are unavailable or user skips exemplar selection:

| Phase | Normal path | Degraded path |
|-------|------------|---------------|
| P0 | exemplar_manifest.md | `exemplar_manifest: null` |
| P2 | Extract L1 from exemplar | Default allocation tables |
| P3 | Extract L2 per section from exemplar | Discipline-default argumentation patterns |
| P3.5 | Extract L3+4 per paragraph → framework | Skip Phase 3.5 entirely |
| P4 | Per-section drafting with framework | Original single-call method |
