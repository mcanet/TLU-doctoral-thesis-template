% TLU Thesis Regulations — safe/cleaned class (2026)
% Updated to match "Tallinn University Guide to Formatting Doctoral Theses" (01.01.2026)
% Safer rework: removed fragile internal @-redefinitions and stray # usages.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tlu-thesis}[2026/02/19 v2.2 Tallinn University thesis class — TNR 10.5pt, cleaned]

\LoadClass[a4paper,oneside]{report}

% ---------- Engine detection & fonts ----------
\RequirePackage{iftex}
\ifPDFTeX
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage{newtxtext}   % Times-like text
  \RequirePackage{newtxmath}
\else
  \RequirePackage{fontspec}
  \setmainfont{Times New Roman}
  \setsansfont{Times New Roman}
  \setmonofont{Courier New}
\fi

% ---------- URL breaking configuration ----------
\RequirePackage{url}
\def\UrlBreaks{\do\/\do-\do_\do.\do=\do?\do\&}
\Urlmuskip=0mu plus 1mu

% ---------- Common packages ----------
\RequirePackage[estonian,english]{babel}
\RequirePackage{geometry}
\RequirePackage{microtype}
\RequirePackage{setspace}
\RequirePackage{tocloft}
\RequirePackage{titling}
\RequirePackage{csquotes}
\RequirePackage[
  backend=biber,
  style=apa,
  natbib=true
]{biblatex}

% Configure URL display per entry type
\ExecuteBibliographyOptions[book]{url=true}
\ExecuteBibliographyOptions[misc]{url=true}
\ExecuteBibliographyOptions[online]{url=true}

\ExecuteBibliographyOptions[article]{url=false}
\ExecuteBibliographyOptions[inproceedings]{url=false}
\ExecuteBibliographyOptions[incollection]{url=false}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
}
\RequirePackage{pdfpages}

