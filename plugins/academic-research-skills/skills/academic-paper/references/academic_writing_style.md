# Academic Writing Style Guide

Used by `draft_writer_agent` and `peer_reviewer_agent`.

## Core Principles

### 1. Precision
- Use the most specific term available
- Define technical terms on first use
- Avoid ambiguous pronouns ("this," "it") without clear antecedents

### 2. Conciseness
- Eliminate filler words and redundant phrases
- One idea per sentence (or clearly connected ideas)
- Prefer short sentences for complex ideas

### 3. Objectivity
- Base claims on evidence, not opinion
- Use hedging for uncertain claims
- Acknowledge limitations and alternative interpretations

### 4. Formality
- Use full forms ("do not" over "don't")
- Use formal academic vocabulary; reserve colloquialisms and slang for informal writing
- Use third person unless discipline conventions allow first person

## Register Adjustment by Discipline

### Sciences (Natural, Applied)
```
Register: Formal, impersonal, method-focused
Voice: Passive voice common ("was measured," "were analyzed")
Terminology: Precise measurements, SI units, statistical notation
Example: "The sample was heated to 350°C for 2 hours, yielding a conversion rate of 87.3% (SD = 2.1)."
```

### Social Sciences
```
Register: Formal, theory-informed, participant-aware
Voice: Active voice encouraged, first person for researcher decisions
Terminology: Theoretical constructs, operationalized variables
Example: "We employed semi-structured interviews to explore how participants understood institutional change (N = 24)."
```

### Humanities
```
Register: Formal, argument-driven, interpretive
Voice: First person acceptable for arguments, active voice
Terminology: Close reading vocabulary, theoretical language
Example: "I argue that the text's spatial metaphors reveal an underlying anxiety about institutional permanence."
```

### Engineering / CS
```
Register: Formal, problem-solution oriented, specification-precise
Voice: Passive common for methods, active for contributions
Terminology: Technical specifications, performance metrics
Example: "The proposed algorithm achieves O(n log n) complexity, outperforming the baseline by 34% on the benchmark dataset."
```

### Education
```
Register: Formal, practice-oriented, stakeholder-aware
Voice: Active voice, first person for reflexive practice
Terminology: Pedagogical concepts, assessment language
Example: "The intervention improved student metacognitive awareness, as evidenced by a significant increase in self-regulation scores (t(45) = 3.21, p = .002, d = 0.72)."
```

### Medicine / Health
```
Register: Formal, evidence-hierarchy conscious, clinical precision
Voice: Passive for methods, active for findings
Terminology: Clinical terms, diagnostic criteria, statistical reporting
Example: "Patients receiving the intervention showed a 40% reduction in readmission rates (RR = 0.60, 95% CI [0.45, 0.80], p = .001)."
```

### Privacy Computing × Finance — Cross-Domain Register (v3.10)

This is a hybrid register: the paper must fluidly switch between CS-technical prose (for protocol description, security analysis, complexity bounds) and finance-economics prose (for problem motivation, mechanism interpretation, managerial implications). The register is NOT a compromise between the two — it is a deliberate alternation, with each section choosing the appropriate voice.

```
Register: Dual — CS-technical (protocol/security sections) + Finance-economics (introduction/discussion/implications sections)
Voice: Active first-person for research decisions ("We design...", "We choose the semi-honest model because...")
       Passive for standard methodological steps ("Data were collected...", "The protocol was benchmarked...")
Terminology: Cryptographic primitives use canonical English forms from privacy_finance_glossary.md §1;
            financial terms use canonical forms from privacy_finance_glossary.md §2;
            every domain term must resolve to a glossary entry before final output
Discipline: Method-driven (DSR-MISQ / Crypto-Protocol / Econ-IS Analytical)
```

