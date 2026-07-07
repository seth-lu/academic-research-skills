# Abstract Writing Guide

Used by `abstract_bilingual_agent`.

## Abstract Types

### Structured Abstract
Contains explicit labeled sections. Required by many journals in social sciences and medicine.

**Sections**: Background, Purpose/Objective, Method, Results/Findings, Conclusion/Implications

### Unstructured Abstract
A single flowing paragraph without labels. Common in humanities and some social sciences.

**Flow**: Context → Problem → Purpose → Method → Key Findings → Implications

### Extended Abstract
Longer (500-1,000 words), used for conference submissions. May include brief literature review and preliminary results.

## English Abstract Guidelines

### Word Count
- Standard: 150-250 words (check journal requirements)
- Conference: 200-500 words (check CFP)
- Dissertation: up to 350 words
- **MISQ/ISR**: ≤150 words (strict)
- **Management Science**: ≤150 words (strict)
- **INFORMS JoC**: ≤200 words

### Structure (5-Component Model)

#### Component 1: Background (1-2 sentences)
Establish context and identify the problem.

**Patterns**:
- "[Topic] has become increasingly important because..."
- "Despite growing interest in [topic], little is known about..."
- "Recent developments in [field] have raised questions about..."

**Cross-domain patterns (v3.10)**:
- "Financial institutions face [regulatory/market pressure], yet [constraint] prevents them from [action]. Privacy-computing techniques offer a potential resolution, but their practical applicability to [specific financial context] remains [gap]."
- "[Financial friction] costs [stakeholders] an estimated [magnitude] annually. Addressing this friction requires [capability] that existing [technical/institutional] solutions cannot provide because [constraint]."

**Avoid**:
- Starting with "This paper..." (too abrupt)
- Generic statements ("Education is important")
- Overly long historical context
- **UTD24**: Starting with the cryptographic primitive rather than the financial problem. The abstract's first sentence names the market friction, not the protocol.

#### Component 2: Purpose (1 sentence)
State the specific objective or research question.

**Patterns**:
- "This study examines [what] in [context]."
- "The purpose of this research is to [verb] [object]."
- "This paper proposes [framework/model] for [application]."

**Cross-domain patterns (v3.10)**:
- "This paper designs [artifact/protocol] that enables [n] financial institutions to jointly [task] without revealing [sensitive data], operating under a [threat model] assumption."
- "We develop an analytical model of [phenomenon] to characterize the conditions under which [privacy technology] improves [financial outcome]."

#### Component 3: Method (1-2 sentences)
Describe the approach, data, and analysis.

**Cross-domain patterns (v3.10)**:
- "We construct a [protocol type] in the [security model] model and evaluate it against [baselines] using [datasets/backtesting]."
- "The model is solved for [equilibrium concept]; comparative statics are derived for [key parameters]."

**Required elements for privacy×finance abstracts**:
- Threat model (semi-honest / malicious / covert)
- Evaluation data source (real transaction data, SAR filings, synthetic benchmarks)
- Privacy parameters when applicable (ε, δ for DP; corruption threshold t for MPC)

#### Component 4: Findings (2-3 sentences)
Present the key results — be specific.

**Cross-domain patterns (v3.10)**:
- Protocol papers: report (a) performance bound, (b) empirical measurement, (c) comparison to baseline, (d) financial-metric impact
- Econ-model papers: report (a) equilibrium characterization, (b) comparative static signs, (c) welfare distribution, (d) parameter region where privacy-tech adoption is individually rational
- Empirical papers: report (a) main coefficient with CI, (b) economic magnitude, (c) robustness to specification

**Required numbers in privacy×finance abstracts**:
- Protocol runtime / communication cost (with units: ms, KB, rounds)
- Privacy budget ε (if DP is used; state per-record or per-query)
- Financial metric change (direction + magnitude + confidence interval if applicable)
- Baseline comparison (what is the non-private or single-bank benchmark?)

