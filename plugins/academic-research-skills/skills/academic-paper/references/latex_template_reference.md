# LaTeX Template Reference

Used by `formatter_agent` for LaTeX output generation.

**Pre-output writing-quality check**: Before converting to LaTeX, verify that the source document has passed `references/writing_quality_check.md` §A–§F. The LaTeX output is the final artifact — it must carry clean prose into the formatted result. Writing-quality violations caught at LaTeX generation time cost 5x more to fix than violations caught at prose-writing time. See `writing_quality_check.md` for the full checklist including AI-flag word detection, Chinese prose naturalization, and domain exemption rules.

## UTD24 Journal-Specific Preamble Directives (v3.10)

UTD24 venues often require specific LaTeX document classes or style files. Before generating LaTeX output for a UTD24 target, check the target journal and apply the correct preamble.

### Management Science (INFORMS)
```latex
\documentclass[12pt]{article}
% Management Science uses standard article class with INFORMS style
% Figures: embedded in text for initial submission; separate files for final
% References: Author-Date format (see citation_format_switcher.md § INFORMS Author-Date)
% Page limit: 38 pages (including tables/figures/references)
% Double-spaced for initial submission
```

### MIS Quarterly
```latex
\documentclass[12pt]{article}
% MISQ uses standard article class
% References: Author-Date format (see citation_format_switcher.md § MISQ Author-Date)
% Abstract limited to 150 words
% DSR papers: must include "Design Principles" section before Discussion
% Appendices: allowed for protocol details, security proofs; reviewers may request online-only supplement
```

### Information Systems Research (INFORMS)
```latex
\documentclass[12pt]{article}
% ISR uses standard article class
% References: Author-Date format (INFORMS style)
% Abstract limited to 150 words
% Page limit: 32 pages for initial submission
% Research transparency: data availability statement required in footnote on first page
```

### INFORMS Journal on Computing
```latex
\documentclass[12pt]{article}
% INFORMS JoC uses standard article class
% References: Author-Date format (INFORMS style)
% Code availability: mandatory data/code availability section
% Reproducibility: supplementary materials must include source code + benchmarks
% Formal proofs: can be in appendix or online supplement
```

### General UTD24 Common Preamble Elements
```latex
% --- Common to all UTD24 submissions ---
\usepackage[margin=1in]{geometry}     % 1-inch margins (standard across UTD24)
\usepackage{setspace}
\doublespacing                         % Double-spaced for initial submission (all UTD24)
\usepackage[natbibapa]{apacite}        % or natbib for Author-Date formats
\usepackage{booktabs}                  % Professional tables (no vertical rules)
\usepackage{graphicx}
\usepackage{hyperref}
\hypersetup{colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue}

% Title page (all UTD24 venues: anonymous for review)
\title{Paper Title}
\author{Author details withheld for peer review}
\date{}

% Acknowledgement footnote (added after acceptance)
% \thanks{We thank seminar participants at... Funding: ...}
```

## Basic Article Template

