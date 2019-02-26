\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{mathexpthesis}

% Initial Code
\newif\if@mcm@bwprint\@mcm@bwprintfalse
\newif\if@mcm@preface\@mcm@prefacetrue
\newif\if@mcm@titlepage\@mcm@titlepagetrue
\newif\if@mcm@bookmarknumber\@mcm@bookmarknumberfalse

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
% 支持中文的 ctex 宏包
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{titletoc}
% 设置颜色
\RequirePackage{xcolor}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array, tabularx}
%% 长表格
\RequirePackage{longtable}
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
%% multirow 支持在表格中跨行
\RequirePackage{multirow}
%% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%% 在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
% 摘要页的缩进
\RequirePackage{changepage}
% 附录定制
\RequirePackage{appendix}
% 首行缩进
\RequirePackage{indentfirst}
% 设置浮动体的标题
\RequirePackage{caption}
% 定制列表环境
\RequirePackage{enumitem}
% 下划线
\RequirePackage{ulem}
% 尺寸计算
\RequirePackage{calc}

% 超链接 hyperref 的设置
\RequirePackage{hyperref}
%% Document Layout
% 页面布局
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}
\renewcommand*{\baselinestretch}{1.38}
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
  {\bgroup%
  \renewcommand{\arraystretch}{1.38}%
  \mcm@oldtabular}%
  {\mcm@endoldtabular\egroup}
% 每行缩进两个汉字
\setlength\parindent{2em}
% 设置字体
\setmainfont{Times New Roman}
%\setmonofont{Courier New}
\setsansfont{Arial}
\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}}

\renewcommand\normalsize{%
  \@setfontsize\normalsize{12.05}{14.45}%
  \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}

% 数学环境, 定理等设置
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
{\thmname{#1}\thmnumber{\arabic{section}.\thinspace\addtocounter{overall}{1}\arabic{overall}}\thmnote{ (#3)}}
\theoremstyle{theoremdd}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries 证明：\space]\ignorespaces
}{\popQED\endtrivlist\@endpefalse}

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

% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
\renewcommand*{\floatpagefraction}{0.85}
% 关于图片 graphicx
% 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
% 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{./}{./figures/}{./figure/}{./pictures/}{./picture/}{./pic/}{./pics/}{./image/}{./images/}}
% 图表标题
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{%
  format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
  labelsep=quad, % 分隔符是一个空格
  font={song,minusfour,bf}, % 图的字体, 宋体小四
  position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
\captionsetup[table]{%
  format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
  labelsep=quad, % 分隔符是一个空格
  font={song,minusfour,bf}, % 表的字体, 宋体小四
  position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
% 列表环境设置
\setlist{%
  topsep=0.3em, % 列表顶端的垂直空白
  partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
  itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
  parsep=0pt, % 列表项内的段落之间的垂直空白
  leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
  rightmargin=0em, % 环境的右边界和列表之间的水平距离
  labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
  labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度。
}

% 超链接
\hypersetup{
  %xetex,
  unicode=true,
  pdfstartview=FitH,
  CJKbookmarks=true,
  bookmarksnumbered=false,
  bookmarksopen=true,
  colorlinks, %注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
  pdfborder=001,   %注释掉此项则交叉引用为彩色边框
  allcolors=blue,
  breaklinks=true
}
\if@mcm@bookmarknumber
  \hypersetup{bookmarksnumbered}
\else\relax\fi

\if@mcm@bwprint
  \AtBeginDocument{\hypersetup{hidelinks}}
\else\relax\fi

% 代码环境
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Document Markup
% 生成封面, 使用\maketitle
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
  %\setcounter{page}{0}
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

% 中文标题名称设置
\renewcommand\contentsname{\mcm@cap@contentsname}
\renewcommand\listfigurename{\mcm@cap@listfigurename}
\renewcommand\listtablename{\mcm@cap@listtablename}
\renewcommand\refname{\mcm@cap@refname}
\renewcommand\indexname{\mcm@cap@indexname}
\renewcommand\figurename{\mcm@cap@figurename}
\renewcommand\tablename{\mcm@cap@tablename}
\renewcommand\appendixname{\mcm@cap@appendixname}
\renewcommand\abstractname{\mcm@cap@abstractname}

% 中文标题格式设置
% 目录深度
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

%% 摘要两个字设置为 4 号.
%% 定义摘要环境
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

% 定义附录，重定义计数器
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

% 重定义参考文献环境
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialization
 %%%数学定理相关的常量
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

 %%%  中文标题名称
\newcommand*{\mcm@cap@contentsname}{\begin{center}目 \quad 录 \end{center}}
\newcommand*{\mcm@cap@listfigurename}{插图清单}
\newcommand*{\mcm@cap@listtablename}{附表清单}
\newcommand*{\mcm@cap@refname}{参考文献}
\newcommand*{\mcm@cap@indexname}{索引}
\newcommand*{\mcm@cap@figurename}{图}
\newcommand*{\mcm@cap@tablename}{表}
\newcommand*{\mcm@cap@appendixname}{附录}
\newcommand*{\mcm@cap@abstractname}{摘 \quad 要}
 %%%  中文关键字
\newcommand*{\mcm@cap@keywordsname}{关键词}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

%设置目录格式

% 节的目录格式
\titlecontents{section}[0pt]{\vspace{2mm}\bfseries\heiti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
% 小节的目录格式
\titlecontents{subsection}[30pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsubsection}[55pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

\pagestyle{plain}

\endinput