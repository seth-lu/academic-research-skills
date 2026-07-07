# Privacy Computing × Finance Domain Glossary

Bilingual terminology used by all agents when writing papers in the **Privacy Computing × Finance** interdisciplinary field, especially when targeting **UTD24 IS-track / MS-track** journals (MISQ, ISR, Management Science, INFORMS Journal on Computing).

Loaded by:
- `academic-paper/agents/draft_writer_agent.md` — to align technical terminology
- `academic-paper/agents/abstract_bilingual_agent.md` — for zh-CN ↔ en bilingual abstract production
- `academic-paper/agents/literature_strategist_agent.md` — for keyword expansion
- `academic-paper-reviewer/agents/methodology_reviewer_agent.md` — to check threat-model precision
- `deep-research/agents/research_question_agent.md` — for RQ scoping in the joint domain
- `commands/ars-utd24-full.md` — pre-loaded by the UTD24 preset

**Iron rule (analogous to v3.6.7 IRB-glossary firm rule)**: terms in the **Caveat** column are not interchangeable. Reviewers in cryptography and privacy regulation routinely reject papers that conflate **anonymity vs differential privacy vs k-anonymity**, or **secure-aggregation vs MPC vs FHE**, or **honest-but-curious vs malicious adversary**. Every privacy-or-security claim in the draft MUST pass through this lookup before output.

---

## Section 1 — Privacy-Computing Primitives

| English | 简体中文 | Caveat (≤25 words) |
|---|---|---|
| Secure Multi-Party Computation (MPC / SMPC) | 安全多方计算 | NOT a synonym for FHE. Multi-round protocol; participants compute jointly without revealing inputs. State threat model. |
| Fully Homomorphic Encryption (FHE) | 全同态加密 | Single-party server-side. Distinct from MPC. Specify scheme: BFV / BGV (integer) or CKKS (approximate / float). |
| Somewhat Homomorphic Encryption (SHE) | 部分同态加密 | Bounded multiplication depth. NOT FHE. Common in low-depth analytics. |
| Partially Homomorphic Encryption (PHE) | 单一同态加密 | One operation only (add OR multiply). Paillier (additive), RSA (multiplicative). |
| Zero-Knowledge Proof (ZKP) | 零知识证明 | Three properties: completeness, soundness, zero-knowledge. State which is proven. |
| zk-SNARK | 简洁非交互零知识证明 | Succinct, non-interactive, requires trusted setup unless using transparent variant (e.g., STARK). |
| zk-STARK | 透明零知识证明 | No trusted setup, post-quantum secure, larger proofs than SNARK. |
| Bulletproofs | 防弹证明 | No trusted setup, range proofs, common in confidential transactions. |
| Differential Privacy (DP) | 差分隐私 | Has formal (ε, δ) guarantee. NOT k-anonymity. State which mechanism (Laplace, Gaussian, Exponential). |
| Local Differential Privacy (LDP) | 本地化差分隐私 | Noise added at user device before sending. Strictly stronger trust model than central DP. |
| Central / Global DP | 中心化差分隐私 | Trusted curator adds noise. Lower utility cost but requires trusted aggregator. |
| Rényi Differential Privacy (RDP) | Rényi 差分隐私 | Tighter composition than (ε,δ)-DP. Used for DP-SGD privacy accounting. |
| Privacy Budget (ε, δ) | 隐私预算 | ε = privacy loss; δ = failure probability. State both. ε > 10 is "weak DP" in regulator eyes. |
| DP-SGD | 差分隐私随机梯度下降 | Per-sample clip + Gaussian noise + RDP/moments accounting. Standard for private deep learning. |
| Federated Learning (FL) | 联邦学习 | NOT inherently private. Need DP / secure aggregation / encryption layer for actual privacy. |
| Horizontal FL | 横向联邦学习 | Same features, different samples (e.g., banks with disjoint customers). |
| Vertical FL | 纵向联邦学习 | Same samples, different features (e.g., bank + e-commerce on shared users). |
| Cross-Silo FL | 跨机构联邦学习 | Few participants (banks, hospitals). Distinct from cross-device FL. |
| Cross-Device FL | 跨设备联邦学习 | Many participants (phones). Stragglers and dropouts are first-order. |
| Secure Aggregation (SecAgg) | 安全聚合 | Server learns SUM only, not individual updates. NOT a substitute for DP — orthogonal. |
| Trusted Execution Environment (TEE) | 可信执行环境 | Hardware enclave (Intel SGX, ARM TrustZone, AMD SEV). Trust shifts to silicon vendor + side-channel surface. |
| Garbled Circuits | 混淆电路 | 2-party MPC primitive (Yao). Constant rounds. |
| Oblivious Transfer (OT) | 不经意传输 | Foundational primitive. OT extension makes large-scale OT cheap. |
| Threshold Cryptography | 门限密码学 | t-of-n keyholders required to decrypt/sign. Used in custody, MPC. |
| Secret Sharing | 秘密分享 | Shamir (t,n)-threshold or replicated. Building block for MPC. |
| Honest-but-Curious / Semi-Honest Adversary | 诚实但好奇 / 半诚实攻击者 | Follows protocol, tries to learn. WEAKER than malicious. State explicitly. |
| Malicious / Active Adversary | 恶意 / 主动攻击者 | Deviates arbitrarily. Stronger model; usually 10–100× cost. |
| Covert Adversary | 隐蔽攻击者 | Misbehaves only if undetectable. Between semi-honest and malicious. |
| k-Anonymity | k-匿名 | NOT differential privacy. Vulnerable to homogeneity & background-knowledge attacks. |
| l-Diversity / t-Closeness | l-多样性 / t-接近性 | Patches to k-anonymity. Still NOT differential privacy. |
| Privacy-Preserving Record Linkage (PPRL) | 隐私保护的记录链接 | Match records across orgs without exposing identifiers. Bloom-filter or MPC-based. |
| Confidential Computing | 机密计算 | Umbrella term: TEE-based + sometimes MPC/FHE. Industry-coined; specify which technology. |
| Privacy-Enhancing Technology (PET) | 隐私增强技术 | Umbrella: DP + FL + MPC + FHE + ZKP + TEE + PSI. Always specify which. |
| Private Set Intersection (PSI) | 隐私集合求交 | Compute set intersection without exposing non-overlap. MPC primitive. Common in cross-bank reconciliation. |
| Data Clean Room | 数据洁净室 | Industry term for PETs deployed in advertising/finance. Often vague — specify underlying tech. |

