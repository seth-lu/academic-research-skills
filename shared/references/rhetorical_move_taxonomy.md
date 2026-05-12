# Rhetorical Move Taxonomy

Closed vocabulary for paragraph-level rhetorical analysis of academic papers. Used by the progressive extraction mechanism during `academic-paper`'s writing flow: `draft_writer_agent` Step 1.5 annotates exemplar paragraphs with move IDs, and Step 2 Path A uses them in framework paragraph specs.

**Why a closed list**: without a fixed taxonomy, each LLM call invents its own move labels and extraction layers cannot speak the same language across phases. Every move below has a unique ID — L3 extraction annotates by ID, framework specs reference moves by ID.

**Theoretical grounding**: extends Swales (1990) CARS model for introductions and Hyland (2005) metadiscourse framework for cross-cutting features, augmented with empirical-IS / OR-analytical / DSR-specific moves observed in MISQ / ISR / Management Science / INFORMS JoC papers.

---

## Reading the table

| Field | Meaning |
|---|---|
| **ID** | Unique identifier. Cite as `M3` or `X1` in guides and rationales. |
| **Function** | What the paragraph DOES rhetorically (not what it talks about). |
| **Typical position** | Where in the section this move usually appears. |
| **Exemplar template** | A schematic sentence that realizes the move. |
| **Anti-pattern** | A miscalibrated realization that triggers reviewer complaints. |
| **MS-vs-MISQ default** | Where the two journals diverge on this move. Empty = same default. |

---

## Section A: Introduction moves (M1–M8)

| ID | Name | Function | Typical position | Exemplar template | Anti-pattern | MS-vs-MISQ default |
|---|---|---|---|---|---|---|
| M1 | Stake-Setting | Establish that the empirical or theoretical territory matters at this moment in time | Intro ¶1 sentence 1–2 | "Privacy-preserving analytics in inter-bank settlement now affects $X trillion in daily volume" | Throat-clearing about how the field has evolved over decades | MS prefers numbers + immediate stakes; MISQ tolerates a sentence of context |
| M2 | Puzzle-Statement | State the specific tension or gap that motivates the paper | Intro ¶1 sentence 3–5 | "Yet whether [X] improves or worsens [Y] remains an open question" | Vague "little is known about" with no tension | MS expects sharp puzzle in ¶1; MISQ tolerates ¶2 |
| M3 | Literature-Gap | Articulate what prior work has missed or assumed | Intro ¶2–3 | "Prior work has assumed [A]. We relax this and ask whether [B]" | Listing every paper without distilling the gap | MS: 2–4 citations max in this move; MISQ: tolerates broader sweep |
| M4 | Contribution-Preview | State what the paper does, in plain English | Intro ¶3–4 | "We show that [main result], using [method], in the context of [setting]" | Saving the contribution for §1.5 or §2 | Both: contribution must appear in Intro by word ~600 |
| M5 | Roadmap | Tell reader the section sequence | Intro last ¶ | "The remainder is organized as follows: §2 ... §3 ..." | Roadmap longer than 4 sentences | MS often skips roadmap; MISQ usually includes |
| M6 | Significance-Hook | Tie the contribution to a broader implication | Intro ¶3–4 | "These results imply that [policy/practice/theory] should reconsider [Z]" | Generic "this matters" without specifying for whom | MISQ requires this; MS optional |
| M7 | Reader-Hook | Use a vivid scenario or counterexample to engage | Intro ¶1 alternative opening | "When [BANK] processed [TRANSACTION], it faced [TRADEOFF]..." | Story without a punchline tied to the puzzle | MISQ tolerates; MS rare |
| M8 | Counter-Concession | Pre-empt the obvious objection | Intro ¶3 or ¶4 | "One might object that [O]; however, [response]" | Conceding a point without rebutting | Both: signals confident framing |

---

## Section B: Literature review moves (M9–M14)

