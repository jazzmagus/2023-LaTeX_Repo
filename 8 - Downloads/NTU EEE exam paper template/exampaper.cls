% Ling KV, 20 Aug 2006, created
% ekvling@ntu.edu.sg

\ProvidesClass{exampaper}[2006/08/20 EEE Exam Paper Class]
\NeedsTeXFormat{LaTeX2e}[2001/06/01]

\LoadClassWithOptions{article}

\usepackage[a4paper]{geometry}
\usepackage{fancyhdr}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\lhead{} \chead{} \rhead{\subjectcode} \lfoot{} \cfoot{\thepage}
\rfoot{}

\setlength{\parskip}{1.5ex plus0.5ex minus 0.5ex}
\setlength{\parindent}{0mm}

\newcommand{\Qmarks}[1]{\begin{flushright}
  (#1 marks)\end{flushright}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
\renewcommand{\baselinestretch}{1.2}
\thispagestyle{fancy}
\pagestyle{fancy}
\begin{minipage}[t]{\textwidth}
\vspace{10mm}
\begin{center}
  \bf \large \underline{NANYANG TECHNOLOGICAL UNIVERSITY}\\
  \underline{\semester\ EXAMINATION \acadyear}\\
  \underline{\subjectcode\ - \subjecttitle}
\end{center}
\vspace{10mm}
\examdate\ \hfill Time Allowed: \timeallowed\ hours
\end{minipage}
\vspace{10mm}

{\underline{\bf INSTRUCTIONS}}
}

\AtEndDocument{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The last page of the exam paper
\vspace{10mm}
\begin{center}
End of Paper
\end{center}
\newpage
\cfoot{}\rhead{}
\renewcommand{\baselinestretch}{1.0}

%for 11pt, use \huge
%for 12pt, use \LARGE
{\LARGE {\bf \subjectcode\ \subjecttitle}

\vspace{40mm}

Please read the following instructions carefully.

\begin{enumerate} \setlength{\itemsep}{15mm}
  \item {\bf Do not turn over the question paper until you are
  told to do so. Disciplinary action may be taken against you if
  you do so.}

  \item You are not allowed to leave the examination hall unless
  accompanied by an invigilator. You may raise your hand if you
  need to communicate with the invigilator.

  \item Write ONLY your Matriculation Number on the front of the
  answer book. Do not write your name.

  \item Please indicate clearly in the answer book (at the
  appropriate place) if you are continuing the answer to a
  question elsewhere in the book.
\end{enumerate}
}
}
