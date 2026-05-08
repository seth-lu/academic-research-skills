# Privacy Computing × Finance Seed Corpus

This directory ships a curated reference set of ~25 canonical papers at the intersection of **privacy computing** (MPC / FHE / ZKP / DP / FL / TEE) and **finance** (market microstructure, AML, credit scoring, inter-bank settlement, FinTech). Use it to seed the v3.6.4 Material Passport `literature_corpus[]` field when starting a UTD24 IS-track / MS-track project.

## Files

- `manifest.yaml` — the seed corpus, one entry per paper, conformant to `shared/contracts/passport/literature_corpus_entry.schema.json`.
- `README.md` — this file.

## Status

**These are bibliographic pointers, not acquired sources.** Every entry has:

```yaml
source_acquired: false
description_last_audit: "none"
description_source: "bibliography_v0"
```

i.e., ARS knows the citation metadata but has NOT downloaded or audited the original PDFs against their bibliographic record. **You must acquire each paper into your own KB before relying on it for claims** — see ARS v3.7.1 trust-chain rules (`shared/contracts/passport/literature_corpus_entry.schema.json` § §3.1 firm rule #1).

This is the same fail-soft default pattern used by reference adapters at `scripts/adapters/`. Your `folder-scan` or `zotero-bbt-export` adapter is the correct path to populate `source_acquired: true` after you have the files.

## Categories (n ≈ 25)

| # | Sub-topic | Entries |
|---|---|---|
| 1 | Federated Learning in fraud / credit / banking | 5 |
| 2 | MPC for inter-bank settlement / reconciliation | 5 |
| 3 | Differential Privacy for financial micro-data | 5 |
| 4 | ZKP for audit / regulatory compliance | 4 |
| 5 | TEE in trading / payment systems | 3 |
| 6 | Foundational privacy-tech surveys cited in UTD24 papers | 4 |

## How to use

### Option A — drop into an existing Material Passport

If you already have a passport YAML, splice the `literature_corpus:` block from `manifest.yaml`:

```yaml
literature_corpus:
  # ...your existing entries (if any)...
  # Append from examples/privacy_finance_seed_corpus/manifest.yaml literature_corpus[]:
  - citation_key: hevner2004design
    # ...
```

### Option B — start fresh with `/ars-utd24-full`

The `/ars-utd24-full` slash command auto-suggests this seed corpus during Phase 0. Confirm at the prompt and the orchestrator will splice it into the new passport.

### Option C — convert to BibTeX

```bash
python scripts/adapters/folder_scan.py \
    --input examples/privacy_finance_seed_corpus/manifest.yaml \
    --output literature_corpus.bib
```

(Hypothetical reverse-direction; `folder_scan.py` ships forward-direction only. You may need a small ad-hoc converter.)

## Curation principles

1. **UTD24-citation graph weight**: every entry is cited at least once in a 2018–2025 MISQ / ISR / Management Science / INFORMS JoC paper that touches privacy computing. (Citation graph not pre-computed in this stub; verify with Semantic Scholar API protocol.)
2. **Methodological diversity**: split across constructive (new protocol), evaluative (benchmark / measurement), and analytical (model / theory) papers.
3. **Privacy-tech coverage**: at least one entry for each of MPC / FHE / DP / FL / ZKP / TEE.
4. **Finance scenario coverage**: at least one entry for each of credit, AML, inter-bank settlement, market microstructure, regulatory compliance.
5. **Foundational anchors**: include the canonical foundations (Hevner DSR, Akerlof info asymmetry, Dwork DP, Yao MPC) so downstream agents can resolve "kernel theory" cites without external search.

## Limitations

- This is a **starter** corpus, not exhaustive. Expect to add 50–200 more entries during your literature review (Phase 1 of the pipeline).
- Some entries are **placeholders** for well-known papers; verify DOI and venue before final submission. ARS does not dereference DOIs at write time.
- Tags use a flat namespace; consider promoting to hierarchical tags if your KB supports it (Zotero, Obsidian).

## Maintenance

This corpus is project-local and will drift over time as new UTD24 papers in privacy-finance are published. Refresh approximately yearly, or after each major venue's annual round (MISQ R&R outcomes, ISR best-paper announcements).

---

**Schema version**: matches `shared/contracts/passport/literature_corpus_entry.schema.json` v3.7.1
**Last updated**: 2026-05-08
