\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mathexpthesis}

% Initial Code
\newif\if@mcm@bwprint\@mcm@bwprintfalse
\newif\if@mcm@preface\@mcm@prefacetrue
\newif\if@mcm@titlepage\@mcm@titlepagetrue
\newif\if@mcm@bookmarknumber\@mcm@bookmarknumberfalse
\newif\if@mcm@openfonts\@mcm@openfontsfalse

% tokens definition
\newcommand\mcm@tokens@keywords{}
\newcommand*\mcm@tokens@groupno{}
\newcommand*\mcm@tokens@membera{}
\newcommand*\mcm@tokens@memberb{}
\newcommand*\mcm@tokens@memberc{}
\newcommand*\mcm@tokens@memberd{}

%% Declaration of Options
\DeclareOption{colorprint}{\@mcm@bwprintfalse}
\DeclareOption{bwprint}{\@mcm@bwprinttrue}
\DeclareOption{openbookmarknumber}{\@mcm@bookmarknumbertrue}
\DeclareOption{withoutpreface}{\@mcm@prefacefalse}
\DeclareOption{withouttitlepage}{\@mcm@titlepagefalse}
\DeclareOption{openfonts}{\@mcm@openfontstrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%% Executing of Options
\ExecuteOptions{colorprint}
\ProcessOptions\relax
%% Loading Class
\LoadClass[a4paper,12pt]{article}
%% Loading Package
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

\RequirePackage{ctex}
\RequirePackage{geometry}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{titletoc}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{array, tabularx}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{bigstrut}
\RequirePackage{bigdelim}
\RequirePackage{cprotect}
\RequirePackage{listings}
\RequirePackage{changepage}
\RequirePackage{appendix}
\RequirePackage{indentfirst}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{ulem}
\RequirePackage{calc}
\RequirePackage{hyperref}

% Document Layout
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}
\renewcommand*{\baselinestretch}{1.38}
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
  {\bgroup%
  \renewcommand{\arraystretch}{1.38}%
  \mcm@oldtabular}%
  {\mcm@endoldtabular\egroup}
\setlength\parindent{2em}

\if@mcm@openfonts
	% open source fonts
	\setCJKmainfont{SourceHanSerifCN-Regular}
	\setCJKfamilyfont{song}{SourceHanSerifCN-Regular}
	\setCJKfamilyfont{kai}{gkai00mp.ttf}
	\newcommand*{\kai}{\CJKfamily{kai}}
	\newcommand*{\song}{\CJKfamily{song}}
	\setCJKfamilyfont{heiti}{SourceHanSansCN-Regular}
	\renewcommand*{\heiti}{\CJKfamily{heiti}}
\else
	% built-in fonts
	\setmainfont{Times New Roman}
	\setsansfont{Arial}
	\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf}
	\newcommand*{\kai}{\CJKfamily{kai}}
	\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
	\newcommand*{\song}{\CJKfamily{song}}
\fi

\renewcommand\normalsize{%
  \@setfontsize\normalsize{12.05}{14.45}%
  \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}

