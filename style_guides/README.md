# Style Guides

This directory holds **venue-specific style extraction artifacts** produced by the progressive extraction mechanism embedded in `academic-paper`'s writing flow. See `shared/references/progressive_style_extraction.md` for the full mechanism.

## Directory layout

Each extraction run produces a dated directory:

```
style_guides/<journal-slug>_<topic-slug>_<date>/
├── exemplar_manifest.md          # P0: user's selected exemplars (produced by intake_agent Step 3.5)
├── style_L1_structure.md         # L1: section architecture rules (produced by structure_architect_agent Step 0.5)
├── style_L2_introduction.md      # L2: argumentation patterns per section (produced by argument_builder_agent Step 0.5)
├── style_L2_method.md
├── style_L2_<section>.md
├── style_L3L4_introduction.md    # L3+4: paragraph + narrative features per section (produced by draft_writer_agent Step 1.5)
├── style_L3L4_method.md
├── style_L3L4_<section>.md
├── framework_introduction.md     # Writing framework: paragraph specs with exemplar anchors (produced by draft_writer_agent Step 1.5)
├── framework_method.md
└── framework_<section>.md
```

## How extraction works

1. `intake_agent` Step 3.5 asks for exemplar PDFs → writes `exemplar_manifest.md`
2. `structure_architect_agent` reads exemplar structure → writes `style_L1_structure.md` → outline is venue-shaped
3. `argument_builder_agent` reads exemplar corresponding sections → writes `style_L2_<section>.md` → CER chains use venue argumentation
4. `draft_writer_agent` reads exemplar corresponding paragraphs → writes `style_L3L4_<section>.md` + `framework_<section>.md` → user approves each framework
5. `draft_writer_agent` drafts per-section with framework as hard constraint → user approves each section

## If you don't have exemplars

The config record will show `venue_style_status = "missing"`. The draft proceeds with generic academic conventions. This is a known risk for top-tier venues.

## Reuse

- One guide drives multiple papers targeting the same journal
- Edit files to correct or strengthen rules as you learn more about the venue
- Check into git for co-author review

## Refresh triggers

| Trigger | Action |
|---|---|
| New year | Re-extract — venue style drifts |
| New EIC | Re-extract — house style often shifts |
| Topic shifts substantially | New manifest with topic-matched exemplars |
| Reviewer feedback contradicts a rule | Edit the contradicted rule with reviewer's evidence |
