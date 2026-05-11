# Style Calibration Protocol

## Purpose

Learns the author's natural writing voice from past writing samples and applies it as a soft guide during paper drafting. The goal is **personalization**, not de-AI-ification — the author's voice should come through in the final text, within the boundaries of discipline conventions.

> **Design boundary**: This is NOT a humanizer. We do not aim to evade AI detectors. We aim to produce text that sounds like the author wrote it, because the author's judgment and style are part of scholarly identity.

---

## When to Use

- **Primary entry point**: `academic-paper/agents/intake_agent` Step 10 (optional)
- **Pipeline carry**: `academic-pipeline` Material Passport carries the Style Profile across all stages
- **Consumers**: `academic-paper/agents/draft_writer_agent`, `deep-research/agents/report_compiler_agent`

---

## Calibration Flow

### Step 1: Sample Collection

Ask the user:
> "Do you have past papers or writing samples you'd like me to learn your style from? Providing 3+ samples helps me match your natural voice. This is optional."

**Requirements**:
- Minimum 3 samples recommended (1-2 samples produce unreliable profiles)
- Samples should be the user's own writing (not co-authored sections they didn't write)
- Same language as the target paper preferred
- Same discipline preferred but not required

**Acceptable formats**: PDF, DOCX, Markdown, plain text, pasted excerpts

### Step 2: Dimension Extraction

Analyze each sample across 6 dimensions:

#### Dimension 1: Sentence Length Distribution
- Mean word count per sentence
- Standard deviation (captures variability)
- Rhythm pattern: does the author alternate short-long, or maintain steady length?
- Example profile: `{mean: 22, stddev: 8, rhythm: "variable — mixes 8-word punchy sentences with 35-word complex ones"}`

#### Dimension 2: Paragraph Length Distribution
- Mean sentences per paragraph
- Variation across sections (e.g., shorter paragraphs in Methods, longer in Discussion)
- Example profile: `{mean_sentences: 5, variation: "moderate — 3-7 sentences, shorter in Methods"}`

#### Dimension 3: Vocabulary Preferences
- **Hedging patterns**: which hedging words does the author prefer? ("suggests" vs "indicates" vs "implies")
- **Transition words**: preferred connectives ("However" vs "Nevertheless" vs "Yet")
- **Preferred verbs**: reporting verbs for citations ("found" vs "demonstrated" vs "showed")
- **Formality level**: where on the spectrum from conversational academic to highly formal
- Example profile: `{hedging: ["suggests", "appears to", "may"], transitions: ["However", "In contrast", "Yet"], reporting: ["found", "argued", "noted"], formality: "moderate-formal"}`

#### Dimension 4: Citation Integration Style
- Narrative ratio: how often does the author use "Smith (2024) found..." vs "(Smith, 2024)"
- Citation density: average citations per paragraph
- Citation placement: beginning of paragraph (context-setting) vs end (evidence-backing)
- Example profile: `{narrative_ratio: 0.4, density: 2.3, placement: "mixed — narrative for key claims, parenthetical for supporting"}`

#### Dimension 5: Modifier Style
- Minimal vs elaborate: does the author use many adjectives/adverbs, or keep it lean?
- Abstract vs concrete: preference for abstract concepts or concrete examples?
- Example profile: `{modifier_density: "minimal — lean prose, few adjectives", abstraction: "concrete — prefers specific examples over generalizations"}`

#### Dimension 6: Register Shifts
- How does tone change across paper sections?
- Typically: Methods (neutral/procedural) → Results (descriptive) → Discussion (interpretive/assertive)
- Does the author maintain consistent register or shift noticeably?
- Example profile: `{shifts: "noticeable — cautious in Methods, increasingly assertive in Discussion, most personal voice in Conclusion"}`

### Step 3: Profile Synthesis

Combine the 6 dimensions into a **Style Profile** artifact (see `shared/handoff_schemas.md` Schema 10).

Report to the user:
> "I've analyzed your writing style from [N] samples. Key traits:
> - [1-sentence summary of most distinctive trait]
> - [1-sentence summary of second distinctive trait]
> I'll use this as a soft guide — discipline conventions always take priority."

---

## Consumption Rules — Priority System

When the Style Profile is consumed during writing, apply the following priority hierarchy:

```
Priority 1 (HARD): Discipline conventions
  → Cannot be violated. E.g., if the discipline requires third-person,
    the author's preference for first-person is overridden.

Priority 2 (STRONG): Target journal conventions
  → If the user has specified a target journal, its style norms take precedence.
    E.g., Nature requires short paragraphs; author's preference for long paragraphs is overridden.

Priority 3 (SOFT): Author's personal style
  → Applied only where it does not conflict with Priority 1 or 2.
    E.g., the author's preferred transition words, hedging patterns,
    citation integration ratio — these are safe to apply.
```

