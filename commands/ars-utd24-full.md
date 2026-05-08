---
description: ARS full pipeline preset for UTD24 IS-track / MS-track (Privacy Computing × Finance). 中文起草 → 英文终稿.
model: opus
---

Trigger the `academic-pipeline` orchestrator with a domain preset for **Privacy Computing × Finance** research targeting **UTD24** journals (MIS Quarterly / Information Systems Research / Management Science / INFORMS Journal on Computing).

This is **not a new mode** — it is the standard `(pipeline)` orchestrator invoked with a preloaded domain configuration. All ten pipeline stages (deep-research → academic-paper → integrity → academic-paper-reviewer → revision → re-review → final integrity → finalize) run as usual.

## Preset configuration

When this command is invoked, the orchestrator MUST set the following before Phase 0 Configuration Interview:

| Field | Value |
|---|---|
| `target_track` | `utd24_is_or_ms` |
| `primary_discipline` | `Information Systems` |
| `secondary_disciplines` | `[cryptography, privacy, finance, FinTech]` |
| `methodology_weight` | `method-driven` |
| `drafting_language` | `zh-CN` (简体中文) |
| `final_language` | `en` |

## References to load before drafting

Pre-load the following into agent context (treated as authoritative for all writer / reviewer / abstract agents in the pipeline):

1. `shared/references/privacy_finance_glossary.md` — bilingual terminology + Anti-Pattern Phrasings table. Every privacy/security claim MUST resolve to a row before output.
2. `shared/references/privacy_finance_methodology_presets.md` — three recipes (DSR-MISQ / Crypto-Protocol / Econ-IS Analytical). `structure_architect_agent` selects one in Phase 1 based on the user's contribution type.
3. `academic-paper-reviewer/references/top_journals_by_field.md` Section 7.5 — UTD24 IS-track / MS-track journal preferences and the Finance-track adjacency note.
4. `academic-paper-reviewer/agents/field_analyst_agent.md` Example 3 — default reviewer panel for this domain (EIC=MISQ SE, R1=cryptography, R2=FinTech, R3=privacy-regulation).
5. `academic-paper/references/citation_format_switcher.md` UTD24 section — MISQ Author-Date and INFORMS Author-Date styles.
6. `style_guides/<target-journal>_*.md` (when present) — venue-specific writing-thinking guide produced by `/ars-style-extract`. The UTD24 preset benefits especially from the style pipeline because UTD24 venues (especially MISQ vs MS vs JoC) have sharply different house styles. See `intake_agent` Phase 0 Step 10.5 for the exemplar-collection prompt that produces this guide.

## Phase 0 — Configuration Interview defaults

`intake_agent` SHOULD pre-fill the configuration record with:

- **Paper type**: empirical (DSR) / methodological (crypto protocol) / theoretical (analytical model) — ASK the user; default suggestion based on user's contribution claim.
- **Target journal**: ASK the user; presented options ordered: MISQ → ISR → Management Science → INFORMS JoC → JMIS → DSS.
- **Citation format**: auto-derived from target journal (see UTD24 routing table in `citation_format_switcher.md`).
- **Output format**: LaTeX (default for INFORMS JoC and MS) or DOCX (default for MISQ).
- **Language**: drafting in zh-CN, finalization in en. `abstract_bilingual_agent` produces the bilingual abstract at finalization.
- **Word count**: from methodology preset (Recipe 1: 9k–13k; Recipe 2: 9k–14k; Recipe 3: 8k–12k).

## Default reviewer panel

`field_analyst_agent` applies Example 3 panel by default. Override only if the user's contribution type does not match (e.g., a pure empirical-finance paper without a privacy-tech artifact — in which case re-route to standard reviewer panel and ask the user to confirm the UTD24 IS-track is still the right venue).

## Quality-gate additions for this preset

In addition to the standard pipeline integrity gates (Stage 2.5, 4.5):

1. **Glossary coverage check** at end of Phase 4 drafting: scan draft for top-20 privacy-finance terms; each must resolve to a glossary row. Flag conflations (anonymization vs DP; FL vs privacy; blockchain hand-waving).
2. **Recipe alignment check** at end of Phase 4: draft structure must match the selected methodology preset's required-section table within ±1 section.
3. **Citation-style validation** at Phase 5: every reference list entry passes the MISQ or INFORMS author-date format checker.
4. **Bilingual abstract** at Phase 6: zh-CN + en abstract produced by `abstract_bilingual_agent`. Ensure bilingual consistency on technical terms via the glossary.

## Material Passport seed corpus (optional)

If the user has a literature collection to seed, point them at `examples/privacy_finance_seed_corpus/` for a reference set of ~25 canonical papers (FL in fraud / MPC inter-bank / DP financial micro-data / ZKP audit / TEE trading) usable with the v3.6.4 corpus adapter.

## Mode reference

- Orchestrator: `(pipeline)` in `MODE_REGISTRY.md` § academic-pipeline.
- Skill entry: `academic-pipeline/SKILL.md`.
- Domain customization layer: see `.claude/CLAUDE.md` § Domain Customizations.
