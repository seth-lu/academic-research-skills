# Writing Quality Check

## Purpose

A set of writing quality rules extracted from common patterns in AI-generated text and calibrated to **management-science / finance × privacy-computing** interdisciplinary prose targeting **UTD24 journals** (Management Science, MIS Quarterly, Information Systems Research, INFORMS Journal on Computing). These are **good writing rules** that apply regardless of whether the text was AI-generated or human-written. The goal is better prose, not detection evasion.

> **Design boundary**: This checklist improves writing quality. It is NOT a humanizer. We do not aim to fool AI detectors. We aim to produce clear, precise, varied academic prose that reads like a senior scholar in information systems, finance, or management science wrote it.

Reference this checklist during the self-review step of drafting (draft_writer_agent Step 2.7, report_compiler_agent final check). For 简体中文 drafts, also apply Section F.

**Domain calibration (v3.10)**: In management-science and finance prose, precision about magnitudes, directions, mechanisms, and boundary conditions matters more than stylistic variety. A flagged term that carries a precise economic meaning (e.g., "robustness check," "leverage" in corporate finance, "landscape" for competitive landscape) is NOT an AI tell — it is a domain term. The exception rules in §A are the gatekeeper; when in doubt, prefer the precise term.

---

## A. High-Frequency Term Warnings

The following terms appear disproportionately in AI-generated text. They are not banned — but when you encounter one, ask: **"Is this really the most precise word here, or am I defaulting to it?"**

### Flagged Terms (English)

| Term | Why it's flagged | Better alternatives (context-dependent) |
|------|-----------------|----------------------------------------|
| delve | Overused as "explore" substitute | examine, investigate, analyze, explore |
| tapestry | Cliché metaphor for complexity | network, interplay, system, configuration |
| landscape | Vague when not literal | field, domain, context, state of the literature |
| pivotal | Inflation of importance | important, significant, central, decisive |
| crucial | Same as above | essential, necessary, critical, consequential |
| foster | Vague verb | promote, develop, cultivate, enable |
| showcase | Non-academic register | demonstrate, illustrate, present, document |
| testament | Cliché | evidence, indicator, demonstration |
| navigate | Vague when not literal | manage, address, handle, resolve |
| realm | Archaic/poetic | domain, field, area, stream of research |
| embark | Overwrought for "begin" | begin, initiate, undertake, start |
| underscore | Overused emphasis verb | emphasize, highlight, stress, reinforce |
| multifaceted | Vague complexity claim | complex, varied, diverse, multilayered |
| nuanced | Often vacuous | subtle, detailed, fine-grained, qualified |
| comprehensive | Often unjustified | thorough, extensive, broad, detailed |
| robust | Vague quality claim; see domain exemption | reliable, strong, rigorous, resilient |
| intricate | Same problem as multifaceted | complex, detailed, elaborate, involved |
| cornerstone | Cliché metaphor | foundation, basis, core element, pillar |
| paradigm | Overused outside philosophy of science | framework, model, approach |
| synergy | Business jargon (ironic in finance context) | interaction, complementarity, combined effect |
| holistic | Vague without definition | comprehensive, integrated, system-wide |
| streamline | Non-academic | simplify, improve efficiency, reduce friction |
| cutting-edge | Cliché | recent, advanced, state-of-the-art, novel |
| groundbreaking | Inflation | novel, innovative, pioneering, original |
| vibrant | Emotive; non-academic | dynamic, active, rapidly evolving |
| accentuate | Overwrought for "emphasize" | emphasize, highlight, stress |
| ameliorate | Overwrought for "improve" | improve, reduce, mitigate, alleviate |
| ascertain | Overwrought for "determine" | determine, identify, establish, verify |
| convey | Vague; "communicate" substitute | communicate, transmit, signal, reveal |
| elucidate | Overwrought for "explain" | explain, clarify, illuminate, describe |
| endeavor | Overwrought for "attempt" | attempt, effort, undertaking, initiative |
| envision | Speculative without evidence | anticipate, project, expect, foresee |
| exacerbate | Overwrought for "worsen" | worsen, amplify, intensify, aggravate |
| leverage | Business jargon; see domain exemption | use, employ, utilize, exploit, draw on |
| manifest | Overwrought for "show" | show, exhibit, display, appear |
| perpetrate | Wrong domain; fraud/audit term | (use only in fraud/audit context) |
| profound | Inflation of significance | substantial, considerable, large, material |
| scrutinize | Overwrought for "examine" | examine, inspect, analyze, investigate |
| substantiate | Overwrought for "support" | support, confirm, validate, corroborate |
| underscore | Overused emphasis verb | emphasize, highlight, stress, reinforce |
| unveil | Overwrought for "reveal" | reveal, show, disclose, present |
| shed light on | Cliché metaphor | illuminate, explain, reveal, clarify |
| play a pivotal role | Three-cliché stack | is central to, drives, shapes, determines |
| in today's X landscape | Timestamped filler | Delete. Start with the actual subject |
| has emerged as | AI-tell passive | Delete. Use active: "X provides," "Y enables" |
| it is widely acknowledged | Vague consensus claim | Cite specific scholars or delete |
| a paradigm shift | Inflated unless Kuhn context | a fundamental change, a departure from, a reorientation of |
| double-edged sword | Cliché metaphor | trade-off, tension, dilemma, competing demands |

