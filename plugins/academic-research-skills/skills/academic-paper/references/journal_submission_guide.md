# Journal Submission Guide

Used by `formatter_agent` and `intake_agent`.

## Pre-Submission Checklist

### 1. Journal Selection Criteria
- [ ] Scope alignment: Does the journal publish papers on your topic?
- [ ] Audience match: Will the journal's readers care about your findings?
- [ ] Impact: Is the journal recognized in your field?
- [ ] Predatory check: Verify via Beall's List, DOAJ, or Cabells
- [ ] Open access: Does the journal offer OA options? What are the APCs?
- [ ] Timeline: What is the typical review turnaround?
- [ ] Rejection rate: Is it realistic for your paper's quality?

**Cross-domain additional criteria (Privacy Computing × Finance — v3.10)**:
- [ ] Does the journal publish design-science papers? DSR papers?
- [ ] Has the journal published privacy-computing work before?
- [ ] Does the editorial board include scholars from both CS and Finance/Economics backgrounds?
- [ ] What is the journal's position on interdisciplinary work? (Check recent editorials)
- [ ] For IS journals: does the journal expect a kernel theory, or is technical novelty sufficient?
- [ ] For MS journals: does the journal's Finance/IS department handle FinTech, or does this fall between departments?

### 2. Manuscript Preparation
- [ ] Follow journal's Author Guidelines exactly
- [ ] Word/page count within limits
- [ ] Correct citation format (may differ from your preferred style)
- [ ] Figures/tables meet resolution and format requirements
- [ ] Anonymized for double-blind review (if required)
- [ ] Author information page separate from main text
- [ ] Running head (if required)
- [ ] Line numbers (if required)

### 3. Required Components
| Component | Usually Required | Notes |
|-----------|:---------------:|-------|
| Cover letter | ✓ | Addressed to Editor-in-Chief |
| Title page | ✓ | Title, authors, affiliations, corresponding author |
| Abstract | ✓ | Check word limit (often 150-250) |
| Keywords | ✓ | Usually 4-7 |
| Main text | ✓ | Following journal structure |
| References | ✓ | In journal's required format |
| Tables | Often | Separate files or embedded |
| Figures | Often | High-resolution, specific formats |
| Supplementary materials | Sometimes | Data, code, extended analyses |
| Author contributions (CRediT) | Increasingly | Who did what |
| Conflict of interest statement | ✓ | Even if no conflicts |
| Data availability statement | Increasingly | Where data can be accessed |
| Funding statement | ✓ | Grant numbers and funders |
| Ethics statement | If applicable | IRB approval, informed consent |
| AI disclosure | Increasingly | Nature, Science require this |

## Common Journal Types in Higher Education

### UTD24 IS-Track Journals (v3.10)

| Journal | Impact Tier | Citation Style | Typical Length | Abstract | Review Time | Notes for Privacy×Finance |
|---------|------------|---------------|---------------|----------|-------------|---------------------------|
| **MIS Quarterly** | Elite (FT50) | MISQ Author-Date | 9,000–12,000 words | Structured, ≤150 words | 6–12 months | DSR papers dominate; must name kernel theory; evaluation ≥2 methods; design principles are mandatory |
| **Information Systems Research** | Elite (FT50) | INFORMS Author-Date | 9,000–12,000 words | Unstructured, ≤150 words | 6–12 months | Broader IS scope than MISQ; computational + behavioral + econ tracks; research transparency statement required |
| **Journal of MIS** | High (FT50) | APA | 8,000–10,000 words | Unstructured | 4–8 months | Strong on DSR; more tolerant of technical depth; good fit for protocol-heavy privacy×finance |
| **INFORMS Journal on Computing** | High | INFORMS Author-Date | 8,000–12,000 words | Unstructured, ≤200 words | 4–8 months | Algorithmic focus; reproducibility checklist mandatory; code + data availability required; best fit for formal complexity/security contributions |
| **Journal of the AIS** | High | APA | 8,000–10,000 words | Unstructured | 4–8 months | Broad IS scope; theory-forward; good for econ-model or DSR papers with strong theoretical contribution |
| **European Journal of IS** | High | APA | 7,000–9,000 words | Unstructured | 4–8 months | European IS tradition; qualitative + DSR; good for GDPR/regulatory framing |
| **Information Systems Journal** | High | APA | 7,000–9,000 words | Unstructured | 4–8 months | Practice-oriented IS; good for papers where managerial/regulatory implications are primary |
| **Journal of Strategic IS** | High | APA | 7,000–9,000 words | Unstructured | 4–8 months | Strategy/policy focus; good for papers addressing competitive implications of privacy-tech adoption |
| **Journal of Information Technology** | High | APA | 7,000–9,000 words | Unstructured | 4–8 months | Broad IS + IT; organizational and societal impact |