**Avoid**:
- "Results will be discussed" (the abstract IS the discussion)
- Vague findings ("significant results were found")

#### Component 5: Implications (1-2 sentences)
State the significance, practical implications, or recommendations.

**Cross-domain patterns (v3.10)**:
- "These findings contribute design principles for privacy-preserving financial infrastructure and carry implications for [regulatory body / standard-setting organization]."
- "The results establish that [privacy technology] can resolve [market friction] without requiring [infeasible institutional change], suggesting a path for [specific policy or industry action]."

**UTD24 closing convention**: End on the managerial/regulatory upshot, not on a technical note or "future work" placeholder. MISQ desk-rejects papers whose abstracts end with "Future work will extend the protocol to the malicious setting."

### Example (English, Privacy Computing × Finance — v3.10)

> Cross-institutional financial crimes exploit a structural blind spot: coordinated money laundering distributes transactions across multiple banks, evading any single institution's internal controls, yet privacy regulations prohibit the obvious remedy of pooling transaction data for joint screening. We design a secure multi-party computation (MPC) protocol that enables a consortium of banks to jointly execute anti-money laundering (AML) screening rules over their combined transaction graphs without revealing customer identities, transaction patterns, or account balances to competitors. The protocol operates in the preprocessing model with semi-honest security against an adversary controlling up to t < n/2 parties. Backtesting against a decade of Suspicious Activity Report (SAR) filings (n = 12 banks, 2.3 million transactions) shows an 18–34% reduction in cross-institutional false negatives (95% CI), with 120–400 ms of added latency per screening query compared to a non-private centralized baseline. Communication complexity scales as O(n log n), supporting consortia of up to 30 banks without hardware acceleration. We characterize the incentive-compatibility conditions under which rational banks join the consortium and contribute genuine data rather than strategic noise. These findings establish that privacy-preserving computation can resolve a material market friction in financial-crime detection without requiring regulatory reform or centralized data repositories, carrying direct implications for the design of privacy-compliant information-sharing frameworks under AMLD6.
>
> **Keywords**: secure multi-party computation, anti-money laundering, information asymmetry, regulatory technology, cross-border payments, financial intermediation, privacy-preserving data sharing

## 简体中文 Abstract Guidelines (v3.10 — replaces zh-TW)

### Word Count
- Standard: 300-500 characters
- Conference: 300-800 characters
- Dissertation: 500-1,000 characters

### Structure (5-Component Model)

#### Component 1: Research Background (1-2 sentences)
**Patterns**:
- "在……背景下，……面临……的挑战"
- "尽管……已受到广泛关注，但……仍缺乏系统性研究"
- "……每年造成约[数量]的[损失]，解决这一问题需要……，但现有方案受限于……"

**隐私计算×金融模式 (v3.10)**:
- 首句点名金融摩擦/市场失灵，而非密码学方案。中文摘要的读者首先看到的是经济问题。
- 使用中文领域规范术语（参见 `privacy_finance_glossary.md` §2），不得出现原始LaTeX源码。

#### Component 2: Research Purpose (1 sentence)
**Patterns**:
- "本研究旨在探讨……"
- "本文以……为对象，分析……对……的影响"
- "本研究设计了一个[协议/模型/框架]，使[n]家金融机构能够在[威胁模型]假设下联合执行[任务]，同时不暴露[敏感数据]"

#### Component 3: Research Method (1-2 sentences)
**Patterns**:
- "本研究采用[安全模型]下的[协议类型]方案，基于[数据集]进行回溯测试"
- "本文构建了一个[均衡概念]分析模型，推导了[关键参数]的比较静态"

**隐私计算×金融必须出现的要素**:
- 威胁模型（半诚实/恶意/隐蔽敌手）
- 评估数据来源（真实交易数据/可疑交易报告SAR/合成基准）
- 必要时给出隐私参数（如ε, δ差分隐私预算；MPC的腐化阈值t）