### Exception Rule

If a flagged term is **standard terminology in the target discipline**, it is exempt:

**Management-science / economics exemptions:**
- "robustness check," "robust standard errors," "robustness to" in econometrics → OK (standard term of art)
- "leverage" in corporate finance (debt-to-equity, leveraged buyout) → OK (precise technical meaning)
- "landscape" in "competitive landscape," "regulatory landscape" → OK (standard strategy/IO term)
- "comprehensive" in "comprehensive income" (accounting) → OK
- "material" in "material adverse effect," "material information" → OK (legal/finance term of art)
- "navigate" in "navigate regulatory requirements" → acceptable (no concise substitute)

**Privacy-computing exemptions:**
- "robust" in "robust against malicious adversaries" → OK (cryptographic term of art)
- "holistic" in "holistic privacy guarantee" → acceptable (no concise substitute for end-to-end guarantee)
- "comprehensive" in "comprehensive security model" → acceptable when enumerating covered threat surfaces
- "paradigm" in "threat-model paradigm" → OK (used in cryptography)

**General academic exemptions:**
- "paradigm shift" in philosophy of science → OK
- "navigate" in wayfinding research (literal) → OK
- "landscape" in ecology/geography (literal) → OK

**Iron-clad exception rule**: When a flagged term has a **precise, quantitative, discipline-standard meaning**, using it is not an AI tell — replacing it with a "better alternative" would introduce ambiguity. The UTD24 reviewer expects the term of art.

---

## B. Punctuation Pattern Control

### Em Dash (—)
- **Limit**: ≤ 2 per paper total, recommend 0
- **Why**: AI text overuses em dashes for parenthetical asides. Management-science and finance prose uses commas, parentheses, or separate sentences instead. An em dash in a UTD24 paper signals either AI generation or careless editing.
- **Fix**: Replace with commas, parentheses, or restructure into separate sentences
- **Exception**: Direct quotes from sources retain their original punctuation

### Semicolons
- **Limit**: ≤ 2 per 1000 words
- **Why**: AI text chains independent clauses with semicolons where a period would be clearer. UTD24-style argumentation prefers short, declarative sentences over semicolon-stitched chains.
- **Fix**: Use a period and start a new sentence. Reserve semicolons for closely related parallel structures (e.g., "Model 1 assumes semi-honest adversaries; Model 2 extends to the malicious case.")

### Colon-List Sequences
- **Rule**: Avoid 2+ consecutive paragraphs that each open with a colon followed by a list
- **Why**: Creates a monotonous enumerate-everything pattern characteristic of AI-generated survey prose
- **Fix**: Integrate list items into prose, or use a single consolidated list

### Exclamation Marks
- **Rule**: Zero. Never use in academic prose.
- **Why**: UTD24 journals do not use exclamation marks outside direct quotes.

---

## C. Throat-Clearing Openers

Delete the following sentence starters. Cut to the point.

