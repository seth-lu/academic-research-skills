# Style Thinking Guide — Schema

This file is the **canonical schema** for guides produced by `/ars-style-extract` and consumed by `/ars-restyle`. It is a markdown schema (not JSON) because both producers and consumers are LLMs that read the file directly.

A guide that does not conform to this schema MUST be rejected by `/ars-restyle` with a pointer to re-run extraction. Mandatory sections are marked **REQUIRED**; optional sections are marked **OPTIONAL**.

---

## Filename convention

```
style_guides/<journal-slug>_<topic-slug>_<YYYY-MM-DD>.md
```

Examples:
- `style_guides/management-science_privacy-finance_2026-05-08.md`
- `style_guides/misq_dsr-fintech_2026-05-08.md`
- `style_guides/informs-joc_mpc-protocols_2026-05-08.md`

`<journal-slug>` lowercased, hyphenated. `<topic-slug>` lowercased, hyphenated. `<date>` is the extraction date in ISO-8601.

---

## Schema (every guide MUST follow this skeleton)

````markdown
# Style Thinking Guide — <Journal Display Name> × <Topic Display Name>

## Provenance  **REQUIRED**

- **Exemplars used** (1+ entries):
  | citation_key | doi | file_path | year |
  |---|---|---|---|
  | hevner2004design | 10.2307/25148625 | /papers/hevner2004.pdf | 2004 |

- **Topic scope**: <one sentence>
- **Extraction date**: YYYY-MM-DD
- **Extractor version**: ars-style-extract v<X.Y.Z>
- **Confidence**:
  - HIGH (n ≥ 3 exemplars on same topic, ≤ 2 conflicts surfaced)
  - MEDIUM (n = 2, OR n ≥ 3 with > 2 conflicts)
  - LOW (n = 1, treat all rules as preliminary)
- **Pipeline origin**: one of `standalone` / `intake_phase_0` / `mid_pipeline_invocation`
- **Anti-mimicry audit**: PASSED (date) / FAILED (date, reason)

---

## Section-Level Rhythm  **REQUIRED**

For EACH section the exemplars contain (Introduction, Literature Review, Model/Methods, Results/Analysis, Discussion, Conclusion). Sections absent from all exemplars may be omitted; section labels MUST follow the exemplar's naming.

### <Section name>

- **Paragraph count**: median = N (range: min–max across exemplars)
- **Word count per section**: median = N words (range: min–max)
- **Opening move sequence**: e.g., `M1 → M2 → M3` (Stake-Setting → Puzzle-Statement → Literature-Gap)
- **Closing move sequence**: e.g., `M4 → M5`
- **Transition pattern**: one of `sequential` (each ¶ follows naturally from the prior) / `nested` (¶ structure mirrors hierarchical argument) / `parallel` (¶s enumerate co-equal cases)
- **Notable rhythm signature**: 1 sentence describing what makes this section's flow distinctive

---

## Per-Section Move Patterns  **REQUIRED**

For EACH section, a table where each row describes the default move at a given paragraph position.

### <Section name>

| Position | Default Move (ID + name) | Why this move (reasoning, 1–2 sentences) | Common variant | Anti-pattern |
|---|---|---|---|---|
| ¶1 | M1 Stake-Setting | MS reviewers spend 12 minutes on desk-reject decision; first sentence must establish stakes or paper is rejected before §2 | M7 Reader-Hook (acceptable in 20% of MS papers) | Throat-clearing recap of field history |
| ¶2 | M3 Literature-Gap | Reader needs to know what's missing before they can evaluate the contribution preview | — | Listing every prior paper without gap statement |
| ¶3 | M4 Contribution-Preview | MS norm: contribution must appear before word ~600 | — | Saving contribution for §1.5 |
| last | M5 Roadmap (optional) | MS frequently SKIPS roadmap; presence is fine but not required | Skip | Roadmap longer than 4 sentences |

The reasoning column is the most important part of this schema. **Every row must contain a defensible *why* derived from the exemplars or known venue norms.** Surface-only rows ("MS uses shorter sentences") with no reasoning MUST be dropped during the anti-mimicry audit.

---

## Author Choice Rubrics  **REQUIRED**

Cross-section reasoning that doesn't fit the per-section table. Format: numbered rules with stable IDs `G-MR-<N>` (Guide Move Rule N) so `/ars-restyle` can cite them.

### Rule G-MR-1
**Trigger**: When the author needs to introduce a model setup
**MS choice**: introduces notation BEFORE the assumptions table
**Alternative not chosen**: assumptions before notation
**Why**: reviewers verify each assumption against named primitives; assumptions referencing un-introduced symbols force a re-read
**Confidence**: HIGH (3/3 exemplars consistent)

### Rule G-MR-2
**Trigger**: ...

(Add as many rules as the exemplar set supports. 5–15 is typical for a HIGH-confidence guide; 1–5 for LOW.)

---

## Vocabulary & Phrasing  **REQUIRED**

### Preferred hedges
- `suggests` (frequency: 18 instances across 3 exemplars)
- `appears to` (12)
- `may` (used sparingly, 6 instances, only in Discussion)