#### Component 4: Research Findings (2-3 sentences)
**Patterns**:
- "结果发现：(1)……；(2)……；(3)……"
- "分析结果表明……，进一步分析显示……"

**隐私计算×金融摘要中必须出现的数值类型**:
- 协议性能（通信复杂度/运行时间，带单位）
- 隐私预算（如使用DP，标注ε值及单位）
- 金融指标变化（方向 + 幅度 + 置信区间）
- 与非隐私基线的对比

**注意**：中文摘要中所有数学符号必须转化为自然语言或纯文本形式（不再使用LaTeX源码语法）。ε写成"ε"，O(n log n)写成"O(n log n)"。

#### Component 5: Research Significance (1-2 sentences)
**Patterns**:
- "本研究对[领域]具有理论与实践双重贡献……"
- "研究结果为[监管机构/行业协会]制定[政策/标准]提供了实证依据"
- "这些发现表明，隐私保护计算可以在不依赖[制度变革]的前提下解决[市场摩擦]，对[具体法规/标准]的设计具有直接启示"

**UTD24结尾规范**：以管理/监管含义作结，而非技术展望。MISQ会直接退稿摘要以"未来工作将把协议扩展到恶意安全模型"结尾的论文。

### Example (简体中文, 隐私计算×金融 — v3.10)

> 跨机构金融犯罪利用了一个结构性盲区：协同洗钱行为将交易路径分散于多家机构之间，规避了任何单家银行的监控系统，然而隐私法规（GDPR、银行保密法）禁止将交易数据跨机构汇集进行联合筛查这一显而易见的解决手段。本研究设计了一个安全多方计算（MPC）协议，使银行联盟能够在合并交易图上联合执行反洗钱（AML）筛查规则，同时不向竞争对手暴露客户身份、交易模式或账户余额。协议基于预处理模型，在半诚实安全假设下可抵御控制不超过t < n/2方的敌手。对十年可疑交易报告（SAR）的回顾测试（n = 12家银行，230万笔交易）表明，该协议可将跨机构假阴性率降低18-34%（95%置信区间），相比非隐私保护的集中式基线，每次筛查查询仅增加120-400毫秒延迟。协议通信复杂度为O(n log n)，在无硬件加速条件下可支持最多30家银行组成的联盟。本文形式刻画了理性银行选择加入联盟并提供真实数据（而非策略性噪声）的激励相容条件。这些发现表明，隐私保护计算能够在不依赖监管改革或集中化数据存储的前提下，解决金融犯罪检测领域一个实质性的市场摩擦，对欧盟第六号反洗钱指令（AMLD6）下隐私合规信息共享框架的设计具有直接政策启示。
>
> **关键词**：安全多方计算, 反洗钱, 信息不对称, 监管科技, 跨境支付, 金融中介, 隐私保护数据共享

## Keywords Selection

### English Keywords
1. **Core concepts** — main variables or constructs (2-3)
2. **Context** — geographical, institutional, or temporal (1-2)
3. **Method** — if distinctive (0-1)
4. **Field** — discipline or sub-field (1)

**Cross-domain rules (v3.10)**: For Privacy Computing × Finance papers, select ≥ 2 terms from each stream:
- Privacy-computing stream: MPC, differential privacy, federated learning, zero-knowledge proofs, etc. (per `privacy_finance_glossary.md` §1)
- Finance stream: anti-money laundering, credit scoring, regulatory compliance, information asymmetry, etc. (per `privacy_finance_glossary.md` §2)
- This ensures cross-disciplinary discoverability — a finance scholar searching for "AML" finds your paper; a CS scholar searching for "MPC" finds it too.