### UTD24 MS-Track Journals (v3.10)

| Journal | Impact Tier | Citation Style | Typical Length | Abstract | Review Time | Notes for Privacy×Finance |
|---------|------------|---------------|---------------|----------|-------------|---------------------------|
| **Management Science** | Elite (FT50) | INFORMS Author-Date | 8,000–12,000 words (≤38 pages) | Unstructured, ≤150 words | 6–14 months | IS, Finance, Operations tracks available; formal modeling expected; double-spaced for submission |
| **Operations Research** | Elite (FT50) | INFORMS Author-Date | 8,000–12,000 words | Unstructured | 6–12 months | Optimization/algorithm-heavy; good for protocol-complexity + financial-optimization papers |
| **Manufacturing & Service Operations Management** | High (FT50) | INFORMS Author-Date | 7,000–10,000 words | Unstructured | 4–8 months | Operations + technology interface; good for supply-chain/inventory privacy-tech applications |

### Cross-Domain Venue Selection Decision Tree (v3.10)

```
Privacy Computing × Finance paper →
├── Primary contribution is DESIGN KNOWLEDGE (design principles, artifact, kernel-theory grounding)?
│   ├── Heavy on DSR methodology → MISQ or ISR
│   ├── More technical, less DSR-formal → JMIS or JAIS
│   └── European/GDPR context → EJIS
├── Primary contribution is ALGORITHMIC (new protocol with formal complexity/security bounds)?
│   ├── The economic mechanism is first-class (not just evaluation) → Management Science (IS/Finance track)
│   ├── The algorithmic contribution is the central claim → INFORMS Journal on Computing
│   └── Optimization-heavy framing → Operations Research
├── Primary contribution is ECONOMIC MODELING (analytical model of privacy-tech adoption/welfare)?
│   ├── Microeconomics of privacy → Management Science (Finance/Economics track)
│   └── IS economics framing (two-sided markets, platforms) → ISR (Economics of IS track)
├── Primary contribution is EMPIRICAL (causal identification of privacy-tech impact on financial outcomes)?
│   ├── Large-scale financial data → Management Science (Finance track)
│   ├── IS-specific data (IT adoption, platform data) → ISR
│   └── Regulatory/policy data → Journal of Strategic IS
└── Primary contribution is PRACTICE/REGULATORY (implementation framework, compliance design)?
    ├── Broad IS practice → ISJ or JIT
    └── Specific technology → MISQ (DSR track) or JMIS

Tiebreaker: If the paper's core narrative starts with "Banks/Markets cannot [financial task] because [privacy constraint]," it is a Management Science or ISR paper. If the paper's core narrative starts with "We propose a novel [cryptographic construction] that achieves [bound]," it is an INFORMS JoC or Management Science paper. The difference is where the intellectual contribution is claimed — in the design knowledge (UTD24 IS) or in the formal result + economic mechanism (UTD24 MS).
```

### Top HEI Journals (International)