% Theorem style for article
\newcounter{overall}[section]
\setcounter{overall}{1}
\newtheoremstyle{theoremdd}% name of the style to be used
{ }% measure of space to leave above the theorem. E.g.: 3pt
{ }% measure of space to leave below the theorem. E.g.: 3pt
{ }% name of font to use in the body of the theorem
{0pt}% measure of space to indent
{\bfseries}% name of head font
{ }% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmname{#1}\thmnumber{\arabic{section}.\thinspace\addtocounter{overall}{1}\arabic{overall}}\thmnote{ （#3）}}
\theoremstyle{theoremdd}

\newtheorem{definition}{\mcm@cap@definition}
\newtheorem{theorem}{\mcm@cap@theorem}
\newtheorem{lemma}{\mcm@cap@lemma}
\newtheorem{corollary}{\mcm@cap@corollary}
\newtheorem{assumption}{\mcm@cap@assumption}
\newtheorem{conjecture}{\mcm@cap@conjecture}
\newtheorem{axiom}{\mcm@cap@axiom}
\newtheorem{principle}{\mcm@cap@principle}
\newtheorem{problem}{\mcm@cap@problem}
\newtheorem{example}{\mcm@cap@example}
\newtheorem*{solution}{\mcm@cap@solution}

% Theorem style for appendix
\newtheoremstyle{theoremapd}% name of the style to be used
{ }% measure of space to leave above the theorem. E.g.: 3pt
{ }% measure of space to leave below the theorem. E.g.: 3pt
{ }% name of font to use in the body of the theorem
{0pt}% measure of space to indent
{\bfseries}% name of head font
{ }% punctuation between head and body
{ }% space after theorem head; " " = normal interword space
{\thmname{#1}\thmnumber{\Alph{section}.\thinspace\addtocounter{overall}{1}\arabic{overall}}\thmnote{ （#3）}}
\theoremstyle{theoremapd}

\newtheorem{apdefinition}{\mcm@cap@definition}
\newtheorem{aptheorem}{\mcm@cap@theorem}
\newtheorem{aplemma}{\mcm@cap@lemma}
\newtheorem{apcorollary}{\mcm@cap@corollary}
\newtheorem{apassumption}{\mcm@cap@assumption}
\newtheorem{apconjecture}{\mcm@cap@conjecture}
\newtheorem{apaxiom}{\mcm@cap@axiom}
\newtheorem{apprinciple}{\mcm@cap@principle}
\newtheorem{approblem}{\mcm@cap@problem}
\newtheorem{apexample}{\mcm@cap@example}
\newtheorem*{apsolution}{\mcm@cap@solution}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries 证明：\space]\ignorespaces
}{\popQED\endtrivlist\@endpefalse}

% Float settings
\renewcommand*{\textfraction}{0.05}
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
\renewcommand*{\floatpagefraction}{0.85}

% Picture settings
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
\graphicspath{{./}{./figures/}{./figure/}{./pictures/}{./picture/}{./pic/}{./pics/}{./image/}{./images/}}
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{%
  format=hang,
  labelsep=quad,
  font={song,minusfour,bf},
  position=bottom
}
\captionsetup[table]{%
  format=hang,
  labelsep=quad,
  font={song,minusfour,bf},
  position=top
}

% List settings
\setlist{%
  topsep=0.3em,
  partopsep=0pt,
  itemsep=0ex plus 0.1ex,
  parsep=0pt,
  leftmargin=1.5em,
  rightmargin=0em,
  labelsep=0.5em,
  labelwidth=2em
}

% Hyperref
\hypersetup{
  unicode=true,
  pdfstartview=FitH,
  CJKbookmarks=true,
  bookmarksnumbered=false,
  bookmarksopen=true,
  colorlinks,
  pdfborder=001,
  allcolors=blue,
  breaklinks=true
}
\if@mcm@bookmarknumber
  \hypersetup{bookmarksnumbered}
\else\relax\fi

\if@mcm@bwprint
  \AtBeginDocument{\hypersetup{hidelinks}}
\else\relax\fi

% Code settings
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
}

