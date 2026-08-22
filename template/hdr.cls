%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% INFORMATION %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This is the template I made for my HDR, feel free to adapt it for yours or your PhD
% Normally, you do not need to edit this file
% It provides the following options:
% - \documentclass[hdr_demand, french]{template/hdr} if you need to write a shorter HDR demand document (here, in French)
% - \documentclass[hdr, english]{template/hdr}       for the main HDR manuscript
% - \documentclass[phd, english]{template/hdr}       for a PhD manuscript
% Both "french" and "english" are available for the three document types
% Some commands have been defined that need to be used to make this work properly
% Check "main_hdr.tex", "main_demand.tex" and "main_phd.tex" for three complete examples

% Important remarks:
% - It is not possible to use parts, please start with chapters
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
\usepackage{qrcode}%

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

% Format parts as chapters
% This allows a needed hack, as added non-numbered chapters seem to break minitoc
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

% Needed hack to have acronyms in paragraphs/TOC
\newcommand{\glsintitle}[1]{\texorpdfstring{\glslink{#1}{\glsentryname{#1}}}{\glsentryname{#1}}}%
\renewcommand{\gls}{\glsintitle}%

% Tooltips for acronyms
% This breaks appendices :(
% That's why there is a \lappendix{...}
\RequirePackage{soul}%
\RequirePackage{pdfcomment}%

% Tooltips that are also links (see "test/" for the comparison of the candidate
% PDF mechanisms). A pdfcomment tooltip is a read-only push button widget
% carrying /TU; a viewer only honours it, and the action attached to it, when the
% widget is a real form field, so every tooltip is collected here and declared in
% the document catalog's /AcroForm at the very end of the document
\makeatletter%
\ifdefined\pdfextension% LuaTeX renamed every pdfTeX primitive
    \protected\def\hdr@catalog{\pdfextension catalog }%
    \def\hdr@lastannot{\the\numexpr\pdffeedback lastannot\relax}%
\else%
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

% tabularx measures its content in trial passes and throws the result away, and
% the CV is full of tabularx (181 \arrowBox instances). Suppress tooltips during
% those passes, otherwise every discarded copy leaves a reserved annotation
% object behind. No group here: tabularx reads \@tempboxa after the trial, so a
% group would undo its \setbox
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
        \pdftooltip{#3}{#2}%
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

% Hack: Format chapter titles for unnumbered sections
% Part instead of chapter to avoid minitoc disappearing somehow
% This probably prevents from using parts correctly
% Ideally, we would use: \addcontentsline{toc}{chapter}{#1}
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

% Use biblatex
\RequirePackage{csquotes}%
\RequirePackage[backend=biber, style=authoryear, natbib=true, sorting=customsort, backref=true, url=false, isbn=false, doi=false, dashed=false, maxnames=99]{biblatex}%

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
    \sort[direction=ascending]{\field{usera}}%
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
                        \myabbr{\thefield{usera}}%
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

% Macro to duplicate icons if a list is provided
% Customize missing entries with following constant
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

% Macro for the icons
\newcommand{\bibEntryIcons}{%
    \iffieldundef{howpublished}{%
        \iffieldequalstr{usera}{nousera}{%
            \printIconList{\faNewspaper[regular]}{url}%
            \ifshortdoc\else---\hspace{0.2cm}\fi%
        }{%
            \printIconList{\faNewspaper[regular]}{url}%
            \printIconList{\faImages}{userf}%
            \printIconList{\faImage}{userb}%
            \printIconList{\faGithub}{userd}%
            \printIconList{\faYoutube}{userc}%
            \printIconList{\faTrophy}{usere}%
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
            #2%
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
    \end{minipage}%
    \par\vspace*{\cstBiblioEntriesSpacing}%
}%

\makeatletter%
% Citations: tooltip with the title of the entry + link to its bibliography entry
\DeclareRobustCommand{\citeTooltip}[2]{% #1 = tooltip, #2 = text
    \edef\hdr@cite@dest{cite.\the\c@refsection @\abx@field@entrykey}%
    % \bibhyperref provides the /Link (and the colour), \hdrTooltip the widget
    \bibhyperref{\hdrTooltip{\hdr@cite@dest}{#1}{#2}}}%
\makeatother%

% Same, for entries that are excluded from the bibliography: nothing to link to
\DeclareRobustCommand{\citeTooltipNoLink}[2]{%
    \hdrTooltip{}{#1}{\textcolor{linksColor}{#2}}}%

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
    \iffieldequalstr{usera}{nousera}{%
        \iffieldundef{addendum}{}{%
            \errmessage{External references should not have "usera" or "addendum" fields (found in \thefield{entrykey})}%
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
            \ifcsname abbr@\thefield{usera}\endcsname\else%
                \errmessage{Citing reference \thefield{entrykey} with undeclared category "\thefield{usera}". This entry will not appear in the bibliography}%
            \fi%
            \ifonlyonecategory%
                \citeTooltip{\thefield{title}}{%
                    \printnames{labelname}\setunit{,\space}\printfield{year}%
                    \iffieldundef{note}{}{\textsuperscript{(\printfield{note})}}%
                }%
            \else%
                \citeTooltip{\thefield{title}}{\myabbr{\thefield{usera}}}%
                \iffieldundef{addendum}{}{\textsubscript{\scriptsize\number\numexpr\thefield{addendum}\relax}}%
            \fi%
        \else%
            \errmessage{When no categories are used, no references should have "usera" or "addendum" fields (found in \thefield{entrykey}). This entry will not appear in the bibliography}%
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

% Nothing on header for odd pages in bibliography%
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
        \errmessage{Duplicate bibliography category \thefield{usera}}%
    \else%
        \expandafter\gdef\csname abbr@#1\endcsname{#2}%
    \fi%
    \DeclareSourcemap{%
        \maps[datatype=bibtex]{%
            \map{%
                \step[fieldsource=usera, match=\regexp{#1}, final]%
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
            \step[fieldsource=usera, null]%
            \step[fieldset=usera, fieldvalue={nousera}]%
            \step[fieldsource=usera, match=\regexp{nousera}, final]%
            \step[fieldsource=howpublished, null, final]%
            \step[fieldset=keywords, fieldvalue={filter_url}, append]%
        }%
        \map{%
            \step[fieldsource=usera, null]%
            \step[fieldset=usera, fieldvalue={nousera}]%
            \step[fieldsource=usera, match=\regexp{nousera}, final]%
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
\makeatletter%
\newcommand{\arrowBox}[4]{%
    \begingroup%
    \begin{tikzpicture}%
        \node (table) at (0.085\linewidth, 0) {%
            \let\old@centercr\@centercr%
            \let\old@normalcr\@normalcr%
            \begin{minipage}{0.915\linewidth}%
                \let\@centercr\old@centercr%
                \let\@normalcr\old@normalcr%
                \vspace*{-\topskip}%
                \vspace{2\valparskip}%
                \titlespacing*{\paragraph}{0pt}{0.5\valparskip}{0pt}%
                \textcolor{missingColor}{#3~}\par\vspace*{\valparskip}%
                \begin{tabularx}{\linewidth}{r|X}%
                    #4%
                \end{tabularx}%
                \vspace{2\valparskip}%
            \end{minipage}%
        };%
        \coordinate (topwest) at (table.west|-table.north);%
        \coordinate (southwest) at (table.west|-table.south);%
        \fill[#1!20]%
        ([xshift=-0.085\linewidth]topwest) --%
            ([xshift=-0.055\linewidth, yshift=-0.02\linewidth]topwest) --%
            ([xshift=-0.025\linewidth]topwest) --%
            ([xshift=-0.025\linewidth, yshift={0.02\linewidth+0.12cm}]southwest) --%
            ([xshift=-0.055\linewidth, yshift=0.12cm]southwest) --%
            ([xshift=-0.085\linewidth, yshift={0.02\linewidth+0.12cm}]southwest) --%
        cycle;%
        \node[anchor=center] at ([xshift=-0.055\linewidth, yshift=-0.005\linewidth]table.west){\rotatebox{-90}{\scriptsize{\textcolor{#1}{\hypersetup{linkcolor=#1}\textbf{{\transparent{0}{|}}#2{\transparent{0}{|}}}}}}};
    \end{tikzpicture}%
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