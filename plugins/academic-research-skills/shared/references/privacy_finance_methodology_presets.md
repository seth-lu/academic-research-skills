# Privacy Computing × Finance — Methodology Presets

Method-driven research recipes for the Privacy Computing × Finance interdisciplinary domain, calibrated to **UTD24 IS-track / MS-track** review culture (MISQ, ISR, Management Science, INFORMS Journal on Computing).

Loaded by:
- `academic-paper/agents/structure_architect_agent.md` — to pick the right paper skeleton
- `academic-paper/agents/argument_builder_agent.md` — to align argument structure with venue norms
- `academic-paper-reviewer/agents/methodology_reviewer_agent.md` — to score methodological rigor against expected pattern
- `commands/ars-utd24-full.md` — pre-loaded by the UTD24 preset

The user has selected **method-driven** weight: new MPC/FHE/ZKP/DP/FL protocol or algorithm + financial-scenario validation. The three recipes below cover the dominant publication paths.

---

## Recipe 1 — DSR-MISQ (Design Science Research, MISQ-style)

**Best fit**: MIS Quarterly, Information Systems Research (design-science track), Journal of Management Information Systems.

**Core promise to the reviewer**: novel IT artifact + rigorous evaluation + abstracted design principles + economic/managerial implication.

### Required structure

| § | Section | Word target | What MUST be inside |
|---|---|---|---|
| 1 | Introduction | 1,000–1,500 | Problem framed in financial-business terms (NOT cryptographic terms first); gap in current practice; preview of artifact + 1-sentence summary of findings |
| 2 | Background and Related Work | 1,500–2,000 | Two literature streams: (a) the financial problem (e.g., inter-bank reconciliation, AML, credit scoring); (b) the privacy-computing primitive (MPC/FHE/DP/FL/ZKP/TEE). Identify the unsolved intersection. |
| 3 | Theoretical Foundations / Kernel Theory | 800–1,200 | Pin the kernel theory: information asymmetry (Akerlof 1970) / Hevner et al. DSR / Gregor's theory types. Make the theory commitment explicit. |
| 4 | Artifact Design | 2,000–3,000 | (a) **Design requirements** derived from §2 (numbered DR1, DR2, …); (b) **Design principles** abstracting the construction; (c) **Concrete instantiation** — protocol diagram + pseudocode; (d) **Threat model statement** (semi-honest vs malicious; standalone vs UC; corruption threshold). |
| 5 | Evaluation | 2,500–3,500 | Multi-method per Venable et al. (2012): (a) **Analytical** — security proof sketch / complexity; (b) **Experimental** — runtime / communication / utility on financial dataset; (c) **Comparative** — against status-quo baseline AND a non-private baseline AND a strong-private baseline; (d) **Demonstrative** — case study with a real or realistic financial scenario. |
| 6 | Discussion | 1,000–1,500 | Generalization of design principles; boundary conditions; managerial/economic implication (this is where MISQ desk-rejects pure-CS papers); regulatory fit. |
| 7 | Conclusion | 400–600 | Contributions, limitations, future work. |