| ID | Name | Function | Typical position | Exemplar template | Anti-pattern | MS-vs-MISQ default |
|---|---|---|---|---|---|---|
| M9 | Stream-Naming | Name the literature stream(s) the paper engages with | Lit-review opening | "Our work draws on three streams: [A], [B], and [C]" | Treating literature as a flat list | MS: 2–3 streams; MISQ: tolerates 4–5 |
| M10 | Synthesis-Claim | Make a claim about what the stream collectively shows | Per-stream paragraph opener | "This stream finds that [pattern], with the exception of [outlier]" | Annotated bibliography style (one paragraph per paper) | Both: synthesis required, not annotation |
| M11 | Position-Taking | State where YOUR work sits relative to the stream | Per-stream paragraph closer | "We extend this stream by [contribution]" / "We depart from this stream by [contribution]" | Reviewing without positioning | Both: required at stream-end |
| M12 | Limit-Acknowledgment | Note what the stream cannot answer that your paper can | Anywhere in lit review | "These studies do not address [gap], which is the focus of our paper" | Limit acknowledgment that your paper also doesn't address | Both |
| M13 | Connector-to-Own-Work | Hand off explicitly from review to your contribution | Lit-review final ¶ | "Building on these foundations, we develop [your contribution]" | Abrupt jump from review to methods | Both: required transition |
| M14 | Borrowed-Construct | Adopt and explicitly cite a construct from outside the home stream | Mid-review | "We adopt [Author's] notion of [construct] (Author Year)" | Using a construct without flagging the borrow | DSR papers (MISQ) need this more often |

---

## Section C: Model / Methods moves (M15–M21)

| ID | Name | Function | Typical position | Exemplar template | Anti-pattern | MS-vs-MISQ default |
|---|---|---|---|---|---|---|
| M15 | Setup-Declaration | Describe the world the model lives in | Model §1 | "Consider an economy with N agents, each endowed with [E], facing [decision]" | Diving into equations before stating the world | MS: dense and abstract; MISQ: may include narrative scenario first |
| M16 | Notation-Introduction | Establish symbols and conventions | Model §2 (often a table) | "Let X denote [thing]; we use bold for vectors" | Notation introduced ad-hoc throughout the paper | MS: notation table mandatory; MISQ: tolerates inline |
| M17 | Assumption-Justification | State each assumption with a one-sentence reason | Each assumption listed | "Assumption 1 (Risk Neutrality). [Statement]. We adopt this because [reason; cite if standard]" | Assumption listed without justification | Both: each assumption needs a *why*, even if "for tractability" |
| M18 | Tractability-Argument | Defend a simplification by appeal to tractability or pedagogy | Where the simplification is introduced | "We focus on the two-period case for tractability; the n-period extension appears in §6" | Apologizing without defending | MS expects this; MISQ less common |
| M19 | Robustness-Foreshadow | Promise that an extension or robustness check is coming | After a key simplification | "We relax this assumption in §5.2" | Promising and not delivering | Both |
| M20 | Comparative-Anchoring | Position the construction relative to a named prior protocol/algorithm | After construction is introduced | "Our protocol differs from [Prior] in that we use [X] rather than [Y], reducing [cost] by [amount]" | Construction without comparison | Crypto-protocol papers (JoC, MS-IS) need this; MISQ less |
| M21 | Threat-Model-Statement | State the adversary's capabilities and goals (security/privacy papers) | Methods §threat-model | "We assume a semi-honest adversary corrupting up to t < n/2 parties in the standalone model" | "Our protocol is secure" without naming the model | Crypto/privacy papers required; pure economic theory N/A |

---

## Section D: Results moves (M22–M27)

| ID | Name | Function | Typical position | Exemplar template | Anti-pattern | MS-vs-MISQ default |
|---|---|---|---|---|---|---|
| M22 | Result-Statement | State the result formally | Theorem/Proposition box | "Theorem 1. Under Assumptions 1–3, [statement]" | Stating without formal frame | Both |
| M23 | Magnitude-Quantification | Translate the formal result into magnitude | Sentence after the theorem | "This implies a 23% reduction in [metric] when [parameter] doubles" | Statistical significance without economic significance | MS: required; MISQ: required |
| M24 | Mechanism-Interpretation | Explain WHY the result holds | After magnitude | "The intuition is that [mechanism]: when [condition], [actor] does [action]" | Stating result without intuition paragraph | MS expects this paragraph; MISQ also |
| M25 | Boundary-Statement | State when the result does NOT hold | After interpretation | "This result requires [condition X]; it fails when [condition Y]" | Result presented as universal | Both |
| M26 | Reviewer-Pre-emption | Anticipate a likely reviewer objection and address it | Before the discussion | "A natural concern is [O]. We address this in three ways: [A], [B], [C]" | Leaving objections for reviewers to find | MS: heavy use; MISQ: less |
| M27 | Comparison-to-Prior | Position the result vs prior result | After interpretation | "[Prior author] found [opposite/similar/extension]. The discrepancy arises because [X]" | New result presented in isolation | Both |

---

## Section E: Discussion moves (M28–M34)