---

## Section 2 — Finance Terminology

| English | 简体中文 | Caveat |
|---|---|---|
| Market Microstructure | 市场微观结构 | Subfield: order books, price formation, liquidity. Hasbrouck/Kyle/Madhavan canonical. |
| Asymmetric Information | 信息不对称 | Akerlof / Spence / Stiglitz. Pin to which type: adverse selection vs moral hazard. |
| Adverse Selection | 逆向选择 | Pre-contract information asymmetry. Distinct from moral hazard. |
| Moral Hazard | 道德风险 | Post-contract effort/action asymmetry. Distinct from adverse selection. |
| Informed Trading | 知情交易 | PIN model (Easley & O'Hara). Empirically estimated from order flow. |
| Price Discovery | 价格发现 | Hasbrouck information share / Gonzalo-Granger component share. |
| Market Efficiency | 市场效率 | Weak / semi-strong / strong (Fama). State which form is tested. |
| Liquidity Provision | 流动性提供 | Bid-ask spread + depth + resilience. Three dimensions, do not collapse. |
| Bid-Ask Spread | 买卖价差 | Quoted vs effective vs realized — distinct concepts. State which. |
| Systemic Risk | 系统性风险 | Network-wide failure risk. CoVaR / SRISK / DebtRank. NOT same as systematic risk (β). |
| Systematic Risk | 系统性风险 (β-风险) | CAPM beta — market-wide non-diversifiable risk. Distinct from systemic risk above. |
| Contagion | 传染 (金融) | Cross-border / cross-asset shock propagation. Allen-Gale / Acemoglu-Ozdaglar. |
| FinTech | 金融科技 | Umbrella: lending, payments, wealth, RegTech, InsurTech. Specify segment. |
| RegTech | 监管科技 | Compliance automation. Often the "managerial implication" hook for privacy-tech papers. |
| SupTech | 监管科技 (监管端) | Tools used BY regulators. Distinct from RegTech (used by regulated). |
| Anti-Money Laundering (AML) | 反洗钱 | FATF 40 Recommendations. Privacy-tech use case: cross-bank graph analytics. |
| Know-Your-Customer (KYC) | 客户尽职调查 | Identity verification. Privacy-preserving KYC = ZKP / verifiable credentials. |
| Credit Scoring | 信用评分 | FICO, internal-rating-based (IRB) under Basel. Privacy-tech use case: cross-institution joint scoring via FL/MPC. |
| Inter-bank Settlement | 银行间结算 | RTGS, ACH, SWIFT. MPC / FHE use case: privacy-preserving netting. |
| Payment Rails | 支付通道 | Visa/MC, FedNow, RTP, ACH, SEPA. State which. |
| Audit Trail | 审计轨迹 | Tamper-evident log. ZKP/blockchain use case: verifiable audit without exposing detail. |
| Data Sovereignty | 数据主权 | Cross-border data localization. GDPR/CCPA/PIPL. Driver for FL adoption. |
| Counterparty Risk | 对手方风险 | Distinct from credit risk. Privacy-tech use case: collateral verification without position disclosure. |
| Front-Running | 抢先交易 | Order-flow exploitation. TEE/FHE use case: dark pools, sealed-bid markets. |
| MEV (Maximal Extractable Value) | 最大可提取价值 | DeFi-specific front-running. ZKP/threshold-encryption use case: encrypted mempools. |
| Portfolio Optimization | 投资组合优化 | Markowitz baseline. MPC use case: joint optimization across asset managers without exposing positions. |
| Stress Testing | 压力测试 | Basel III / DFAST / EBA. Privacy-tech use case: cross-bank stress test on linked data. |
| Basel III / IV | 巴塞尔协议 III / IV | Capital + liquidity + leverage. Compliance frame for IRB models. |
| GDPR / CCPA / PIPL | 欧盟 / 加州 / 中国数据隐私法 | Regulatory triad in privacy-tech papers. State which jurisdiction the artifact targets. |

---

## Section 3 — Joint-Domain Canonical Phrasing

| Phrase (EN) | 简体中文 | Usage / caveat |
|---|---|---|
| Privacy-Utility Tradeoff | 隐私-效用权衡 | The first-order axis. Always quantified, never narrative. Plot ε on x, utility metric on y. |
| Privacy Budget Allocation | 隐私预算分配 | When ε is split across queries / iterations. Composition matters; cite RDP or moments accountant. |
| Honest-but-Curious Adversary | 诚实但好奇的攻击者 | Default in efficient MPC. State explicitly when used. |
| Malicious-Secure | 恶意安全 | Reviewer 1 (cryptography) will demand this if claim is "production-ready". |
| Universally Composable (UC) | 通用可组合 | Canetti's UC framework. Strong but heavy. State if claimed. |
| Membership Inference Attack (MIA) | 成员推断攻击 | Privacy attack used to motivate DP. NOT a privacy guarantee — the attack DP defends against. |
| Reconstruction Attack | 重构攻击 | Stronger than MIA. Cite Carlini et al. for canonical examples. |
| Linkage Attack | 链接攻击 | Re-identification via auxiliary data. Used to motivate why k-anonymity is insufficient. |
| Cross-Silo Federated Analytics | 跨机构联邦分析 | Banks/hospitals jointly compute statistics. SecAgg + DP standard stack. |
| Privacy-Preserving Machine Learning (PPML) | 隐私保护机器学习 | Umbrella. Always specify: DP-SGD vs FL vs MPC-ML vs FHE-ML. |
| Secure Analytics | 安全分析 | Industry term for joint analytics under PETs. Specify the protocol stack. |
| Confidential Transactions | 机密交易 | Pedersen commitment + range proof. Monero, Mimblewimble. |
| Verifiable Credentials | 可验证凭证 | W3C standard. ZKP-based selective disclosure. KYC use case. |
| Privacy-Preserving Audit | 隐私保护审计 | ZKP / FHE-based audit without exposing transactions. zkLedger canonical. |
| Privacy by Design (PbD) | 隐私即设计 | Cavoukian 7 principles. GDPR Article 25. Often cited as motivation. |
| Data Minimization | 数据最小化 | GDPR Article 5(1)(c). Often the regulatory hook. |
| Right to Be Forgotten | 被遗忘权 | GDPR Article 17. Hard problem under FL — machine unlearning area. |
| Explainable Privacy | 可解释隐私 | ε is hard for regulators/users to interpret. Open problem; cite Cummings et al. |

---

## Anti-Pattern Phrasings (DO NOT WRITE)

The following phrasings appear AI-generated or technically imprecise. Reviewers will flag them.

| ❌ DO NOT WRITE | ✅ WRITE INSTEAD | Why |
|---|---|---|
| "We anonymize the data using differential privacy" | "We apply (ε=2, δ=10⁻⁵)-differential privacy via the Gaussian mechanism" | Anonymization ≠ DP. State the mechanism + parameters. |
| "Our protocol is fully secure" | "Our protocol is secure against a semi-honest adversary in the standalone model" | Specify threat model + composition setting. |
| "MPC guarantees privacy" | "Our MPC protocol reveals only the function output to the designated party under a t < n/2 honest-majority assumption" | State leakage profile + corruption threshold. |
| "Federated learning protects privacy" | "FL alone does not provide formal privacy; we add (ε=8)-DP via DP-SGD and SecAgg" | FL ≠ privacy without an additional layer. |
| "We use blockchain for security" | "We use [name a specific consensus / commitment scheme] for [name a specific property]" | Blockchain is not a primitive; reviewers will reject hand-waving. |
| "Our scheme is post-quantum" | "Our scheme is conjectured post-quantum secure under the [LWE / SIS / isogeny] assumption" | State the underlying hard problem. |
| "We achieve a privacy-utility tradeoff" | "At ε=4, F1 drops by 3.2% relative to non-private baseline (Table X)" | Quantify, do not narrate. |

---

## Cross-References

- IRB / consent terminology (anonymity vs confidentiality vs de-identification): `shared/references/irb_terminology_glossary.md`
- Reviewer panel preset for this domain: `academic-paper-reviewer/agents/field_analyst_agent.md` Example 3
- Methodology recipes (DSR / crypto / econ-IS): `shared/references/privacy_finance_methodology_presets.md`
- Citation styles (MISQ / INFORMS author-date): `academic-paper/references/citation_format_switcher.md`
- UTD24 IS/MS journal preferences: `academic-paper-reviewer/references/top_journals_by_field.md` Section 3.5

---

**Version**: 1.0 (initial release with ARS v3.7.0 customization layer)
**Last updated**: 2026-05-08
**Maintainer**: project-local customization (not upstream ARS)