| Throat-clearing phrase | What to do |
|-----------------------|-----------|
| "In the realm of..." | Delete. Start with the actual subject |
| "It is important to note that..." | Delete. If it's important, the content speaks for itself |
| "It is worth mentioning that..." | Same as above |
| "In today's rapidly evolving..." | Delete. Timestamped clichés add no information |
| "This serves as a testament to..." | Replace with direct claim: "This demonstrates..." or just state the evidence |
| "It goes without saying that..." | If it goes without saying, don't say it |
| "In order to..." | Replace with "To..." |
| "It should be noted that..." | Delete. Just note it |
| "As a matter of fact..." | Delete. State the fact |
| "When it comes to..." | Replace with the subject directly: "X shows..." |
| "At the end of the day..." | Delete. Colloquial and vague |
| "With that being said..." | Delete or use "However" if a contrast is intended |
| "Needless to say..." | Delete. If needless, don't say it |
| "In the context of..." | Replace with a concrete scope: "In U.S. banking markets," "Under Basel III," |
| "Against this backdrop..." | Delete. Start with the specific development |

### Meta-Commentary to Avoid

Also watch for sentences that describe what the paper is doing instead of doing it:
- "This section will discuss..." → Just discuss it
- "The following paragraph examines..." → Just examine it
- "We now turn our attention to..." → Just turn to it
- "In this paper, we aim to..." → "We [verb] [object]."
- "The remainder of this paper is organized as follows..." → Keep ONLY if genuinely helpful; delete if it's a mechanical recitation of section names

Exception: Concise roadmap sentences in the Introduction ("Section 2 reviews related literature on X and Y; Section 3 describes our protocol and threat model") are standard practice and should be kept. Limit to one such sentence.

### Internal-Control Leakage

Planning notes, literature-positioning labels, style constraints, contribution boundaries, and reviewer-risk reminders are not manuscript prose. They may shape what the draft selects, orders, emphasizes, omits, or transitions between, but they must not be copied or paraphrased into the paper body.

| Leakage pattern | Why it fails | What to do |
|-----------------|--------------|------------|
| "This paper sits at the intersection of X, Y, and Z literatures" | Reports the planning map instead of making an argument | State what each stream explains, what remains unresolved jointly, and why the unresolved tension matters |
| "This study combines four literature streams" | Turns a literature-matrix label into a sentence | Identify the specific problem that cannot be handled by any one stream alone |
| "The contribution is positioned as..." | Exposes contribution-planning language | State the contribution directly as a scholarly claim |
| "This section follows the CER chain..." | Leaks workflow terminology | Present the claim, evidence, and reasoning without naming the workflow |
| "The draft avoids treating X as Y" | Copies a negative framing control | Use affirmative framing: what X does in the paper and why that role is appropriate |

Self-check question: if the sentence mainly tells the reader how the paper was planned, categorized, constrained, or prompted, delete it or rewrite it as a substantive problem-gap-mechanism claim.

### Manuscript Voice Boundary

The paper body must speak from the research object, evidence, method, and literature — not from the writer's planning position. A sentence is valid manuscript prose only if it can be authorized by one of the following sources:

- a cited source or established literature stream;
- a definition, model object, proposition, method, algorithm, or design choice in the paper;
- an empirical result, numerical output, robustness check, or observed pattern;
- a stated boundary condition, assumption, threat model, or limitation.

The following sources are not valid authorization for manuscript sentences: target-venue strategy, reader-expectation guesses, reviewer-risk anticipation, contribution-positioning notes, style rules, rhetorical priorities, L1/L2/L3 `Why` fields, `Risk control` fields, or instructions about what the section should emphasize. These controls may shape order, emphasis, scope, and transitions, but they must not become paper-body assertions.

Rewrite test: replace any writer-facing rationale with an object-level claim. For example, do not say that a metric matters because a venue or reader group expects it; say what regulatory decision, model property, empirical result, or boundary condition the metric evaluates.

---

## D. Structure Pattern Warnings

### Rule of Three Compulsion
- **Pattern**: Every argument has exactly 3 sub-points, every list has exactly 3 items
- **Why**: Real analysis doesn't always decompose into trios. Two strong points beat three padded ones. In management-science papers, contribution frameworks often have 2 or 4 dimensions — forcing 3 is an AI tell.
- **Fix**: Use as many points as the evidence warrants. 2 is fine. 4 is fine. Don't pad to 3