\lstnewenvironment{tcode}
  {
    \lstset{basicstyle = \small\ttfamily,
        language=TeX,
        tabsize = 4,
        frame = single,
        escapechar = `,
        breaklines = true,
        breakatwhitespace = true,
        frameround = tttt,
    }
  }
  {}

% Document Markup
\renewcommand{\maketitle}{\par
  \begingroup
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
  \endgroup
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \if@mcm@preface
  \newpage
  \null
  \setcounter{page}{0}
  %\def\thepage{0}
  \thispagestyle{empty}%
  \begin{center}
    {\includegraphics[width=0.8\textwidth]{whulogo}}
    \vskip2.25cm
  \end{center}
  \vskip2em
  \renewcommand\arraystretch{1.3}
  \noindent 
  \begin{tabularx}{\textwidth}{lX}
    \zihao{-2}\bfseries 组\qquad 号&\zihao{-2}\bfseries\mcm@tokens@groupno\\
    \hline\\[-15pt]
    \zihao{-2}\bfseries 实验题目&\zihao{-2}\bfseries\@title\\
    \hline\\[-15pt]
    \multirow{4}{*}{\zihao{-2}\bfseries 队员姓名} & \zihao{-2}\bfseries 1. \mcm@tokens@membera\hfill\null\\
    \cline{2-2}\\[-15pt]
                                                & \zihao{-2}\bfseries 2. \mcm@tokens@memberb\hfill\null\\
    \cline{2-2}\\[-15pt]
                                                & \zihao{-2}\bfseries 3. \mcm@tokens@memberc\hfill\null\\
    \cline{2-2}\\[-15pt]
                                                & \zihao{-2}\bfseries 4. \mcm@tokens@memberd\hfill\null\\
    \hline
  \end{tabularx}
  \else
  \fi
  \null
  \if@mcm@titlepage
  \makenametitle
  \fi
  }

\def\makenametitle{
\newpage
\setcounter{page}{1}
\vspace*{2.3cm}
\begin{center}
\vskip1.6cm
\begin{center}\begin{tabularx}{.95\textwidth}{@{}lX@{}}
{\zihao{4} 题\qquad 目} &\hfill\zihao{3}\heiti\@title\hfill\null\\
\cline{2-2}
\end{tabularx}
\end{center}
\newpage
}

% Chinese format for float env
\renewcommand\contentsname{\mcm@cap@contentsname}
\renewcommand\listfigurename{\mcm@cap@listfigurename}
\renewcommand\listtablename{\mcm@cap@listtablename}
\renewcommand\refname{\mcm@cap@refname}
\renewcommand\indexname{\mcm@cap@indexname}
\renewcommand\figurename{\mcm@cap@figurename}
\renewcommand\tablename{\mcm@cap@tablename}
\renewcommand\appendixname{\mcm@cap@appendixname}
\renewcommand\abstractname{\mcm@cap@abstractname}

% Chinese format for articles
\setcounter{secnumdepth}{3}
\def\@seccntformat#1{\csname the#1\endcsname\ }
\renewcommand\thesection{\arabic{section}\space}
\renewcommand\thesubsection{\arabic{section}.\thinspace\arabic{subsection}\space}
\renewcommand\thesubsubsection{\arabic{section}.\thinspace\arabic{subsection}.\thinspace\arabic{subsubsection}\space}
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  %{\centering\normalfont\Large\bfseries}}
  {\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
   {3.25ex \@plus1ex \@minus .2ex}%
   {-1em}%
   {\normalfont\normalsize\bfseries}}

% Abstract settings
\renewenvironment{abstract}{%
\if@twocolumn
    \section*{\abstractname}%
  \else
   \begin{center}%
  {\zihao{4}\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
   \end{center}%
   \quotation
  \fi}
  {\if@twocolumn\else\endquotation\newpage\null\fi}
\renewenvironment{quotation}
  {\list{}{\listparindent 2em%
   \itemindent \listparindent
   \rightmargin\z@
   \leftmargin\z@
   \parsep \z@ \@plus\p@}%
  \item\relax}
  {\endlist}

\newcommand\keywords[1]{%
  \renewcommand{\mcm@tokens@keywords}{#1}
  \par
  \vskip1ex
  {\noindent\zihao{-4}\heiti\mcm@cap@keywordsname：}~{\mcm@tokens@keywords}
}

% Appendix settings
\renewenvironment{appendices}{\par
\@resets@pp
\gdef\thesection{\@Alph\c@section}
\gdef\thesubsection{\@Alph\c@subsection}
\renewcommand\thesection{\mcm@cap@appendixname\space\Alph{section}\space}
\renewcommand\thesubsection{\Alph{section}.\thinspace\arabic{subsection}\space}
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-3.25ex\@plus -1ex \@minus -.2ex}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {3.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {3.25ex \@plus1ex \@minus .2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
}    

% Bibliography settings
\renewenvironment{thebibliography}[1]
{
  \addcontentsline{toc}{section}{\mcm@cap@refname}
  \section*{\refname}%
  \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
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
       {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
} 

% Parameterize
\newcommand*\groupno[1]{%
  \renewcommand{\mcm@tokens@groupno}{#1}}
\newcommand*\membera[1]{%
  \renewcommand{\mcm@tokens@membera}{#1}}
\newcommand*\memberb[1]{%
  \renewcommand{\mcm@tokens@memberb}{#1}}
\newcommand*\memberc[1]{%
  \renewcommand{\mcm@tokens@memberc}{#1}}
\newcommand*\memberd[1]{%
  \renewcommand{\mcm@tokens@memberd}{#1}}
\newcommand*{\mcm@cap@definition}{定义}
\newcommand*{\mcm@cap@theorem}{定理}
\newcommand*{\mcm@cap@lemma}{引理}
\newcommand*{\mcm@cap@corollary}{推论}
\newcommand*{\mcm@cap@assumption}{假设}
\newcommand*{\mcm@cap@conjecture}{猜想}
\newcommand*{\mcm@cap@axiom}{公理}
\newcommand*{\mcm@cap@principle}{定律}
\newcommand*{\mcm@cap@problem}{问题}
\newcommand*{\mcm@cap@example}{例}
\newcommand*{\mcm@cap@proof}{证明}
\newcommand*{\mcm@cap@solution}{解}
\newcommand*{\mcm@cap@contentsname}{\begin{center}目 \quad 录 \end{center}}
\newcommand*{\mcm@cap@listfigurename}{插图清单}
\newcommand*{\mcm@cap@listtablename}{附表清单}
\newcommand*{\mcm@cap@refname}{参考文献}
\newcommand*{\mcm@cap@indexname}{索引}
\newcommand*{\mcm@cap@figurename}{图}
\newcommand*{\mcm@cap@tablename}{表}
\newcommand*{\mcm@cap@appendixname}{附录}
\newcommand*{\mcm@cap@abstractname}{摘 \quad 要}
\newcommand*{\mcm@cap@keywordsname}{关键词}

% Other utility
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% toc settings
\titlecontents{section}[0pt]{\vspace{2mm}\bfseries\heiti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
% 小节的目录格式
\titlecontents{subsection}[30pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsubsection}[55pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

\pagestyle{plain}

\endinput