### Preferred boosters
- `establishes` (used only after Theorem statements)
- `demonstrates` (Results section, with magnitude)

### Preferred reporting verbs (for citations)
- `argue` (theoretical claim)
- `find` (empirical claim)
- `show` (proven claim)

### Preferred transitions
- `In contrast` (preferred over `However` 3:1 in MS exemplars)
- `Building on` (preferred connector to own work)

### Forbidden patterns (with REASONING — not just "AI-sounding")
- ❌ `delve into` — appears in zero MS papers; over-represented in LLM output; reviewers flag as AI-prose
- ❌ `crucial` / `pivotal` / `paramount` — MS prefers concrete claim ("affects $X trillion") over evaluative adjective
- ❌ `it is important to note that` — throat-clearing; MS prefers direct claim or footnote
- ❌ Em-dash for parenthetical — MS prefers commas or parentheses; em-dashes signal LLM-style rhythm

---

## Citation-Integration Style  **REQUIRED**

- **Narrative-vs-parenthetical ratio**: e.g., 0.3 (30% narrative, 70% parenthetical)
- **Citation density**: median 2.1 citations per paragraph in Lit Review; 0.4 per paragraph in Results
- **Placement preference**: parenthetical citations cluster at sentence-end; narrative citations cluster at paragraph-opening (context-setting)
- **Multi-citation order**: alphabetical (MS / INFORMS norm) vs chronological (some discipline norms)

---

## Per-Section Worked Example  **REQUIRED**

For EACH section: ONE annotated paragraph from an exemplar, with inline move tags and rationale showing the patterns above in action.

### Introduction worked example

**Source**: Hevner et al. (2004) MISQ, ¶1
**Paragraph**:
> [Original paragraph text here]

**Annotation**:
- Sentence 1–2: M1 Stake-Setting — establishes that DSR is a missing methodological strand in IS
- Sentence 3: M2 Puzzle-Statement — articulates the gap between behavioral and design science
- Sentence 4–5: M4 Contribution-Preview — previews the framework
- Cross-cutting: X1 Hedge ("we propose"), X4 Citation-Integration (parenthetical, 2 citations)

**Why this works**: stakes + puzzle + preview in 5 sentences = MS-style information density for ¶1.

(Repeat for each section.)

---

## Open Questions / Low-Confidence Areas  **REQUIRED** (may be empty)

Conflicts between exemplars OR thin-evidence patterns that the user should know about before trusting the guide.

- **Section X**: Exemplar A uses move M-X at position P; Exemplar B uses move M-Y at position P. Cannot resolve which is the MS default from N=2; recommend adding a third exemplar.
- **Vocabulary**: Conflict on `furthermore` vs `moreover` — both appear with similar frequency. Marking neither as preferred.

If the section is genuinely empty, write: `_No conflicts or low-confidence areas — exemplar set was internally consistent._`

---

## Versioning  **REQUIRED**

| Version | Date | Change |
|---|---|---|
| 0.1 | YYYY-MM-DD | Initial extraction from N exemplars |

User-edited versions must increment (0.2, 1.0, ...) and add a row.

````

---

## Schema enforcement checklist

`/ars-restyle` must verify the loaded guide passes ALL of these before proceeding:

- [ ] H1 title matches `# Style Thinking Guide — <X> × <Y>` pattern
- [ ] Provenance section present with exemplars table containing ≥ 1 row
- [ ] Confidence level present and one of HIGH/MEDIUM/LOW
- [ ] Anti-mimicry audit field present and PASSED (FAILED guides may be loaded only with explicit `--allow-failed-audit` flag)
- [ ] At least one section in Section-Level Rhythm
- [ ] At least one section in Per-Section Move Patterns
- [ ] At least one rule in Author Choice Rubrics with `G-MR-1` ID
- [ ] Vocabulary section present with at least one hedge, one booster, one forbidden pattern
- [ ] At least one Per-Section Worked Example
- [ ] Open Questions section present (may be the empty-marker text)
- [ ] Versioning table present

If any item fails, abort with: `[STYLE-GUIDE-INVALID] Missing or malformed: <field>. Re-run /ars-style-extract or fix the guide manually.`

---

## Editing the guide manually

The guide is **explicitly user-editable**. Common edits:

1. **Strengthen a rule's *why***: the LLM produced reasoning is sometimes too generic. Replace with venue-specific evidence the user knows.
2. **Demote a rule from HIGH to LOW confidence**: when the user disagrees with a pattern the LLM thought was strong.
3. **Add an Open Question**: when the user notices a venue convention the LLM missed.
4. **Override a vocabulary preference**: when the user has personal style they want preserved (this becomes a Priority 3 conflict logged at restyle time).

After manual edit, increment the version number and add a row to Versioning.

---

## Cross-references

- Move taxonomy (the closed vocabulary): `shared/references/rhetorical_move_taxonomy.md`
- Producer command: `commands/ars-style-extract.md`
- Consumer command: `commands/ars-restyle.md`
- Priority hierarchy this guide plugs into: `shared/style_calibration_protocol.md` § Priority 2 Implementation
- Storage convention: `style_guides/README.md`

---

**Maintainer**: project-local customization (not upstream ARS).