% ---------- URL and DOI font size in bibliography ----------
\urlstyle{same}
\renewcommand*{\mkbibacro}[1]{#1}

% ---------- Fix arXiv primaryClass font size ----------
\DeclareFieldFormat{eprint:arxiv}{%
  arXiv\addcolon\space
  \ifhyperref
    {\href{https://arxiv.org/abs/#1}{\nolinkurl{#1}}}
    {\nolinkurl{#1}}%
}
\DeclareFieldFormat{eprintclass}{\mkbibbrackets{#1}}

% ---------- Better line breaking settings ----------
\tolerance=2000
\emergencystretch=10pt
\hyphenpenalty=1000
\exhyphenpenalty=1000
\sloppy
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{graphicx}
\RequirePackage{chngcntr}
\RequirePackage[table]{xcolor}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{epigraph}   % use package-provided interface (avoid redefining internal macros)
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{tikz}
\RequirePackage{tabularx}

\usetikzlibrary{positioning,arrows.meta}

% ---------- Figure and Table caption formatting ----------
\captionsetup[figure]{
  position=below,
  labelfont=bf,
  textfont=normal,
  font=normalsize,
  skip=6pt,
  justification=justified,
  singlelinecheck=false,
  format=plain,
  aboveskip=6pt,
  belowskip=12pt,
  font={stretch=1.15}
}
\captionsetup[table]{
  position=above,
  labelfont=bf,
  textfont=normal,
  font=normalsize,
  skip=6pt
}

% ---------- Epigraph settings (use package interface) ----------
% Keep epigraph width and spacing as requested, but avoid touching internal macros.
\setlength{\epigraphwidth}{0.4\textwidth}
\setlength{\beforeepigraphskip}{1.5\baselineskip}
\setlength{\afterepigraphskip}{1.5\baselineskip}
% If user wants a smaller epigraph font, they can redefine \epigraphsize in the document:
%   \renewcommand{\epigraphsize}{\small}

% ---------- Bibliography formatting ----------
\setlength{\bibhang}{0pt} % Remove hanging indent in bibliography
\renewcommand*{\bibfont}{\fontsize{9.5pt}{11.4pt}\selectfont}

\DeclareBibliographyCategory{inlineonly}
\AtBeginDocument{%
  \providecommand{\fullciteinline}[1]{%
    \addtocategory{inlineonly}{#1}%
    \fullcite{#1}%
  }%
}

% ---------- Page layout (per Guide) ----------
\geometry{
  paperwidth=175mm,
  paperheight=240mm,
  top=23mm,
  inner=25mm,
  bottom=25.4mm,
  outer=25mm
}
\setstretch{1.15}

% ---------- Paragraph spacing ----------
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}

% ---------- Body font size to 10.5pt ----------
\makeatletter
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10.5pt}{12pt}%
  \abovedisplayskip 6pt plus2pt minus2pt%
  \belowdisplayskip 6pt plus2pt minus2pt%
}
\renewcommand\Large{\@setfontsize\Large{14pt}{17pt}}
\makeatother

% ---------- Metadata ----------
\newcommand{\TLUAuthor}{}
\newcommand{\TLUTitleEN}{}
\newcommand{\TLUInstitute}{}
\newcommand{\TLUSupervisors}{}
\newcommand{\TLUOpponents}{}
\newcommand{\TLUDefenseDate}{}
\newcommand{\TLUDefenseTime}{}
\newcommand{\TLUDefensePlace}{}
\newcommand{\TLUFunding}{}
\newcommand{\TLUCopyrightHolder}{}
\newcommand{\TLUCopyrightYear}{\the\year}
\newcommand{\TLUSeriesNumber}{\textbf{X}}

\newcommand{\authorname}[1]{\renewcommand{\TLUAuthor}{#1}}
\newcommand{\titleen}[1]{\renewcommand{\TLUTitleEN}{#1}}
\newcommand{\institute}[1]{\renewcommand{\TLUInstitute}{#1}}
\newcommand{\supervisors}[1]{\renewcommand{\TLUSupervisors}{#1}}
\newcommand{\opponents}[1]{\renewcommand{\TLUOpponents}{#1}}
\newcommand{\defensedate}[1]{\renewcommand{\TLUDefenseDate}{#1}}
\newcommand{\defensetime}[1]{\renewcommand{\TLUDefenseTime}{#1}}
\newcommand{\defenseplace}[1]{\renewcommand{\TLUDefensePlace}{#1}}
\newcommand{\funding}[1]{\renewcommand{\TLUFunding}{#1}}
\newcommand{\copyrightholder}[1]{\renewcommand{\TLUCopyrightHolder}{#1}}
\newcommand{\seriesnumber}[1]{\renewcommand{\TLUSeriesNumber}{#1}}
\newcommand{\eclogo}[1]{\renewcommand{\ECLogoFile}{#1}}

% ---------- Logo ----------
\newcommand{\TLULogoFile}{TLU-logo-eng.pdf}
\newcommand{\ECLogoFile}{logo-ce-horizontal-en-quadri.pdf}
\newcommand{\TLUIncludeLogo}{%
  \IfFileExists{\TLULogoFile}{%
    \begin{center}\includegraphics[width=40mm]{\TLULogoFile}\end{center}\vspace{8mm}
  }{}%
}

% ---------- Table of Contents title ----------
\renewcommand{\contentsname}{CONTENTS}
\AtBeginDocument{%
  \addto\captionsenglish{\renewcommand{\contentsname}{CONTENTS}}%
  \addto\captionsestonian{\renewcommand{\contentsname}{CONTENTS}}%
}

% ---------- TOC spacing configuration ----------
\setlength{\cftbeforechapskip}{2pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\renewcommand{\cfttoctitlefont}{\bfseries\fontsize{14pt}{16pt}\selectfont}
\setlength{\cftbeforetoctitleskip}{-1.5\baselineskip}
\setlength{\cftaftertoctitleskip}{12pt}

% ---------- Pre-title page ----------
\newcommand{\TLUPreTitlePage}{%
  \thispagestyle{empty}
  \begin{center}
    \vspace*{30mm}
    {\Large TALLINNA ÜLIKOOL \par}
    \vspace{4mm}
    {\large HUMANITAARTEADUSTE DISSERTATSIOONID \par}
    \vspace{10mm}
    {\Large TALLINN UNIVERSITY \par}
    \vspace{4mm}
    {\large DISSERTATIONS ON HUMANITIES \par}
    \vspace{14mm}
    {\Huge\bfseries \TLUSeriesNumber\par}
    \vspace{10mm}
    \TLUIncludeLogo
  \end{center}
  \clearpage
}

% ---------- Title page ----------
\newcommand{\TLUTitlePage}{%
  \thispagestyle{empty}
  \begin{center}
    \vspace*{25mm}
    {\Large \TLUAuthor\par}
    \vspace{18mm}
    {\bfseries\Large \TLUTitleEN\par}
    \vfill
    {\large Tallinn \TLUCopyrightYear}
  \end{center}
  \clearpage
}

% ---------- Reverse title page ----------
\newcommand{\TLUReverseTitlePage}{%
  \thispagestyle{empty}
  {\fontsize{9.5pt}{11.4pt}\selectfont
  \begin{flushleft}
    TALLINNA ÜLIKOOL\\
    HUMANITAARTEADUSTE DISSERTATSIOONID\\[4mm]
    TALLINN UNIVERSITY\\
    DISSERTATIONS ON HUMANITIES\\[8mm]
    \TLUSeriesNumber\\[12mm]
    \TLUAuthor\\[3mm]
    \textbf{\TLUTitleEN}\\[10mm]
    \TLUInstitute\\[10mm]
    Supervisors: \TLUSupervisors\\[2mm]
    Opponents: \TLUOpponents\\[10mm]
    Accepted for defence: \TLUDefenseDate\\
    Defence: \TLUDefenseTime, \TLUDefensePlace\\[8mm]
    \TLUFunding\\[3mm]
    \IfFileExists{\ECLogoFile}{%
      \includegraphics[height=15mm]{\ECLogoFile}\\[8mm]
    }{}%
    © \TLUCopyrightHolder, \TLUCopyrightYear\\
    © Tallinn University, \TLUCopyrightYear
  \end{flushleft}
  }
  \clearpage
}

% ---------- Section numbering & formatting ----------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\renewcommand\thechapter{\arabic{chapter}}
\renewcommand\thesection{\thechapter.\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}

% ---------- Heading formatting ----------
\titleformat{\chapter}[block]
  {\normalfont\fontsize{14pt}{17pt}\selectfont\bfseries}{\thechapter.}{0.5em}{\MakeUppercase}
\titlespacing*{\chapter}{0pt}{0pt}{12pt}

% Unnumbered top-level headings (TOC entry without number, displayed in ALL CAPS)
\newcommand{\TLUunnumberedchapter}[1]{%
  \cleardoublepage
  \chapter*{\MakeUppercase{#1}}%
  \addcontentsline{toc}{chapter}{#1}%
  \markboth{#1}{#1}%
}

% Section / subsection displayed in ALL CAPS, but TOC preserved by using optional argument
\titleformat{\section}
  {\normalfont\fontsize{10.5pt}{13pt}\selectfont\bfseries}{\thesection}{1em}{\MakeUppercase}
\titlespacing*{\section}{0pt}{24pt}{6pt}

\titleformat{\subsection}
  {\normalfont\fontsize{10.5pt}{13pt}\selectfont\bfseries}{\thesubsection}{1em}{\MakeUppercase}
\titlespacing*{\subsection}{0pt}{24pt}{6pt}

\titleformat{\subsubsection}
  {\normalfont\fontsize{10.5pt}{13pt}\selectfont\bfseries}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0pt}{12pt}{6pt}

\titleformat{\paragraph}
  {\normalfont\fontsize{10.5pt}{13pt}\selectfont\bfseries\itshape}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0pt}{12pt}{6pt}

% ---------- Pagination ----------
\renewcommand{\headrulewidth}{0pt}
\newcommand{\frontmatter}{\pagenumbering{roman}\pagestyle{empty}}
\newcommand{\mainmatter}{\clearpage\pagenumbering{arabic}\pagestyle{fancy}\fancyhf{}\fancyfoot[C]{\thepage}}

% ---------- Build front pages ----------
\newcommand{\TLUFrontPages}{%
  \TLUPreTitlePage
  \TLUTitlePage
  \TLUReverseTitlePage
  \frontmatter
  \tableofcontents
  \clearpage
}

% ---------- CV environments ----------
\newenvironment{TLUEstonianCV}{%
  \clearpage
  \TLUunnumberedchapter{CURRICULUM VITAE}%
  \begin{tabular}{@{}p{5cm}p{10cm}@{}}
}{%
  \end{tabular}
}

\newenvironment{TLUEnglishCV}{%
  \begin{tabular}{@{}p{5cm}p{10cm}@{}}
}{%
  \end{tabular}
}

\newcommand{\TLUCVRow}[2]{\textit{#1} & #2 \\[2mm]}
\newcommand{\TLUCVHeading}[1]{\vspace{4mm}\noindent\textbf{#1}\\[2mm]}

% ---------- Helpers for publications list ----------
\newcommand{\TLUListOfPublications}{%
  \cleardoublepage
  \TLUunnumberedchapter{LIST OF PUBLICATIONS}
}

\newcommand{\TLUPublicationsSection}{%
  \cleardoublepage
  \TLUunnumberedchapter{PUBLICATIONS}
}

% ---------- Notes for users ----------
% - Use \TLUunnumberedchapter{INTRODUCTION}, \TLUunnumberedchapter{CONCLUSION}, etc.
%   for the components the Guide requires to be unnumbered and displayed ALL CAPS.
% - Use \chapter{...} for chapters you want numbered (e.g. Studies).
% - To make section shown uppercase but have normal TOC entry, call:
%     \section[Title in TOC]{Title to Display}
%   (the optional argument is what will go to the TOC).
% - If you need different epigraph sizing, redefine \epigraphsize in your document preamble:
%     \renewcommand{\epigraphsize}{\small}

% End of cleaned class
