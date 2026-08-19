# HDR / PhD LaTeX Template

A LaTeX template for **HDR manuscripts**, **HDR demands** and **PhD manuscripts**, in **French** or **English**.
It was originally written for my own HDR, and is shared here with three minimal, self-contained examples,
so that you can see every feature in context before writing your own document.

## What you get

* Custom covers (front page with jury composition, back page with abstract and QR code).
* Chapter pages with a background image, a chapter abstract, and a mini table of contents.
* Simplified label management: labels are declared as an **optional argument** of the sectioning command or
  environment, and recalled with `\nameref` — no more `\ref{fig:...}` next to `\autoref{sec:...}`.
* Acronyms with **tooltips** in the PDF, and an automatically generated list of acronyms.
* A bibliography split into *your own publications* (grouped by category, with clickable icons for the paper,
  the slides, the poster, the video, the code, the prize), *external references*, and *online resources*.
  Every one of those fields is a comma-separated list of URLs, so a single entry can carry several posters,
  several repositories, and so on.
* Boxes (`boxenv`) for definitions, theorems, challenges, questions..., with automatic per-type counters,
  and a dedicated `proof` environment.
* Figures, subfigures, tables and equations numbered continuously across the whole document.
* Ready-to-adapt TikZ figures: a plot of the kind a script would generate, and a career timeline.

## The three examples

| File | Document class options | What it shows |
| --- | --- | --- |
| `main_hdr.tex` | `[hdr, english]` | A full HDR manuscript: foreword, numbered chapters, appendices, bibliography, list of acronyms. |
| `main_demand.tex` | `[hdr_demand, french]` | The short document sent to the university to register for the HDR: no chapter pages, no table of contents, sworn statement and signature on the cover. |
| `main_phd.tex` | `[phd, english]` | A PhD manuscript: same commands, single jury list, appendix of proofs. |

All three share `acronyms.tex`, `bibliography.bib` and the images in `manuscript/figures/`.
Every piece of text is a placeholder: replace it with your own.

The compiled PDFs are kept in `build/`, so you can have a look at the three documents without compiling anything.

## Compiling

The template requires **LuaLaTeX** (for the fonts and the emoji flags), **biber** for the bibliography, and a
**makeglossaries** pass for the list of acronyms. The `.latexmkrc` shipped here wires all three together, so a
plain `latexmk` is enough:

```bash
latexmk -outdir=build main_hdr.tex
latexmk -outdir=build main_demand.tex
latexmk -outdir=build main_phd.tex
```

Without that `.latexmkrc`, `latexmk` does not know it has to run `makeglossaries`, and the list of acronyms comes
out **empty** — so keep the file if you start your own document from this repository.

On Overleaf, set the compiler to *LuaLaTeX* in the project menu and pick the main file you want to build:
Overleaf runs `makeglossaries` on its own, and also honours the `.latexmkrc`.

## Repository layout

```
LICENSE                   GNU General Public License, version 3
.latexmkrc                Build rules: LuaLaTeX, biber, and the makeglossaries pass
build/*.pdf               The three examples, already compiled
acronyms.tex              All acronyms, shared by the three examples
bibliography.bib          All references, shared by the three examples
main_hdr.tex              Example 1 -- full HDR manuscript (English)
main_demand.tex           Example 2 -- HDR demand (French)
main_phd.tex              Example 3 -- PhD manuscript (English)
manuscript/covers/        Logos and signature shown on the covers
manuscript/figures/       Example images, an example plot, and an example timeline
manuscript/hdr/           Chapters of example 1
manuscript/demand/        Chapters of example 2
manuscript/phd/           Chapters of example 3
template/hdr.cls          The template itself -- you should not need to edit this
template/includes/        Front cover, back cover, chapter background
```

## Quick reference

```latex
\chapter[label]{Title}[Text shown on the chapter page]   % starred variant: unnumbered
\section[label]{Title}                                   % same for subsection, subsubsection, paragraph

\begin{figure}[label]{Caption}   ... \end{figure}        % no placement specifier, caption is mandatory
\begin{subfigure}[label]{width}{Caption} ... \end{subfigure}
\begin{table}[label]{Caption}    ... \end{table}
\begin{equation}[label]          ... \end{equation}

\begin{boxenv}[label]{Type}[Title] ... \end{boxenv}      % starred variant: unnumbered
\begin{proof}{label_of_statement} ... \end{proof}        % empty argument for a generic proof

\acro{ai}       % AI, with a tooltip
\acrofull{ai}   % Artificial Intelligence (AI)
\acroname{ai}   % Artificial Intelligence

\nameref{label} % "Chapter 2", "Figure 5", "Definition 1", ...
\cite{key}      % [J3], [12], ...
```

## License

This template is free software, released under the **GNU General Public License, version 3** (see `LICENSE`).
You may use it, modify it and redistribute it, provided that derived versions of the *template itself* stay
under the same license.

To be clear about what this covers: the license applies to the template — `template/hdr.cls`, its includes, and
the example files. It does **not** apply to the manuscript you write with it. Your own text, figures and results
remain entirely yours, and you are free to publish them under whatever terms you like.

## Credits

Template by [Bastien Pasdeloup](https://bastienpasdeloup.github.io/).
Feel free to reuse and adapt it — a mention is always appreciated.
Questions and suggestions: `bastien.pasdeloup@imt-atlantique.fr`.