| ID | Name | Function | Typical position | Exemplar template | Anti-pattern | MS-vs-MISQ default |
|---|---|---|---|---|---|---|
| M28 | Theoretical-Implication | Tie back to the literature stream's theory | Discussion ¶1 | "Our results suggest [Theory] should be amended to include [X]" | Restating results without abstraction | Both: required at top of Discussion |
| M29 | Managerial-Implication | Tie back to practitioners | Discussion ¶2–3 | "Banks deploying privacy-tech should prioritize [X] when [condition]" | Bullet list of buzzwords | MISQ: required, prominent; MS: required but more compact |
| M30 | Generalization-Caveat | State the limits of generalization | Discussion mid | "Our results apply to [setting]; extension to [other setting] requires [additional structure]" | Overclaiming generalization | Both |
| M31 | Limitation-Disclosure | Honest list of paper's limitations | Discussion late | "Our analysis has three limitations: [A], [B], [C]" | Hidden limitations or trivial limitations only | Both required |
| M32 | Future-Work-Pointer | Specific, not generic, future directions | Discussion close / Conclusion | "Three extensions seem fruitful: [specific], [specific], [specific]" | "Future work could explore many directions" | Both: specificity matters |
| M33 | Final-Hedge | Soften the strongest claim | Conclusion ¶1 | "Subject to the assumptions outlined above, our findings suggest [contribution]" | Final paragraph as triumphalism | MS uses; MISQ tolerates more confidence |
| M34 | Closing-Significance-Echo | End by restating the M6 hook | Conclusion last sentence | "These insights matter for [stakeholder] as [trend] accelerates" | Open-ended fade-out | MISQ uses; MS often skips |

---

## Section F: Cross-cutting moves (X1–X4)

These are not paragraph-level moves but sentence/phrase-level patterns that recur across all sections.

| ID | Name | Function | Typical realization | Anti-pattern | MS-vs-MISQ default |
|---|---|---|---|---|---|
| X1 | Hedge | Soften a claim | "suggests" / "appears to" / "may" | Over-hedging that erases the claim | MS prefers fewer, sharper hedges; MISQ tolerates more |
| X2 | Booster | Strengthen a claim | "demonstrates" / "establishes" / "confirms" | Over-boosting unsupported claims | Both: reserve for theorem-backed claims |
| X3 | Self-Reference | Refer to the paper's own structure | "as we show in §4" / "above we argued" | Excessive self-reference (>1 per page) | MS minimizes; MISQ tolerates more |
| X4 | Citation-Integration | How a citation is woven into the sentence | Narrative ("Hevner et al. (2004) argue...") vs Parenthetical ("(Hevner et al. 2004)") | Citation dump at sentence end | MS prefers parenthetical; MISQ uses both freely |

---

## How to use this taxonomy

### In L3 extraction (draft_writer_agent Step 1.5)
For each paragraph in each exemplar paper, the annotation follows:
1. Identify the **primary move** (one of M1–M34)
2. Identify up to **2 secondary moves** if the paragraph does more than one thing
3. Note any **cross-cutting moves** (X1–X4) realized in the paragraph
4. State the **author's choice rationale** — why this move at this position, given the previous paragraph?
5. Record the move ID in `style_L3_<section>.md` for use as the paragraph-level reference during drafting

### In L3-constrained drafting (draft_writer_agent Step 2 Path A)
For each paragraph in the section:
1. Consult the paragraph move sequence in `style_L3_<section>.md`
2. Each row specifies the target move ID for that paragraph position
3. Draft the paragraph to fulfill that rhetorical function
4. If the content doesn't fit the specified move, flag it — the L3 file may need adjustment (user can request revision of specific paragraphs)

### Failure mode to watch for
If a paragraph cannot be classified into any move with confidence > 60%, the analysis prompt should NOT invent a new move. Instead, log the paragraph as `UNCLASSIFIED` and surface it in the guide's "Open Questions" section. The taxonomy is closed; if a paper systematically uses moves outside this list, the taxonomy needs extension (file a project-level update), not on-the-fly invention.

---

## Versioning

| Version | Date | Change |
|---|---|---|
| 1.0 | 2026-05-08 | Initial release: 34 section-moves + 4 cross-cutting; calibrated for IS / OR / DSR / crypto-protocol papers in UTD24 venues |

Future extensions likely needed for: experimental psychology / behavioral economics moves (different result-presentation patterns); pure mathematics moves (proof-architecture moves); medical RCT moves (CONSORT-driven moves).

---

**Maintainer**: project-local customization (not upstream ARS).