**Register-switching rules**:
| Section | Dominant Register | Key Convention |
|---------|------------------|----------------|
| Introduction (¶1–3) | Finance-economics | Open with financial friction, not cryptographic primitive |
| Introduction (¶4–6) | CS-technical (light) | Introduce the privacy mechanism; define technical terms on first use |
| Threat Model | CS-technical | Formal adversary definition; do NOT hedge ("we assume" not "we might assume") |
| Protocol Design | CS-technical | Precise notation; every symbol defined; active voice for design decisions |
| Evaluation (performance) | CS-technical | Report exact numbers with units; distinguish protocol-level from application-level metrics |
| Evaluation (financial impact) | Finance-economics | Report direction AND magnitude; link to mechanism, not just correlation |
| Discussion | Finance-economics (primary) + CS-technical (comparisons) | First paragraph must name the competing explanation the results rule out |
| Implications | Finance-economics | Audience: CIOs, regulators, policymakers — not future protocol designers |

**Cross-domain paragraph example (register switching within paragraph)**:
> "The protocol's communication complexity scales as O(n log n) in the number of consortium banks, making it deployable for consortia of up to 30 members without hardware acceleration. This scalability threshold matters economically: it covers the typical size of a regional banking consortium (median 18 members; ECB, 2024), meaning the protocol can be adopted by existing institutional structures without requiring industry consolidation — a barrier that has stalled prior privacy-preserving clearinghouse proposals (Smith, 2023)."

Notice: sentence 1 is CS register (complexity bound), sentence 2 is finance register (economic significance, institutional data citation). Each sentence is internally coherent in ONE register; the transition between them is through a shared referent (30-member threshold = typical consortium size).

## Domain-Specific Precision Rules (v3.10)

Linked to `shared/references/privacy_finance_glossary.md`. These rules are IRON — violation at final output is a blocking defect.

### Privacy-Claim Precision

| Weak / Vague | Precise | Why It Matters |
|-------------|---------|----------------|
| "the protocol is private" | "the protocol achieves semi-honest security against a non-colluding adversary controlling up to t < n/2 parties" | "Private" has no formal meaning; threat model + adversary bound + collusion assumption does |
| "our system protects data" | "our system provides input privacy: no party learns another party's transaction values beyond what is inferable from the agreed output" | "Protects" is vague; specify what is protected, from whom, and what is leaked |
| "we use encryption" | "we use AES-256-GCM for data-at-rest and TLS 1.3 for data-in-transit" | "Encryption" covers everything from ROT13 to FHE; specify algorithm + mode + context |
| "the model is differentially private" | "the model satisfies (ε = 0.5, δ = 10⁻⁵)-differential privacy per training epoch" | DP claims without parameters are unverifiable; epsilon means nothing without the unit (per-record, per-epoch, per-query?) |
| "secure computation enables joint analysis" | "an MPC protocol in the preprocessing model enables n banks to compute f(x₁,...,xₙ) while leaking only |f| to each party" | The leakage claim IS the contribution; state it precisely |

### Financial-Claim Precision

| Weak / Vague | Precise | Why It Matters |
|-------------|---------|----------------|
| "improves detection" | "reduces cross-institutional false negatives by 18–34% (95% CI) compared to single-bank baseline" | Direction without magnitude cannot support cost-benefit analysis |
| "reduces cost" | "reduces per-transaction screening cost from $0.12 to $0.07, saving $1.2M annually for a mid-tier bank processing 10M transactions/year" | Financial reviewers need absolute numbers, not percent improvements |
| "increases market efficiency" | "narrows the bid-ask spread by 3.2 basis points on average (p < .01, clustered SE)" | Market efficiency is a construct; operationalize it with the actual market microstructure variable |

### Technology-Terminology Precision (IRON RULE)

**Never** confuse these non-interchangeable terms (per `privacy_finance_glossary.md` §1 Caveat column):
- "Differential privacy" ≠ "k-anonymity" ≠ "anonymization"
- "Secure multi-party computation (MPC)" ≠ "fully homomorphic encryption (FHE)" ≠ "functional encryption"
- "Federated learning" ≠ "distributed machine learning" (FL requires formal privacy guarantees)
- "Zero-knowledge proof" ≠ "proof of computation" (ZKP hides the witness; proof of computation may not)
- "Trusted execution environment" ≠ "hardware security module" (TEE provides runtime confidentiality; HSM provides key storage)