| Journal | Impact | Citation Style | Typical Length |
|---------|--------|---------------|---------------|
| Higher Education | High | APA | 8,000-10,000 |
| Studies in Higher Education | High | APA | 6,000-8,000 |
| Research in Higher Education | High | APA | 6,000-10,000 |
| Quality in Higher Education | Medium | APA | 5,000-7,000 |
| Assessment & Evaluation in Higher Education | Medium | APA | 5,000-8,000 |
| Journal of Higher Education | High | Chicago | 8,000-12,000 |
| Tertiary Education and Management | Medium | APA | 5,000-7,000 |
| International Journal of Educational Development | Medium | APA | 6,000-8,000 |

### Major Multidisciplinary Journals

| Journal | Impact | Citation Style | Typical Length | Open Access |
|---------|--------|---------------|---------------|-------------|
| Nature | Very High | Nature style | 3,000-5,000 | Hybrid |
| Science | Very High | Science style | 2,500-4,500 | Hybrid |
| PLOS ONE | Medium | Vancouver | No limit | Full OA |
| Frontiers (series) | Medium-High | Vancouver | 3,000-12,000 | Full OA |
| SAGE Open | Medium | APA | No limit | Full OA |

### Major Education Journals (Beyond HEI)

| Journal | Impact | Citation Style | Typical Length |
|---------|--------|---------------|---------------|
| Review of Educational Research | Very High | APA | 15,000-20,000 |
| Educational Researcher | High | APA | 5,000-8,000 |
| American Educational Research Journal | High | APA | 8,000-12,000 |
| British Educational Research Journal | High | APA | 6,000-8,000 |
| Teaching and Teacher Education | High | APA | 6,000-8,000 |
| Computers & Education | High | APA | 6,000-10,000 |

### Taiwan HEI Journals (TSSCI)

| Journal | Romanized Chinese Name | Citation Style |
|---------|---------|---------------|
| Journal of Research in Education Sciences | Jiao Yu Ke Xue Yan Jiu Qi Kan | APA |
| Bulletin of Educational Research | Jiao Yu Yan Jiu Ji Kan | APA |
| Journal of Taiwan Normal University: Education | Shi Da Xue Bao: Jiao Yu Lei | APA |
| Journal of Educational Practice and Research | Jiao Yu Shi Jian Yu Yan Jiu | APA |
| Higher Education Review | Gao Deng Jiao Yu | APA |

## Cover Letter Template

### Generic Cover Letter

```markdown
[Date]

[Editor Name, if known]
Editor-in-Chief
[Journal Name]

Dear [Editor Name / Editor-in-Chief],

RE: Submission of Original Manuscript — "[Paper Title]"

I am writing to submit our manuscript entitled "[Paper Title]" for
consideration for publication in [Journal Name] as a [Research Article /
Review Article / Brief Communication].

**What the paper addresses:**
[1-2 sentences describing the research problem and why it matters]

**Key findings:**
[1-2 sentences highlighting the most important results]

**Why this journal:**
[1 sentence explaining why this paper fits the journal's scope and readership]

**Confirmations:**
- This manuscript has not been published previously and is not under
  consideration elsewhere.
- All authors have read and approved the final manuscript.
- [If applicable: This research was approved by [IRB/Ethics Committee]
  (approval number: XXX).]
- [If applicable: AI-assisted tools were used in the preparation of this
  manuscript, as disclosed within.]

**Suggested Reviewers** (optional):
1. [Name, Affiliation, Email] — expert in [area]
2. [Name, Affiliation, Email] — expert in [area]

**Excluded Reviewers** (optional):
1. [Name] — [brief reason, e.g., "recent collaborator"]

Thank you for considering our submission. We look forward to hearing from you.

Sincerely,

[Corresponding Author Name]
[Title, Department]
[Institution]
[Email]
[ORCID: xxxx-xxxx-xxxx-xxxx]
```

### UTD24 Cover Letter Template (v3.10)

UTD24 journals expect the cover letter to demonstrate editorial-scope awareness and contribution-type precision. Use this template for MISQ, ISR, Management Science, and INFORMS JoC:

