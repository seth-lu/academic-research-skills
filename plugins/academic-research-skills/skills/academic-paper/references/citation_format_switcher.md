# Citation Format Switcher — Multi-Citation Format Switching

Quick-reference for switching between 5 citation formats. Used by `citation_compliance_agent` and `formatter_agent`.

## Format Comparison Matrix

### In-Text Citation Patterns

| Scenario | APA 7th | Chicago (Notes) | Chicago (Author-Date) | MLA 9th | IEEE | Vancouver |
|----------|---------|-----------------|----------------------|---------|------|-----------|
| Single author | (Smith, 2024) | ¹ (footnote) | (Smith 2024) | (Smith 45) | [1] | ¹ (superscript) |
| Two authors | (Smith & Jones, 2024) | ¹ | (Smith and Jones 2024) | (Smith and Jones 45) | [1] | ¹ |
| 3+ authors | (Smith et al., 2024) | ¹ | (Smith et al. 2024) | (Smith et al. 45) | [1] | ¹ |
| Direct quote | (Smith, 2024, p. 45) | ¹ | (Smith 2024, 45) | (Smith 45) | [1, p. 45] | ¹⁽ᵖ⁴⁵⁾ |
| Multiple works | (Chen, 2023; Smith, 2024) | ¹ ² | (Chen 2023; Smith 2024) | (Chen 12; Smith 45) | [1], [2] | ¹˒² |
| Order | Alphabetical | Order of appearance | Alphabetical | Alphabetical | Order of appearance | Order of appearance |

### Reference List Naming

| Format | Section Title | Entry Order |
|--------|--------------|-------------|
| APA 7th | References | Alphabetical |
| Chicago (Notes) | Bibliography | Alphabetical |
| Chicago (Author-Date) | References | Alphabetical |
| MLA 9th | Works Cited | Alphabetical |
| IEEE | References | Order of appearance |
| Vancouver | References | Order of appearance |

## Format Details

### APA 7th Edition
**Discipline**: Education, Psychology, Social Sciences

**Journal Article**:
```
Smith, J. A., & Jones, B. C. (2024). Article title in sentence case.
    Journal Title in Title Case, 45(2), 123-145. https://doi.org/10.xxxx
```

**Book**:
```
Smith, J. A. (2024). Book title in sentence case (2nd ed.). Publisher.
```

**Key rules**: Hanging indent, DOI as URL, sentence case for titles, "&" before last author.

---

### Chicago 17th (Notes-Bibliography)
**Discipline**: History, Humanities, some Social Sciences

**Footnote (first citation)**:
```
1. John A. Smith and Betty C. Jones, "Article Title in Title Case,"
Journal Title 45, no. 2 (2024): 123, https://doi.org/10.xxxx.
```

**Footnote (subsequent)**:
```
2. Smith and Jones, "Article Title," 130.
```

**Bibliography entry**:
```
Smith, John A., and Betty C. Jones. "Article Title in Title Case."
    Journal Title 45, no. 2 (2024): 123-145.
    https://doi.org/10.xxxx.
```

**Key rules**: Full names, title case throughout, footnotes + bibliography, period after URL.

---

### Chicago 17th (Author-Date)
**Discipline**: Natural Sciences, some Social Sciences

**In-text**: (Smith 2024, 45)

**Reference**:
```
Smith, John A. 2024. "Article Title in Title Case." Journal Title
    45 (2): 123-145. https://doi.org/10.xxxx.
```

**Key rules**: Year after author name, full names in reference, title case.

---

### MLA 9th Edition
**Discipline**: Literature, Languages, Cultural Studies

**In-text**: (Smith 45) — author + page, no comma, no year

**Works Cited**:
```
Smith, John A., and Betty C. Jones. "Article Title in Title Case."
    Journal Title, vol. 45, no. 2, 2024, pp. 123-45.
```

**Key rules**: No year in in-text, page numbers always, containers model, no DOI in basic format (include if online), title case for all titles.