```latex
\documentclass[12pt, a4paper]{article}

% === Packages ===
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{times}                    % Times New Roman
\usepackage[margin=1in]{geometry}     % 1-inch margins
\usepackage{setspace}                 % Line spacing
\usepackage{amsmath}                  % Math support
\usepackage{graphicx}                 % Figures
\usepackage{booktabs}                 % Professional tables
\usepackage{hyperref}                 % Clickable links
\usepackage{natbib}                   % APA-style citations
\usepackage{url}                      % URL formatting
\usepackage{float}                    % Figure placement

% === CJK Support (for zh-TW content) ===
% Uncomment for Chinese content:
% \usepackage{xeCJK}
% \setCJKmainfont{Noto Sans CJK TC}
% \setCJKsansfont{Noto Sans CJK TC}

% === Settings ===
\doublespacing                        % APA requires double spacing
\setlength{\parindent}{0.5in}         % First-line indent
\bibliographystyle{apalike}           % APA citation style

% === Metadata ===
\title{Paper Title in Title Case}
\author{Author Name \\
  \small Department, Institution \\
  \small \href{mailto:email@example.com}{email@example.com}
}
\date{\today}

% === Document ===
\begin{document}

\maketitle

\begin{abstract}
\noindent
Abstract text here (150-250 words). No paragraph indent in abstract.
\\[6pt]
\textit{Keywords}: keyword1, keyword2, keyword3, keyword4, keyword5
\end{abstract}

\newpage

\section{Introduction}
% WRITING RULE: Open with a stylized fact or concrete puzzle, not "With the rapid development of..."
% WRITING RULE: Name the financial friction in the first 3 sentences
% WRITING RULE: State "We [verb]..." (not "This paper [verbs]...") by paragraph 2
% See writing_quality_check.md §A for opener patterns; §F for Chinese opener patterns

Cross-institutional financial crimes exploit a structural blind spot: each bank detects suspicious transactions within its own ledger, but coordinated money laundering that distributes transactions across multiple institutions evades any single bank's surveillance. Banks lose an estimated \$1.6--3.2 trillion annually to undetected money laundering, yet privacy regulations (GDPR, CCPA, local banking secrecy laws) prohibit the obvious remedy — pooling transaction data across institutions for joint screening. This tension between financial-crime detection and data-privacy compliance defines a market failure that cryptographic secure multi-party computation (MPC) is uniquely positioned to resolve.

We design an MPC protocol that enables a consortium of $n$ banks to jointly execute anti-money laundering (AML) screening rules over their combined transaction graphs without any bank revealing its customer identities, account balances, or transaction patterns to competitors or to a central authority. Our protocol reduces cross-institutional false negatives by 18--34\% in backtesting against a decade of Suspicious Activity Report (SAR) filings, while adding 120--400 ms of latency per screening query compared to a non-private centralized baseline.
% WRITING RULE: The opening paragraph above demonstrates — financial friction named in sentence 1, concrete mechanism named, specific magnitude (not "significant improvement")

\section{Related Work}
% WRITING RULE: At UTD24 venues, literature is often embedded in the Introduction or kept compact
% WRITING RULE: Each cited paper's contribution is stated in one clause; avoid "Author (Year) studied X and found Y" monotony

Our work sits at the intersection of two literatures that rarely cite each other. In the privacy-technology stream, secure multi-party computation has progressed from theoretical feasibility \citep{Yao1982, Goldreich1987} to practical deployments in financial settings including interbank FX settlement \citep{Cartlidge2021}, credit scoring \citep{Bogdanov2012}, and supply-chain finance \citep{Kerschbaum2011}. However, these works treat the financial scenario as an evaluation benchmark rather than engaging with the economic mechanism design questions that determine real-world adoption. In the financial-crime literature, AML screening is well-characterized as an information-asymmetry problem \citep{Masciandaro2013}, with structural estimates placing the detection-elasticity of information sharing at 0.3--0.6 \citep{Colladon2020}. Yet this literature treats privacy-preserving computation as a black-box implementation detail.

No prior work synthesizes the cryptographic protocol design with the financial-mechanism design. We bridge this gap by co-designing the MPC protocol and the bank-consortium governance structure, showing that the protocol's communication complexity and the consortium's incentive compatibility are interdependent.
% WRITING RULE: The paragraph structure above alternates between streams rather than siloing them; each stream gets one paragraph, then the synthesis paragraph names the gap

\section{Methodology}
\subsection{Threat Model and Security Model}
% WRITING RULE: Must state (1) adversary capabilities, (2) trust assumptions, (3) security guarantees claimed, (4) what is explicitly NOT protected

We consider a static semi-honest adversary controlling up to $t < n/2$ of $n$ consortium banks...

\subsection{MPC Protocol Construction}
% WRITING RULE: Describe the protocol as enabling a financial workflow, not as a standalone cryptographic construction

\subsection{Empirical Evaluation Design}
% WRITING RULE: Distinguish protocol-level benchmarks from financial-outcome metrics; they answer different questions

\section{Results}
\subsection{Protocol Performance}
% WRITING RULE: State the financial significance of each performance figure, not just the number

\subsection{Financial-Outcome Impact}
% WRITING RULE: Report direction AND magnitude; avoid "statistically significant" without effect size

\section{Discussion}
% WRITING RULE: First paragraph must state which competing explanation the results rule out
% WRITING RULE: Address boundary conditions explicitly — where does this protocol NOT work?

\begin{table}[H]
\centering
\caption{Descriptive Statistics}
\label{tab:results}
\begin{tabular}{lccc}
\toprule
Variable & $M$ & $SD$ & $N$ \\
\midrule
Variable 1 & 3.45 & 0.82 & 120 \\
Variable 2 & 4.12 & 0.67 & 120 \\
\bottomrule
\end{tabular}
\end{table}

\section{Discussion}
\subsection{Interpretation}
\subsection{Implications}
\subsection{Limitations}

\section{Conclusion}

% === AI Disclosure ===
\subsection*{AI Disclosure}
This paper was prepared with the assistance of AI-powered academic
writing tools. All content was reviewed and verified by the author(s).

% === References ===
\newpage
\bibliography{references}

\end{document}
```