```markdown
[Date]

[Editor Name, if known]
[Editorial Track, if applicable — e.g., "IS Track Editor" or "Finance Department Editor"]
[Journal Name]

Dear [Editor Name / Editor-in-Chief],

RE: Submission — "[Paper Title]"

We submit our manuscript for consideration at [Journal Name], targeting
the [editorial track / department]. We believe the contribution is best
classified as [DSR artifact / algorithmic contribution with economic
mechanism / analytical economic model / empirical identification].

== PROBLEM AND MOTIVATION ==
[2–3 sentences: what is the financial/managerial problem? Why does it
persist despite existing solutions? What is at stake economically?]

== THEORETICAL LENS AND CONTRIBUTION TYPE ==
The paper is grounded in [kernel theory / theoretical framework]. We
contribute [design principles / formal bounds / equilibrium
characterization / causal estimates] that advance our understanding of
[phenomenon].

Specifically:
- [Contribution 1 — the primary intellectual move]
- [Contribution 2 — the validation or extension]
- [Contribution 3 — the managerial/regulatory upshot]

== FIT WITH [JOURNAL NAME] ==
[3–4 sentences that demonstrate you have read the journal, not just its
impact factor. Reference: (a) the journal's editorial scope statement,
(b) 1–2 specific recent papers in this journal on related topics, (c)
why your paper extends or complements that conversation rather than
duplicating it.]

Examples:
- For MISQ: "Our design-science contribution responds directly to [SE/SE/AE's]
  recent editorial calling for IS research at the intersection of
  computational innovation and financial market design (MISQ 48:2)."
- For Management Science: "Our paper joins the growing MS literature on
  FinTech and information design (e.g., [recent MS paper]), extending
  it to the setting where information must be shared across competing
  institutions under cryptographic privacy constraints."

== CONFIRMATIONS ==
- Original submission, not under consideration elsewhere.
- All authors approved the manuscript.
- [Funding + COI + Ethics + AI disclosure as applicable.]
- For INFORMS JoC: "Code, data, and benchmark configurations are included
  as supplementary materials per the journal's reproducibility policy."

== REVIEWER SUGGESTIONS ==
Given the cross-domain nature of this work, we suggest reviewers with
expertise in (a) [privacy-computing area] and (b) [financial domain]:
1. [Name, Affiliation] — expertise in [area]
2. [Name, Affiliation] — expertise in [area]
3. [Name, Affiliation] — expertise in [area]

We respectfully exclude: [Name] — [reason, e.g., "close collaborator
within the past 3 years"]

Sincerely,
[Corresponding Author]
```

## CRediT Author Contributions

| Role | Description |
|------|-------------|
| Conceptualization | Ideas; formulation of research goals |
| Data curation | Management activities for research data |
| Formal analysis | Application of statistical or computational techniques |
| Funding acquisition | Financial support for the project |
| Investigation | Conducting the research and data collection |
| Methodology | Development or design of methodology |
| Project administration | Management and coordination |
| Resources | Provision of study materials or tools |
| Software | Programming, software development |
| Supervision | Oversight and leadership |
| Validation | Verification of results |
| Visualization | Preparation of data presentation |
| Writing – original draft | Initial writing |
| Writing – review & editing | Critical review and revision |

## Data Availability Statement Templates

### Open Data
```
The data that support the findings of this study are openly available in
[repository name] at [URL/DOI].
```

### Restricted Data
```
The data that support the findings of this study are available from
[source] but restrictions apply to the availability of these data, which
were used under license for the current study, and so are not publicly
available. Data are available from the authors upon reasonable request
and with permission of [source].
```

### No Data Sharing
```
Data sharing is not applicable to this article as no new data were
created or analyzed in this study.
```

## AI Disclosure Templates

### Minimal Disclosure
```
AI Disclosure: AI-assisted tools were used during the preparation of
this manuscript. The authors reviewed and take full responsibility for
the content.
```