### Uniform Paragraph Length
- **Pattern**: All paragraphs are approximately the same length (150-200 words each)
- **Why**: Natural writing has paragraph length variation. Short paragraphs for emphasis, longer ones for complex arguments. UTD24 papers mix 2-sentence transition paragraphs with 12-sentence model-development paragraphs.
- **Fix**: Vary paragraph length. A 2-sentence paragraph after a 10-sentence paragraph creates rhythm

### Synonym Cycling
- **Pattern**: Using 3+ different synonyms for the same concept within one paragraph to avoid repetition
- **Why**: In academic writing, consistent terminology is a virtue. In privacy×finance writing, this is a **hard error**: using "secure aggregation" and "privacy-preserving aggregation" and "encrypted sum" interchangeably confuses the threat model.
- **Fix**: Pick one term per concept per paper. Repeat it. Technical repetition is clarity, not weakness. The privacy finance glossary (`shared/references/privacy_finance_glossary.md`) is authoritative for domain terms — use its canonical forms.

### Binary Contrast Overuse
- **Pattern**: "Not X. Y." or "It's not about X — it's about Y." used more than twice per paper
- **Why**: This rhetorical device is effective once. Repeated, it becomes a tic
- **Limit**: ≤ 2 per paper

### Mirror Structure
- **Pattern**: Every section has the same internal structure (topic sentence → 3 evidence points → synthesis sentence)
- **Why**: Creates a template-stamped feel. Different sections serve different purposes and should have different internal rhythms
- **Fix**: Let section structure follow content needs. Protocol description can be procedural. Managerial-implications discussion can be exploratory. Security proof follows theorem-proof-corollary, not TEEL.

### Management-Science Prose Tells (UTD24-specific)

| Pattern | Why It's an AI Tell | Fix |
|---------|-------------------|-----|
| Every section opens with "In this section, we..." | AI defaults to meta-commentary | Vary section openers: direct statement, question, stylized fact |
| Contribution claims use identical framing | "First, we contribute... Second, we contribute... Third, we contribute..." | Vary syntax: "We provide..." / "The paper introduces..." / "A third contribution is..." |
| Overuse of "Furthermore" / "Moreover" / "In addition" | Mechanical connective stacking | Use semantic progression; if no logical "furthermore" relationship, start a new paragraph |
| Pseudo-precision without numbers | "significant improvements," "substantial gains," "meaningful reductions" | Replace with direction + magnitude: "reduces latency by 40–60%" or drop the claim |
| Theory-name-dropping without mechanism | "Drawing on agency theory (Jensen & Meckling, 1976)..." followed by no mechanism link | Name the specific mechanism: "The separation of ownership and control creates an information asymmetry that..." |

---

## E. Burstiness (Sentence Length Variation)

### What to Check
Good writing has **natural variation in sentence length**. Short sentences create impact. Longer sentences develop complex ideas. The alternation creates rhythm.

### Detection Rule
If 5+ consecutive sentences all fall within a narrow word-count range (e.g., all between 20-25 words): **flag for review**.

### How to Fix
- Insert a short sentence (≤ 10 words) to break the pattern
- Combine two short sentences into one complex one if the pattern is monotonously short
- Read the paragraph aloud — if it feels metronomic, vary it

### Burstiness Targets (by section)
- **Abstract**: Moderate variation (factual, steady pace)
- **Introduction**: High variation (hook with short sentences, build with long ones)
- **Literature Review / Related Work**: Moderate (steady analytical pace, occasional short synthesis)
- **Protocol / Model Description**: Low variation acceptable (procedural sections naturally have uniform length; precision over style)
- **Security Proof / Formal Analysis**: Low variation acceptable (mathematical rigor over stylistic variety)
- **Empirical Evaluation**: Moderate (short for key findings, longer for detailed descriptions)
- **Discussion / Managerial Implications**: Highest variation (short for emphasis, long for interpretation, very short for conclusions)
- **Limitations & Conclusion**: Moderate-high (candid short admissions, elaborated boundary conditions)

---

## F. 简体中文 Writing Quality Check (Simplified Chinese)

Apply this section when the draft is written in 简体中文 (default for UTD24 IS-track / MS-track preset). These rules complement the English rules above but target Chinese-specific AI-generation patterns observed in finance × privacy-computing prose.

### F.1 词汇规范化 — 意图驱动 (Vocabulary Discipline)