---

### IEEE
**Discipline**: Engineering, Computer Science, Technology

**In-text**: [1] — numbered brackets in order of appearance

**Reference**:
```
[1] J. A. Smith and B. C. Jones, "Article title in sentence case,"
    Journal Title, vol. 45, no. 2, pp. 123-145, Feb. 2024,
    doi: 10.xxxx.
```

**Key rules**: Numbered [N], initials before surname, abbreviated month, "doi:" prefix (not URL).

---

### Vancouver
**Discipline**: Medicine, Biomedical Sciences, Nursing

**In-text**: Superscript numbers ¹ or (1) in order of appearance

**Reference**:
```
1. Smith JA, Jones BC. Article title in sentence case. Journal Title.
   2024;45(2):123-145. doi:10.xxxx
```

**Key rules**: Numbered in order of appearance, no spaces in initials, abbreviated journal titles (per NLM), semicolon before volume, colon before pages.

## Conversion Quick Reference

### APA → Chicago (Notes-Bibliography)
1. Change in-text (Author, Year) → footnotes
2. Expand first names in reference list
3. Change sentence case → title case for article titles
4. Add period after URLs
5. Rename "References" → "Bibliography"

### APA → MLA
1. Remove years from in-text, add page numbers
2. Expand first names, change "&" → "and"
3. Change format: vol., no., year order
4. Remove DOIs (unless online-only source)
5. Rename "References" → "Works Cited"

### APA → IEEE
1. Change (Author, Year) → [N] numbered brackets
2. Reorder references by appearance (not alphabetical)
3. Change to initials-first format
4. Add "doi:" prefix to DOIs
5. Abbreviate month names

### APA → Vancouver
1. Change (Author, Year) → superscript numbers
2. Reorder references by appearance
3. Remove spaces between initials
4. Abbreviate journal titles (NLM catalog)
5. Use semicolons/colons for volume/page separators

## Chinese Citation Format Switching

### APA 7.0 Chinese Format

For complete specifications, see `apa7_chinese_citation_guide.md`. Below is a quick reference.

**Chinese journal article**:
```
Wang, Da-Ming, & Li, Xiao-Hua (2024). Article title. Journal Name, Volume(Issue), Pages. https://doi.org/xxxxx
```

**Chinese book**:
```
Zhang, San (2023). Book title. Publisher.
```

**Government publication**:
```
Ministry of Education (2024). Publication title. https://url
```

### Mixed Chinese-English Reference Handling

**In-text citations**:
- Chinese uses full-width parentheses: (Author, Year)
- English uses half-width parentheses: (Author, Year)
- Chinese multiple authors use enumeration comma; English uses &

**Reference list ordering**:

| Option | Description | Applicable Scenario |
|------|------|---------|
| **Option A (Recommended)** | Chinese first (ordered by stroke count), English after (ordered alphabetically) | Convention for most Taiwan journals |
| **Option B** | Mixed Chinese-English ordering (unified stroke count / alphabetical) | Some international journals |

**Same author with both Chinese and English works**: List separately — Chinese works go in the Chinese section, English works go in the English section.

### Format Conversion Notes (Chinese Papers)

**Chinese APA → Chicago**:
1. Publication format differs (APA 7 does not require publication location, Chicago does)
2. Change titles to "title case" format
3. Add footnote citation system

**Chinese APA → IEEE**:
1. Add numbered labels [N]
2. Remove year from after author position
3. Order by citation appearance (not stroke count)

**Chinese paper format conventions**:
- Most Taiwan journals use APA
- Humanities disciplines (history, literature) occasionally use Chicago
- Engineering/CS fields mostly use IEEE
- Medical fields use Vancouver

---

## AI-Generated Content Citation (by Format)