When the paper makes a claim about one of these primitives, verify against the glossary's canonical definition. A UTD24 reviewer from the other discipline will read the term through their own disciplinary lens — using the wrong term is not a wording issue, it's a factual error.

### Hedging (for uncertain or qualified claims)
| Strength | Hedging Devices | Example |
|----------|----------------|---------|
| Weak | may, might, could, possibly | "This may suggest a correlation." |
| Moderate | suggests, indicates, appears | "The data suggest a positive trend." |
| Strong | demonstrates, establishes, confirms | "The evidence demonstrates a clear link." |

### When to Hedge
- Results that need replication
- Causal claims from correlational data
- Generalizations from limited samples
- Interpretations with alternative explanations

### When NOT to Hedge
- Reporting factual data: "The response rate was 78%." (not "appeared to be")
- Describing methodology: "We used thematic analysis." (not "we attempted to use")
- Well-established facts: "Earth orbits the Sun." (not "may orbit")
- **Privacy claims with formal proofs**: "The protocol achieves malicious security under the DDH assumption." (not "may achieve"). A provable security claim is a statement of mathematical fact — hedging it signals the author doesn't have a proof.

### Hedging for Privacy Claims (v3.10)

Privacy claims have a distinctive hedging discipline. A protocol either achieves a security notion or it doesn't — there is no "may achieve" in cryptography. Hedging applies to the *interpretation* and *applicability* of a security result, not the claim itself.

| Strength | When to Use | Example |
|----------|------------|---------|
| **No hedging** (bare assertion) | The protocol provably achieves the claimed security notion | "The protocol achieves malicious security under the DDH assumption." |
| **Scope hedging** (qualify applicability, not the claim) | The security model has known limitations | "While the protocol provides security against a semi-honest adversary, a malicious consortium member who deviates from the protocol can learn up to k bits of another member's input per round." |
| **Interpretation hedging** (qualify what it means, not whether it is true) | The security result needs economic interpretation | "The (ε = 0.5)-DP guarantee means that an adversary's belief about any single customer's transaction changes by at most a factor of e^0.5 ≈ 1.65 — a privacy amplification that the bank's compliance team must assess against regulatory de-identification standards." |

**Anti-pattern**: "The protocol may achieve differential privacy" — hedging the security claim itself signals the author doesn't have a proof. A reviewer will call this out immediately.

---

## Cross-Domain Anti-Pattern Phrasings (Privacy Computing × Finance — v3.10)

Common phrasing failures at the CS/Finance boundary. Each anti-pattern signals to one set of reviewers that the author doesn't understand their discipline's standards.

| Anti-Pattern | Why It Fails | Correct Version |
|-------------|-------------|-----------------|
| "Our protocol is secure." | No threat model, no assumption, no security notion. A CS reviewer reads this as "the author doesn't know what a security definition is." | "The protocol achieves semi-honest security against an adversary controlling up to t < n/2 parties, under the Decisional Diffie-Hellman assumption." |
| "We use privacy-preserving computation to solve the problem." | "Privacy-preserving computation" is not a primitive; it's an umbrella term that conflates MPC, FHE, DP, FL, TEE, and ZKP. A CS reviewer rejects immediately. | "We use secure multi-party computation (MPC) in the preprocessing model to enable n banks to jointly compute f without revealing their private inputs beyond what f itself reveals." |
| "The model achieves good performance." | Finance/economics papers report specific metrics with magnitudes. "Good" is a reviewer's signal to reject for lack of rigor. | "The model reduces false-negative rates by 18–34% (95% CI) while adding 120 ms of latency, with the accuracy-cost trade-off summarized in Figure 3." |
| "This has important implications for policy." | "Important" without specifying for whom and what kind of policy is a throat-clearing statement. | "These results carry direct implications for the EU's AML Directive (AMLD6): they establish that mandatory suspicious-activity thresholds can be lowered from €10,000 to €5,000 per transaction when privacy-preserving consortium screening is in place, without increasing the false-positive burden on compliance teams." |
| "We contribute to both theory and practice." | Every paper claims this. A specific statement of contribution type is mandatory at UTD24. | "Theoretically, we characterize incentive-compatible privacy-technology adoption equilibria. Practically, we provide an open-source MPC library and consortium-governance template." |
| "Our system combines MPC and blockchain for privacy." | Combining technologies without stating which solves which problem signals kitchen-sink design. | "MPC enables privacy-preserving joint computation over distributed data; the permissioned blockchain provides an immutable audit trail of consortium decisions without storing any transaction data on-chain." |
| "The protocol is efficient." | "Efficient" without reference to a baseline or metric is content-free. | "The protocol's communication complexity (O(n log n)) is within a log n factor of the theoretical lower bound, and end-to-end latency for n = 20 banks is 1.8 s — below the 3 s real-time threshold required by interbank settlement systems." |