凡是无实质信息量的情感渲染表达，或试图通过华丽辞藻掩盖逻辑空洞的词汇，均应替换为具体、客观的学术描述。

#### F.1.1 情感渲染词替换表 (Emotive Inflation Terms)

| AI高频词 (AI Tell) | 问题 | 替换建议 |
|-------------------|------|---------|
| 毋庸置疑 | 无实质信息量的强调 | 删除；若确需强调，用"可以确认的是" |
| 不可磨灭的贡献 | 情感过度渲染 | 具体说明贡献是什么 |
| 范式转移 / 范式变革 | 滥用，除非满足Kuhn条件 | 根本性变化、方向性调整、结构性转变 |
| 颠覆性 | 学术论文中的营销语言 | 根本性的、变革性的、开创性的（仅限确有其事时） |
| 深刻 / 切中要害 / 本质 | 空洞强调 | 具体化：改变了什么？影响了什么？程度多大？ |
| 痛点 | 商业口语 | 问题、挑战、瓶颈、障碍 |
| 展现了令人惊叹的能力 | 营销式评价 | 表现出显著的性能提升（附具体数值） |
| 耦合 / 内聚 | 软件工程术语，勿滥用 | 互动关系、关联性、相互依赖性 |
| 赋能 | 咨询行业用语 | 使……能够、支持、助力、赋予……能力 |
| 闭环 | 互联网黑话 | 完整流程、端到端、全链路 |
| 抓手 | 互联网黑话 | 切入点、着力点、关键手段 |
| 对齐 | 互联网黑话（非AI语境） | 协调、一致、匹配、校准 |
| 颗粒度 | 互联网黑话 | 粒度、细节程度、精细度 |
| 底层逻辑 | 咨询行业用语 | 基本逻辑、核心机制、基础原理 |
| 护城河 | 商业比喻 | 竞争优势、进入壁垒、差异化能力 |

#### F.1.2 隐私计算 × 金融领域术语豁免 (Domain Term Exemptions for 简体中文)

以下术语在隐私计算×金融领域具有精确的技术含义，**不得**被"去AI化"替换：

| 标准术语 | 含义锚点 | 替换禁令 |
|---------|---------|---------|
| 安全多方计算 (MPC) | 密码学原语；参见术语表 §1 | 不可替换为"隐私计算"或"联合计算" |
| 差分隐私 (DP) | 具有 (ε,δ) 形式化保证；参见术语表 §1 | 不可替换为"数据脱敏"或"匿名化" |
| 半诚实攻击者 / 恶意攻击者 | 密码学威胁模型的标准两分法 | 不可替换为"较弱攻击者"或"较强攻击者" |
| 隐私预算 (ε, δ) | 差分隐私的形式化度量 | 不可替换为"隐私保护强度" |
| 信息不对称 | Akerlof/Spence/Stiglitz框架术语 | 保持；不可简化为"信息差" |
| 逆向选择 / 道德风险 | 契约理论的精确区分 | 不可互换或混合使用 |
| 价格发现 | Hasbrouck信息份额；市场微观结构术语 | 保持；不可替换为"价格形成" |
| 系统性风险 / 系统性风险(β) | 前者 = network-wide failure risk; 后者 = CAPM beta | **严格区分**；参见术语表 §2 |

**铁律**：凡出现在 `shared/references/privacy_finance_glossary.md` 中的术语，其 Caveat 列即为权威判据。如果术语表中注明"不可与X混淆"或"严格区分Y与Z"，则draft中出现混淆属于**事实错误**，而非风格问题。

### F.2 句式自然化 — 去翻译腔与机械感 (Sentence Naturalization)

#### F.2.1 消除长定语结构 (De-nested Modifier Chains)

英式长定语是AI中文最明显的机器味来源：
- ❌ "一个能够在保护数据隐私的同时实现跨机构联合建模的基于安全多方计算的框架" 
- ✅ "该框架基于安全多方计算，可在保护数据隐私的同时实现跨机构联合建模。"

**修复规则**：定语从句长度 > 15字的，拆分为短句或将定语后置。

#### F.2.2 限制"被"字句 (Reduce Passive Voice)

中文学术写作少用"被"字句，多用无主语句或主动语态：
- ❌ "数据被发送至中心服务器进行处理"
- ✅ "数据发送至中心服务器进行处理" 或 "各方将数据发送至中心服务器进行处理"