## APA 7.0 Template (`apa7` Class) — Preferred for APA Output

When APA 7.0 format is requested, use the `apa7` document class instead of `article`. This ensures correct running heads, title page layout, and heading levels.

```latex
\documentclass[man,12pt,natbib]{apa7}

% === Fonts (XeTeX) ===
\usepackage{fontspec}
\setmainfont{Times New Roman}
\usepackage{xeCJK}
\setCJKmainfont{Source Han Serif TC VF}
\setmonofont{Courier New}

% === Additional packages ===
\usepackage{longtable}
\usepackage{booktabs}
\usepackage{array}
\usepackage{graphicx}
\usepackage{float}
\usepackage{hyperref}
\hypersetup{colorlinks=true, linkcolor=black, citecolor=black, urlcolor=blue, breaklinks=true}
\usepackage{xurl}  % URL line breaking (after hyperref)

% === Table column types ===
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}

% === Justify text (CRITICAL — apa7 man mode defaults to raggedright) ===
\usepackage{ragged2e}
\usepackage{etoolbox}
\AtBeginDocument{\justifying}
\apptocmd{\maketitle}{\justifying}{}{}
\let\oldraggedright\raggedright
\renewcommand{\raggedright}{\justifying}

% === Pandoc compatibility ===
\newcounter{none}
\providecommand{\tightlist}{\setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}

% === Metadata ===
\title{Paper Title}
\shorttitle{Short Title for Running Head}
\author{Author Name}
\affiliation{Institution}
\authornote{Author note text.}

% === Abstract (primary language) ===
\abstract{
  Primary language abstract text...

  \newpage

  \begin{center}\textbf{Second Language Abstract Title}\end{center}

  Second language abstract text...
}

\keywords{keyword1, keyword2, keyword3}

\begin{document}
\maketitle

% Body sections here...
% WRITING RULE: Each section must pass writing_quality_check.md before being written to LaTeX
% WRITING RULE: Privacy×Finance — every section must bridge both domains in at least one sentence

\end{document}
```

### Key Differences: `apa7` vs `article`

| Feature | `apa7` class | `article` class |
|---------|-------------|-----------------|
| Running head | Automatic (`\shorttitle`) | Manual (`fancyhdr`) |
| Title page | Built-in (`\maketitle`) | Manual (`titlepage`) |
| Abstract | `\abstract{}` in preamble | `\begin{abstract}` in body |
| Heading levels | APA 5-level automatic | Manual formatting |
| Double spacing | Automatic in `man` mode | Requires `\doublespacing` |
| Text alignment | **Ragged-right (must override!)** | Justified by default |

### Table Column Width Formula (Mandatory)

**NEVER** use bare `p{0.25\linewidth}` in longtable — this ignores inter-column padding and causes overflow.

**Correct formula**: `p{(\linewidth - N\tabcolsep) * \real{proportion}}`

Where N = `(number_of_columns - 1) × 2`

| Columns | N (tabcolseps) | Example |
|---------|---------------|---------|
| 3 | 4 | `(\linewidth - 4\tabcolsep) * \real{0.3333}` |
| 4 | 6 | `(\linewidth - 6\tabcolsep) * \real{0.2500}` |
| 5 | 8 | `(\linewidth - 8\tabcolsep) * \real{0.2000}` |

## BibTeX Entry Formats

### Journal Article
```bibtex
@article{Smith2024,
  author  = {Smith, John A. and Jones, Betty C.},
  title   = {Article title in sentence case},
  journal = {Journal Title in Title Case},
  year    = {2024},
  volume  = {45},
  number  = {2},
  pages   = {123--145},
  doi     = {10.1234/example.2024.001}
}
```

### Book
```bibtex
@book{Brown2023,
  author    = {Brown, Alice},
  title     = {Book Title in Sentence Case},
  publisher = {Publisher Name},
  year      = {2023},
  edition   = {2nd},
  address   = {City}
}
```