**Rules**:
- Lowercase (unless proper nouns)
- Complement the title (don't repeat title words verbatim)
- Use established terms (check journal's keyword list if available)
- 5-7 keywords total
- Keywords must not introduce abbreviations not already defined in the abstract

### Chinese Keywords (简体中文)
1. **Core concepts** — main variables or constructs (2-3)
2. **Research context** — geographical, institutional, or temporal (1-2)
3. **Research method** — if distinctive (0-1)
4. **Academic field** — discipline or sub-field (1)

**Cross-domain rules (v3.10)**: 中文关键词同样要求涵盖隐私计算与金融两个方向，每方向不少于2个术语。使用 `privacy_finance_glossary.md` 中的简体中文规范形式。关键词应与英文关键词覆盖相同的概念空间，但不能直接翻译——应使用中文领域的自然学术表达。

**Rules**:
- Use formal academic terminology
- Avoid completely duplicating the title
- May reference the National Central Library Chinese Subject Headings
- 5-7 keywords

## Cross-Domain Abstract Priorities for UTD24 (v3.10)

Privacy Computing × Finance papers face a dual-audience constraint in the abstract: a CS reviewer evaluates the cryptographic rigor, while a business/finance reviewer evaluates the economic significance. The abstract must satisfy both without exceeding the strict word limits of UTD24 journals (≤150 words for MISQ, ISR, Management Science; ≤200 for INFORMS JoC).

### Dual-Audience Strategy

| Position in Abstract | Primary Audience | Content Priority |
|---------------------|-----------------|------------------|
| First 1–2 sentences (Background) | **Business/Finance reviewer** | Name the financial friction; cite its economic magnitude. The business reviewer decides in the first 30 words whether this paper addresses a real problem. |
| Middle sentences (Purpose + Method) | **Both** | State the privacy technology with enough precision that a CS reviewer can identify the security model (semi-honest/malicious); state the financial mechanism with enough specificity that a finance reviewer can identify the market context. |
| Findings (2–3 sentences) | **CS reviewer** (performance) + **Finance reviewer** (outcome) | Report protocol performance for the CS reviewer AND financial-metric impact for the finance reviewer. The worst outcome: a CS reviewer thinks "no performance numbers" while a finance reviewer thinks "no economic magnitudes." |
| Final sentence (Implications) | **Business/Finance reviewer** | End on the managerial/regulatory upshot. MISQ/ISR/Management Science desk-reject papers that end on technical notes. This sentence is the most weighted in the abstract for UTD24 IS-track venues. |

### UTD24 Abstract Self-Check
Before finalizing the abstract, verify:
- [ ] Does the first sentence name a financial problem, not a cryptographic construction?
- [ ] Is the threat model stated (semi-honest / malicious / covert)?
- [ ] Are specific magnitudes reported for at least one performance metric AND at least one financial outcome?
- [ ] Does the final sentence carry a managerial/regulatory implication?
- [ ] Would a CS professor AND a finance professor both understand what was contributed?
- [ ] Are all technical terms traceable to `privacy_finance_glossary.md` canonical forms?
- [ ] For Chinese abstract: zero raw LaTeX syntax present?

## Bilingual Abstract Quality Checklist

| Check | ✓ |
|-------|---|
| Both abstracts cover all 5 components | |
| English: 150-300 words (or journal-specific limit) | |
| Chinese: 300-500 characters | |
| Abstracts are independently written (not translated) | |
| Key findings match between languages | |
| Quantitative data consistent between versions | |
| Keywords: 5-7 per language, ≥2 from each domain stream for cross-domain papers (v3.10) | |
| Keywords complement (not duplicate) the title | |
| No citations in the abstract | |
| No abbreviations undefined in the abstract | |
| Threat model stated in both abstracts (v3.10) | |
| Privacy budget (ε) specified if DP is used (v3.10) | |
| Financial task named with domain-accurate terminology per glossary (v3.10) | |
| Chinese abstract: zero raw LaTeX syntax (v3.10) | |
| English abstract: LaTeX notation limited to standard symbols per abstract_bilingual_agent.md Rule 5 (v3.10) | |
| Final sentence carries managerial/regulatory implication, not technical future work (v3.10) | |
