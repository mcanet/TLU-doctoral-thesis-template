# Tallinn University Doctoral Thesis LaTeX Template (Unofficial)

**Author:** Mar Canet Sola (mar.canet@gmail.com)

This is an unofficial LaTeX template for doctoral theses at Tallinn University. The template follows the official formatting regulations and guidelines provided by Tallinn University.

## Official Guidelines

This template is based on the official Tallinn University guidelines for formatting a doctoral thesis, which can be found here:  
[https://www.tlu.ee/en/phd-students#regulations-and-documents--guidelines-for-formatting-a-doctoral-thesis](https://www.tlu.ee/en/phd-students#regulations-and-documents--guidelines-for-formatting-a-doctoral-thesis)

You can use this template in Overleaf: https://www.overleaf.com/4281267886ynhkvfthvgmv#b676ce

## Features

- **Font:** Times New Roman, 10.5pt body text
- **Line spacing:** 1.15
- **Page layout:** 175 x 240 mm paper with margins (top: 23mm, bottom: 25.4mm, inner: 25mm, outer: 25mm)
- **Front pages:** Pre-title page, title page, and reverse title page with metadata
- **Table of Contents:** Automatically generated
- **Bibliography:** BibLaTeX with APA 7th edition style
- **Sections:** Numbered sections that start on new pages
- **CV sections:** Estonian and English curriculum vitae templates included

## Requirements

### LaTeX Distribution

You need a LaTeX distribution installed on your system:

- **macOS:** [MacTeX](https://www.tug.org/mactex/) (full) or [BasicTeX](https://www.tug.org/mactex/morepackages.html) (minimal)
- **Windows:** [MiKTeX](https://miktex.org/) or [TeX Live](https://www.tug.org/texlive/)
- **Linux:** [TeX Live](https://www.tug.org/texlive/)

### Required Packages

The template uses the following LaTeX packages (most are included in standard distributions):
- `fontspec` (for XeLaTeX/LuaLaTeX)
- `babel` (English and Estonian language support)
- `geometry` (page layout)
- `setspace` (line spacing)
- `biblatex` and `biber` (bibliography management)
- `biblatex-apa` (APA 7th edition citation style)
- `hyperref` (hyperlinks and PDF metadata)
- `titlesec` (section formatting)
- `fancyhdr` (headers and footers)
- `graphicx` (logo inclusion)
- Other standard packages

## Files Structure

```
template_latex_tlu/
├── main.tex              # Main document file
├── tlu-thesis.cls        # Document class with TLU formatting
├── references.bib        # Bibliography database (BibTeX format)
├── TLÜ-üldlogo-eng.pdf   # Tallinn University logo
├── latexmkrc             # Configuration for latexmk (Overleaf)
└── README.md             # This file
```

## Getting Started

### 1. Fill in Metadata

Edit `main.tex` and fill in your thesis information:

```latex
\authorname{Your Name}
\titleen{Your Thesis Title}
\institute{Your Institute, Tallinn University, Tallinn, Estonia}
\seriesnumber{XX}
\supervisors{Prof. Name (University), Dr. Name (University)}
\opponents{Prof. Name (University), Dr. Name (University)}
\defensedate{Month Day, Year}
\defensetime{HH:MM}
\defenseplace{Location details}
\funding{Funding information}
\copyrightholder{Your Name}
```

### 2. Add Your Bibliography

Add your references to `references.bib` in BibTeX format:

```bibtex
@article{author2020title,
  title={Article Title},
  author={Author, First and Author, Second},
  journal={Journal Name},
  volume={1},
  number={1},
  pages={1--10},
  year={2020}
}
```

### 3. Write Your Content

Edit the sections in `main.tex`:
- List of Publications
- Abstract (optional)
- Preface (optional)
- Acknowledgements (optional)
- List of Abbreviations (optional)
- Introduction
- Chapters
- Conclusion
- References (automatically generated)
- Appendixes
- CV (Estonian and English)

### 4. Cite References

Use citation commands in your text:
- `\parencite{key}` for parenthetical citations: (Author, Year)
- `\textcite{key}` for textual citations: Author (Year)
- `\fullcite{key}` for full bibliography entries (used in List of Publications)

## Compilation

### Using Command Line

The recommended compilation sequence is:

```bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

Example:

```bash                 
xelatex -interaction=nonstopmode main.tex && biber main && xelatex -interaction=nonstopmode main.tex
```

**Note:** XeLaTeX is recommended for proper Times New Roman font support. You can also use LuaLaTeX.

### Using latexmk (recommended)

```bash
latexmk -xelatex main.tex
```
or

```bash
pdflatex -interaction=nonstopmode main.tex
```

## Template Structure

### Front Matter
1. Pre-title page (with series number and logo)
2. Title page (author, title, year)
3. Reverse title page (metadata, copyright)
4. Table of Contents
5. List of Publications (page 1)
6. Optional sections (Abstract, Preface, Acknowledgements, Abbreviations)

### Main Content
- Sections are numbered (1, 2, 3, etc.)
- Each section starts on a new page
- Subsections and subsubsections are supported

### Back Matter
- References (automatically generated from citations)
- Appendixes
- Curriculum Vitae (Estonian and English versions)

## Customization

### Changing Copyright Year

By default, the copyright year is set to the current year. To change it manually:

```latex
\renewcommand{\TLUCopyrightYear}{2013}
```

### Modifying Fonts

The template uses Times New Roman (10.5pt) as specified in TLU guidelines. To modify font sizes, edit `tlu-thesis.cls`.

### Adjusting Page Layout

Default margins are:
- Left: 30mm
- Right: 25mm
- Top: 25mm
- Bottom: 25mm

To change margins, edit the `\geometry{}` command in `tlu-thesis.cls`.

## Bibliography Style

The template uses **APA 7th edition** citation style, which is implemented through the `biblatex-apa` package. References are formatted automatically with:
- No hanging indentation
- Proper author-date format
- DOI and URL support

## Troubleshooting

### Missing Fonts
If you get font errors with XeLaTeX, ensure Times New Roman is installed on your system:
- **macOS:** Comes pre-installed
- **Windows:** Comes pre-installed
- **Linux:** Install `ttf-mscorefonts-installer` package

### Bibliography Not Showing
Make sure to:
1. Run `xelatex` first
2. Run `biber main`
3. Run `xelatex` twice more

### Logo Not Found
Ensure `TLÜ-üldlogo-eng.pdf` is in the same directory as `main.tex`.

## Support and Contributions

This is an unofficial template. For official support, please refer to:
- [Tallinn University PhD Students Page](https://www.tlu.ee/en/phd-students)
- Official formatting guidelines (linked above)

For issues or improvements to this template, contact: mar.canet@gmail.com

## License

MIT License

Copyright (c) 2025 Mar Canet Sola

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

**Note:** This template is provided as-is for use by Tallinn University doctoral students. Please ensure compliance with official TLU guidelines when submitting your thesis.

## Acknowledgments

Based on the official Tallinn University doctoral thesis formatting requirements.

---

**Last Updated:** October 30, 2025  
**Template Version:** 2.0  
**Compatible with:** XeLaTeX, LuaLaTeX