### Book Chapter
```bibtex
@incollection{Lee2024,
  author    = {Lee, David},
  title     = {Chapter title in sentence case},
  booktitle = {Book Title in Sentence Case},
  editor    = {Editor, First A.},
  publisher = {Publisher Name},
  year      = {2024},
  pages     = {45--67}
}
```

### Conference Paper
```bibtex
@inproceedings{Chen2024,
  author    = {Chen, Wei and Wang, Ming},
  title     = {Paper title in sentence case},
  booktitle = {Proceedings of the Conference Name},
  year      = {2024},
  pages     = {101--110},
  address   = {City, Country},
  doi       = {10.1234/conf.2024.001}
}
```

### Report / Technical Report
```bibtex
@techreport{MOE2024,
  author      = {{Ministry of Education}},
  title       = {Report title in sentence case},
  institution = {Ministry of Education},
  year        = {2024},
  type        = {Annual Report},
  url         = {https://www.example.com}
}
```

### Thesis / Dissertation
```bibtex
@phdthesis{Wang2024,
  author = {Wang, Mei-Ling},
  title  = {Dissertation title in sentence case},
  school = {National Taiwan University},
  year   = {2024},
  type   = {Doctoral dissertation}
}
```

### Website
```bibtex
@misc{WHO2024,
  author       = {{World Health Organization}},
  title        = {Page title in sentence case},
  year         = {2024},
  howpublished = {\url{https://www.who.int/page}},
  note         = {Accessed: 2024-03-15}
}
```

## Citation Commands

### natbib Commands
| Command | Output | Use For |
|---------|--------|---------|
| `\citet{Smith2024}` | Smith (2024) | Narrative citation |
| `\citep{Smith2024}` | (Smith, 2024) | Parenthetical citation |
| `\citep{Smith2024,Jones2023}` | (Jones, 2023; Smith, 2024) | Multiple |
| `\citeauthor{Smith2024}` | Smith | Author only |
| `\citeyear{Smith2024}` | 2024 | Year only |
| `\citep[p.~45]{Smith2024}` | (Smith, 2024, p. 45) | With page |

### biblatex Commands (Alternative)
| Command | Output |
|---------|--------|
| `\textcite{Smith2024}` | Smith (2024) |
| `\parencite{Smith2024}` | (Smith, 2024) |
| `\autocite{Smith2024}` | (Smith, 2024) — adapts to style |

## XeLaTeX for Chinese Content

When the paper includes zh-TW content:

```latex
\documentclass[12pt, a4paper]{article}
\usepackage{xeCJK}
\setCJKmainfont{Noto Sans CJK TC}     % or 'AR PL UMing TW'
\setCJKsansfont{Noto Sans CJK TC}
\setCJKmonofont{Noto Sans Mono CJK TC}

% Compile with: xelatex paper.tex
```

### Bilingual Abstract in LaTeX (article class)
```latex
\begin{abstract}
\noindent
English abstract text here...
\\[6pt]
\textit{Keywords}: keyword1, keyword2, keyword3
\end{abstract}

\begin{center}
\textbf{中文摘要}
\end{center}

\noindent
简体中文摘要内容...

\noindent
\textbf{关键词}：关键词1, 关键词2, 关键词3
```

### Bilingual Abstract under `apa7` Class (UTD24 — v3.10)

When using `apa7` document class, bilingual abstracts must be placed in the preamble `\abstract{}` block since `apa7` does not use `\begin{abstract}` in the document body:

