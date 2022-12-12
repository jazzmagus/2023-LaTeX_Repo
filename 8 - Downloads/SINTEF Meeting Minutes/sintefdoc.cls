% Generic class for SINTEF documents with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefdoc}[2019/06/01 A generic class for SINTEF documents]

\RequirePackage{etoolbox}

% Whether to change the front page layout for digital signatures;
% defaults to true
\newbool{digitalsignature}
\booltrue{digitalsignature}

% Whether the language is English;
% defaults to true
\newbool{english}
\booltrue{english}

% Whether to include a field for ISBN where relevant (only public reports)
% defaults to false
\newbool{useISBN}

% Whether to use fontspec for font selection (XeTeX and LuaTeX)
% defaults to false
\newbool{fontspec}


%%% BEGIN Options section; no \RequirePackage or \LoadClass in here %%%

% Command to provide alternative translations in English and Norwegian
\newcommand{\EnglishNorsk}[2]{\ifbool{english}{#1}{#2}}

% Classification options, internal is default as per SINTEF policy
\newcommand*{\@classification}{\EnglishNorsk{Internal}{Intern}}
\DeclareOption{unrestricted} {%
  \renewcommand*{\@classification}{\EnglishNorsk{Unrestricted}{Åpen}}%
  \booltrue{useISBN}
}
\DeclareOption{internal}{%
  \renewcommand*{\@classification}{\EnglishNorsk{Internal}{Intern}}%
}
\DeclareOption{restricted}{%
  \renewcommand*{\@classification}{\EnglishNorsk{Restricted}{Fortrolig}}%
}
\DeclareOption{confidential}{%
  \renewcommand*{\@classification}{\EnglishNorsk{Confidential}{Strengt fortrolig}}%
}
% Override and use UK instead of US English if Babel is loaded
\DeclareOption{english}  {\PassOptionsToPackage{UKenglish}{babel,datetime2}}
\DeclareOption{norsk}    {\boolfalse{english}}
\DeclareOption{digital}  {\booltrue{digitalsignature}}
\DeclareOption{manual}   {\boolfalse{digitalsignature}}
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%% END Options section %%%


\LoadClass[a4paper,11pt]{article}

% Use a prettier date format, and adapt according to language.
\RequirePackage[useregional]{datetime2}

\RequirePackage{iftex}
\ifXeTeX \booltrue{fontspec}\else\fi
\ifLuaTeX\booltrue{fontspec}\else\fi

% Carlito is a free clone of Calibri; "lining" option for normal digits.
% TeX Gyre Termes is a Times New Roman clone, also used in math mode.
\ifbool{fontspec}{ % XeLaTeX or LuaLaTeX, advanced font handling
   % load this now to avoid warnings on changed \underbar command.
  \RequirePackage{sectsty}
  \RequirePackage{fontspec,unicode-math}
  \defaultfontfeatures{Ligatures=TeX}
  \setmainfont{TeX Gyre Termes}
  \setmathfont{TeX Gyre Termes Math}
  \setsansfont{Carlito}
}{ % Ye goode olde LaTeX and PDFLaTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[lining]{carlito}
  \RequirePackage{tgtermes,mathptmx}
}
% Use sans font by default
\renewcommand{\familydefault}{\sfdefault}

% \and function for multiple authors
\renewcommand{\and}{\\*}

% Define the main logo
\RequirePackage{graphicx}
\newcommand{\@mainlogo}{Sintef_logo_blue}
\newcommand{\@website}{www.sintef.no}

\RequirePackage{sinteflabels}
\InputIfFileExists{sintefconfig}{}{%
  \ClassWarning{sintefdoc}{%
  The sintefconfig.tex file is missing.\MessageBreak
  You can generate it by double-clicking sintefconfig.js., or by
  using the sintefconfig-example.tex as a template.}
}

% The information box, longer with location (physical address)
\newcommand{\@longinfo}[1][sintefblue]{%
  \noindent%
  \scriptsize%
  \raggedright%
  \setlength{\parskip}{1ex}%
  \color{#1}%
  \textbf{\boolfalse{english}\@institute}
  \ifbool{english}{\\\@institute}{}

  \@addresslabel:\\
  \@address

  \@locationlabel:\\
  \@location

  \@website
  
  \@VATlabel: \@VAT

}

% The information box, shorter.
\newcommand{\@shortinfo}[1][sintefblue]{%
  \noindent%
  \scriptsize%
  \raggedright%
  \setlength{\parskip}{1ex}%
  \color{#1}%
  \textbf{\boolfalse{english}\@institute}
  \ifbool{english}{\\\@institute}{}

  \@addresslabel:\\\@address

  \@website

  \@VATlabel: \@VAT

}

% This separating line is used across several documents,
% for example in footers and title pages.
\RequirePackage{sintefcolor}
\newcommand{\@separator}{%
  % To make sure we have spacing on both sides, make an invisible rule, 2X tall
  \rule{0ex}{2ex}%
   % Place the dashed rule 1X high
  \textcolor{sintefgray}{\rule[1ex]{\textwidth}{0.25pt}}%
}
