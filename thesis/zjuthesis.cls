%%
%% This is file `csbachelor.cls',
%%
%%
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%%
%%    http://www.latex-project.org/lppl.txt
%%
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{zjuthesis}
    [2017/03/28 v1.0 ZJU Thesis Proposal Class]

\newif\ifzju@side\zju@sidetrue
\DeclareOption{twoside}{\zju@sidetrue}
\DeclareOption{oneside}{\zju@sidefalse}
\newif\ifzju@showproposal\zju@showproposalfalse
\DeclareOption{showproposal}{\zju@showproposaltrue}

\ProcessOptions\relax
\PassOptionsToClass{zihao=-4}{ctexbook}
\PassOptionsToClass{scheme=chinese}{ctexbook}
\PassOptionsToClass{fontset=fandol}{ctexbook}
\ExecuteOptions{twoside,oneside}
\ifzju@side
   \LoadClass[a4paper,UTF8,12pt,twoside,titlepage,openany]{ctexbook}
   \def\zjuside{T}
\else
   \LoadClass[a4paper,UTF8,12pt,oneside,titlepage]{ctexbook}
   \def\zjuside{O}
\fi

%\RequirePackage[top=2.0cm,bottom=2.4cm,left=3.4cm,right=2.4cm,includehead,includefoot]{geometry}
\RequirePackage[top=2.54cm,bottom=2.54cm,left=3.18cm,right=3.18cm,includefoot]{geometry}

\RequirePackage{ifthen}
\RequirePackage{calc}
% 张海
\RequirePackage{xpatch}

\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{amsthm}

\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

\RequirePackage[normalem]{ulem}

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
% 张海
%\setmainfont{TeX Gyre Termes}
%\setsansfont{TeX Gyre Heros}
%\setmonofont{TeX Gyre Cursor}

% 张海
\setCJKmainfont{FangSong}  % @NOTE the stupid template uses fangsong as the main font
\setCJKfamilyfont{FangSong}{FangSong}
\setCJKsansfont{SimHei}
\setCJKmonofont{SimHei}
\setCJKfamilyfont{SimHei}{SimHei}
\setCJKfamilyfont{hycufsong}{HYCuFangSongJ}
% \setCJKfamilyfont{zhbfsong}{STZhongsong}
\setCJKfamilyfont{zhbfsong}{FandolSong-Bold.otf}
\setCJKfamilyfont{SongTi}{SimSun}
\setCJKfamilyfont{STFangsong}{STFangsong}
\providecommand*{\bffangsong}{\CJKfamily{hycufsong}}
\providecommand*{\simhei}{\CJKfamily{SimHei}}
\providecommand*{\bfsong}{\CJKfamily{zhbfsong}}
\providecommand*{\stfangsong}{\CJKfamily{stfangsong}}
\renewcommand{\heiti}{\CJKfamily{SimHei}}
\renewcommand{\songti}{\CJKfamily{SongTi}}
\renewcommand{\fangsong}{\CJKfamily{FangSong}}


% \setCJKmainfont{SimFang}  % @NOTE the stupid template uses fangsong as the main font
% \setCJKsansfont{FandolHei-Regular.otf}
% \setCJKmonofont{FandolHei-Regular.otf}
% \punctstyle{kaiming}

% value > 0
\def\xeCJKembold{0.4}

% hack into xeCJK, you don't need to understand it
\def\saveCJKnode{\dimen255\lastkern}
\def\restoreCJKnode{\kern-\dimen255\kern\dimen255}

% save old definition of \CJKsymbol and \CJKpunctsymbol for CJK output
\let\CJKoldsymbol\CJKsymbol
\let\CJKoldpunctsymbol\CJKpunctsymbol

% apply pdf literal fake bold
\def\CJKfakeboldsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\def\CJKfakeboldpunctsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldpunctsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\newcommand\CJKfakebold[1]{%
  \let\CJKsymbol\CJKfakeboldsymbol
  \let\CJKpunctsymbol\CJKfakeboldpunctsymbol
  #1%
  \let\CJKsymbol\CJKoldsymbol
  \let\CJKpunctsymbol\CJKoldpunctsymbol}

\RequirePackage[usenames]{color}
\RequirePackage{fancyhdr}
\RequirePackage{nomencl}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{url}
\urlstyle{tt}

\RequirePackage{lscape}
\RequirePackage{graphicx}

\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{caption2}
\RequirePackage{multirow}
\RequirePackage{dcolumn}
\RequirePackage{colortbl}
\RequirePackage{threeparttable}
\RequirePackage{array}

\setlength{\headheight}{30pt}
\setlength{\footskip}{1.3cm}
\raggedbottom

\frenchspacing
\widowpenalty=10000
\setlength{\parsep}{0em}
\setlength{\parskip}{0em}
\setlength{\parindent}{2em}
\setlength{\itemsep}{0em}

\RequirePackage{enumitem}
\setlist{noitemsep}

\RequirePackage[hidelinks]{hyperref}
\setlength{\LTpre}{1em}
\setlength{\LTpost}{1em}

\RequirePackage{tikz}
\usetikzlibrary{arrows,backgrounds,fit,shapes}
\tikzstyle{layer} = [draw, dashed]
\tikzstyle{block} = [draw, rectangle, minimum height=2em]
\tikzset{>=latex}

\RequirePackage{pdfpages}
\RequirePackage[backend=biber,bibstyle=gb7714-2015]{biblatex}
\RequirePackage[ruled]{algorithm2e}
\SetAlgorithmName{算法}{算法}{算法列表}

% \RequirePackage{syntonly}
% \syntaxonly

\let\oldthebibliography\thebibliography
\let\endoldthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{\begin{oldthebibliography}{#1}\setlength{\itemsep}{0em}\setlength{\parskip}{0em}}{\end{oldthebibliography}}

\renewcommand{\baselinestretch}{1.389} % 20pt / 14.4pt
\def\verbatim@font{\normalfont\ttfamily\linespread{1}\wuhao}
\renewcommand{\arraystretch}{1}

\DeclareRobustCommand{\fortyeight}{\fontsize{48pt}{57.6pt}\selectfont}
\DeclareRobustCommand{\chuhao}{\fontsize{42pt}{50.4pt}\selectfont}
\DeclareRobustCommand{\xiaochu}{\fontsize{36pt}{43.2pt}\selectfont}
\DeclareRobustCommand{\yihao}{\fontsize{26pt}{31.2pt}\selectfont}
\DeclareRobustCommand{\xiaoyi}{\fontsize{24pt}{28.8pt}\selectfont}
\DeclareRobustCommand{\erhao}{\fontsize{22pt}{26.4pt}\selectfont}
\DeclareRobustCommand{\xiaoer}{\fontsize{18pt}{21.6pt}\selectfont}
\DeclareRobustCommand{\sanhao}{\fontsize{16pt}{19.2pt}\selectfont}
\DeclareRobustCommand{\xiaosan}{\fontsize{15pt}{18pt}\selectfont}
\DeclareRobustCommand{\sihao}{\fontsize{14pt}{16.8pt}\selectfont}
\DeclareRobustCommand{\shisanbang}{\fontsize{13pt}{15.pt}\selectfont}
\DeclareRobustCommand{\xiaosi}{\fontsize{12pt}{14.4pt}\selectfont}
\DeclareRobustCommand{\wuhao}{\fontsize{10.5pt}{12.6pt}\selectfont}
\DeclareRobustCommand{\xiaowu}{\fontsize{9pt}{10.8pt}\selectfont}
\DeclareRobustCommand{\liuhao}{\fontsize{7.5pt}{9pt}\selectfont}
\DeclareRobustCommand{\xiaoliu}{\fontsize{6.5pt}{7.8pt}\selectfont}
\DeclareRobustCommand{\qihao}{\fontsize{5.5pt}{6.6pt}\selectfont}
\DeclareRobustCommand{\bahao}{\fontsize{5pt}{6pt}\selectfont}
% 张海
\setCJKfamilyfont{STXingkai}{STXingkai}
%\setCJKfamilyfont{FangSong}{FZFangSong-Z02}
%\setCJKfamilyfont{simhei}{FZHei-B01}
%\setCJKfamilyfont{KaiShu}{FZKai-Z03}
%\setCJKfamilyfont{LiShu}{FZLiShu-S01}
%\setCJKfamilyfont{SongTi}{FZSongS-Extended}
%\setCJKfamilyfont{YouYuan}{YouYuan}
%\setCJKfamilyfont{fangsong}{FZFangSong-Z02}
%\setCJKfamilyfont{STXingkai}{FZXingKai-S04}
\newfontfamily{\timesnewroman}{Times New Roman}
\newfontfamily{\arial}{Arial}
\newfontfamily{\couriernew}{Courier New}
\DeclareRobustCommand{\stxingkai}{\CJKfamily{STXingkai}}
\setcounter{secnumdepth}{4}

% 张海
\xpatchcmd{\frontmatter}{\pagenumbering{roman}}{\pagenumbering{Roman}}{}{}
\renewcommand*{\thechapter}{\arabic{chapter}}
\renewcommand*{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand*{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand*{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\RequirePackage{chngcntr}
\xpatchcmd{\c@t@sin}{\@nameuse{the#2}.}{\arabic{#2}.}{}{}
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}


\RequirePackage{zhnumber}
\RequirePackage{setspace}
\renewcommand{\appendixname}{附录}
\newcommand{\todayinchinese}{\number\year 年 \number\month 月 \number\day 日}
\RequirePackage{mathtools}
\RequirePackage[bottom]{footmisc}
\RequirePackage{emptypage}



% to hide entry from table of contents
\newcommand{\nocontentsline}[3]{}
\newcommand{\tocless}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}

%\titleformat{\chapter}[block]{\linespread{1}\simhei\sanhao\bfseries\filcenter}{\thechapter}{1em}{}{}
\renewcommand{\thepart}{\arabic{part}}

\titleformat{\part}[display]{\xiaochu\bffangsong\filcenter}{\fortyeight\mdseries\simhei\filcenter 第\zhnumber{\thepart}部分}{0.5em}{}{}


\titleformat{\chapter}[hang]{\sanhao\bffangsong}{\sanhao\timesnewroman\bfseries\thechapter}{1em}{}{}
\titleformat{name=\chapter,numberless}[hang]{\sanhao\bffangsong\filcenter}{}{0pt}{}{}
% \titlespacing{\chapter}{0em}{0pt}{18pt}
\titlespacing{\chapter}{0em}{-2em}{1em}
%\titlecontents{chapter}[0em]{}{\songti\sihao\thecontentslabel\hspace{1em}}{\songti\sihao}{\songti\sihao\titlerule*[5pt]{.}\contentspage}
\titlecontents{chapter}[0em]{}{\fangsong\xiaosi\thecontentslabel\hspace{1em}}{}{\fangsong\xiaosi\titlerule*[3pt]{.}\contentspage}


\titleformat{\section}[hang]{\linespread{1}\xiaosan\bffangsong}{\xiaosan\timesnewroman\bfseries\thesection}{1em}{}{}
\titlespacing{\section}{0em}{24pt}{6pt}
%\titlecontents{section}[2em]{}{\songti\xiaosi\thecontentslabel\hspace{1em}}{}{\songti\xiaosi\titlerule*[5pt]{.}\contentspage}
\titlecontents{section}[0em]{}{\fangsong\xiaosi\thecontentslabel\hspace{0.75em}}{}{\fangsong\xiaosi\titlerule*[3pt]{.}\contentspage}


\titleformat{\subsection}[hang]{\linespread{1}\bffangsong\sihao}{\sihao\timesnewroman\bfseries\thesubsection}{1em}{}{}
\titlespacing{\subsection}{0em}{12pt}{6pt}
%\titlecontents{subsection}[4em]{}{\songti\wuhao\thecontentslabel\hspace{1em}}{}{\songti\wuhao\titlerule*[5pt]{.}\contentspage}
\titlecontents{subsection}[0em]{}{\fangsong\xiaosi\thecontentslabel\hspace{0.75em}}{}{\fangsong\xiaosi\titlerule*[3pt]{.}\contentspage}

\titleformat{\subsubsection}[hang]{\linespread{1}\bffangsong\xiaosi}{\xiaosi\timesnewroman\bfseries\thesubsubsection}{1em}{}{}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\chaptermark}[1]{\markright{#1}}
\renewcommand{\sectionmark}[1]{}
\fancypagestyle{frontmatter}{
  \fancyhf{}
  \fancyhead[LE]{\songti\xiaowu 浙江大学本科毕业论文（设计）}
  \fancyhead[RO]{\songti\xiaowu \zjutitlec}
  \fancyfoot[C]{\songti\xiaowu \thepage}
}
\fancypagestyle{mainmatter}{
  \fancyhf{}
  \fancyhead[LE]{\songti\xiaowu 浙江大学本科毕业论文（设计）}
  \fancyhead[RO]{\songti\xiaowu \zjutitlec}
  \fancyfoot[C]{\songti\xiaowu \thepage}
}
\newcommand{\contentsformat}{\simhei\sanhao\bfseries}
\renewcommand{\contentsname}{\hfill \sanhao\bffangsong 目~~~~录 \hfill}
\renewcommand\tableofcontents{
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsformat\contentsname}
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
    }
\renewcommand{\listfigurename}{\centerline{图~目~录}}
\renewcommand{\listtablename}{\centerline{表~目~录}}
\setcounter{tocdepth}{2}  % 设置目录的深度到 subsection
\renewcommand{\bibname}{参考文献}
\renewcommand{\nomname}{\centerline{术~语~表}}
\renewcommand{\nomlabelwidth}{25mm}
\renewcommand{\nompreamble}{\vspace{1em}}
\makenomenclature
\renewcommand{\figurename}{图} % 插图题头
\renewcommand{\tablename}{表} % 插表题头
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

\renewcommand*{\captionfont}{\wuhao\bfsong}
\renewcommand*\captionlabelfont{\bffangsong\bfseries}
% \renewcommand{\captionlabelfont}{\wuhao\fangsong}
\renewcommand{\captionlabeldelim}{} %% 定义如 "图(表)1: 示例" 中的间隔符号,如 ":" ,这里定义为空
% \renewcommand{\captionlabelsep}{\hspace{1em}} %定义图表编号与标题间的间隔距离

% \setlength{\belowcaptionskip}{2mm}
\renewcommand{\footnotesize}{\xiaowu}
% \newtheoremstyle{zjutheorem}
%    {9pt}{9pt}{\ttfamily}{0pt}{\lishu}{：}{0pt}{}
\newtheoremstyle{zjutheorem}
   {9pt}{9pt}{\fangsong\xiaosi}{0pt}{\simhei}{：}{0pt}{}
\theoremstyle{zjutheorem}
\newtheorem{zjutheorem}{定理~}[chapter]
\newtheorem{zjuassumption}{假设~}[chapter]
\newtheorem{zjulemma}{引理~}[chapter]
\newtheorem{zjuremark}{备注~}[chapter]
\newtheorem{zjudefine}{定义~}[chapter]
\newtheorem{zjuproposition}{命题~}[chapter]
\newenvironment{zjuproof}{\begin{proof}[\textnormal{\simhei 证明~}]}{\end{proof}}

% HACK
% \renewcommand{\cite}[1]{\textsuperscript{\oldcite{#1}}}
\renewcommand{\supercite}[1]{\textsuperscript{\cite{#1}}}
% \renewcommand{\supercite}[1]{\oldcite{#1}}
% \renewcommand{\cleardoublepage}{\clearpage{\thispagestyle{empty}\cleardoublepage}}

\newcolumntype{.}{D{.}{.}{2.4}}
\AtBeginDocument{%
   \makeatletter
   \input{zjuthesis.cfg}
   \makeatother}
\endinput
%%
%% End of file `csbachelor.cls'.
