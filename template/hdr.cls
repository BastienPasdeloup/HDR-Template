%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% INFORMATION %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This is the template I made for my HDR, feel free to adapt it for yours or your PhD
% Normally, you do not need to edit this file

% Three kinds of documents, each of them in French or in English:
% - \documentclass[hdr, english]{template/hdr}        the HDR manuscript itself
% - \documentclass[hdr_demand, french]{template/hdr}  the shorter document that comes with it
% - \documentclass[phd, english]{template/hdr}        a PhD manuscript
% "hdr_demand" is the short variant: tighter spacing, a running head reduced to the
% page number, no blank page added to start chapters on the right, no back cover,
% and a bibliography reduced to the publications of the author
% The template ships three complete examples, one per kind: "main_hdr.tex",
% "main_demand.tex" and "main_phd.tex"

% The author describes the document through the commands of the OPTIONS section
% below (\setAuthorName, \setDocumentTitle, \addReviewer, \addLogo, ...), and the
% class expects these files around it:
% - "bibliography.bib"      the references, own publications and cited works alike
% - "template/hdr.dbx"      the custom Biblatex fields that "bibliography.bib" uses
% - "acronyms.tex"          the acronyms, shown as tooltips and in a list at the end
% - "template/includes/"    front cover, back cover, and chapter page background
% - ".latexmkrc"            build rules, including the makeglossaries pass that
%                           latexmk does not know about by default

% Important remarks:
% - It is not possible to use parts, please start with chapters
% - Sectioning commands take a label as their first argument, and it is recalled
%   with \nameref: \chapter[context]{Context} ... \nameref{context}
% - Check "bibliography.bib" and "acronyms.tex" to see how they work
% - Compile with LuaLaTeX: latexmk -lualatex -outdir=build main_hdr.tex

% Contact: bastien.pasdeloup@imt-atlantique.fr

% Copyright (C) 2025-2026 Bastien Pasdeloup
% This template is free software: you can redistribute it and/or modify it under the terms
% of the GNU General Public License as published by the Free Software Foundation, either
% version 3 of the License, or (at your option) any later version.
% It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
% even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
% See the GNU General Public License (file "LICENSE") for more details.
% The license covers the template itself, not the manuscript you write with it.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% HEADERS %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define template
\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{template/hdr}[2025/03/31 HDR Template]%
\LoadClass[a4paper, 11pt, twoside]{book}%