| Format | How to Cite AI |
|--------|---------------|
| APA 7th | OpenAI. (2024). ChatGPT (Version 4) [Large language model]. https://chat.openai.com |
| Chicago | OpenAI. ChatGPT. Version 4. 2024. Large language model. https://chat.openai.com. |
| MLA | "ChatGPT response to [prompt description]." OpenAI, 15 Mar. 2024, chat.openai.com. |
| IEEE | [N] OpenAI, "ChatGPT," ver. 4, 2024. [Online]. Available: https://chat.openai.com |
| Vancouver | OpenAI. ChatGPT [Large language model]. 2024. Available from: https://chat.openai.com |

---

## UTD24 IS-track and MS-track Styles

For the Privacy Computing × Finance customization layer. Loaded by `/ars-utd24-full`.

### MIS Quarterly (MISQ) Author-Date

**Discipline**: Information Systems (UTD24)

**In-text**: (Author Year) — no comma; multiple cites separated by semicolons. Example: (Hevner et al. 2004; Gregor and Hevner 2013).

**Journal article**:
```
Hevner, A. R., March, S. T., Park, J., and Ram, S. 2004. "Design Science in Information Systems
    Research," MIS Quarterly (28:1), pp. 75-105.
```

**Conference paper**:
```
Author, A. B. 2024. "Paper Title in Title Case," in Proceedings of the International Conference
    on Information Systems (ICIS), Atlanta, GA.
```

**Book**:
```
Author, A. B. 2024. Book Title in Title Case, City: Publisher.
```

**Key rules**:
- Last-name then comma, first/middle initials with periods.
- Last author preceded by `and` (no `&`).
- Year follows the author block, no parentheses around year in reference list.
- Article titles in **double quotes**, **title case**.
- Journal name **italicized**, **title case**.
- Volume:issue formatted as `(28:1)` after journal, then `pp. 75-105`.
- DOI optional, appended at end with no `https://`.

**Reference-list section title**: References — alphabetical by first author.

---

### INFORMS Author-Date (Management Science / ISR / INFORMS JoC / Operations Research)

**Discipline**: IS, OR, OM (UTD24)

**In-text**: (Author year) — no comma; ranges with en-dash. Example: (Acemoglu and Ozdaglar 2015, Allen and Gale 2000).

**Journal article**:
```
Acemoglu D, Ozdaglar A (2015) Systemic risk and stability in financial networks. Amer. Econ.
    Rev. 105(2):564-608.
```

**INFORMS journals** abbreviated per INFORMS style sheet (e.g., *Management Science* → "Management Sci.", *Information Systems Research* → "Inform. Systems Res.", *Operations Research* → "Oper. Res.").

**Working paper**:
```
Author A, Coauthor B (2024) Paper title in sentence case. Working paper, Institution, City.
```

**Book**:
```
Author A (2024) Book Title in Title Case (Publisher, City).
```

**Key rules**:
- Last name + space + initials (no commas, no periods between initials).
- Year in parentheses immediately after authors.
- Article title in **sentence case**, NO quote marks.
- Journal name **abbreviated**, **italicized** in print but NOT in plain-text drafts.
- Volume(issue):pages with no spaces.
- Up to 3 authors listed; 4+ uses "et al." in text but ALL listed in references.

**Reference-list section title**: References — alphabetical.

---

### UTD24 style routing rule

When `intake_agent` records a target journal, automatically select:

| Target journal | Style |
|---|---|
| MIS Quarterly | MISQ Author-Date (above) |
| Information Systems Research | INFORMS Author-Date |
| Management Science | INFORMS Author-Date |
| INFORMS Journal on Computing | INFORMS Author-Date |
| Operations Research / M&SOM / POM | INFORMS Author-Date |
| Journal of Finance / JFE / RFS | Chicago Author-Date (closest match; check journal's specific guide before submission) |
| Other UTD24 (AMJ / AMR / SMJ / ASQ) | Chicago Author-Date or APA 7 (journal-specific) |

`citation_compliance_agent` and `formatter_agent` consume this routing table when `target_track = utd24` is set in the Material Passport.

---