**Total target**: 9,000–13,000 words main text (within MISQ's 12k SE preference; ISR DSR papers similar).

### Anti-patterns specific to DSR-MISQ

- ❌ Going straight from "we propose protocol X" to "Algorithm 1" without §3 kernel theory and §4 design requirements. **MISQ rejects DSR papers without a theory commitment.**
- ❌ Evaluation reduced to one experiment. MISQ requires multi-method evaluation (≥2 of analytical/experimental/observational/case-study).
- ❌ "Managerial implications" section that is a bullet list of buzzwords. Must be 1–2 substantive paragraphs tying artifact properties to specific business outcomes.
- ❌ Treating the financial scenario as an afterthought illustration. The scenario is co-equal with the artifact in MISQ DSR.
- ❌ Reporting only ε (privacy budget) without translating to a business-meaningful claim. Pair every ε with a concrete leakage-bound or attack-success-probability statement.

### Required cross-references in the draft

- §4 threat model → `shared/references/privacy_finance_glossary.md` Section 1 + Anti-Pattern Phrasings table
- §3 kernel theory citation → at least one of: Hevner et al. 2004, Gregor and Hevner 2013, Peffers et al. 2007
- §6 managerial implication → connect to Section 2's finance terminology (`shared/references/privacy_finance_glossary.md` Section 2)

---

## Recipe 2 — Crypto-Protocol with Financial Evaluation (INFORMS JoC / Management Science computational track)

**Best fit**: INFORMS Journal on Computing, Management Science (Information Systems department, design-science or computational track), occasionally MISQ if the managerial framing is strong.

**Core promise to the reviewer**: novel cryptographic construction + tight security analysis + rigorous complexity bounds + reproducible empirical evaluation on a financial dataset.

### Required structure

| § | Section | Word target | What MUST be inside |
|---|---|---|---|
| 1 | Introduction | 800–1,200 | Cryptographic-problem statement + financial application; preview of result (e.g., "First malicious-secure protocol for X in O(n log n) communication"); contributions in numbered list. |
| 2 | Preliminaries | 800–1,500 | Notation table; recap primitives used (e.g., garbled circuits, OT, PRF, hash functions); security definitions used (semi-honest, malicious, UC); hardness assumptions (DDH, LWE, etc.). |
| 3 | Problem Statement and Threat Model | 600–1,000 | Functionality definition (ideal world); adversary model — corruption threshold, computational power, network model; security goal (privacy / correctness / fairness / robustness). |
| 4 | Construction | 1,500–2,500 | Step-by-step protocol description; pseudocode in figure; intuition paragraph between formal description and theorem. |
| 5 | Security Proof | 1,500–2,500 | Theorem statement; simulator construction; hybrid argument; reduction to assumption. Inline if short, appendix if long with sketch in main text. |
| 6 | Complexity Analysis | 600–1,000 | Communication complexity (round + bandwidth); computation complexity (per party); compare to prior best in a table. |
| 7 | Empirical Evaluation | 1,500–2,500 | Implementation details; **financial dataset** (state which: transaction logs, market microstructure data, credit records); metrics: throughput, latency, accuracy/utility; baseline comparisons; ablation. |
| 8 | Application Discussion | 800–1,200 | How the protocol embeds in a real financial workflow (e.g., RTGS integration, AML pipeline); regulatory fit; deployment caveats. |
| 9 | Related Work | 600–1,000 | Cryptography side + financial-applications side, two paragraphs. |
| 10 | Conclusion | 300–500 | |

**Total target**: 9,000–14,000 words.

### Anti-patterns specific to crypto-protocol papers

- ❌ Skipping §3 threat model rigor. INFORMS JoC and Management Science reviewers (R1 = cryptography expert per `field_analyst_agent.md` Example 3) demand precise threat-model spec including standalone vs UC composition.
- ❌ Evaluation on synthetic toy data only. Must use a financial dataset (real or realistically simulated with cited generation procedure).
- ❌ Hand-waved security ("our protocol is clearly secure because…"). Always provide either a proof or a reduction to a standard assumption.
- ❌ Forgetting to include malicious-secure variant cost. Reviewers expect at least a paragraph addressing extension to malicious adversaries even if the main result is semi-honest.
- ❌ Submitting to MISQ without a §8 application discussion that engages with managerial / economic implication beyond a single sentence.

### Reproducibility expectations

INFORMS JoC requires code + data + Dockerfile (Software section). Use the existing ARS `repro_lock` block — `shared/repro_lock_protocol.md` (or wherever defined; refer to `examples/passport_with_repro_lock.yaml`) maps cleanly to JoC's submission checklist.

---

## Recipe 3 — Econ-IS Analytical Model (ISR / Management Science analytical track)

**Best fit**: Information Systems Research (analytical track), Management Science (IS department analytical, or Finance department), INFORMS Journal on Computing if the result is algorithmic.

**Core promise to the reviewer**: tractable economic model of privacy-tech adoption / market design / contracting + closed-form or tight numerical comparative statics + welfare/efficiency implications.

### Required structure

| § | Section | Word target | What MUST be inside |
|---|---|---|---|
| 1 | Introduction | 1,000–1,500 | Stylized fact / puzzle motivating the model; preview of the model + 2–3 main results in plain English; contributions. |
| 2 | Related Literature | 800–1,200 | Two streams: (a) economic theory (information asymmetry, mechanism design, contracting, market microstructure); (b) IS / privacy-tech adoption. State exactly what is new. |
| 3 | Model | 1,500–2,500 | Players, action spaces, information structure, payoffs, timing. Include a **table of notation**. State the equilibrium concept (PBE / Bayesian Nash / DSE). |
| 4 | Analysis | 2,000–3,500 | Equilibrium derivation; **comparative statics** as labeled propositions; **proofs** in appendix with sketch in main text. |
| 5 | Welfare and Policy Implications | 1,000–1,500 | Social welfare comparison; regulatory levers (privacy budget mandate, data minimization rule); winners and losers. |
| 6 | Robustness | 600–1,000 | Alternative information structures; alternative cost functions; numerical sensitivity. |
| 7 | Empirical Illustration (optional but recommended) | 800–1,500 | Calibrate the model with real financial-sector parameters; quantitative magnitudes; back-of-envelope policy counterfactual. |
| 8 | Conclusion | 300–500 | |
| Appendix | Proofs | as needed | All omitted proofs. |

**Total target**: 8,000–12,000 words main text.

### Anti-patterns specific to analytical-model papers

- ❌ Empirical illustration substituting for §4 analysis. ISR analytical track requires a closed-form or tight numerical comparative-static result before any data work.
- ❌ Numerical results without analytical results. Pure simulation is generally rejected by ISR analytical track.
- ❌ Ignoring the privacy-tech mechanics in the model. The privacy primitive must enter the payoff / information structure non-trivially — otherwise the paper is just an info-asymmetry model that mentions privacy.
- ❌ Welfare claims without specifying the welfare function. State whether you use utilitarian, ex-ante, ex-post, or constrained-Pareto efficiency.

### Required cross-references in the draft

- §3 model setup → cite at least one of: Akerlof 1970, Spence 1973, Stiglitz 1981 (info asymmetry); Myerson 1981 / Maskin 1999 (mechanism design); Kyle 1985 / Glosten and Milgrom 1985 (market microstructure).
- §3 privacy primitive → glossary lookup (`shared/references/privacy_finance_glossary.md` Section 1) for exact terminology.
- §5 policy → engage with at least one specific regulation (GDPR Article 25 / 17, CCPA, PIPL, Basel III).

---

## Recipe Selection Decision Tree

```
Is the contribution primarily a new artifact (system / protocol embedded in workflow)?
├── YES → Is the venue MISQ-style (heavy managerial framing)?
│         ├── YES → Recipe 1 (DSR-MISQ)
│         └── NO  → Recipe 2 (Crypto-Protocol with Financial Evaluation)
└── NO  → Is the contribution a new economic / strategic insight from a model?
          ├── YES → Recipe 3 (Econ-IS Analytical Model)
          └── NO  → reconsider scope; method-driven CS×Finance papers
                    landing at UTD24 nearly always fit one of these three
```

---

## Cross-Recipe Quality Gates

Before submission, every paper using these recipes must pass:

1. **Glossary coverage**: every privacy/security term resolves to a row in `shared/references/privacy_finance_glossary.md`. Anti-pattern phrasings checked against the table.
2. **Threat-model precision**: §threat-model is unambiguous about adversary type, corruption threshold, network model, composition setting.
3. **Baseline triple**: evaluation includes status-quo / non-private / strong-private baselines (Recipe 1 + 2).
4. **Managerial implication paragraph**: at least one substantive paragraph (≥150 words) tying technical results to specific financial outcomes (Recipe 1 + 2).
5. **Citation style aligned**: MISQ author-date for MISQ; INFORMS author-date for ISR / MS / JoC (`academic-paper/references/citation_format_switcher.md` UTD24 section).
6. **Reviewer panel match**: `field_analyst_agent.md` Example 3 panel can be applied without modification — i.e., the paper has clear surface area for cryptography review, FinTech review, and privacy-regulation review.

---

**Version**: 1.0
**Last updated**: 2026-05-08
**Maintainer**: project-local customization (not upstream ARS)
