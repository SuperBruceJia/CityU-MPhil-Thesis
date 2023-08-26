\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cityuthesis}
\LoadClass[a4paper, twoside, 12pt]{book}

%%=================Declare Options=============================== 
\newif\if@draft\@draftfalse
\DeclareOption{draft}{\@drafttrue}  %% Draft mode
\DeclareOption*{\InputIfFileExists{\CurrentOption.sty}{}%
{\ClassWarning{}{\CurrentOption: Undefined Option or Package}}}
\ProcessOptions\relax

%%================Required packages==============================
\RequirePackage{amsmath, amsthm, amsfonts, amssymb, mathrsfs} 
\RequirePackage{CJK} % To output chinese
\if@draft\else{\PassOptionsToPackage{nocites, norefs, nomsgs, ignoreunlbld}{refcheck}}\fi
%%The refcheck check takes effect only in draft mode
\RequirePackage{refcheck}

%%=========== Page size and margin ===================================
\usepackage[top=1.25in, bottom=1.25in, left=1.25in, right=1.25in]{geometry}
%\renewcommand{\baselinestretch}{1.5}

%%================Clear Doublepage Head==============================
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}
    \thispagestyle{plain}
    \newpage
    \if@twocolumn\hbox{}\newpage\fi\fi\fi
}

%%========== Pages style and headings ========================================
\def\chaptermark#1{\markboth{}{\ifnum \c@secnumdepth>\m@ne
   \if@mainmatter
   \@chapapp\ \thechapter \ \fi\fi #1}
}
\def\sectionmark#1{\markright{\ifnum \c@secnumdepth >\z@
   \thesection \ \fi #1}}

\newdimen\headrulewidth
\setlength\headrulewidth{0.8pt}

\newcommand\ps@ThesisHeading{%
        \renewcommand\@oddhead{%
           \begin{minipage}{\textwidth}\normalsize%
               \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
                  {\bf \rightmark} & { }
               \end{tabular*}%
               \vspace{-2.5ex}
               \rule{\textwidth}{\headrulewidth}
           \end{minipage}}
       
		% \renewcommand\@evenhead{}
        \renewcommand\@evenhead{%
           \begin{minipage}{\textwidth}\normalsize%
               \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
                  {\bf \rightmark} & { }
               \end{tabular*}%
               \vspace{-2.5ex}
               \rule{\textwidth}{\headrulewidth}
           \end{minipage}}
%        \renewcommand\@oddfoot{}
%        \renewcommand\@evenfoot{}
			\renewcommand\@oddfoot{
					\begin{minipage}{\textwidth}\normalsize
							\centering
							\thepage
				%			\vspace{-1ex}
						\end{minipage}}
			
			\renewcommand\@evenfoot{
					\begin{minipage}{\textwidth}\normalsize
							\centering
							\thepage
				%			\vspace{-1ex}
						\end{minipage}}
}

%\renewcommand\ps@plain{\ps@empty}
\pagestyle{ThesisHeading}
\addtolength{\headheight}{\baselineskip} %% this is to compensate the heading

%%========== To change the heading of tableofcontentes ========================
\renewcommand{\tableofcontents}{\chapter*{\contentsname
                        \@mkboth{\contentsname}{\contentsname}}
                        \@starttoc{toc}}

%%===== Environments: Abstract, Ackknowledgement and Bibliography =====
\newenvironment{abstract}{
       \if@mainmatter   
           \chapter*{\abstractname}
             \markboth{\abstractname}{\abstractname}
             \addcontentsline{toc}{chapter}{\abstractname}
       \else \chapter{\abstractname}
        \fi }{}
\global\let\abstractname\relax
\def\abstractname{Abstract}

\newenvironment{acknowledgement}{
        \if@mainmatter
             \chapter*{\acknowledgementname}
             \markboth{\acknowledgementname}{\acknowledgementname}
             \addcontentsline{toc}{chapter}{\acknowledgementname} 
        \else \chapter{\acknowledgementname} 
        \fi}{}
\global\let\acknowledgementname\relax
\def\acknowledgementname{Acknowledgements}

\renewenvironment{thebibliography}[1]
   {\if@mainmatter 
      \chapter*{\bibname}%
      \addcontentsline{toc}{chapter}{\bibname}%
      \@mkboth{\bibname}{\bibname}%
    \else
      \chapter{\bibname}%
    \fi% 
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
   	{ \def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

%%============End of cityuthesis.cls =================================

\hfuzz=5pt