% Ignore non-harmful warnings
\RequirePackage{silence}%
\WarningFilter{tracklang}{No `datatool' support for dialect `french'}%
\WarningFilter{marginnote}{Consecutive odd pages found}%
\WarningFilter{glossaries}{No \printglossary or \printglossaries found}%
\WarningFilter{latex}{Command \showhyphens has changed}%
\WarningFilter{microtype}{Unknown slot number of character}%
\hbadness=10000%
\vbadness=10000%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% OPTIONS %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Short/long & doc type
\DeclareOption{hdr_demand}{%
    \newif\ifshortdoc \shortdoctrue%
    \newif\ifhdr \hdrtrue}%
\DeclareOption{hdr}{%
    \newif\ifshortdoc \shortdocfalse%
    \newif\ifhdr \hdrtrue}%
\DeclareOption{phd}{%
    \newif\ifshortdoc \shortdocfalse%
    \newif\ifhdr \hdrfalse}%

% French/English
\def\doc@language{english}
\DeclareOption{french}{%
    \def\doc@language{french}%
    \PassOptionsToPackage{french}{babel}}%
\DeclareOption{english}{%
    \def\doc@language{english}%
    \PassOptionsToPackage{english}{babel}}%
\ProcessOptions\relax%
\RequirePackage{babel}%
\selectlanguage{\doc@language}%

% Short/long specific
\ifshortdoc%
    \newcommand{\cstPageInnerMargin}{2cm}%
    \newcommand{\cstParagraphSpacing}{4pt}%
    \newcommand{\cstItemizeSpacing}{2pt}%
    \newcommand{\cstBiblioEntriesSpacing}{6pt}%
    \newcommand{\cstBiblioFirstColWidth}{0.335\textwidth}%
    \newcommand{\cstBiblioLastColWidth}{0.655\textwidth}%
\else%
    \newcommand{\cstPageInnerMargin}{3cm}%
    \newcommand{\cstParagraphSpacing}{8pt}%
    \newcommand{\cstItemizeSpacing}{4pt}%
    \newcommand{\cstBiblioEntriesSpacing}{10pt}%
    \newcommand{\cstBiblioFirstColWidth}{0.36\textwidth}%
    \newcommand{\cstBiblioLastColWidth}{0.63\textwidth}%
\fi%

% Language specific
% Also check for dates formating command
\iflanguage{french}{%
    \newcommand{\cstHDR}{Habilitation à Diriger des Recherches}%
    \newcommand{\cstThesis}{Thèse de Doctorat}%
    \newcommand{\cstRequiredBy}{Demandée par :}%
    \newcommand{\cstPresentedBy}{Présentée par :}%
    \newcommand{\cstPubliclyDefended}{Soutenue publiquement le}%
    \newcommand{\cstInFrontOf}{devant le jury composé de :}%
    \newcommand{\cstReviewers}{Rapporteurs}%
    \newcommand{\cstExaminers}{Examinateurs}%
    \newcommand{\cstChapter}{Chapitre}%
    \newcommand{\cstSection}{Section}%
    \newcommand{\cstAppendix}{Annexe}%
    \newcommand{\cstAppendices}{Annexes}%
    \newcommand{\cstFigure}{Figure}%
    \newcommand{\cstTable}{Table}%
    \newcommand{\cstEquation}{Équation}%
    \newcommand{\cstBox}{Boîte}%
    \newcommand{\cstProofOf}{Preuve de}%
    \newcommand{\cstProof}{Preuve}%
    \newcommand{\cstTOC}{Sommaire}%
    \newcommand{\cstBibliography}{Bibliographie}%
    \newcommand{\cstGlossary}{Acronymes}%
    \newcommand{\cstRefsAuthor}{Références auxquelles j'ai contribué}%
    \newcommand{\cstRefsOthers}{Autres références citées dans ce document}%
    \newcommand{\cstRefsURLs}{Ressources en ligne citées dans ce document}%
    \newcommand{\cstRefsList}{Liste des publications}%
}{}%
\iflanguage{english}{%
    \newcommand{\cstHDR}{Habilitation to Supervise Research}%
    \newcommand{\cstThesis}{Doctoral Thesis}%
    \newcommand{\cstRequiredBy}{Required by:}%
    \newcommand{\cstPresentedBy}{Presented by:}%
    \newcommand{\cstPubliclyDefended}{Defended publicly on}%
    \newcommand{\cstInFrontOf}{before the jury composed of:}%
    \newcommand{\cstReviewers}{Reviewers}%
    \newcommand{\cstExaminers}{Examiners}%
    \newcommand{\cstChapter}{Chapter}%
    \newcommand{\cstSection}{Section}%
    \newcommand{\cstAppendix}{Appendix}%
    \newcommand{\cstAppendices}{Appendices}%
    \newcommand{\cstFigure}{Figure}%
    \newcommand{\cstTable}{Table}%
    \newcommand{\cstEquation}{Equation}%
    \newcommand{\cstBox}{Box}%
    \newcommand{\cstProofOf}{Proof of}%
    \newcommand{\cstProof}{Proof}%
    \newcommand{\cstTOC}{Table of Contents}%
    \newcommand{\cstBibliography}{Bibliography}%
    \newcommand{\cstGlossary}{Acronyms}%
    \newcommand{\cstRefsAuthor}{References I Contributed To}%
    \newcommand{\cstRefsOthers}{Other References Cited in this Document}%
    \newcommand{\cstRefsURLs}{Online Resources Cited in this Document}%
    \newcommand{\cstRefsList}{List of Publications}%
}{}%

% Constants to set by the author for front/back pages
\newcommand{\authorFirstName}{}%
\newcommand{\authorName}{}%
\newcommand{\university}{}%
\newcommand{\doctoralSchool}{}%
\newcommand{\doctoralSchoolSubtitle}{}%
\newcommand{\defenseDate}{}%
\newcommand{\documentTitle}{}%
\newcommand{\testimony}{}%
\newcommand{\signature}{}%
\newcommand{\logos}{}%
\newcommand{\reviewers}{}%
\newcommand{\examiners}{}%
\newcommand{\jury}{}%
\newcommand{\QRCodeLink}{}%
\newcommand{\backText}{}%

% Commands to set them
\newcommand{\setAuthorFirstName}[1]{\renewcommand{\authorFirstName}{#1}}%
\newcommand{\setAuthorName}[1]{\renewcommand{\authorName}{#1}}%
\newcommand{\setUniversity}[1]{\renewcommand{\university}{#1}}%
\newcommand{\setDoctoralSchool}[1]{\renewcommand{\doctoralSchool}{#1}}%
\newcommand{\setDoctoralSchoolSubtitle}[1]{\renewcommand{\doctoralSchoolSubtitle}{\\[0.1cm]#1}}%
\newcommand{\setDefenseDate}[1]{\renewcommand{\defenseDate}{\date{#1}}}%
\newcommand{\setDocumentTitle}[1]{\renewcommand{\documentTitle}{#1}}%
\newcommand{\setTestimony}[1]{\renewcommand{\testimony}{#1}}%
\newcommand{\setSignature}[1]{\renewcommand{\signature}{#1}}%
\newcommand{\addLogo}[2]{\iffirstlogo\firstlogofalse\else\appto{\logos}{\hfill}\fi\appto{\logos}{\href{#2}{\includegraphics{#1}}}}%
\newcommand{\addReviewer}[4]{\appto{\reviewers}{\textbf{#1~\textsc{#2}}, #3\newline#4\\[0.2cm]}}%
\newcommand{\addExaminer}[4]{\appto{\examiners}{\textbf{#1~\textsc{#2}}, #3\newline#4\\[0.2cm]}}%
\newcommand{\addJuryMember}[5]{\appto{\jury}{\textbf{#1~\textsc{#2}}, #3 (#5)\newline#4\\[0.2cm]}}%
\newcommand{\setQRCodeLink}[1]{\renewcommand{\QRCodeLink}{#1}}%
\newcommand{\setBackText}[1]{\renewcommand{\backText}{#1}}%

% Additional commands for customization
% Also use \addBiblioCategory{code}{Letter}{Title} defined later in this document
\newcommand{\removeExternalRefsFromBib}{\IncludeExternalRefsInBibfalse}%
\newcommand{\removeURLsFromBib}{\IncludeURLsInBibfalse}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% GLOBAL STUFF %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Page shape
\RequirePackage[a4paper, inner=\cstPageInnerMargin, outer=2cm, top=3cm, bottom=2cm, headheight=1cm, headsep=1cm]{geometry}%

% Font & special characters
\RequirePackage{ebgaramond}%
\RequirePackage{eso-pic}%
\RequirePackage{fontawesome5}%
\RequirePackage{amssymb}%
\RequirePackage{fontspec}%
\RequirePackage{twemojis}%
\RequirePackage{transparent}%
\newcommand{\frflag}[1][1.5]{\raisebox{-0.17em}{\scalebox{#1}{\twemoji{flag: France}}}}
\newcommand{\ukflag}[1][1.5]{\raisebox{-0.17em}{\scalebox{#1}{\twemoji{flag: United Kingdom}}}}

% Math
\RequirePackage{amsmath}%
\RequirePackage{xfp}%
\RequirePackage{bm}%

% Figures
\RequirePackage{pgfplots}%
\RequirePackage{float}%
\RequirePackage{subcaption}%
\RequirePackage[export]{adjustbox}%
\floatplacement{figure}{!htbp}%
\floatplacement{table}{!htbp}%
\pgfplotsset{compat=1.18}%
\RequirePackage{tikz}%
\usetikzlibrary{calc, backgrounds, matrix}%
\RequirePackage{ocgx2}%

% Boxes
\setlength{\fboxrule}{0.5pt}%
\setlength{\fboxsep}{0pt}%
\let\oldfbox\fbox%
\renewcommand{\fbox}[1]{\oldfbox{\makebox[\dimexpr\width-1pt\relax][l]{#1}}}%

% Spacing
\RequirePackage{enumitem}%
\RequirePackage{titlesec}%
\setlength{\parindent}{0pt}%
\setlength{\parskip}{\cstParagraphSpacing}%
\renewcommand{\arraystretch}{1.3}%
\setlist{itemsep=\cstItemizeSpacing, before=\vspace{-\cstParagraphSpacing}, after=\vspace{\dimexpr\cstItemizeSpacing-\cstParagraphSpacing\relax}, topsep=\cstItemizeSpacing, parsep=0pt, partopsep=0pt, left=0pt}%
\setlist[itemize]{label=•}%
\raggedbottom%
\titlespacing*{\paragraph}{\parindent}{\parskip}{\parskip}%

% QR codes
% The lowest error-correction level keeps the number of modules as low as it can
% be, which is what matters for the long URLs of the online resources: printed at
% the size they are here, a denser code becomes hard to scan. Nothing is lost on
% the short ones, as the package raises the level again whenever the version it
% settles on has room to spare
\usepackage{qrcode}%
\qrset{level=L}%

% Stay adjusted
\RequirePackage{microtype}%
\RequirePackage{ragged2e}%
\sloppy%

% Arrays
\RequirePackage{tabularx}

% Colors used in the template
\RequirePackage[table]{xcolor}%
\definecolor{missingColor}{HTML}{dddddd}%
\definecolor{titlesColor}{HTML}{00b9df}%
\definecolor{linksColor}{HTML}{003474}%
\definecolor{separatorColor}{HTML}{dddddd}%
\definecolor{titleBoxColor}{HTML}{f5f5f5}%
\definecolor{boxEnvColor}{HTML}{f5f5f5}%

% Titles style
\RequirePackage{caption}%
\RequirePackage[normalem]{ulem}%
\RequirePackage{dashundergaps}%
\newcommand{\ulinesection}[1]{}%
\newcommand{\dashulinesection}[1]{\dashuline{\thesubsection\quad#1}}%
\newcommand{\dotulinesection}[1]{\dotuline{\thesubsubsection\quad#1}}%
\titleformat{\section}{\normalfont\Large\bfseries\color{titlesColor}\hypersetup{linkcolor=titlesColor}}{\uline{\thesection\quad}}{0pt}{\uline}%
\titleformat{\subsection}{\normalfont\large\bfseries\color{titlesColor}\hypersetup{linkcolor=titlesColor}}{\dashuline{\thesubsection\quad}}{0pt}{\dashuline}%
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries\color{titlesColor}\hypersetup{linkcolor=titlesColor}}{\dotuline{\thesubsubsection\quad}}{0pt}{\dotuline}%
\titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries\color{titlesColor}\hypersetup{linkcolor=titlesColor}}{\theparagraph}{1em}{}%
\captionsetup[figure]{labelsep=quad, name={Figure}, singlelinecheck=true, labelfont={color=titlesColor}, format=hang, justification=justified}%
\captionsetup[subfigure]{labelsep=quad, singlelinecheck=true, labelfont={color=titlesColor}, format=hang, justification=justified}%
\captionsetup[table]{labelsep=quad, name={Table}, singlelinecheck=true, labelfont={color=titlesColor}, format=hang, justification=justified}%
\renewcommand{\tagform@}[1]{\maketag@@@{\color{titlesColor}(\ignorespaces#1\unskip\@@italiccorr)}}%

% Dates format
\RequirePackage[en-US, french]{datetime2}%
\iflanguage{english}{%
    \newcommand{\mkenglishordinal}[1]{%
        \number#1\textsuperscript{%
            \ifcase#1\or st\or nd\or rd\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or th\or st\or nd\or rd\or th\or th\or th\or th\or th\or th\or th\or st\fi}}%
    \DTMnewdatestyle{englishtoday}{%
        \renewcommand{\DTMdisplaydate}[4]{%
            \DTMenglishmonthname{##2}~\mkenglishordinal{##3},~##1}%
        \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}}%
    \DTMsetdatestyle{englishtoday}%
    \addto\extrasenglish{\DTMsetdatestyle{englishtoday}}%
}{}%
\iflanguage{french}{%
    \newcommand{\mkfrenchordinal}[1]{%
        \number#1\ifnum#1=1\relax\textsuperscript{er}\fi}%
    \DTMnewdatestyle{frenchtoday}{%
        \renewcommand{\DTMdisplaydate}[4]{%
            \mkfrenchordinal{##3}~\DTMfrenchmonthname{##2}~##1}%
        \renewcommand{\DTMDisplaydate}{\DTMdisplaydate}}%
    \DTMsetdatestyle{frenchtoday}%
    \addto\extrasfrench{\DTMsetdatestyle{frenchtoday}}%
}{}%
\renewcommand{\date}[1]{%
    \StrCut{#1}{-}\yearpart\tempmonthday%
    \StrCut{\tempmonthday}{-}\monthpart\daypart%
    \DTMdisplaydate{\yearpart}{\monthpart}{\daypart}{-1}%
}%

% Add a space after dots
\let\olddots\dots%
\renewcommand{\dots}{\olddots\space}%

% For spacing paragraphs in itemizes & minipages
% Spacing correction is made at the end of this file (creates errors otherwise)
\RequirePackage{etoolbox}%
\newlength{\valitemskip}%
\setlength{\valitemskip}{\cstItemizeSpacing}%
\newlength{\valparskip}%
\setlength{\valparskip}{\parskip}%

% Correct width issues with tikzpictures
\RequirePackage{adjustbox}%
\let\oldtikzpicture\tikzpicture%
\let\endoldtikzpicture\endtikzpicture%
\renewenvironment{tikzpicture}[1][]%
{%
    \begin{adjustbox}{max width=\linewidth}%
    \oldtikzpicture[#1]%
}{%
    \endoldtikzpicture%
    \end{adjustbox}%
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% TABLE OF CONTENTS %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prepare mini-TOC
\RequirePackage{minitoc}%
\dominitoc%

% Depth of numbering/TOC/mini-TOC
\setcounter{secnumdepth}{3}%
\setcounter{tocdepth}{2}%
\setcounter{minitocdepth}{3}%

% Set counter to avoid putting a margin above first chapter
\newcounter{tocchapterpartcounter}%
\newif\ifinmaintoc%
\inmaintoctrue%

% Various values for appearance
\newcommand{\margindotfill}{\hspace{0.5cm}\dotfill\hspace{0.5cm}}%
\newcommand\tocEntrySpacing{3}%
\newcommand\minitocEntrySpacing{4}%

% Parts are formatted as chapters in the table of contents
% Unnumbered chapters are in fact added to it as parts (see the chapter pages
% further down), because adding them as chapters makes minitoc lose track of the
% mini-tables of contents
\renewcommand*\l@part[2]{%
    \ifnum \c@tocdepth > -1\relax%
        \stepcounter{tocchapterpartcounter}%
        \ifnum\thetocchapterpartcounter>1%
            \vspace{1em}%
        \fi%
            {\iftocinappendix%
                    % In appendices, chapters appear as sections
                    \vspace{-1.3em}%
                    \setlength\@tempdima{\tocEntrySpacing em}%
                    \hspace*{\tocEntrySpacing em}%
                    \small%
                \else%
                    % Formatting in TOC
                    \setlength\@tempdima{\tocEntrySpacing em}%
                    \normalsize%
                    \bfseries%
                \fi%
                #1\margindotfill#2\par}%
    \fi}%

% Format chapters
\renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne%
        \stepcounter{tocchapterpartcounter}%
        \ifnum\thetocchapterpartcounter>1%
            \vspace{1em}%
        \fi%
            {\iftocinappendix%
                    % In appendices, chapters appear as sections
                    \vspace{-1.3em}%
                    \setlength\@tempdima{\tocEntrySpacing em}%
                    \hspace*{\tocEntrySpacing em}%
                    \small%
                \else%
                    % Formatting in TOC
                    \setlength\@tempdima{\tocEntrySpacing em}%
                    \normalsize%
                    \bfseries%
                \fi%
                #1\margindotfill#2\par}%
    \fi}%

% Format sections
\renewcommand*\l@section[2]{%
    \ifnum \c@tocdepth >\z@%
        {\iftocinappendix%
                \ifinmaintoc%
                    % In appendices, sections appear as subsections
                    \vspace{-0.3em}%
                    \setlength\@tempdima{\tocEntrySpacing em}%
                    \hspace*{\the\numexpr2*\tocEntrySpacing\relax em}%
                    \footnotesize%
                \else%
                    % Formatting in mini-TOC
                    \setlength\@tempdima{\minitocEntrySpacing em}%
                    \normalsize%
                \fi%
            \else%
                \ifinmaintoc%
                    % Formatting in TOC
                    \vspace{-0.3em}%
                    \setlength\@tempdima{\tocEntrySpacing em}%
                    \hspace*{\tocEntrySpacing em}%
                    \small%
                \else%
                    % Formatting in mini-TOC
                    \setlength\@tempdima{\minitocEntrySpacing em}%
                    \normalsize%
                \fi%
            \fi%
            #1\margindotfill#2\par}%
    \fi}%

% Format subsections
\renewcommand*\l@subsection[2]{%
    \ifnum \c@tocdepth >1%
            {\iftocinappendix%
                    \ifinmaintoc%
                        % In appendices, subsections appear as subsubsections
                        \vspace{-0.3em}%
                        \setlength\@tempdima{\tocEntrySpacing em}%
                        \hspace*{\the\numexpr3*\tocEntrySpacing\relax em}%
                        \scriptsize%
                    \else%
                        % Formatting in mini-TOC
                        \vspace{-0.2em}%
                        \setlength\@tempdima{\minitocEntrySpacing em}%
                        \hspace*{\minitocEntrySpacing em}%
                        \small%
                    \fi%
                \else%
                    \ifinmaintoc%
                        % Formatting in TOC
                        \vspace{-0.3em}%
                        \setlength\@tempdima{\tocEntrySpacing em}%
                        \hspace*{\the\numexpr2*\tocEntrySpacing\relax em}%
                        \footnotesize%
                    \else%
                        % Formatting in mini-TOC
                        \vspace{-0.2em}%
                        \setlength\@tempdima{\minitocEntrySpacing em}%
                        \hspace*{\minitocEntrySpacing em}%
                        \small%
                    \fi%
                \fi%
                #1\margindotfill#2\par}%
    \fi}%

% Format subsubsections
\renewcommand*\l@subsubsection[2]{%
    \ifnum \c@tocdepth >2%
            {\iftocinappendix%
                    \ifinmaintoc%
                        % In appendices, subsubsections appear as subsubsubsections
                        \vspace{-0.3em}%
                        \setlength\@tempdima{\tocEntrySpacing em}%
                        \hspace*{\the\numexpr4*\tocEntrySpacing\relax em}%
                        \tiny%
                    \else%
                        % Formatting in mini-TOC
                        \vspace{-0.2em}%
                        \setlength\@tempdima{\minitocEntrySpacing em}%
                        \hspace*{\the\numexpr2*\minitocEntrySpacing\relax em}%
                        \footnotesize%
                    \fi%
                \else%
                    \ifinmaintoc%
                        % Formatting in TOC
                        \vspace{-0.3em}%
                        \setlength\@tempdima{\tocEntrySpacing em}%
                        \hspace*{\the\numexpr3*\tocEntrySpacing\relax em}%
                        \scriptsize%
                    \else%
                        % Formatting in mini-TOC
                        \vspace{-0.2em}%
                        \setlength\@tempdima{\minitocEntrySpacing em}%
                        \hspace*{\the\numexpr2*\minitocEntrySpacing\relax em}%
                        \footnotesize%
                    \fi%
                \fi%
                #1\margindotfill#2\par}%
    \fi}%

% Remove mini-TOC title
\renewcommand{\mtctitle}{}%

% To hide the table of contents while still enabling minitoc
\newcommand{\silenttableofcontents}{%
    \IfFileExists{\jobname.toc}{}{\@starttoc{toc}}}%

% Nothing on header for odd pages in TOC
% Separate index creation from showing TOC
% Set a flag to avoid having a TOC entry in TOC
\newif\ifnotcreatingtoc%
\notcreatingtoctrue%
\let\oldtableofcontents\tableofcontents%
\renewcommand{\tableofcontents}{%
    \renewcommand\rightmark{}%
    \notcreatingtocfalse%
    \oldtableofcontents%
    \label{toc}%
    \notcreatingtoctrue}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% HEADER & FOOTER %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set header & footer
% We recall the setion in the long doc, but only the number in the short one
\RequirePackage{fancyhdr}%
\pagestyle{fancy}%
\fancyhf{}%
\fancyhead[LE, RO]{\thepage}%
\ifshortdoc%
\else%
    \fancyhead[LE, RO]{\thepage}%
    \fancyhead[RE]{\itshape\nouppercase\leftmark}%
    \fancyhead[LO]{\itshape\nouppercase\rightmark}%
\fi%

% Add line
\renewcommand{\headrulewidth}{0.4pt}%
\renewcommand{\footrulewidth}{0pt}%

% Do not write "Chapter X" in header
\renewcommand{\chaptermark}[1]{\markboth{\thechapter~~~---~~~#1}{}}%
\renewcommand{\sectionmark}[1]{\markright{\thesection~~~---~~~#1}}%
\let\oldrightmark\rightmark%
\let\oldchaptermark\chaptermark%

% Add missing headers on empty pages and chapter starts
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}%

% Remove title in headers of blank pages
% Also disables blank pages for short doc
\fancypagestyle{emptyheader}{%
    \fancyhf{}%
    \fancyhead[LE, RO]{\thepage}%
    \renewcommand{\headrulewidth}{0.4pt}%
    \renewcommand{\footrulewidth}{0pt}}%
\makeatletter%
\renewcommand{\cleardoublepage}{%
    \clearpage%
    \ifshortdoc%
    \else%
        \if@twoside%
            \ifodd%
                \c@page%
            \else%
                \hbox{}%
                \thispagestyle{emptyheader}%
                \newpage%
            \fi%
        \fi%
    \fi}%
\makeatother%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% REFERENCES %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Colors & needed packages for refs
\RequirePackage[colorlinks=true, linkcolor=linksColor, citecolor=linksColor, urlcolor=linksColor]{hyperref}%
\RequirePackage{xparse}%

% Chapter / appendix
\newcommand{\chaptertext}{}%
\renewcommand{\chaptername}{\cstChapter}%
\makeatletter%
\let\oldchapter\chapter%
\RenewDocumentCommand{\chapter}{s o m O{}}{%
    \if\relax\detokenize\expandafter{#4}%
    \else%
        \renewcommand{\chaptertext}{%
            \begingroup
            \let\oldnewline\\%
            \renewcommand{\\}{\oldnewline[\valparskip]}%
            #4%
            \endgroup%
        }%
    \fi%
    \IfBooleanTF{#1}{%
        \iftocinappendix%
            \let\oldthechapter\thechapter%
            \renewcommand{\thechapter}{}%
            \renewcommand{\chaptermark}[1]{\markboth{##1}{}}%
            \oldchapter{#3}%
            \renewcommand{\thechapter}{\oldthechapter}%
            \renewcommand{\chaptermark}{\oldchaptermark}%
        \else%
            \oldchapter*{#3}%
        \fi%
        \def\@currentlabelname{#3}%
    }{%
        \oldchapter{#3}%
        \edef\@currentlabelname{\iftocinappendix\cstAppendix\else\cstChapter\fi~\thechapter}%
    }%
    \IfValueT{#2}{\label{#2}}%
}%
\makeatother%

% Section
\makeatletter%
\let\oldsection\section%
\RenewDocumentCommand{\section}{s o m}{%
    \IfBooleanTF{#1}{%
        \phantomsection%
        \oldsection*{#3}%
        \def\@currentlabelname{#3}%
    }{%
        \oldsection{#3}%
        \edef\@currentlabelname{\cstSection~\thesection}%
    }%
    \IfValueT{#2}{\label{#2}}%
}%
\makeatother%

% Subsection
\makeatletter%
\let\oldsubsection\subsection%
\RenewDocumentCommand{\subsection}{s o m}{%
    \IfBooleanTF{#1}{%
        \phantomsection%
        \oldsubsection*{#3}%
        \def\@currentlabelname{#3}%
    }{%
        \oldsubsection{#3}%
        \edef\@currentlabelname{\cstSection~\thesubsection}%
    }%
    \IfValueT{#2}{\label{#2}}%
}%
\makeatother%

% Subsubsection
\makeatletter%
\let\oldsubsubsection\subsubsection%
\RenewDocumentCommand{\subsubsection}{s o m}{%
    \IfBooleanTF{#1}{%
        \phantomsection%
        \oldsubsubsection*{#3}%
        \def\@currentlabelname{#3}%
    }{%
        \oldsubsubsection{#3}%
        \edef\@currentlabelname{\cstSection~\thesubsubsection}%
    }%
    \IfValueT{#2}{\label{#2}}%
}%
\makeatother%

% Paragraph
\makeatletter%
\let\oldparagraph\paragraph%
\RenewDocumentCommand{\paragraph}{s o m}{%
    \IfBooleanTF{#1}{%
        \phantomsection%
        \oldparagraph*{#3}%
    }{%
        \oldparagraph{#3}%
    }%
    \def\@currentlabelname{#3}%
    \IfValueT{#2}{\label{#2}}%
}%
\makeatother%

% Subparagraph
\makeatletter%
\let\oldsubparagraph\subparagraph%
\RenewDocumentCommand{\subparagraph}{s o m}{%
    \IfBooleanTF{#1}{%
        \phantomsection%
        \oldsubparagraph*{#3}%
    }{%
        \oldsubparagraph{#3}%
    }%
    \def\@currentlabelname{#3}%
    \IfValueT{#2}{\label{#2}}%
}%
\makeatother%

% To start appendices
\newif\iftocinappendix%
\tocinappendixfalse%
\makeatletter%
\let\oldappendix\appendix
\NewDocumentCommand{\appendices}{}{%
    \iftocinappendix%
    \else%
        \tocinappendixtrue%
        \renewcommand{\chaptername}{\cstAppendix}%
        \cleardoublepage%
        \phantomsection%
        \addcontentsline{toc}{part}{\cstAppendices}%
        \addtocontents{toc}{\protect\tocinappendixtrue}%
        \oldappendix%
    \fi%
}%
\makeatother%

% Figure
\counterwithout{figure}{chapter}%
\makeatletter%
\let\oldfigure\figure%
\let\endoldfigure\endfigure%
\RenewDocumentEnvironment{figure}{o m}%
{%
    \oldfigure%
    \centering%
}{%
    \caption{#2}%
    \edef\@currentlabelname{\cstFigure~\thefigure}%
    \IfValueT{#1}{\label{#1}}%
    \endoldfigure%
}%
\RenewDocumentEnvironment{figure*}{o m}%
{%
    \oldfigure%
    \centering%
}{%
    \caption*{#2}%
    \edef\@currentlabelname{\cstFigure}%
    \IfValueT{#1}{\label{#1}}%
    \endoldfigure%
}%
\makeatother%

% Subfigure
\makeatletter%
\let\oldsubfigure\subfigure%
\let\endoldsubfigure\endsubfigure%
\RenewDocumentEnvironment{subfigure}{o m m}%
{%
    \oldsubfigure[t]{#2}%
    \vspace{0pt}%
    \centering%
}{%
    \caption{#3}%
    \edef\@currentlabelname{(\thesubfigure)}%
    \IfValueT{#1}{\label{#1}}%
    \endoldsubfigure%
}%
\NewDocumentEnvironment{subfigure*}{o m m}%
{%
    \oldsubfigure[t]{#2}%
    \vspace{0pt}%
    \centering%
}{%
    \caption*{#3}%
    \edef\@currentlabelname{}%
    \IfValueT{#1}{\label{#1}}%
    \endoldsubfigure%
}%
\makeatother%

% Table
\counterwithout{table}{chapter}%
\makeatletter%
\let\oldtable\table%
\let\endoldtable\endtable%
\RenewDocumentEnvironment{table}{o m}%
{%
    \oldtable%
    \centering%
}{%
    \caption{#2}%
    \edef\@currentlabelname{\cstTable~\thetable}%
    \IfValueT{#1}{\label{#1}}%
    \endoldtable%
}%
\RenewDocumentEnvironment{table*}{o m}%
{%
    \oldtable%
    \centering%
}{%
    \caption*{#2}%
    \edef\@currentlabelname{\cstTable}%
    \IfValueT{#1}{\label{#1}}%
    \endoldtable%
}%
\makeatother%

% Equation
\counterwithout{equation}{chapter}%
\makeatletter%
\let\oldequation\equation%
\let\endoldequation\endequation%
\RenewDocumentEnvironment{equation}{o}%
{%
    \oldequation%
}{%
    \edef\@currentlabelname{\cstEquation~\theequation}%
    \IfValueT{#1}{\label{#1}}%
    \endoldequation%
}%
\RenewDocumentEnvironment{equation*}{o}%
{%
    \oldequation%
    \phantomsection%
}{%
    \notag%
    \edef\@currentlabelname{\cstEquation}%
    \IfValueT{#1}{\label{#1}}%
    \endoldequation%
}%
\makeatother%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% LIST OF ACRONYMS %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prepare glossary
\RequirePackage[acronym]{glossaries}%
\glssetnoexpandfield{long}%
\glssetnoexpandfield{description}%
\loadglsentries{acronyms}%
\makeglossaries%

% Customize entries
\newglossarystyle{acronymsstyle}{%
    \renewenvironment{theglossary}{}{}%
    \renewcommand*{\glossentry}[2]{%
        \begingroup%
        \hdrtipsoff%
        \ifglshaslong{##1}{%
            \begin{tabularx}{\textwidth}{@{}l@{}X@{}}%
                \glsentryitem{##1}\glstarget{##1}{\glsentryname{##1}} & \raggedleft\margindotfill\glsentrylong{##1} %
            \end{tabularx}\\%
        }{}%
        \endgroup%
    }%
    \renewcommand*{\glsgroupskip}{}%
}
\setglossarystyle{acronymsstyle}%

% Set glossary title and avoid too many double pages before
\makeatletter%
% An acronym is only linked to its entry when the list of acronyms is actually
% printed; documents that omit it (the "demand", typically) would otherwise point
% at destinations that do not exist. The information is carried by the .aux file,
% so the links appear from the second compilation on
\newif\ifhdrglossaryprinted%
\renewcommand{\printglossaries}{%
    \addtocontents{toc}{\protect\tocinappendixfalse}%
    \tocinappendixfalse%
    \cleardoublepage%
    \chapter*[glossary]{\cstGlossary}%
    \renewcommand{\glossarysection}[2][]{}
    \printglossary[type=\acronymtype]%
    % \global is required: the switch set by \newif is a local \let, and the
    % .aux file is read inside a group (minitoc writes \global the same way)
    \immediate\write\@auxout{\string\global\string\hdrglossaryprintedtrue}%
    \renewcommand\rightmark{}}%
\makeatother%

% An acronym used in a title also travels to the table of contents and to the PDF
% bookmarks, where no link can be created: only its name is kept there
\newcommand{\glsintitle}[1]{\texorpdfstring{\glslink{#1}{\glsentryname{#1}}}{\glsentryname{#1}}}%
\renewcommand{\gls}{\glsintitle}%

% Tooltips for acronyms
% These two packages interfere with \appendix, which is why the class provides
% the \appendices command above, and why a document should use that one
\RequirePackage{soul}%
\RequirePackage{pdfcomment}%

% Tooltips that are also links (see "test/" for the comparison of the candidate
% PDF mechanisms). A pdfcomment tooltip is a read-only push button widget
% carrying /TU; a viewer only honours it, and the action attached to it, when the
% widget is a real form field, so every tooltip is collected here and declared in
% the document catalog's /AcroForm at the very end of the document
\makeatletter%
% LuaTeX renamed the pdfTeX primitives, so both spellings have to be provided
\ifdefined\pdfextension%
    \protected\def\hdr@annot{\pdfextension annot }%
    \protected\def\hdr@catalog{\pdfextension catalog }%
    \def\hdr@lastannot{\the\numexpr\pdffeedback lastannot\relax}%
\else%
    \protected\def\hdr@annot{\pdfannot }%
    \protected\def\hdr@catalog{\pdfcatalog }%
    \def\hdr@lastannot{\the\pdflastannot}%
\fi%
\newcommand{\hdr@formfields}{}%
\AtEndDocument{%
    \ifx\hdr@formfields\@empty\else%
        \hdr@catalog{/AcroForm << /Fields [\hdr@formfields] /NeedAppearances false >>}%
    \fi}%

% The annotation dictionary pdfcomment writes for every tooltip, with an extra
% action slot. It is redefined once and for all rather than per call: \hdrTooltip
% must not open a group, because ulem's \dotuline (used for author names in the
% bibliography) cannot cope with one in its argument
\newcommand{\hdr@tip@action}{}%
\renewcommand{\pc@annot@tooltip}{%
    /TU (\pc@pdfenc@contents)\space%
    /T (tooltip \thezref@unique)\space%
    /FT /Btn\space%
    /Ff 65536\space%
    /F 4\space%
    /H /N\space%
    /BS << /W 0 >>\space%
    \hdr@tip@action}%

% \hdrTooltipLink{destination}{tooltip}{text}
% The label is boxed, hence unbreakable: an annotation is a single rectangle,
% so a label split across two lines would carry neither tooltip nor link on
% its second half (only \pdfstartlink, which hyperref uses, splits by itself)
% Same as \hdrTooltip below, plus a /Link annotation for the viewers that ignore
% form widgets. The link is emitted *before* the widget on purpose: Acrobat gives
% the hover to whichever annotation comes last in the page's /Annots array, and
% \bibhyperref writes its link at \pdfendlink, hence after the widget, which hid
% the tooltip. Test T3 in "test/" had it in this order, which is why it worked
\newsavebox{\hdr@tipbox}%
\DeclareRobustCommand{\hdrTooltipLink}[3]{%
    \ifhdr@tips%
        \sbox\hdr@tipbox{\Hy@colorlink\@citecolor#3\Hy@endcolorlink}%
        \hdr@annot width \the\wd\hdr@tipbox
        height \the\ht\hdr@tipbox
        depth \the\dp\hdr@tipbox
        {/Subtype /Link /Border [0 0 0] /A << /S /GoTo /D (#1) >>}%
        \hdrTooltip{#1}{#2}{\usebox\hdr@tipbox}%
    \else%
        #3%
    \fi}%

% \hdrTooltip{destination}{tooltip}{text}
% Reuses pdfcomment's widget (hence its PDF string encoding, which matters for
% accents), adds a "go to destination" action to it, and registers it as a form
% field. An empty destination gives a plain tooltip, for entries that have
% nowhere to point to. Note that a bare \pdftooltip is not registered, so use
% this command instead everywhere in the document
% Some contexts typeset their content several times and throw all but the last
% copy away (tabularx trial passes, for instance). Every discarded copy would
% still have reserved an annotation object number, leaving dangling references in
% /Fields, so tooltips can be switched off locally with \hdrtipsoff
\newif\ifhdr@tips%
\hdr@tipstrue%
\newcommand{\hdrtipsoff}{\hdr@tipsfalse}%

% tabularx measures its content in trial passes and throws the result away, which
% the tables of a CV do a lot. Suppress tooltips during those passes, otherwise
% every discarded copy leaves a reserved annotation object behind. No group here:
% tabularx reads \@tempboxa after the trial, so a group would undo its \setbox
\let\hdr@TX@trial\TX@trial%
\def\TX@trial#1{%
    \ifhdr@tips%
        \let\hdr@tips@restore\hdr@tipstrue%
    \else%
        \let\hdr@tips@restore\hdr@tipsfalse%
    \fi%
    \hdr@tipsfalse%
    \hdr@TX@trial{#1}%
    \hdr@tips@restore}%
\DeclareRobustCommand{\hdrTooltip}[3]{%
    \ifhdr@tips%
        \ifblank{#1}%
        {\def\hdr@tip@action{}}%
        {\edef\hdr@tip@action{/A << /S /GoTo /D (#1) >>\space}}%
        \pdftooltip{\mbox{#3}}{#2}%
        \xdef\hdr@formfields{\hdr@formfields\space\hdr@lastannot\space 0 R}%
        \def\hdr@tip@action{}%
    \else%
        #3%
    \fi}%
\makeatother%

% In a PDF string (bookmarks, document properties) no annotation can be created,
% and hyperref silently drops any command it does not know -- including the
% \ifglshaslong test below, whose leftover arguments then break the string. So
% the acronym commands are replaced by their plain-text equivalent altogether
\pdfstringdefDisableCommands{%
    \def\pdftooltip#1#2{#1}%
    \def\hdrTooltip#1#2#3{#3}%
    \def\citeTooltip#1#2{#2}%
    \def\citeTooltipNoLink#1#2{#2}%
    \def\citeTooltipExternal#1#2{#2}%
    \def\citeTooltipURL#1#2{#2}%
    \def\checkacro#1{}%
    \def\acro#1{\glsentryname{#1}}%
    \def\acrofull#1{\glsentrydesc{#1} (\glsentryname{#1})}%
    \def\acroname#1{\glsentrydesc{#1}}%
}%
\DeclareRobustCommand{\checkacro}[1]{%
    \ifglsentryexists{#1}{}{%
        \PackageWarning{hdr}{Acronym `#1' is not defined}%
    }%
}
\DeclareRobustCommand{\acro}[1]{%
    \checkacro{#1}%
    \ifglsentryexists{#1}{%
        % Entries with an empty "long" are not printed in the list of acronyms,
        % so there is no target to jump to for those (plural/adjective variants)
        \ifhdrglossaryprinted%
            \ifglshaslong{#1}%
            {\hdrTooltip{glo:#1}{\glsentrydesc{#1}}{\glsentryname{#1}}}%
            {\hdrTooltip{}{\glsentrydesc{#1}}{\glsentryname{#1}}}%
        \else%
            \hdrTooltip{}{\glsentrydesc{#1}}{\glsentryname{#1}}%
        \fi%
    }{#1}%
}
\DeclareRobustCommand{\acrofull}[1]{%
    \checkacro{#1}%
    \ifglsentryexists{#1}{%
        \glsentrydesc{#1}~(\acro{#1})%
    }{#1}%
}
\DeclareRobustCommand{\acroname}[1]{%
    \checkacro{#1}%
    \ifglsentryexists{#1}{%
        \glsentrydesc{#1}%
    }{#1}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% CHAPTER PAGES %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Separator
\newcommand\chapterSeparator[0]{\normalfont\LARGE\color{separatorColor}\contour{white}{\FourierOrns{P}}}%

% Background on chapter pages
\RequirePackage{graphicx} %
\newcommand\ChapterBackground{template/includes/background.png}%
\newcommand{\AddChapterBackground}{%
    \AddToShipoutPictureBG*{%
        \put(0,0){%
            \includegraphics[width=\paperwidth,height=\paperheight]{\ChapterBackground}}}}%

% Line around title of chapters
\RequirePackage{contour}%
\contourlength{0.7pt}%

% Chapter pages of unnumbered chapters (foreword, acknowledgements, bibliography)
% They are added to the table of contents as parts rather than as chapters, which
% would be the natural \addcontentsline{toc}{chapter}{#1}: minitoc drops the
% mini-tables of contents of the whole document otherwise
% This is also why parts cannot be used in a document
\RequirePackage{fourier-orns}%
\makeatletter%
\renewcommand{\@makeschapterhead}[1]{%
    \cleardoublepage%
    \AddChapterBackground%
    \ifnotcreatingtoc
        \addcontentsline{toc}{part}{#1}%
    \fi%
    \markboth{#1}{}%
    \vspace*{0pt}%
    {\centering%
        \normalfont\huge\bfseries\scshape\color{titlesColor}\contour{white}{#1}\par%
        \vspace*{40pt}%
        \chapterSeparator\par%
        \vspace*{50pt}}%
    \if\relax\detokenize\expandafter{\chaptertext}%
        \relax%
    \else%
        \chaptertext\par%
        {\centering%
            \vspace*{50pt}%
            \chapterSeparator\par%
            \vspace*{50pt}}%
        \renewcommand{\chaptertext}{}%
    \fi}%
\makeatother%

% Format chapter titles for numbered sections
\renewcommand{\thechapter}{\Roman{chapter}}%
\makeatletter%
\renewcommand{\@makechapterhead}[1]{%
    \cleardoublepage%
    \AddChapterBackground%
    \renewcommand\rightmark\oldrightmark%
    \renewcommand\chaptermark\oldchaptermark%
    \vspace*{0pt}%
    {\centering%
        \normalfont\huge\scshape\color{titlesColor}\contour{white}{\chaptername~~\thechapter}\par%
        \vspace*{10pt}%
        \normalfont\huge\bfseries\scshape\color{titlesColor}\contour{white}{#1}\par%
        \vspace*{40pt}%
        \chapterSeparator\par%
        \vspace*{50pt}}%
    \if\relax\detokenize\expandafter{\chaptertext}%
        \relax%
    \else%
        \chaptertext\par%
        \vspace*{50pt}%
        \renewcommand{\chaptertext}{}%
    \fi%
    \vfill%
    \inmaintocfalse%
    \minitoc%
    \inmaintoctrue%
    \pagebreak}%
\makeatother%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% BIBLIOGRAPHY %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Use biblatex, with the custom fields declared in "template/hdr.dbx" ("group",
% "poster", "video", "code", "prize" and "slides"): data model commands cannot be
% used in a preamble, hence the separate file, read through the "datamodel" option
\RequirePackage{csquotes}%
\RequirePackage[backend=biber, datamodel=template/hdr, style=authoryear, natbib=true, sorting=customsort, backref=true, url=false, isbn=false, doi=false, dashed=false, maxnames=99]{biblatex}%

% Chapter title
\defbibheading{bibliography}[\bibname]{\chapter*[bibliography]{\cstBibliography}}%

% Allow acronyms in the bibliography
\AtEveryBibitem{\glsunsetall\glsaddall}%

% We distinguish cases when pages are used for article numbers rather than articles
\RequirePackage{xstring}%
\newcommand{\printpages}{%
    \StrSubstitute{\thefield{pages}}{0}{}[\temp]%
    \StrSubstitute{\temp}{1}{}[\temp]%
    \StrSubstitute{\temp}{2}{}[\temp]%
    \StrSubstitute{\temp}{3}{}[\temp]%
    \StrSubstitute{\temp}{4}{}[\temp]%
    \StrSubstitute{\temp}{5}{}[\temp]%
    \StrSubstitute{\temp}{6}{}[\temp]%
    \StrSubstitute{\temp}{7}{}[\temp]%
    \StrSubstitute{\temp}{8}{}[\temp]%
    \StrSubstitute{\temp}{9}{}[\temp]%
    \StrLen{\temp}[\len]%
    \ifnum\len=1%
        pp.\space\thefield{pages}%
    \else%
        art.\space\thefield{pages}%
    \fi}%

% My name underlined in refs
\RequirePackage[normalem]{ulem}%
\DeclareNameFormat{author}{%
    \ifthenelse{\equal{\namepartfamily}{\authorName} \and \equal{\namepartgiven}{\authorFirstName}}%
    {\dotuline{\namepartgiven\space{\scshape\namepartfamily}}}%
    {\namepartgiven\space{\scshape\namepartfamily}}%
    \ifthenelse{\value{listcount} < \value{listtotal}}%
    {,\space\newunit\newblock}%
    {}}%

% Show as [Author et al., date]
% Use field "note" for the suffix to put to the ref in case of ambiguous entries
\addbibresource{bibliography.bib}
\DeclareNameFormat{labelname}{%
    \ifnum\value{listcount}=1%
        \textsc{\namepartfamily}%
        \ifnum\value{listtotal}>1%
            ~\emph{et al.}%
        \fi%
    \fi}%

% Sort using sortname
% For external refs: [ Author 1, year ]
% For my refs: [ X_{addendum} ]
\DeclareSortingTemplate{customsort}{%
    \sort[direction=ascending]{\field{howpublished}}%
    \sort[direction=ascending]{\field{group}}%
    \sort[direction=ascending]{\field{addendum}}%
    \sort[direction=ascending]{\field{labelname}}%
    \sort[direction=ascending]{\field{year}}%
    \sort[direction=ascending]{\field{note}}%
}%

% Macro to test if multiple fields are undefined
\newcommand{\IfAllFieldsUndef}[3]{%
    \def\do##1{%
        \ifboolexpr{ test {\iffieldundef{##1}} }{}{%
            \expandafter\def\expandafter\allundef\expandafter{\allundef false}}}%
    \def\allundef{true}%
    \forcsvlist{\do}{#1}%
    \ifthenelse{\equal{\allundef}{true}}{#2}{#3}%
}%

% Macro for the entry code
\newcommand{\bibEntryCode}{%
    \mkbibbrackets{%
        ~%
        \iffieldundef{howpublished}{%
            \iffieldundef{addendum}{}{%
                \ifcategoriesused%
                    \ifonlyonecategory\else%
                        \myabbr{\thefield{group}}%
                        \textsubscript{\scriptsize\number\numexpr\thefield{addendum}\relax}%
                        ~|~%
                    \fi%
                \else\fi}%
            \printnames{labelname}%
            \iffieldundef{year}{}{,~\printfield{year}}%
            \iffieldundef{note}{}{\textsuperscript{(\printfield{note})}}%
        }{%
            \textsc{\printfield{howpublished}}%
            \iffieldundef{note}{}{\textsuperscript{(\printfield{note})}}%
        }%
        ~%
    }%
}%

% The fields holding the extras of an entry are comma-separated lists of URLs, so
% one icon is drawn per URL: an entry with two repositories gets two GitHub icons
% Set "showMissing" to true to also show, greyed out, the icons of the extras that
% the entry does not have
\newbool{showMissing}%
\boolfalse{showMissing}%
\DeclareListParser{\myurlparser}{,}%
\newcommand{\printIconList}[2]{%
    \iffieldundef{#2}{%
        \ifbool{showMissing}{%
            \textcolor{missingColor}{#1}\hspace{0.2cm}%
        }%
    }{%
        \savefieldcs{#2}{tempData}%
        \renewcommand*{\do}[1]{%
            \ifblank{##1}{}{%
                \href{##1}{#1}\hspace{0.2cm}%
            }%
        }%
        \expandafter\myurlparser\expandafter{\tempData}%
    }%
}%

% Icons shown under an entry of the author: the article itself, then its slides,
% poster, code, video and prize, and finally the pages where the entry is cited
% External references and online resources only get the link to the resource
\newcommand{\bibEntryIcons}{%
    \iffieldundef{howpublished}{%
        \iffieldequalstr{group}{nogroup}{%
            \printIconList{\faNewspaper[regular]}{url}%
            \ifshortdoc\else---\hspace{0.2cm}\fi%
        }{%
            \printIconList{\faNewspaper[regular]}{url}%
            \printIconList{\faImages}{slides}%
            \printIconList{\faImage}{poster}%
            \printIconList{\faGithub}{code}%
            \printIconList{\faYoutube}{video}%
            \printIconList{\faTrophy}{prize}%
            \par\vspace*{0cm}%
        }%
    }{}%
    \ifshortdoc%
    \else%
        \iflistundef{pageref}{}{\hspace{0.05cm}{\scriptsize \faBookOpen}\hspace{0.2cm}\printlist[pageref][1-999]{pageref}}%
        \par\vspace*{0cm}%
    \fi%
}%

% Macro for volume/number/pages block
\newcommand{\volNbPp}{%
    \IfAllFieldsUndef{volume, pages}{}{%
        \space(%
        \iffieldundef{volume}{}{vol.~\thefield{volume}}%
        \iffieldundef{number}{}{%
            \iffieldundef{volume}{}{,\space}%
            nb.~\thefield{number}}%
        \iffieldundef{pages}{}{%
            \iffieldundef{number}{\iffieldundef{volume}{}{,\space}}{,\space}%
            \printpages}%
        )%
    }%
}%

% Macro for a reference type
\newcommand{\declareReferenceType}[2]{%
    \DeclareBibliographyDriver{#1}{%
        \justifying%
        \small%
        \begin{minipage}[t]{\cstBiblioFirstColWidth}%
            \vspace{0pt}%
            \bibEntryCode%
            \par\vspace*{0.1cm}%
            \bibEntryIcons%
        \end{minipage}%
        \hfill%
        \begin{minipage}[t]{\cstBiblioLastColWidth}%
            \vspace{0pt}%
            #2.%
        \end{minipage}%
        \par\vspace*{\cstBiblioEntriesSpacing}%
    }%
    \DeclareBibliographyDriver{secondcol:#1}{#2}%
}%

% Thesis/report
\declareReferenceType{thesis}{%
    \printnames{author}\space%
    (\thefield{year}).\space%
    \textbf{``\thefield{title}''}.\space%
    \textit{%
        \thelist{institution}%
        \iffieldundef{type}{}{\space(\thefield{type})}%
    }%
}%
\DeclareBibliographyAlias{phdthesis}{thesis}%
\DeclareBibliographyAlias{secondcol:phdthesis}{secondcol:thesis}%
\DeclareBibliographyAlias{mdthesis}{thesis}%
\DeclareBibliographyAlias{secondcol:mdthesis}{secondcol:thesis}%
\DeclareBibliographyAlias{report}{thesis}%
\DeclareBibliographyAlias{secondcol:report}{secondcol:thesis}%
\DeclareBibliographyAlias{manual}{thesis}%
\DeclareBibliographyAlias{secondcol:manual}{secondcol:thesis}%

% Manual
\declareReferenceType{manual}{%
    \printnames{author}%
    \iffieldundef{year}{}{\space(\thefield{year})}.\space%
    \textbf{``\thefield{title}''}.\space%
    \textit{\thelist{organization}}%
}%

% Publications
\declareReferenceType{default}{%
    \printnames{author}\space%
    (\thefield{year}).\space%
    \textbf{``\thefield{title}''}.\space%
    \textit{%
        \thefield{booktitle}%
        \thefield{journaltitle}%
        \volNbPp%
        \iflistundef{publisher}{}{%
            \IfAllFieldsUndef{booktitle, journaltitle}{}{,\space}%
            \thelist{publisher}%
        }%
        \iflistundef{organization}{}{%
            \IfAllFieldsUndef{booktitle, journaltitle}{}{,\space}%
            \thelist{organization}%
        }%
    }%
}%
\DeclareBibliographyAlias{incollection}{default}%
\DeclareBibliographyAlias{secondcol:incollection}{secondcol:default}%
\DeclareBibliographyAlias{inproceedings}{default}%
\DeclareBibliographyAlias{secondcol:inproceedings}{secondcol:default}%
\DeclareBibliographyAlias{article}{default}%
\DeclareBibliographyAlias{secondcol:article}{secondcol:default}%
\DeclareBibliographyAlias{book}{default}%
\DeclareBibliographyAlias{secondcol:book}{secondcol:default}%

% URL
\newlength{\firstColWidth}%
\setlength{\firstColWidth}{\cstBiblioFirstColWidth}%
\renewbibmacro*{urldate}{\date{\thefield{urlyear}-\thefield{urlmonth}-\thefield{urlday}}}%
\DeclareBibliographyDriver{online}{%
    \justifying%
    \small%
    \begin{minipage}[t]{\dimexpr 0.23\firstColWidth\relax}%
        \vspace{0pt}%
        \qrcode[height=\linewidth]{\strfield{url}}%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t]{\dimexpr 0.7\firstColWidth\relax}%
        \vspace{0pt}%
        \bibEntryCode%
        \par\vspace*{0.1cm}%
        \iffieldundef{urlyear}{}{%
            \faEye[regular]\hspace{0.2cm}\usebibmacro{urldate}%
            \par\vspace*{0cm}%
        }%
        \bibEntryIcons%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t]{\cstBiblioLastColWidth}%
        \vspace{0pt}%
        \ifnameundef{author}{}{%
            \printnames{author}%
            \iffieldundef{year}{}{\space(\thefield{year})}%
            .\space%
        }%
        \textbf{``\thefield{title}''}%
        \iflistundef{organization}{}{.\space\textit{\thelist{organization}}}%
        .%
    \end{minipage}%
    \par\vspace*{\cstBiblioEntriesSpacing}%
}%

\makeatletter%
% Citations: tooltip with the title of the entry + link to its bibliography entry
% \citeTooltip{tooltip}{text}
\DeclareRobustCommand{\citeTooltip}[2]{%
    \edef\hdr@cite@dest{cite.\the\c@refsection @\abx@field@entrykey}%
    \hdrTooltipLink{\hdr@cite@dest}{#1}{#2}}%

% Same, for entries that are excluded from the bibliography: nothing to link to
\DeclareRobustCommand{\citeTooltipNoLink}[2]{%
    \hdrTooltip{}{#1}{\Hy@colorlink\@citecolor#2\Hy@endcolorlink}}%
\makeatother%

% External references and URLs are only linked when they appear in the
% bibliography. A short document never prints them (see \printbibliography, which
% only lists the author's own categories in that case), so there is nothing to
% point to there either
\AtBeginDocument{%
    \ifshortdoc%
        \let\citeTooltipExternal\citeTooltipNoLink%
        \let\citeTooltipURL\citeTooltipNoLink%
    \else%
        \ifIncludeExternalRefsInBib%
            \let\citeTooltipExternal\citeTooltip%
        \else%
            \let\citeTooltipExternal\citeTooltipNoLink%
        \fi%
        \ifIncludeURLsInBib%
            \let\citeTooltipURL\citeTooltip%
        \else%
            \let\citeTooltipURL\citeTooltipNoLink%
        \fi%
    \fi}%

% Use brackets in citep (and others), and make full entry clickable
\let\citep\relax%
\newif\ifpreviouswithicon%
\DeclareCiteCommand{\citep}%
{%
    \previouswithiconfalse%
    \bibopenbracket%
}{%
    \iffieldequalstr{group}{nogroup}{%
        \iffieldundef{addendum}{}{%
            \errmessage{External references should not have "group" or "addendum" fields (found in \thefield{entrykey})}%
        }%
        \iffieldundef{howpublished}{%
            \citeTooltipExternal{\thefield{title}}{%
                \printnames{labelname}\setunit{,\space}\printfield{year}%
                \iffieldundef{note}{}{\textsuperscript{(\printfield{note})}}%
            }%
            \space%
            \href{\thefield{url}}{\faNewspaper[regular]}%
        }{%
            \citeTooltipURL{\thefield{title}}{%
                \textsc{\printfield{howpublished}}%
                \iffieldundef{note}{}{\textsuperscript{(\printfield{note})}}%
            }%
            \space%
            \href{\thefield{url}}{\faGlobeAmericas}%
        }%
        \global\previouswithicontrue%
    }{%
        \ifcategoriesused%
            \ifcsname abbr@\thefield{group}\endcsname\else%
                \errmessage{Citing reference \thefield{entrykey} with undeclared category "\thefield{group}". This entry will not appear in the bibliography}%
            \fi%
            \ifonlyonecategory%
                \citeTooltip{\thefield{title}}{%
                    \printnames{labelname}\setunit{,\space}\printfield{year}%
                    \iffieldundef{note}{}{\textsuperscript{(\printfield{note})}}%
                }%
            \else%
                \citeTooltip{\thefield{title}}{\myabbr{\thefield{group}}}%
                \iffieldundef{addendum}{}{\textsubscript{\scriptsize\number\numexpr\thefield{addendum}\relax}}%
            \fi%
        \else%
            \errmessage{When no categories are used, no references should have "group" or "addendum" fields (found in \thefield{entrykey}). This entry will not appear in the bibliography}%
            \citeTooltip{\thefield{title}}{%
                \printnames{labelname}\setunit{,\space}\printfield{year}%
                \iffieldundef{note}{}{\textsuperscript{(\printfield{note})}}%
            }%
        \fi%
        \global\previouswithiconfalse%
    }%
}%
{\ifpreviouswithicon\nobreak\hspace{0.1em}\fi;\space}%
{\bibclosebracket}%

% Redefine citation commands
\DeclareCiteCommand{\fullcite}{}{\usedriver{}{secondcol:\thefield{entrytype}}}{}{}%
\renewcommand\cite\citep%
\renewcommand\citet\citep%

% Nothing on header for odd pages in bibliography
\let\oldbibliography\bibliography%
\renewcommand{\bibliography}[1]{%
    \fancyhead[LO]{}%
    \oldbibliography{#1}}%

% To declare categories
% URL entries have a field howpublished to distinguish them from references
\newif\ifcategoriesused%
\categoriesusedfalse%
\newif\ifonlyonecategory%
\onlyonecategorytrue%
\makeatletter%
\let\oldprintbibliography\printbibliography
\newcommand{\@biblioCategories}{}%
\newcommand{\@biblioCategoriesNoTitle}{}%
\newcommand{\addBiblioCategory}[3]{%
    \ifcategoriesused%
        \onlyonecategoryfalse%
    \fi%
    \categoriesusedtrue%
    \ifcsname abbr@#1\endcsname%
        \errmessage{Duplicate bibliography category \thefield{group}}%
    \else%
        \expandafter\gdef\csname abbr@#1\endcsname{#2}%
    \fi%
    \DeclareSourcemap{%
        \maps[datatype=bibtex]{%
            \map{%
                \step[fieldsource=group, match=\regexp{#1}, final]%
                \step[fieldset=keywords, fieldvalue={filter_#1}, append]}}}%
    \g@addto@macro\@biblioCategories{%
        \ifshortdoc%
            \subsection{#3}%
        \else%
            \subsection*{#3}%
        \fi%
        \oldprintbibliography[keyword=filter_#1, heading=none]}%
    \ifonlyonecategory%
        \g@addto@macro\@biblioCategoriesNoTitle{%
            \oldprintbibliography[keyword=filter_#1, heading=none]}%
    \fi%
}%
\let\olddocument\document%
\renewcommand\document{%
\DeclareSourcemap{%
    \maps[datatype=bibtex]{%
        \map{%
            \step[fieldsource=group, null]%
            \step[fieldset=group, fieldvalue={nogroup}]%
            \step[fieldsource=group, match=\regexp{nogroup}, final]%
            \step[fieldsource=howpublished, null, final]%
            \step[fieldset=keywords, fieldvalue={filter_url}, append]%
        }%
        \map{%
            \step[fieldsource=group, null]%
            \step[fieldset=group, fieldvalue={nogroup}]%
            \step[fieldsource=group, match=\regexp{nogroup}, final]%
            \step[fieldset=keywords, fieldvalue={filter_external}, append]%
        }}}%
\olddocument}%
\makeatother%

% For including abbreviations in entries
\makeatletter%
\newcommand{\myabbr}[1]{%
    \ifcsname abbr@#1\endcsname%
        \csname abbr@#1\endcsname%
    \else%
        #1%
    \fi}%
\makeatother%

% To show the bibliography
% No external refs or URLs in short doc by default
\newif\ifIncludeExternalRefsInBib%
\IncludeExternalRefsInBibtrue%
\newif\ifIncludeURLsInBib%
\IncludeURLsInBibtrue%
\makeatletter%
\renewcommand{\printbibliography}{%
    \addtocontents{toc}{\protect\tocinappendixfalse}%
    \tocinappendixfalse%
    \ifshortdoc%
        \section[bibliography]{\cstRefsList}%
        \ifonlyonecategory%
            \@biblioCategoriesNoTitle%
        \else%
            \@biblioCategories%
        \fi%
    \else%
        \printbibheading%
        \ifcategoriesused%
            \section*[bibliography_author]{\cstRefsAuthor}%
            \ifonlyonecategory%
                \@biblioCategoriesNoTitle%
            \else%
                \@biblioCategories%
            \fi%
            \ifIncludeExternalRefsInBib%
                \section*[bibliography_others]{\cstRefsOthers}%
                \oldprintbibliography[keyword=filter_external, heading=none]%
            \fi%
            \ifIncludeURLsInBib%
                \section*[bibliography_urls]{\cstRefsURLs}%
                \oldprintbibliography[keyword=filter_url, heading=none]%
            \fi%
        \else%
            \ifIncludeExternalRefsInBib%
                \oldprintbibliography[keyword=filter_external, heading=none]%
            \fi%
            \ifIncludeURLsInBib%
                \oldprintbibliography[keyword=filter_url, heading=none]%
            \fi%
        \fi%
    \fi%
}%
\makeatother%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% MAIN PAGE %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For the box of the title & jury
\RequirePackage[most]{tcolorbox}%
\RequirePackage{varwidth}%

% Customize main page style
% We also add an empty page after for the long version
% TOC needs to be renamed there too
\AtBeginDocument{%
    \thispagestyle{empty}%
    \newgeometry{top=1cm, bottom=1cm, left=1cm, right=1cm}%
    \input{template/includes/front}%
    \ifshortdoc%
    \else%
        \newpage%
        \thispagestyle{empty}%
        \null%
    \fi%
    \restoregeometry%
    \newpage%
    \setcounter{page}{1}%
    \renewcommand{\contentsname}{\cstTOC}%
    \silenttableofcontents}%

% For logos
\newif\iffirstlogo%
\firstlogotrue%
\newcommand{\showLogos}[1]{%
    \begingroup%
    \let\oldincludegraphics\includegraphics%
    \renewcommand{\includegraphics}[2][]{\oldincludegraphics[height=#1]{##2}}%
    \logos%
    \endgroup}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% BACK COVER %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For the columns
\RequirePackage{multicol}%
\setlength{\columnsep}{2cm}%
\setlength{\columnseprule}{0.4pt}%

% Add a back cover
% We also add a blank page before for the long version
\AtEndDocument{%
    \cleardoublepage%
    \thispagestyle{empty}%
    \newgeometry{top=1cm, bottom=1cm, left=1cm, right=1cm}%
    \ifshortdoc%
    \else%
        \null%
        \newpage%
        \thispagestyle{empty}%
        \input{template/includes/back}%
        \restoregeometry
    \fi}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% CONTENTS %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Arrow + content
% Usage: \arrowBox{color}{ribbon label}{heading}{rows of the table}
% The rows keep the "&" and "\\" syntax of a two-column table, but they are
% typeset one at a time instead of as a single unbreakable table: a box that is
% too tall for the space left on the page is now split over two pages, where it
% used to be pushed as a whole to the next one and leave a large void behind
% Each fragment carries its own piece of ribbon, the arrow head being drawn on
% the first fragment only, and the tip on the last one only. The label is not
% repeated: it runs along the whole ribbon, each fragment taking the words that
% fit in its own piece and leaving the others to the next one
% Constraints on the rows: exactly one "&" per row, no optional argument to "\\",
% and nested tables must be enclosed in braces so that the "&" and "\\" they
% contain stay hidden from the parser
\RequirePackage{framed}%
\makeatletter%

% Geometry of the ribbon, all of it set from \linewidth when a box is typeset
% - "band" is the colored band, "gutter" the space it leaves before the contents,
%   and "ribbon" the total width taken on the left of them
% - "notch" is the depth of the arrow head, and of the arrow tip below the band
% - "margin" is the space left free under the tip, where the head of the next box
%   comes to nest
\newlength{\hdr@ab@band}%
\newlength{\hdr@ab@gutter}%
\newlength{\hdr@ab@notch}%
\newlength{\hdr@ab@margin}%
\newlength{\hdr@ab@ribbon}%
\newcommand{\hdr@ab@setgeometry}{%
    \setlength{\hdr@ab@band}{0.06\linewidth}%
    \setlength{\hdr@ab@gutter}{0.025\linewidth}%
    \setlength{\hdr@ab@notch}{0.02\linewidth}%
    \setlength{\hdr@ab@margin}{0.12cm}%
    \setlength{\hdr@ab@ribbon}{\dimexpr\hdr@ab@band+\hdr@ab@gutter\relax}}%

% Coordinates of the shape, and dimensions of the fragment being decorated
\newlength{\hdr@ab@height}%
\newlength{\hdr@ab@xmid}%
\newlength{\hdr@ab@ynotch}%
\newlength{\hdr@ab@ybase}%
\newlength{\hdr@ab@ytip}%
\newlength{\hdr@ab@ylow}%
\newlength{\hdr@ab@yhigh}%
\newlength{\hdr@ab@ylabel}%
\newlength{\hdr@ab@avail}%
\newlength{\hdr@ab@labelwidth}%
\newlength{\hdr@ab@valuewidth}%
\newsavebox{\hdr@ab@box}%
\newsavebox{\hdr@ab@tag}%
\newif\ifhdr@ab@head%
\newif\ifhdr@ab@tip%
\newif\ifhdr@ab@whole%
\newif\ifhdr@ab@fits%

% Penalty inserted between two rows: splitting a box is allowed, but discouraged
% so that a break between two boxes is always preferred
% A fragment is never left with a single row, and never starts with the last one
\newcommand{\arrowBoxRowPenalty}{150}%
% Rows are rigid, so a fragment made of rows only could not be squeezed at all by
% "framed" when it reboxes it to the space left on the page, and TeX complained
% about an overfull \vbox. This tiny amount of shrink between two rows (invisible,
% and only a few points over a whole fragment) is enough to absorb it
\newcommand{\arrowBoxRowShrink}{1pt}%
\newcount\hdr@ab@nrows%
\newcount\hdr@ab@row%

% Before each fragment, "framed" applies the frame command to a dummy box, only
% to measure the width it adds. Nothing must be drawn then, and above all no word
% of the label must be consumed by such a trial
\newif\ifhdr@ab@measuring%
\let\hdr@ab@sizeofframe\fb@sizeofframe%
\def\fb@sizeofframe#1{\begingroup\hdr@ab@measuringtrue\hdr@ab@sizeofframe#1\endgroup}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% RIBBON LABEL %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The label, typeset in a box (to be measured, or to be rotated and drawn)
% The two transparent bars keep the text away from the ends of the ribbon
\newcommand{\hdr@ab@labelbox}[1]{%
    \sbox\hdr@ab@tag{\scriptsize\textcolor{\hdr@ab@color}{%
            \hypersetup{linkcolor=\hdr@ab@color}%
            \textbf{{\transparent{0}{|}}#1{\transparent{0}{|}}}}}}%

% Words of the label are consumed one by one, fragment after fragment
% \hdr@ab@rest holds those that are left, always ended by \hdr@ab@endword
\let\hdr@ab@endword\relax%
\def\hdr@ab@endmarker{\hdr@ab@endword}%
% A label holding an environment cannot be cut between two of its words: such a
% label is kept whole, and simply goes to the first fragment where it fits
\newif\ifhdr@ab@atomic%
\long\def\hdr@ab@testenv#1\begin#2\hdr@ab@stop{%
    \def\hdr@ab@tmp{#2}%
    \ifx\hdr@ab@tmp\@empty\hdr@ab@atomicfalse\else\hdr@ab@atomictrue\fi}%
\long\def\hdr@ab@peel#1 #2\hdr@ab@stop{\def\hdr@ab@word{#1}\gdef\hdr@ab@rest{#2}}%
\newcommand{\hdr@ab@takefirst}{\expandafter\hdr@ab@peel\hdr@ab@rest\hdr@ab@stop}%
\newcommand{\hdr@ab@putback}{%
    \xdef\hdr@ab@rest{%
        \unexpanded\expandafter{\hdr@ab@word}\space
        \unexpanded\expandafter{\hdr@ab@rest}}}%

% Whether all the words have been used
\newcommand{\hdr@ab@ifnowordleft}[2]{%
    \hdr@ab@takefirst%
    \hdr@ab@putback%
    \ifx\hdr@ab@word\hdr@ab@endmarker#1\else#2\fi}%

% Test whether one more word still fits in the piece of ribbon at hand
% Tooltips are turned off, since these trials are thrown away
\newcommand{\hdr@ab@trycandidate}{%
    \edef\hdr@ab@candidate{%
        \unexpanded\expandafter{\hdr@ab@taken}%
        \ifx\hdr@ab@taken\@empty\else\space\fi%
        \unexpanded\expandafter{\hdr@ab@word}}%
    \begingroup%
    \hdrtipsoff%
    \hdr@ab@labelbox{\hdr@ab@candidate}%
    \ifdim\wd\hdr@ab@tag>\hdr@ab@avail%
        \global\hdr@ab@fitsfalse%
    \else%
        \global\hdr@ab@fitstrue%
    \fi%
    \endgroup}%

% Take the words that fit in a piece of ribbon of length #1, leave the others
\newcommand{\hdr@ab@takewords}[1]{%
    \setlength{\hdr@ab@avail}{#1}%
    \gdef\hdr@ab@taken{}%
    \hdr@ab@takeloop}%
\newcommand{\hdr@ab@takeloop}{%
    \hdr@ab@takefirst%
    \ifx\hdr@ab@word\hdr@ab@endmarker%
        \hdr@ab@putback%
        \let\hdr@ab@next\relax%
    \else%
        \hdr@ab@trycandidate%
        \ifhdr@ab@fits%
            \global\let\hdr@ab@taken\hdr@ab@candidate%
            \let\hdr@ab@next\hdr@ab@takeloop%
        \else%
            \hdr@ab@putback%
            \let\hdr@ab@next\relax%
        \fi%
    \fi%
    \hdr@ab@next}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% RIBBON %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% One piece of ribbon, drawn in a box of zero height and depth so that it never
% interferes with the height of the fragment it decorates
% The head and the tip are omitted on a fragment that is too short for them, and
% a fragment holding nothing but glue gets no ribbon at all
\newcommand{\hdr@ab@drawribbon}{%
    \ifdim\hdr@ab@height<\baselineskip\else%
        \hdr@ab@drawpiece%
    \fi}%
\newcommand{\hdr@ab@drawpiece}{%
    \setlength{\hdr@ab@xmid}{0.5\hdr@ab@band}%
    \setlength{\hdr@ab@ynotch}{\dimexpr\hdr@ab@height-\hdr@ab@notch\relax}%
    \ifdim\hdr@ab@height<\dimexpr3\hdr@ab@notch+\hdr@ab@margin\relax%
        \hdr@ab@headfalse%
        \hdr@ab@tipfalse%
    \fi%
    \ifhdr@ab@tip%
        \setlength{\hdr@ab@ybase}{\dimexpr\hdr@ab@margin+\hdr@ab@notch\relax}%
        \setlength{\hdr@ab@ytip}{\hdr@ab@margin}%
    \else%
        \setlength{\hdr@ab@ybase}{0pt}%
        \setlength{\hdr@ab@ytip}{0pt}%
    \fi%
    % The label lies on the middle line of the band, so it is centred on what is
    % colored along that very line: the head digs a notch into it from the top,
    % the tip carries it down to its point, and neither of them is drawn on the
    % side where the box continues on another page
    % A quarter of a notch is given back at the top and taken at the bottom, as
    % centring between the two extremes exactly leaves the label sitting low
    \setlength{\hdr@ab@ylow}{\z@}%
    \ifhdr@ab@tip%
        \setlength{\hdr@ab@ylow}{\dimexpr\hdr@ab@margin+0.25\hdr@ab@notch\relax}%
    \fi%
    \setlength{\hdr@ab@yhigh}{\hdr@ab@height}%
    \ifhdr@ab@head%
        \addtolength{\hdr@ab@yhigh}{-0.75\hdr@ab@notch}%
    \fi%
    \setlength{\hdr@ab@ylabel}{\dimexpr0.5\hdr@ab@ylow+0.5\hdr@ab@yhigh\relax}%
    % Words drawn here: as many as fit, or all of them for an unbroken box, which
    % has no next fragment to leave the remaining ones to
    \hdr@ab@takewords{\dimexpr\hdr@ab@yhigh-\hdr@ab@ylow\relax}%
    \ifhdr@ab@whole%
        \hdr@ab@ifnowordleft{}{\gdef\hdr@ab@taken{}}%
    \fi%
    \ifx\hdr@ab@taken\@empty\else%
        \hdr@ab@labelbox{\hdr@ab@taken}%
    \fi%
    \raisebox{-\dp\hdr@ab@box}[\z@][\z@]{\makebox[\hdr@ab@ribbon][l]{%
            \begin{tikzpicture}[inner sep=0pt, outer sep=0pt, baseline=0pt]%
                \useasboundingbox (0pt, 0pt) rectangle (\hdr@ab@ribbon, \hdr@ab@height);%
                \fill[\hdr@ab@color!20]%
                (0pt, \hdr@ab@height)%
                \ifhdr@ab@head%
                    -- (\hdr@ab@xmid, \hdr@ab@ynotch)%
                \fi%
                -- (\hdr@ab@band, \hdr@ab@height)%
                -- (\hdr@ab@band, \hdr@ab@ybase)%
                \ifhdr@ab@tip%
                    -- (\hdr@ab@xmid, \hdr@ab@ytip)%
                \fi%
                -- (0pt, \hdr@ab@ybase)%
                -- cycle;%
                \ifx\hdr@ab@taken\@empty\else%
                    \node[anchor=center] at (\hdr@ab@xmid, \hdr@ab@ylabel)%
                    {\rotatebox{-90}{\usebox\hdr@ab@tag}};%
                \fi%
            \end{tikzpicture}}}}%

% Decoration of one fragment: the piece of ribbon, then the contents
% "framed" hands over the fragment as a box, and calls this once per page
\long\def\hdr@ab@frame#1{%
    \sbox\hdr@ab@box{#1}%
    \setlength{\hdr@ab@height}{\dimexpr\ht\hdr@ab@box+\dp\hdr@ab@box\relax}%
    \ifhdr@ab@measuring%
        \hbox{\kern\hdr@ab@ribbon\box\hdr@ab@box}%
    \else%
        \hbox{\hdr@ab@drawribbon\box\hdr@ab@box}%
    \fi}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% ROWS %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Rows are read one by one, and split at their "&" into a label and a value
% The list ends with a sentinel row, appended by \arrowBox and detected here
\def\hdr@ab@sentinel{}%
\def\hdr@ab@sentinelrow{\hdr@ab@sentinel}%
\long\def\hdr@ab@rowloop#1\\{%
        \def\hdr@ab@thisrow{#1}%
        \ifx\hdr@ab@thisrow\hdr@ab@sentinelrow%
            \let\hdr@ab@next\relax%
        \else%
            \ifblank{#1}{}{\hdr@ab@dorow#1\hdr@ab@endrow}%
            \let\hdr@ab@next\hdr@ab@rowloop%
        \fi%
        \hdr@ab@next}%

% First pass over the rows: width of the widest label, as the "r" column of a
% table would have it (tooltips are turned off, since this copy is thrown away)
\long\def\hdr@ab@measurerow#1&#2\hdr@ab@endrow{%
    \global\advance\hdr@ab@nrows\@ne%
    \begingroup%
    \hdrtipsoff%
    \sbox\hdr@ab@box{\ignorespaces#1\unskip}%
    \ifdim\wd\hdr@ab@box>\hdr@ab@labelwidth%
        \global\hdr@ab@labelwidth=\wd\hdr@ab@box%
    \fi%
    \endgroup}%

% Second pass: each row becomes a table of its own, so that a page break may
% occur between two of them. No interline glue between the rows, so that the
% vertical rules of the successive tables join
\long\def\hdr@ab@emitrow#1&#2\hdr@ab@endrow{%
    \advance\hdr@ab@row\@ne%
    \ifnum\hdr@ab@row>\@ne%
        \nointerlineskip%
    \fi%
    \hbox{%
        \begin{tabular}[t]{%
                >{\raggedleft\arraybackslash\ignorespaces}p{\hdr@ab@labelwidth}<{\unskip}%
                |>{\ignorespaces}p{\hdr@ab@valuewidth}<{\unskip}}%
            #1 & #2 %
        \end{tabular}}%
    \ifnum\hdr@ab@row=\@ne%
        \nopagebreak%
    \else%
        \ifnum\hdr@ab@row<\hdr@ab@nrows%
            \ifnum\numexpr\hdr@ab@row+\@ne\relax=\hdr@ab@nrows%
                \nopagebreak%
            \else%
                \penalty\arrowBoxRowPenalty%
            \fi%
        \fi%
    \fi%
    \ifnum\hdr@ab@row<\hdr@ab@nrows%
        \vskip\z@\@minus\arrowBoxRowShrink%
    \fi}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% BOX %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\arrowBox}[4]{%
    \par%
    \begingroup%
    \hdr@ab@setgeometry%
    \def\hdr@ab@color{#1}%
    \hdr@ab@testenv#2\begin\hdr@ab@stop%
    \ifhdr@ab@atomic%
        \xdef\hdr@ab@rest{\unexpanded{{#2}}\space\noexpand\hdr@ab@endword\space}%
    \else%
        \xdef\hdr@ab@rest{\unexpanded{#2}\space\noexpand\hdr@ab@endword\space}%
    \fi%
    % Same decoration everywhere, except for the head and the tip
    \def\FrameCommand{\hdr@ab@headtrue\hdr@ab@tiptrue\hdr@ab@wholetrue\hdr@ab@frame}%
    \def\FirstFrameCommand{\hdr@ab@headtrue\hdr@ab@tipfalse\hdr@ab@wholefalse\hdr@ab@frame}%
    \def\MidFrameCommand{\hdr@ab@headfalse\hdr@ab@tipfalse\hdr@ab@wholefalse\hdr@ab@frame}%
    \def\LastFrameCommand{\hdr@ab@headfalse\hdr@ab@tiptrue\hdr@ab@wholefalse\hdr@ab@frame}%
    % Spacing around the contents, chosen to reproduce the look of the previous
    % (unbreakable) version: no space added by "framed" between two boxes, and
    % the negative kern compensates what it adds after each of them
    \setlength{\OuterFrameSep}{\z@}%
    % When "framed" squeezes a fragment into the space left on the page, it also
    % cancels its own simulated glue, which can leave less shrink than it takes:
    % the last points then overflow the box. They fall in the padding below the
    % last row, where they cannot be seen, so they are not worth a warning
    \vfuzz\valparskip%
    \global\hdr@ab@labelwidth=\z@%
    \global\hdr@ab@nrows=\z@%
    \let\hdr@ab@dorow\hdr@ab@measurerow%
    \hdr@ab@rowloop#4\\\hdr@ab@sentinel\\%
    % \@secpenalty is the (attractive) penalty a sectioning command adds before
    % itself: left alone, the \paragraph of the heading would offer a breakpoint
    % at the very top of the box, and "framed" would happily split there
    \MakeFramed{\advance\hsize-\width \FrameRestore%
        \parindent\z@ \parskip\z@ \@secpenalty\@M}%
    \setlength{\hdr@ab@valuewidth}{%
        \dimexpr\hsize-\hdr@ab@labelwidth-4\tabcolsep-\arrayrulewidth\relax}%
    % Plain \vskip, not \vspace*: the latter inserts a zero-height rule, which
    % would make this very first glue a legal breakpoint and let "framed" split
    % the box right there, leaving a stub of ribbon at the bottom of the page
    % Both paddings may shrink a little, so that a fragment squeezed by
    % "framed" to fit the space left on the page does not overflow its box
    \vskip\dimexpr\valparskip\relax\@minus\dimexpr\valparskip\relax%
    \titlespacing*{\paragraph}{0pt}{0.5\valparskip}{0pt}%
    \textcolor{missingColor}{#3~}\par%
    \nopagebreak%
    \vskip\dimexpr\valparskip\relax\@minus\dimexpr\valparskip\relax%
    \hdr@ab@row=\z@%
    \let\hdr@ab@dorow\hdr@ab@emitrow%
    \hdr@ab@rowloop#4\\\hdr@ab@sentinel\\%
    \nopagebreak%
    \vskip\dimexpr2.5\valparskip\relax\@minus\dimexpr2\valparskip\relax%
    \endMakeFramed%
    \kern-\valparskip%
    \endgroup}%
\makeatother%

% Boxes
\RequirePackage[most]{tcolorbox}%
\tcbset{%
    boxstyle/.style={%
            breakable,%
            coltitle=black,%
            colbacktitle=white,%
            colback=boxEnvColor,%
            enhanced,%
            attach boxed title to top center={yshift=-3mm},%
            boxed title style={boxrule=1pt, left=3mm, right=3mm, bottom=1mm, top=1mm, boxrule=0.5pt},%
            boxrule=0.5pt,%
            middle=3mm,%
            top=5.5mm,%
            bottom=3mm,%
            before skip=\textfloatsep,%
            after skip=\textfloatsep,%
        }}%

% Generic box environment
% Usage: \begin{box}[label]{type}[title] or \begin{box*}[label]{type}[title]
% - type: e.g., challenge, definition, proposition, lemma, theorem, example, or any custom type
% - If \cst<Type> exists (e.g., \cstChallenge), it is used as the display name
% - Otherwise, the type with first letter capitalized is used
% - A counter <type>counter is created automatically on first use
\RequirePackage{pdftexcmds}%
\makeatletter%
\newlength{\boxmaxtitlewidth}%
\newlength{\boxtitlewidth}%
\newcommand{\box@hash}[1]{\pdf@mdfivesum{#1}}%
\newcommand{\box@countername}[1]{boxcounter@\box@hash{#1}}%
\newcommand{\box@ensurecounter}[1]{%
    \ifcsname c@\box@countername{#1}\endcsname\else%
        \newcounter{\box@countername{#1}}%
    \fi%
}%
\newcommand{\box@setcapitalized}[1]{\expandafter\box@setcap@helper#1\relax}
\def\box@setcap@helper#1#2\relax{%
    \uppercase{\def\box@capresult{#1}}%
    \expandafter\def\expandafter\box@capresult\expandafter{\box@capresult#2}%
}%
\newcommand{\box@displayname}[1]{%
    \box@setcapitalized{#1}%
    \ifcsname cst\box@capresult\endcsname%
        \csname cst\box@capresult\endcsname%
    \else%
        \box@capresult%
    \fi%
}%
\NewDocumentEnvironment{boxenv}{o m O{}}{%
    \phantomsection%
    \setlength{\boxmaxtitlewidth}{\dimexpr0.9\linewidth-7.5mm\relax}%
    \if\relax\detokenize{#2}\relax%
        \IfBlankTF{#3}{%
            \def\@currentlabelname{\cstBox}%
            \IfValueT{#1}{\label{#1}}%
            \begin{tcolorbox}[boxstyle]%
        }{%
            \begin{tcolorbox}[boxstyle,title={%
                        \begin{varwidth}{\boxmaxtitlewidth}#3\end{varwidth}}]%
        }%
    \else%
        \box@ensurecounter{#2}%
        \refstepcounter{\box@countername{#2}}%
        \protected@edef\@currentlabelname{#2~\csname the\box@countername{#2}\endcsname}%
        \settowidth{\boxtitlewidth}{#2~\csname the\box@countername{#2}\endcsname\quad}%
        \IfValueT{#1}{\label{#1}}%
        \begin{tcolorbox}[boxstyle,title={%
                    \begin{varwidth}{\boxmaxtitlewidth}%
                        \begingroup%
                        \hypersetup{citecolor=titlesColor}%
                        \textcolor{titlesColor}{#2~\csname the\box@countername{#2}\endcsname}%
                        \endgroup%
                        \IfBlankF{#3}{%
                            \quad\begin{varwidth}[t]{\dimexpr\boxmaxtitlewidth-\boxtitlewidth\relax}%
                                #3%
                            \end{varwidth}%
                        }%
                    \end{varwidth}}]%
    \fi%
}{%
    \end{tcolorbox}%
}%
\NewDocumentEnvironment{boxenv*}{o m O{}}{%
    \phantomsection%
    \setlength{\boxmaxtitlewidth}{\dimexpr0.9\linewidth-7.5mm\relax}%
    \if\relax\detokenize{#2}\relax%
        \def\@currentlabelname{\cstBox}%
        \IfValueT{#1}{\label{#1}}%
        \IfBlankTF{#3}{%
            \begin{tcolorbox}[boxstyle]%
        }{%
            \begin{tcolorbox}[boxstyle,title={%
                        \begin{varwidth}{\boxmaxtitlewidth}#3\end{varwidth}}]%
        }%
    \else%
        \def\@currentlabelname{#2}%
        \settowidth{\boxtitlewidth}{#2\quad}%
        \IfValueT{#1}{\label{#1}}%
        \begin{tcolorbox}[boxstyle,title={%
                    \begin{varwidth}{\boxmaxtitlewidth}%
                        \begingroup%
                        \hypersetup{citecolor=titlesColor}%
                        \textcolor{titlesColor}{#2}%
                        \endgroup%
                        \IfBlankF{#3}{%
                            \quad\begin{varwidth}[t]{\dimexpr\boxmaxtitlewidth-\boxtitlewidth\relax}%
                                #3%
                            \end{varwidth}%
                        }%
                    \end{varwidth}}]%
    \fi%
}{%
    \end{tcolorbox}%
}%
\makeatother%

% Proof
\makeatletter%
\tcbset{
    proofstyle/.style={%
            segmentation hidden,%
            top=-2.5mm,%
            after lower={\hfill$\square$}%
        }}%
\NewDocumentEnvironment{proof}{o m}%
{%
    \phantomsection%
    \if\relax\detokenize{#2}\relax%
        \def\@currentlabelname{\cstProof}%
        \IfValueT{#1}{\label{#1}}%
        \begin{tcolorbox}[boxstyle, proofstyle, title={\textcolor{titlesColor}{\cstProof}}]%
    \else%
        \edef\@currentlabelname{\cstProofOf~\nameref{#2}}%
        \IfValueT{#1}{\label{#1}}%
        \begin{tcolorbox}[boxstyle, proofstyle, title={\textcolor{titlesColor}{\cstProofOf~{\hypersetup{linkcolor=titlesColor}\nameref{#2}}}}]%
    \fi%
    \tcblower%
}{%
    \end{tcolorbox}%
}%
\NewDocumentEnvironment{proof*}{o m}%
{%
    \phantomsection%
    \if\relax\detokenize{#2}\relax%
        \def\@currentlabelname{\cstProof}%
        \IfValueT{#1}{\label{#1}}%
        \begin{tcolorbox}[boxstyle, proofstyle, title={\textcolor{titlesColor}{\cstProof}}]%
    \else%
        \edef\@currentlabelname{\cstProofOf~\nameref{#2}}%
        \IfValueT{#1}{\label{#1}}%
        \begin{tcolorbox}[boxstyle, proofstyle, title={\textcolor{titlesColor}{\cstProofOf~{\hypersetup{linkcolor=titlesColor}\nameref{#2}}}}]%
    \fi%
    \tcblower%
}{%
    \end{tcolorbox}%
}%
\makeatother%

% Itemize with stuff other than text inside
\newcommand{\complexItem}[1]{%
    \item \raisebox{\fpeval{0.8*\ht\strutbox - \height}pt}{#1}\par\vspace{\cstItemizeSpacing}}%

% Usual macros
\RequirePackage{xspace}%
\newcommand{\ie}{\emph{i.e.,}\xspace}%
\newcommand{\eg}{\emph{e.g.,}\xspace}%
\newcommand{\etal}{\emph{et al.}\xspace}%
\newcommand{\latex}{\LaTeX\hspace{0.1em}}%

% Inclusive writing
\DeclareRobustCommand{\incl}[1]{{\transparent{0.5}{#1}}}%

% Quotations
\DeclareRobustCommand{\inquotes}[1]{\emph{``#1''}}%
\DeclareRobustCommand{\quotation}[2]{%
    \begin{center}%
        \begin{minipage}{0.8\linewidth}%
            \inquotes{#2}\par~\par%
            \hfill --- \emph{#1}%
        \end{minipage}%
    \end{center}}%

% Initials of a name
\ExplSyntaxOn
\tl_new:N \l__hdr_initials_tl
\seq_new:N \l__hdr_initials_seq
\cs_new_protected:Npn \__hdr_initials_add:n #1
{
    \tl_if_blank:nF {#1}
    { \tl_put_right:Nx \l__hdr_initials_tl { \text_uppercase:n { \tl_head:n {#1} } . } }
}
\cs_new_protected:Npn \__hdr_initials:n #1
{
    \tl_clear:N \l__hdr_initials_tl
    \tl_set:Nx \l_tmpa_tl { \text_purify:n {#1} }
    \tl_replace_all:Nnn \l_tmpa_tl { - } { ~ }
    \seq_set_split:NnV \l__hdr_initials_seq { ~ } \l_tmpa_tl
    \seq_map_function:NN \l__hdr_initials_seq \__hdr_initials_add:n
}
\NewDocumentCommand { \nameInitials } { m }
{ \__hdr_initials:n {#1} \tl_use:N \l__hdr_initials_tl }
\NewDocumentCommand { \authorInitials } { }
{ \nameInitials { \authorFirstName \c_space_tl \authorName } }
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% FINAL ADJUSTMENTS %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Correct spacing within environments
% Needs to be done here to avoid errors
\makeatletter%
\AtBeginEnvironment{itemize}{%
    \let\old@itemcr\\%
    \renewcommand{\\}{\old@itemcr[\valitemskip]}}%
\AtEndEnvironment{itemize}{%
    \let\\\old@itemcr}%
\AtBeginEnvironment{enumerate}{%
    \let\old@itemcr\\%
    \renewcommand{\\}{\old@itemcr[\valitemskip]}}%
\AtEndEnvironment{enumerate}{%
    \let\\\old@itemcr}%
\AtBeginEnvironment{minipage}{%
    \let\old@centercr\@centercr%
    \renewcommand\@centercr{%
        \par%
        \vskip\valparskip}%
    \let\old@normalcr\@normalcr%
    \renewcommand\@normalcr{%
        \par%
        \vskip\valparskip}}%
\AtEndEnvironment{minipage}{%
    \let\@centercr\old@centercr%
    \let\@normalcr\old@normalcr}%
\makeatother%

% Customize footnotes
% Should be here to avoid differences between long/short doc
\RequirePackage{chngcntr}%
\counterwithout{footnote}{chapter}%
\setlength{\skip\footins}{30pt}%
\makeatletter%
\AtBeginDocument{%
    \renewcommand{\@makefntext}[1]{%
        \Hy@raisedlink{\hypertarget{Hfootnote.\@thefnmark}{}}%
        \small\makebox[2em][l]{\textcolor{titlesColor}{(\@thefnmark)}}#1%
    }%
    \renewcommand{\@makefnmark}{%
        \hyperlink{Hfootnote.\@thefnmark}{%
            \textsuperscript{\small(\@thefnmark)}%
        }%
    }%
}%
\makeatother%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% LET'S GO! %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Placeholder text generator, handy while drafting (\lipsum, \lipsum[1-3], ...)
\RequirePackage{lipsum}%

% Print every entry of the bibliography, even those that are not cited
% This is generally what you want for an HDR, where the bibliography doubles as a list of publications
% Comment this line out if you only want the entries you actually cite
\nocite{*}%

% Done
\endinput%