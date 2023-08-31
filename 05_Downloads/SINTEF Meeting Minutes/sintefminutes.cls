% Class for SINTEF meeting minutes with LaTeX.
%
% by Federico Zenith, federico.zenith@sintef.no.

\ProvidesClass{sintefminutes}[2015/10/23 A class to prepare meeting minutes in the SINTEF style]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{sintefdoc}}
\ProcessOptions\relax

\PassOptionsToPackage{table}{xcolor}
\LoadClass{sintefdoc}

% Set margins
\RequirePackage[top=3.1cm,      bottom=15ex,
                left=2.3cm,     right=2.3cm,
                headheight=1cm, footskip=2.5ex]{geometry}

% Definition of variables
\heading{\EnglishNorsk{Meeting Minutes}{Møtereferat}}

\renewcommand*{\@authorlabel}{\EnglishNorsk{WRITTEN BY}{REFERERT AV}}

% Section titles in sans serif
\RequirePackage{sectsty}
\allsectionsfont{\sffamily}

% Setting up header and footer
\RequirePackage{nccfancyhdr,lastpage}
\pagestyle{fancy}

% Header
\renewcommand{\headrulewidth}{0pt}
\fancyhead[l]{\includegraphics[width=0.25\textwidth]{\@mainlogo}}

% Footer
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[c]{%
  \sffamily%
  \color{sintefgray}
  \@separator\newline
  ~~%
  \begin{minipage}[c]{0.5\textwidth}
    \small{\textbf{\@projectlabel}}\newline
    \@project
  \end{minipage}%
  \hfill
  \thepage\ \EnglishNorsk{of}{av} \pageref{LastPage}
  ~~\newline
  \@separator
}


\RequirePackage{xparse}
\newcommand{\@participantstable}{}
\NewDocumentCommand \participant { O{present} m }{
    \g@addto@macro \@participantstable {
        \multicolumn{2}{l}{#2}
          & \ifstrequal{#1}{present}    {$\bullet$}{}
          & \ifstrequal{#1}{absent}     {$\bullet$}{}
          & \ifstrequal{#1}{information}{$\bullet$}{}\\
    }
}

\RequirePackage{tabularx,ltxtable}
\newcommand{\@tasktable}{}
\newcommand{\tasklist}{%
  \section*{\@tasklistlabel}
  \vspace{-\baselineskip} 
  \begin{longtable}{rp{0.55\textwidth}p{0.2\textwidth}l}
    \multicolumn{4}{@{}c@{}}{\@separator}\\*
    \@labeltext \@tasknumberlabel & \@labeltext \@tasklabel &
    \@labeltext \@responsiblelabel & \@labeltext \@duelabel\\*
    \multicolumn{4}{@{}c@{}}{\@separator}
    \@tasktable\\*
  \end{longtable}
}
\newcounter{sinteftask}
\newcommand{\task}[3]{%
    \g@addto@macro \@tasktable {%
      \\
      \refstepcounter{sinteftask}\thesinteftask & #1 & #2 & #3 \\*
      \multicolumn{4}{@{}c@{}}{\@separator}%
    }%
}


% Recipient address and information colophon
\RequirePackage{colortbl,tabularx,setspace,rotating}
\newcommand{\frontmatter}{%
  \sffamily%
  \noindent%
  \begin{minipage}[b]{0.7\textwidth}
    \setlength{\parskip}{2ex}%
    \Huge \@heading

    \huge\textbf \@title
    
    % ~ ensures \\ does not crash when \@wheremeeting is empty
    \Large \@wheremeeting~\\\@whenmeeting
  \end{minipage}
  \hfill
  \begin{minipage}[b]{0.25\textwidth}
    % Bring the colophon and address back up a bit
    \vspace*{-25pt}%
    \@shortinfo
  \end{minipage}

  \vspace{4ex}%
  \noindent%
  \@separator\\
  \rowcolors{4}{}{sinteflightgray}
  \begin{tabularx}{\textwidth}{XXccc}
    \rowcolor{white}
      \parbox{\linewidth}{{\@labeltext \@initiatorlabel}\\\@initiator}
      & \parbox{\linewidth}{{\@labeltext \@authorlabel}\\\@author}
      & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@presentlabel}\end{sideways}}
      & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@absentlabel}\end{sideways}}
      & \raisebox{-1.5cm}{\begin{sideways}\parbox{2cm}{\raggedright\@labeltext\@informationlabel}\end{sideways}}\\
    \rowcolor{white} \multicolumn{5}{@{}c@{}}{\@separator}\\
    \rowcolor{white} \@labeltext \@participantslabel\\
    \@participantstable
  \end{tabularx}
  \rowcolors{1}{}{} % Back to normal
  \@separator\\
  \begin{minipage}{0.45\textwidth}
    \@labeltext \@projectlabel\\
    \@project
  \end{minipage}
  \hfill
  \begin{minipage}{0.3\textwidth}
    \@labeltext \@datelabel\\
    \@date
  \end{minipage}
  \begin{minipage}{0.2\textwidth}
    \@labeltext \@classificationlabel\\
    \@classification
  \end{minipage}\\
  \@separator

  \noindent
}