### Conflict Resolution

When personal style conflicts with discipline or journal norms:

1. **Use the norm** (Priority 1 or 2 wins)
2. **Log the conflict** in Draft Metadata:
   ```
   Style conflict: Author prefers passive voice (72% in samples),
   but target discipline (Engineering) conventions favor active voice.
   → Using active voice per discipline convention.
   ```
3. **Notify the user** (once per draft, not per instance):
   > "Note: Your typical use of [trait] differs from [discipline/journal] convention. I've followed the convention, but you can adjust manually if you prefer your style here."

### Safe Dimensions (always applicable)

These dimensions rarely conflict with norms and can be applied freely:
- Preferred transition words (within academic register)
- Hedging word choices
- Reporting verb preferences
- Citation integration ratio (narrative vs parenthetical)
- Modifier density (as long as precision is maintained)
- Sentence length variability patterns

### Risky Dimensions (check before applying)

These dimensions may conflict with discipline/journal norms:
- Voice (active vs passive) — discipline-dependent
- Paragraph length — journal-dependent
- Person (first vs third) — discipline-dependent
- Formality level — journal-dependent

---

## Edge Cases

### Insufficient Samples
If user provides < 3 samples: generate a partial profile with a warning.
> "I have a preliminary style profile from [N] sample(s), but it may not be fully representative. I'll apply it cautiously."

### Mismatched Language
If samples are in a different language than the target paper: extract transferable dimensions only (paragraph structure, citation style, modifier density). Skip vocabulary preferences.

### Co-authored Samples
If user indicates samples are co-authored: ask which sections they wrote. Analyze only those sections.

### Style Evolution
If samples span many years: weight recent samples more heavily (2x weight for samples within 2 years).

---

## Priority 2 Implementation — Progressive Style Extraction

The Priority hierarchy above (Discipline > Target journal > Personal style) leaves Priority 2 ("Target journal conventions") unfilled in the base protocol — it is enforced only by handwritten domain references like `journal_submission_guide.md`, which carry submission mechanics but not WRITING reasoning.

Priority 2 is sourced from **progressive style extraction** embedded in `academic-paper`'s writing flow. See `shared/references/progressive_style_extraction.md` for the authoritative reference.

1. Phase 0 Step 3.5: User selects exemplars → `exemplar_manifest.md`
2. Phase 2: `structure_architect_agent` extracts Layer 1 structure → `style_L1_structure.md` → outline is venue-shaped
3. Phase 3: `argument_builder_agent` extracts Layer 2 per-section → `style_L2_<section>.md` → CER chains use venue argumentation
4. Phase 3.5: `draft_writer_agent` extracts Layer 3+4 per-paragraph → `style_L3L4_<section>.md` + `framework_<section>.md` → hard constraints for drafting
5. Phase 4: `draft_writer_agent` drafts per-section with framework hard constraints

### Activation

When ALL of the following are true, progressive style extraction activates:

1. `intake_agent` Phase 0 Step 3.5 produced `exemplar_manifest.md` (user supplied venue exemplars)
2. `passport.style_profile.priority_2_source` points at the exemplar manifest directory
3. The exemplar files referenced in the manifest are readable

If conditions are not met, proceed with no Priority 2 source — the config record shows `venue_style_status = "missing"` and draft metadata flags this as a known risk.

### Degradation path

| Phase | Progressive path | Degraded path (no exemplar manifest) |
|-------|------------------|-------------------------------------|
| P2 | Extract L1 from exemplar → venue-shaped outline | Default allocation tables |
| P3 | Extract L2 per section from exemplar → venue CER chains | Discipline-default argumentation patterns |
| P3.5 | Extract L3+4 per paragraph → framework hard constraints | Skip Phase 3.5 entirely |
| P4 | Per-section calls with framework | Original single-call method |

### Conflict resolution (extends existing rules)

The base hierarchy stays: Priority 1 (discipline) > Priority 2 (venue style) > Priority 3 (personal style).

When a progressive extraction rule conflicts with a Priority 3 personal style preference:
- Progressive extraction wins (Priority 2 > Priority 3)
- Log the conflict in Draft Metadata, citing both the personal-style trait AND the extraction rule ID (e.g., S-2, A-1)
- Notify user once per draft per conflict type

### Cross-references

- Producer of exemplar manifest: `academic-paper/agents/intake_agent.md` Step 3.5
- Progressive extraction reference: `shared/references/progressive_style_extraction.md`
- Consumers: `structure_architect_agent.md` (P2), `argument_builder_agent.md` (P3), `draft_writer_agent.md` (P3.5, P4)
- Storage convention: `style_guides/README.md`