## Transition Words and Phrases

### Addition
moreover, furthermore, in addition, additionally, similarly, likewise

### Contrast
however, nevertheless, in contrast, on the other hand, conversely, whereas

### Cause/Effect
therefore, consequently, as a result, thus, hence, accordingly

### Example
for example, for instance, specifically, in particular, such as, namely

### Sequence
first, second, third, subsequently, finally, meanwhile

### Summary
in summary, to conclude, overall, taken together, in short

### Concession
although, despite, while, granted that, notwithstanding

## Paragraph Construction

### Standard Academic Paragraph (TEEL)
1. **T**opic sentence — states the paragraph's main point
2. **E**vidence — data, citations, examples that support the point
3. **E**xplanation — interpret the evidence, connect to argument
4. **L**ink — connect to the next paragraph or back to thesis

### Example
> **[T]** AI-assisted quality assurance has shown promise in improving evaluation consistency across institutions. **[E]** Smith (2024) found that institutions using AI tools reported a 23% reduction in inter-rater variance, while Chen and Wang (2023) documented improved agreement on scoring rubrics (κ = 0.82 vs. 0.64). **[E]** These findings suggest that algorithmic assistance can mitigate the subjective biases inherent in human evaluation, particularly when assessors have varying levels of experience. **[L]** However, the reliance on AI tools also raises concerns about the loss of contextual judgment, which the following section addresses.

## Common Style Errors

### Wordiness
| Wordy | Concise |
|-------|---------|
| in order to | to |
| due to the fact that | because |
| a large number of | many |
| at the present time | currently / now |
| it is important to note that | notably |
| in the event that | if |
| has the ability to | can |
| with regard to | regarding / about |
| in spite of the fact that | despite / although |
| conduct an investigation of | investigate |

### Vague Language
| Vague | Precise |
|-------|---------|
| "many studies" | "several studies (e.g., Chen, 2023; Smith, 2024)" |
| "a significant impact" | "a 23% increase in retention rates" |
| "in recent years" | "since 2020" or "over the past five years" |
| "some researchers" | Name them with citations |
| "it is well known that" | Cite the source or remove |

### Tense Usage
| Section | Tense | Example |
|---------|-------|---------|
| Literature review (reporting findings) | Past | "Smith (2024) found that..." |
| Literature review (ongoing state) | Present | "The theory posits that..." |
| Methodology | Past | "Data were collected through..." |
| Results | Past | "The analysis revealed..." |
| Discussion (interpreting) | Present | "These findings suggest..." |
| Conclusion (implications) | Present/Future | "This has implications for... / Future research should..." |

## Chinese Academic Writing (zh-TW / 简体中文) Conventions

### Register (简体中文 — v3.10)

Privacy×Finance papers drafted in 简体中文 use formal academic Chinese with the following conventions:
- Use written/formal language; avoid colloquial expressions
- Prefer active voice (Chinese rarely uses passive)
- Mainly short sentences; avoid overly long subordinate clauses
- Use "本研究" rather than "我们" in methodology/results sections
- **隐私计算×金融特有规范**: 中文摘要将所有LaTeX数学符号转化为自然语言（参见`abstract_bilingual_agent.md`规则3）；中文正文保留必要的数学符号但避免LaTeX源码语法（即直接写ε而不写`$\varepsilon$`）

