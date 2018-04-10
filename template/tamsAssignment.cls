%%
%% tamsAssignment.cls  -  Small class file for assignments for lectures
%%
%% $Id: assignment.cls,v 1.2 2015/03/23 Lasse Einig $
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tamsAssignment}
[2015/03/23 v1.2 Document class for lecture assignments.]
%%
%% This class is a derivative of the standard LaTeX2e article class.
%%
\LoadClass[a4paper,11pt]{article}
%%
%% The following packages are included to provide support for
%% hyphenation in American English, for eps figures, and for the Times
%% font with T1 encoding.
%%
%\RequirePackage{t1enc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{ifthen}
%\RequirePackage[german]{babel}
\RequirePackage{graphicx}
%\IfFileExists{syntax.sty}
%{\RequirePackage{syntax}\def\ll@twsf{\sffamily\fontsize{12}{14}\selectfont}}
%{\RequirePackage{times}\def\ll@twsf{\sffamily\fontsize{11}{13}\selectfont}}

%\RequirePackage{mathpple}
%\renewcommand{\ttdefault}{txtt} %       pag pcr
%\renewcommand{\ttdefault}{cmtt} %       pag pcr
%\renewcommand{\sfdefault}{phv}  %       pag phv
\renewcommand{\familydefault}{\sfdefault}
%%
%% Corporate Design stuff
%%
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=KVO,
	prefix=KVO@
}
%\DeclareStringOption[John Doe]{authors}[John Doe]
\DeclareStringOption{authors}
\DeclareStringOption{title}
\DeclareStringOption{department}
\DeclareStringOption{group}
\DeclareStringOption{type}
\DeclareStringOption{id}
\DeclareStringOption{due}
\ProcessKeyvalOptions{KVO}

%\setlength{\fboxsep}{0pt}
%\def\ll@headline{\vbox to 28mm{\unitlength1mm
%	\begin{minipage}{.26\textwidth}
%		\includegraphics[height=14mm]{figures/uhhLogo.png}
%	\end{minipage}%
%	\begin{minipage}{.48\textwidth}
%		\parbox[t]{\textwidth}{
%			\centering{
%				\bf \KVO@group\\[0.5mm]
%				\KVO@department\\[0.5mm]
%				\KVO@authors
%			}
%		}
%	\end{minipage}%
%	\begin{minipage}{.26\textwidth}
%		\flushright
%		\includegraphics[height=14mm]{figures/tamsIcon.png}
%	\end{minipage}%
%	\vss}
%}
%\AtBeginDocument{\ll@headline}

%%
%% Page and paragraph formatting to make best use of space.
%%
\setlength{\parindent}{0pt}
\setlength{\topmargin}{-15.4mm}
\setlength{\textheight}{245mm}
\setlength{\footskip}{2cm}
\setlength{\textwidth}{163.4mm} %% {173.4mm}
\setlength{\evensidemargin}{-5mm}
\setlength{\oddsidemargin}{-5mm}
\setlength{\parskip}{3pt plus 2 pt minus 1pt}
\frenchspacing
\sloppy

\RequirePackage{fancyhdr}
\setlength{\headheight}{45pt}
\pagestyle{fancy}
\fancyhf{}
\lhead{\includegraphics[height=14mm]{figures/uhhLogo.png}}
\chead{	\ifthenelse{\value{page}=1}{
			\centering{	\bf \KVO@group\\[0.5mm]
						\KVO@department\\[0.5mm]
						\KVO@authors
			}
		}{
			\centering{	\bf \KVO@title\\[0.5mm]
						\KVO@type\ \#\KVO@id\\[0.5mm]
			}
		}
}
\rhead{\includegraphics[height=14mm]{figures/tamsIcon.png}}
%\begin{center}
%\textbf{\large {\KVO@title}\\[2mm]
%	{#1} \#{#2}}\\[1mm]
%	\textbf{Due:} {#3}
%\end{center}
%}

%%
%% Mathematical symbols for reals and integers.
%%
\newcommand{\R}{{\bf I\kern-2ptR}}
\newcommand{\N}{{\bf I\kern-2ptN}}
%%
%% Page header.
%%
\newcounter{AssignmentC}
\newcounter{TaskC}[AssignmentC]
\newcounter{SubtaskC}
\newcounter{SubSubtaskC}
%%
\def\mylabel#1{\@bsphack
  \protected@write\@auxout{}%
         {\string\newlabel{#1}{{\@currentlabel\theAssignmentC.\theTaskC.\theSubtaskC}{\thepage}}}%
  \@bsphack}
%%
\newlength{\RBoxWidth}
\settowidth{\RBoxWidth}{\textsf{\textbf{\Large University of Hamburg}}}
\newcommand{\header}{\setcounter{AssignmentC}{\KVO@id}
	\begin{center}
		\textbf{\large{\KVO@title}\\[2mm]
		\KVO@type\ \#\KVO@id}\\[1mm]
		\ifx\KVO@due\@empty\else \textbf{Due:} \KVO@due \fi
	\end{center}
}
\newcommand{\task}[2]{\vspace{1.0cm}\stepcounter{TaskC}\setcounter{SubtaskC}{0}\setcounter{SubSubtaskC}{0}\par\textbf{Task
    \arabic{AssignmentC}.\arabic{TaskC}{\ifx&#1&{}\else{\ (#1 point\ifnum#1>1{s}\fi)}\fi}{\ #2}:}}
\newcommand{\subtask}[1]{\vspace{0.25cm}\stepcounter{SubtaskC}\par\textbf{%
    \arabic{AssignmentC}.\arabic{TaskC}.\arabic{SubtaskC}{\ifx&#1&{}\else{\ (#1 point\ifnum#1>1{s}\fi)}\fi:}}}
\newcommand{\subsubtask}[1]{\vspace{0.25cm}\stepcounter{SubSubtaskC}\par\textbf{%
    \arabic{AssignmentC}.\arabic{TaskC}.\arabic{SubtaskC}.\arabic{SubSubtaskC}:}}
\newcommand{\bonustask}[2]{\vspace{1.0cm}\stepcounter{TaskC}\setcounter{SubtaskC}{0}\setcounter{SubSubtaskC}{0}\par\textbf{Bonus Task
    \arabic{AssignmentC}.\arabic{TaskC}{\ifx&#1&{}\else{\ (#1 point\ifnum#1>1{s}\fi)}\fi}{\ #2}:}}
\newcommand{\bonussubtask}[1]{\vspace{0.25cm}\stepcounter{SubtaskC}\par\textbf{%
    \arabic{AssignmentC}.\arabic{TaskC}.\arabic{SubtaskC}{\ifx&#1&{\ *Bonus*}\else{\ *Bonus* (#1 point\ifnum#1>1{s}\fi)}\fi:}}}
\newcommand{\unit}[1]{\texttt{#1}}
\newcommand{\prog}[1]{\textbf{#1}}
\newcommand{\IR}{\textrm{I\kern-0.25exR}}
\newcommand{\Sp}{\textrm{Sp}}
\newcommand{\Id}{\textrm{1\kern-0.55exI}}
\newcommand{\shellcommand}[1]{\begin{quotation}\texttt{#1}\end{quotation}}
\newcommand{\type}{\KVO@title}
\newbox\@box
\newenvironment{source}%
{\global\setbox\@box\hbox\bgroup%
\begin{minipage}{0.98\textwidth}\footnotesize}%
{\end{minipage}\egroup\begin{center}\fbox{\box\@box}\end{center}}