**例外**：当"被"字承载了语义上的受动/被害含义时保留（如"被攻击者截获"）。

#### F.2.3 去除机械连接词堆砌 (De-mechanicalize Transitions)

- ❌ "首先……其次……再次……最后……" / "第一……第二……第三……"
- ✅ 通过句间因果、递进关系自然过渡。若确实需要枚举（如协议步骤、模型假设），仅使用"第一……第二……"且≤5项。

#### F.2.4 避免"一个...的...的..."嵌套 (Avoid Nested Possessives)

- ❌ "一个针对金融机构间数据共享场景的基于差分隐私的保护方案的设计"
- ✅ "本文设计了一种基于差分隐私的保护方案，适用于金融机构间的数据共享场景。"

### F.3 排版规范 — Word 适配 (Word-Ready Formatting)

#### F.3.1 Markdown 语法禁绝
输出的中文文本中严禁出现 `**加粗**`、`*斜体*`、`# 标题` 等Markdown标记。确保文本可直接纯文本粘贴到Word中。

#### F.3.2 标点规范
- 严格使用中文全角标点符号（，。；：""）
- 数学符号和英文术语周围保留合理空格
- 中英文混排时，英文单词前后各空一个半角空格（如"采用 MPC 协议"）
- 数字与中文单位之间不加空格（如"10万元"、"3家银行"）

#### F.3.3 数字表达统一
- 统计数字保留三位有效数字（如"p = 0.032"）
- 大数使用科学计数法或"万""亿"单位（如"1.2亿条交易记录"）
- 百分比精确到十分位（如"提高了 34.6%"）

### F.4 管理科学 / 金融领域中文特有模式 (Finance × Management-Science Chinese Tells)

| AI 模式 | 为何是 AI 味 | 修复 |
|--------|------------|------|
| "对于……而言，……具有重要的理论意义和现实意义" | 万能结尾，无信息量 | 具体陈述理论意义是什么（延伸了哪个理论），实践意义是什么（哪类机构如何受益） |
| "丰富了……领域的研究" | 空泛的贡献陈述 | 具体说明丰富了哪个子领域、以何种方式丰富 |
| "为……提供了新的思路" | 万能句式 | 删除。具体陈述提供了什么思路 |
| "在一定程度上" / "从某种意义上说" | 模糊化填充词 | 删除。如果结论不确定，明确陈述不确定性来源 |
| 结尾"未来研究可以……"列表 | 机械式展望 | 最多 2 个具体方向，每个方向一句话说明为什么非做不可 |
| "现有研究较少关注……" 但未引用"现有研究" | 稻草人论证 | 必须引用具体的"现有研究"（≥2篇），并明确其范围 |
| 引言第一句"随着……的发展" | AI万能开头 | 替换为具体的制度事实、数据事实或理论争议 |
| 在安全证明段落中使用文学化比喻 | 跨域混淆 | 安全证明使用精确的技术语言，避免"攻防博弈"外的比喻 |

---

## How to Use This Checklist

### During Drafting (Preferred)
Apply rules **while writing each section** in the self-review sub-step (Step 2.7 in draft_writer_agent). This catches issues before they propagate. For 简体中文 drafts, apply Section F in parallel with Sections A–E.

### During Final Review (Fallback)
If not applied during drafting, run a full-paper sweep before handoff to citation_compliance_agent. Apply both English rules (Sections A–E) and 简体中文 rules (Section F) when the draft is bilingual or Chinese-only.

### Scoring (Internal, Not Reported to User)
For each rule category, track violations:
- 0 violations: Clean
- 1-3 violations: Minor — fix in self-review
- 4+ violations: Pattern issue — review the section's writing approach

### Domain-Glossary Cross-Check (Mandatory for Privacy × Finance)
After completing the writing quality sweep, verify that **every privacy-computing and finance term** in the draft resolves to a canonical entry in `shared/references/privacy_finance_glossary.md`. Terms that do not resolve or are conflated (e.g., "MPC" and "FHE" used interchangeably) are **factual errors**, not style issues, and must be corrected before proceeding to Phase 6.

Do NOT report scores to the user. Just fix the issues silently during drafting.