### Register (zh-TW — legacy)

- Use written/formal language; avoid colloquial expressions
- Prefer active voice (Chinese rarely uses passive)
- Mainly short sentences; avoid overly long subordinate clauses
- Use "this study" (ben yan jiu) rather than "we" (wo men)

### Common Academic Expressions
| English | 简体中文 | Romanized Chinese (zh-TW legacy) |
|------|------|------|
| This study aims to | 本研究旨在 | Ben Yan Jiu Zhi Zai |
| The findings indicate | 研究结果显示 | Yan Jiu Jie Guo Xian Shi |
| It is worth noting | 值得注意的是 | Zhi De Zhu Yi De Shi |
| In conclusion | 综上所述 | Zong Shang Suo Shu |
| Based on the above analysis | 基于上述分析 | Gen Ju Shang Shu Fen Xi |
| Further research is needed | 未来研究可进一步探讨 | Wei Lai Yan Jiu Ke Jin Yi Bu Tan Tao |

### Avoiding Translationese (common to zh-TW and 简体中文)
- Incorrect: "was found to be" (被发现) → Correct: "Results show" (结果显示)
- Incorrect: "This is because" (这是因为) → Correct: "The reason lies in" (原因在于)
- Incorrect: "In the aspect of..." (在...方面) → Correct: State directly
- Incorrect: "It is worth being pointed out that" (值得被指出的是) → Correct: "It is worth noting that" (值得注意的是)
- **Incorrect (v3.10)**: 中文摘要保留LaTeX源码（`$\varepsilon=0.5$`）→ Correct: 直接写为 "ε = 0.5" 或转化为自然语言 "(ε, δ)-差分隐私"
- **Incorrect (v3.10)**: 长定语英式结构（"一个基于安全多方计算的、用于跨机构反洗钱筛查的、隐私保护的协议"）→ Correct: 拆分为短句（"本研究设计了一个基于安全多方计算的隐私保护协议，用于跨机构反洗钱筛查"）

---

## Mathematical Notation Conventions for Privacy-Computing Papers (v3.10)

Privacy-computing papers are dense with notation. Notation inconsistency across sections is a common reviewer complaint at UTD24 venues — a symbol used to mean one thing in the threat model section and another in the evaluation section signals carelessness.

### Variable Naming Conventions
| Symbol | Domain Convention | Example |
|--------|-----------------|---------|
| n | Number of parties / banks in the consortium | "n = 12 banks" |
| m | Number of records / transactions | "m = 10^6 transactions" |
| t | Adversary threshold (corruption bound) | "t < n/2" (honest majority) or "t < n" (dishonest majority) |
| λ | Computational security parameter | "λ = 128" |
| κ | Statistical security parameter | "κ = 40" |
| ε, δ | DP parameters (privacy budget, failure probability) | "(ε = 0.5, δ = 10^{-5})-DP" |
| σ | Standard deviation / Gaussian noise scale | "σ = 2.0 for Gaussian mechanism" |
| k | Generic count (use only when n, m, t already assigned) | "k = 5 evaluation rounds" |

### Iron Rules for Notation
1. **Every symbol must be defined before first use.** No exceptions. A symbol appearing in §3 (Preliminaries) that was first defined in §5 (Evaluation) is a notation defect.
2. **One symbol, one meaning across the entire paper.** n = number of banks in §4 must not become n = sample size in §7. Use different symbols for different quantities.
3. **Consistency across text, equations, tables, and figures.** If Table 3 uses m for transaction count, the accompanying prose must not use T. The formatter_agent's LaTeX escape discipline enforces this mechanically; the author must enforce it semantically.
4. **Notation defined in the Preliminaries section applies to the entire paper.** Notation defined within a section is local to that section; redefine it if used elsewhere.
5. **Security parameter λ is never used for anything else.** λ = 128 is a statement about computational hardness; using λ for a Lagrange multiplier or an eigenvalue in the same paper creates ambiguity for cryptography-literate reviewers.