### Detailed Disclosure
```
AI Disclosure: The authors used [tool name] during the preparation of
this work. Specifically, [tool name] was used for [specific tasks: e.g.,
literature search assistance, language editing, data visualization].
After using this tool, the authors reviewed and edited the content as
needed and take full responsibility for the content of the published
article.
```

### AI-Assisted Code and Algorithm Development Disclosure (v3.10)

Privacy-computing papers frequently use AI for code generation, formal-proof verification assistance, or automated experiment orchestration. Standard writing-assistance disclosures do not cover these uses.

```
AI Disclosure — Code and Algorithm Development:

[Tool name(s)] were used during the development of the algorithms,
protocol implementations, and experimental framework reported in
this paper. Specifically:
- [Tool name] was used for [code generation / optimization /
  debugging] of the [component name] implementation.
- [Tool name] was used for [formal verification assistance /
  proof checking] of [theorem / lemma / security property].
- [Tool name] was used for [experiment automation / hyperparameter
  search / benchmark orchestration].

All AI-generated code and proof fragments were reviewed, tested, and
validated by the authors. The authors take full responsibility for
the correctness of all algorithms, protocols, and experimental
results reported in this paper. No AI-generated content was included
without human verification.

Reproducibility note: All source code, benchmarks, and configuration
files are available at [repository URL] and can be compiled and
executed independently of the AI tools used during development.
```

## Post-Submission: Responding to Peer Review

### Response Letter Structure

**Reference**: For automated response-letter skeleton generation, see `revision_coach_agent.md` Step 6 and Optional Output formats. The revision coach can pre-populate a response letter with all reviewer comments parsed and placeholder responses ready to fill in.

```markdown
Dear Editor and Reviewers,

Thank you for your constructive feedback on our manuscript "[Title]"
(Manuscript ID: XXX). We have carefully addressed all comments and
revised the manuscript accordingly. Below we provide point-by-point
responses.

---

## Reviewer 1

**Comment 1**: [Quote the reviewer's comment]
**Response**: [Your response explaining what you did]
**Changes**: [Describe specific changes, with page/line numbers]

**Comment 2**: [...]
**Response**: [...]
**Changes**: [...]

---

## Reviewer 2

[Same format]

---

We believe these revisions have substantially strengthened the
manuscript and hope it is now suitable for publication.

Sincerely,
[Authors]
```

### UTD24 Response Letter Conventions (v3.10)

UTD24 revise-and-resubmit letters have additional conventions beyond generic response letters:

1. **Revision summary table**: Before the point-by-point response, include a structured table mapping each major revision to the theoretical contribution it strengthens:
   | Revision | Theoretical Implication | Section | Page |
   |----------|------------------------|---------|------|
   | Added formal incentive-compatibility analysis | Strengthens kernel-theory grounding (agency theory) | §5.3 | pp. 18–22 |
   | Additional evaluation episode with heterogeneous bank sizes | Extends boundary-condition evidence | §7.4 | pp. 29–32 |

2. **Kernel-theory commitment**: For DSR papers at MISQ/ISR, explicitly state how each major revision affects the design principles or kernel-theory grounding. Reviewers expect to see that the revision deepened the theoretical contribution, not just added data.

3. **Cross-reviewer synthesis**: When the same concern was raised by multiple reviewers (common at UTD24 venues due to interdisciplinary reviewer panels), address it ONCE with a header "Raised by R1 and R3" rather than duplicating the response.

4. **Disagreement with reviewer**: If you disagree with a reviewer on a substantive point, frame it as a scholarly dialogue rather than a correction of the reviewer. Template: "We appreciate Reviewer 2's suggestion to [alternative approach]. We considered this carefully and chose to retain our approach because [intellectual justification with evidence]. We have added a discussion of this trade-off on pp. X–Y."

### Response Best Practices
1. Respond to EVERY comment (even if you disagree)
2. Be respectful and grateful
3. If you disagree, explain why with evidence
4. Reference specific page/line numbers for changes
5. Use tracked changes in the revised manuscript
6. Submit a clean copy AND a tracked-changes copy