```latex
\documentclass[man,12pt,natbib]{apa7}

% ... font setup, packages ...

\title{Privacy-Preserving Cross-Bank AML Screening via Secure Multi-Party Computation}
\shorttitle{Privacy-Preserving Cross-Bank AML Screening}
\author{Author Name}
\affiliation{Institution}

\abstract{
  % === English Abstract (primary) ===
  Cross-institutional financial crimes exploit a structural blind spot: each bank detects suspicious transactions within its own ledger, but coordinated money laundering distributed across multiple institutions evades any single bank's surveillance. We design a secure multi-party computation (MPC) protocol that enables a consortium of banks to jointly execute anti-money laundering (AML) screening rules over their combined transaction graphs without revealing customer identities, transaction patterns, or account balances to competitors. Backtesting against a decade of Suspicious Activity Report (SAR) filings shows an 18--34\% reduction in cross-institutional false negatives, with 120--400 ms of added latency per screening query compared to a non-private centralized baseline. The protocol's communication complexity scales linearly in the number of consortium members, making it deployable for consortia of up to 30 banks without hardware acceleration. We formalize the incentive-compatibility conditions under which rational banks join the consortium and contribute genuine data rather than strategic noise. These findings establish that privacy-preserving computation can resolve a material market friction in financial-crime detection without requiring regulatory reform or centralized data repositories.

  \vspace{12pt}
  \noindent\textit{Keywords}: secure multi-party computation, anti-money laundering, cross-border payments, information asymmetry, regulatory technology, financial intermediation, privacy-preserving data sharing

  \newpage

  % === Chinese Abstract (简体中文) ===
  \begin{center}\textbf{摘要}\end{center}

  跨机构金融犯罪利用了一个结构性盲区：各家银行均能识别自身账本内的可疑交易，但跨机构协同洗钱行为——将交易路径分散于多家机构之间——可以规避任何单家银行的监控。我们设计了一个安全多方计算协议，使银行联盟能够在合并的交易图上联合执行反洗钱筛查规则，同时不向竞争对手或中心化机构暴露客户身份、交易模式或账户余额。基于十年可疑交易报告数据的回溯测试表明，该协议可将跨机构假阴性率降低18--34\%，相比非隐私保护的集中式基线，每次筛查查询仅增加120--400毫秒延迟。协议通信复杂度随联盟成员数量线性增长，在无硬件加速条件下可支持最多30家银行组成的联盟。我们形式化了理性银行选择加入联盟并提供真实数据（而非策略性噪声）的激励相容条件。这些发现表明，隐私保护计算能够在不依赖监管改革或集中化数据存储的前提下，解决金融犯罪检测领域一个实质性的市场摩擦。

  \vspace{6pt}
  \noindent\textbf{关键词}：安全多方计算, 反洗钱, 跨境支付, 信息不对称, 监管科技, 金融中介, 隐私保护数据共享
}

\keywords{secure multi-party computation, anti-money laundering, cross-border payments, information asymmetry, regulatory technology, financial intermediation, privacy-preserving data sharing}
% For apa7, \keywords is separate from \abstract; the abstract block carries both language versions

\begin{document}
\maketitle

% Body sections follow...
\end{document}
```

**Key points for UTD24 bilingual abstracts**:
- The two abstracts are independently composed, not translated (per `abstract_bilingual_agent.md` core principle 1)
- English abstract: 150–300 words, carries some LaTeX notation for technical terms (e.g., \varepsilon, \lambda)
- Chinese abstract: 300–500 characters, converts ALL LaTeX notation to natural language (per `abstract_bilingual_agent.md` rule 3)
- Keywords complement (do not duplicate) the title
- Privacy×Finance: ≥2 terms from each stream for cross-disciplinary discoverability

## Common LaTeX Compilation Issues

| Issue | Solution |
|-------|---------|
| Chinese characters not showing | Use XeLaTeX instead of pdfLaTeX |
| Bibliography not appearing | Run: latex → bibtex → latex → latex |
| Citations showing [?] | Run bibtex and recompile |
| Hyperlinks not working | Ensure `hyperref` is loaded last |
| Table/figure placement wrong | Use `[H]` from `float` package |
| UTF-8 encoding errors | Ensure `\usepackage[utf8]{inputenc}` |

## Pandoc Conversion Commands

### Markdown → LaTeX
```bash
pandoc paper.md -o paper.tex --bibliography=references.bib --csl=apa.csl
```

### Markdown → PDF (via LaTeX)
```bash
pandoc paper.md -o paper.pdf --pdf-engine=xelatex \
  --bibliography=references.bib --csl=apa.csl \
  -V geometry:margin=1in -V fontsize=12pt -V linestretch=2
```

### Markdown → PDF (with Chinese)
```bash
pandoc paper.md -o paper.pdf --pdf-engine=xelatex \
  -V CJKmainfont="Noto Sans CJK TC" \
  --bibliography=references.bib --csl=apa.csl
```

### Markdown → DOCX
```bash
pandoc paper.md -o paper.docx --bibliography=references.bib --csl=apa.csl
```
