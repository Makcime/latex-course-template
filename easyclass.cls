%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% easyclass.cls - LaTeX2e class for Lecture Note use.
%% To Make Lecture Note for Computer Science Courses
%%	Version 1.00
%%  written by Naijia Fan, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{easyclass}[2/6/2019 custom lecture note class]
\LoadClass[twoside=false]{scrbook}
% \RequirePackage[margin=2cm]{geometry}
\RequirePackage[left=2cm,right=2cm,top=2cm,bottom=2.5cm]{geometry}

\RequirePackage{mathtools,amssymb,bm,bbold,enumerate}
\RequirePackage[dvipsnames]{xcolor}

\RequirePackage{qrcode}
\RequirePackage{hyperref,cleveref}
%--------------------------------------------------------------------
% Bibliography
\RequirePackage[]{natbib}
\bibliographystyle{chicago}
\RequirePackage[french]{babel}

%--------------------------------------------------------------------
% Bibliography
\RequirePackage[]{natbib}
\bibliographystyle{chicago}

\RequirePackage[french]{babel}

\RequirePackage{etoolbox} % Needed for \ifstrempty

\RequirePackage{tabularx}      % For creating tables with adjustable-width columns
\RequirePackage{pifont}        % For using symbols like \ding{51} (checkmark) and \ding{55} (cross)
\RequirePackage{setspace}      % For controlling line spacing (e.g., \begin{spacing}{1.5})
\RequirePackage{enumitem} % For customizable lists
\RequirePackage{amssymb}  % For symbols like \square and \checkmark

\RequirePackage{tikz} % For drawing diagrams
\usetikzlibrary{arrows.meta}
\usetikzlibrary{calc}
\usetikzlibrary{angles,quotes}

\RequirePackage{fontawesome5} % For checkmark icon
\RequirePackage{tcolorbox} % Required for colored boxes
\tcbuselibrary{skins}
\RequirePackage{booktabs}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{makecell} % To allow line breaks inside cells
\RequirePackage{csquotes} % Fix for \og and \fg
\RequirePackage{multicol} % For multi-column formatting


\newcommand{\checkboxEmpty}{$\square$} % Define an empty checkbox symbol
\newcommand{\checkboxChecked}{$\checkmark$} % Define a checked checkbox symbol


\newcommand{\exosep}{
	\begin{center}
		\begin{tikzpicture}
			% \draw[line width=2pt] (0,0) -- (\textwidth,0);
			% \draw[line width=4pt, rounded corners=0.5pt] (0,0) -- (0.8\textwidth,0);
			% \draw[line width=2pt, line cap=round] (0,0) -- (0.9\textwidth,0);
			\draw[line width=2pt, line cap=round] (0,0) -- (\textwidth,0);
		\end{tikzpicture}
	\end{center}
}

\newcommand{\circleNumber}[1]{%
	\tikz[baseline=(char.base)]{
		% \node[shape=circle, draw, inner sep=1pt] (char) {\textbf{#1}};
		% \node[shape=circle, draw=blue, ultra thick, text=blue, inner sep=1pt] (char) {\large\textbf{#1}}
		% \node[shape=circle, draw=black, fill=black, ultra thick, text=white, inner sep=1pt] (char) {\large\textbf{#1}};
		\node[shape=circle, draw=black, fill=black, ultra thick, text=white, inner sep=2pt, minimum size=1.5em] (char) {\Large\textbf{#1}};
	}%
}
% \newcommand{\circleNumber}[2][]{%
% 	\tikz[baseline=(char.base)]{
% 		\node[shape=circle, draw=black, fill=black, ultra thick, text=white, inner sep=2pt, minimum size=2em] (char) {\Large\textbf{#2}};
% 		\draw[ultra thick] (char.north west) -- ++(3cm, 0) -- ++(#1, 0);
% 	}%
% 	\newline
% }

% Define a new counter for exercises, resetting every section
\newcounter{exercise}[section]
\renewcommand{\theexercise}{\arabic{exercise}}

% Define the \exercise command
\newcommand{\exocnt}{%
	\refstepcounter{exercise}% Increment the counter
	\noindent\circleNumber{\theexercise}\quad% Display the circled number
}

\newcommand{\lldots}{\ldots.\ldots}
\newcommand{\vvec}[1]{\overrightarrow{#1}}
\newcommand{\vcomp}[2]{\begin{pmatrix} #1 \\ #2 \end{pmatrix}}
\newcommand{\vcompd}{\begin{pmatrix} \ldots \\ \ldots \end{pmatrix}}

% Set the default style for enumerate
\setlist[enumerate,1]{label=\textbf{(\alph*)}, labelsep=1em}

% Set the default style for itemize
\setlist[itemize]{label=\textbullet, labelsep=1em}

\newcommand\myshade{90}
\colorlet{mylinkcolor}{NavyBlue}
\colorlet{mycitecolor}{Aquamarine}
\colorlet{myurlcolor}{Aquamarine}

\hypersetup{
	linkcolor  = mylinkcolor!\myshade!black,
	citecolor  = mycitecolor!\myshade!black,
	urlcolor   = myurlcolor!\myshade!black,
	colorlinks = true,
}

%--------------------------------------------------------------------
% Theorem
%=================================
% pre-defined theorem environments
% custom theorem boxes
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{amsthm}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}{Proposition}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem*{remark}{Remark}
\newtheorem*{assumption}{Assumption}
%Theorem
\newcounter{theo}[chapter] \setcounter{theo}{0}
\renewcommand{\thetheo}{\arabic{chapter}.\arabic{theo}}
\newenvironment{theo}[2][]{%
	\refstepcounter{theo}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=blue!20]
					{\strut Theorem~\thetheo};}}
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=blue!20]
					{\strut Theorem~\thetheo:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=blue!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}
%Lemma
\newcounter{lem}[theo] %\setcounter{lem}{0}
\renewcommand{\thelem}{\arabic{chapter}.\arabic{theo}}
\newenvironment{lem}[2][]{%
	\refstepcounter{theo}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=green!20]
					{\strut Lemma~\thelem};}}
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=green!20]
					{\strut Lemma~\thelem:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=green!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}
%Proof
\newcounter{prf}[theo]%\setcounter{prf}{0}
\renewcommand{\theprf}{\arabic{chapter}.\arabic{theo}}
\newenvironment{prf}[2][]{%
	\refstepcounter{prf}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=red!20]
					{\strut Proof~\theprf};}}
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=red!20]
					{\strut Proof~\theprf:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=red!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}[]\relax%
		\label{#2}}{\qed\end{mdframed}}


% Définition
\newcounter{defn}[chapter] \setcounter{defn}{0}
\renewcommand{\thedefn}{\arabic{chapter}.\arabic{defn}}
\newenvironment{defn}[2][]{%
	\refstepcounter{defn}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=cyan!20]
					{\strut Définition~\thedefn};}}%
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=cyan!20]
					{\strut Définition~\thedefn:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=cyan!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}

% Propriété
\newcounter{prop}[chapter] \setcounter{prop}{0}
\renewcommand{\theprop}{\arabic{chapter}.\arabic{prop}}
\newenvironment{prop}[2][]{%
	\refstepcounter{prop}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=green!20]
					{\strut Propriété~\theprop};}}%
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=green!20]
					{\strut Propriété~\theprop:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=green!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}

% Méthodologie
\newcounter{meth}[chapter] \setcounter{meth}{0}
\renewcommand{\themeth}{\arabic{chapter}.\arabic{meth}}
\newenvironment{meth}[2][]{%
	\refstepcounter{meth}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=orange!20]
					{\strut Méthodologie~\themeth};}}%
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=orange!20]
					{\strut Méthodologie~\themeth:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=orange!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}

% Démonstration
\newcounter{demo}[chapter] \setcounter{demo}{0}
\renewcommand{\thedemo}{\arabic{chapter}.\arabic{demo}}
\newenvironment{demo}[2][]{%
	\refstepcounter{demo}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=red!20]
					{\strut Démonstration~\thedemo};}}%
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=red!20]
					{\strut Démonstration~\thedemo:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=red!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax}
	\begin{mdframed}[]\relax%
		\label{#2}}{\qed\end{mdframed}}

% Remarque
\newcounter{rem}[chapter] \setcounter{rem}{0}
\renewcommand{\therem}{\arabic{chapter}.\arabic{rem}}
\newenvironment{rem}[2][]{%
	\refstepcounter{rem}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=yellow!20]
					{\strut Remarque~\therem};}}%
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=yellow!20]
					{\strut Remarque~\therem:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=yellow!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}

% Exemple
\newcounter{exemple}[chapter] \setcounter{exemple}{0}
\renewcommand{\theexemple}{\arabic{chapter}.\arabic{exemple}}
\newenvironment{exemple}[2][]{%
	\refstepcounter{exemple}%
	\ifstrempty{#1}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=purple!20]
					{\strut Exemple~\theexemple};}}%
	}%
	{\mdfsetup{%
			frametitle={%
					\tikz[baseline=(current bounding box.east),outer sep=0pt]
					\node[anchor=east,rectangle,fill=purple!20]
					{\strut Exemple~\theexemple:~#1};}}%
	}%
	\mdfsetup{innertopmargin=10pt,linecolor=purple!20,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax}
	\begin{mdframed}[]\relax%
		\label{#2}}{\end{mdframed}}


\newtcolorbox{themedBox}[2][]{
	colback=#2!5!white, % Background color (lightened)
	colframe=#2!75!black, % Frame color (darker)
	fonttitle=\bfseries, % Bold title
	coltitle=white, % Title color
	title=#1, % Title provided as the first argument
	% sharp corners, % No rounded corners
	boxrule=1pt, % Thickness of the box border
	toptitle=2mm, % Space above the title
	bottomtitle=2mm, % Space below the title
	top=5pt, bottom=5pt, % Padding inside the box
	left=10pt, right=10pt, % Padding inside the box
}

\newtcolorbox{objThemedBox}[2][]{
	colback=#2!5!white, % Background color (lightened)
	colframe=#2!75!black, % Frame color (darker)
	fonttitle=\bfseries, % Bold title
	coltitle=white, % Title color
	title=\Large{#1}, % Title provided as the first argument
	% sharp corners, % No rounded corners
	boxrule=1pt, % Thickness of the box border
	toptitle=2mm, % Space above the title
	bottomtitle=2mm, % Space below the title
	top=5pt, bottom=5pt, % Padding inside the box
	left=10pt, right=10pt, % Padding inside the box
}

% Optionally, define a similar box for ToC if desired
\newtcolorbox{tocThemedBox}[1][]{
	colback=white, % Background color
	colframe=white, % Frame color
	fonttitle=\bfseries, % Bold title
	coltitle=black, % Title color
	title=\Large{#1}, % Title provided as the first argument
	boxrule=1pt, % Thickness of the box border
	toptitle=2mm, % Space above the title
	bottomtitle=2mm, % Space below the title
	top=5pt, bottom=5pt, % Padding inside the box
	left=10pt, right=10pt, % Padding inside the box
}

% Wrapper for Definition (cyan)
\newcommand{\Definition}[1]{
	\begin{themedBox}[Définition]{cyan}
		#1
	\end{themedBox}
}

\newcommand{\Defn}[2]{
	\begin{themedBox}[\faCheckCircle~#1]{cyan}
		#2
	\end{themedBox}
}

% Wrapper for Propriété (green)
\newcommand{\Propriete}[1]{
	\begin{themedBox}[Propriété]{Dandelion}
		#1
	\end{themedBox}
}

% Wrapper for Méthodologie (orange)
\newcommand{\Methodologie}[1]{
	\begin{themedBox}[Méthodologie]{orange}
		#1
	\end{themedBox}
}

% Wrapper for Démonstration (red)
\newcommand{\Demonstration}[1]{
	\begin{themedBox}[Démonstration]{Orchid}
		#1
	\end{themedBox}
}

% Wrapper for Remarque (yellow)
\newcommand{\Remarque}[1]{
	\begin{themedBox}[Remarque]{yellow}
		#1
	\end{themedBox}
}

%=================================
% useful commands
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\supp}{supp}

\def\vec#1{{\ensuremath{\bm{{#1}}}}}
\def\mat#1{\vec{#1}}
\def\bvec#1{\mathbf{#1}}

%=================================
% convenient notations
\newcommand{\XX}{\mathbb{X}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\EE}{\mathbb{E}}
\newcommand{\PP}{\mathbb{P}}

\newcommand{\sL}{\mathcal{L}}
\newcommand{\sX}{\mathcal{X}}
\newcommand{\sY}{\mathcal{Y}}

\newcommand{\ind}{\mathbb{1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typography, change document font
\RequirePackage[tt=false, type1=true]{libertine}
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[T1]{fontenc}

\RequirePackage[protrusion=true,expansion=true]{microtype}

% Disable paragraph indentation, and increase gap
\RequirePackage{parskip}

%=================================
% header and footer
%=================================
\RequirePackage{scrlayer-scrpage}
% Redefine chapter command to set \leftmark manually
\renewcommand{\chaptermark}[1]{%
	\markboth{\thechapter.\ #1}{} % Use chapter number and title for \leftmark
}

\pagestyle{scrheadings}
\deftripstyle{pagestyle}
% [0.5pt]
[0.3pt]
{}
{}
{\footnotesize{\leftmark}}
{\@courseid -- \@title}
{}
{\pagemark}

\pagestyle{pagestyle}
\renewcommand{\chapterpagestyle}{pagestyle}


%=================================
% draw pictures
\RequirePackage{tikz}
\usetikzlibrary{arrows,positioning,calc}
\tikzstyle{labeled}=[execute at begin node=$\scriptstyle,
	execute at end node=$]
\RequirePackage{graphicx}

%=================================
% title page
% define university 
\def\@university{no university}
\newcommand{\university}[1]{
	\def\@university{#1}
}
% define course id
\def\@courseid{CS 000}
\newcommand{\courseid}[1]{
	\def\@courseid{#1}
}
% define version
\def\@version{Great Year}
\newcommand{\version}[1]{
	\def\@version{#1}
}
% define instructor info
\def\@instructor{Instructor}
\newcommand{\instructor}[1]{
	\def\@instructor{#1}
}

% define a default title figure
\def\@titlefigure{figures/funny.png}

% command to set a custom title figure
\newcommand{\titlefigure}[1]{\def\@titlefigure{#1}}

% make title
\renewcommand{\maketitle}{
	\centering
	{\scshape{\Large  \@university, \@courseid} \par}
	\vspace{1.5cm}
	{\huge\bfseries{\@title} \par}
	\vspace{2cm}
	\@instructor
	\vspace{2cm}
	\includegraphics[width=0.50\textwidth]{\@titlefigure}
	\vfill
	% Bottom of the page
	{\Large\itshape \@author \par}
	{\large \@version \par}
}

% make title
% Simple title command
\newcommand{\simpletitle}{
	\begin{tcolorbox}[
			colback=Gray!75!black,
			coltext=white,
			colframe=black!75
		]
		\centering
		{\huge\bfseries \@title \par}
		\vspace{0.5cm}
		{\small \@courseid \par}
	\end{tcolorbox}
	\vspace{1.5cm}
}


%=================================
% add current instructor info 
% on the right
\newcommand{\curinstructor}[1]{
	% instructor info
	\vfill
	\begin{flushright}
		Instructor: #1
	\end{flushright}
}



% \RequirePackage[explicit]{titlesec}
\RequirePackage{titlesec}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CHAPTER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\chapter}[block]
{\normalfont\huge\bfseries} % Font & size for chapter title
{}
{0pt}
{%
\vspace{-4em}% Reduce top spacing before chapter
\begin{tcolorbox}[
		colback=Gray!75!black,
		% colframe=gray!75!black, % Frame color (darker)
		coltext=white,
		boxrule=1pt,
		enlarge top by=0pt,
		enlarge bottom by=0pt
	]
	\centering \thechapter.\hspace{0.5em}%
	% \centering -- \thechapter --\\ %
	}
	[%
\end{tcolorbox}
\vspace{-1em}
]

\titleformat{name=\chapter,numberless}[block]
{\normalfont\huge\bfseries}
{}
{0pt}
{%
	\noindent\hrule width\textwidth\vspace{0.5em}%
	\centering
}[%
	\vspace{0.5em}\hrule width\textwidth
]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\section}[block]
{\normalfont\Large\bfseries}
{\thesection.}
{1em}
{}

\titleformat{name=\section,numberless}[block]
{\normalfont\Large\bfseries}
{}
{0pt}
{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SUBSECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\subsection}[block]
{\normalfont\large\bfseries}
{\thesubsection.}
{1em}
{}

\titleformat{name=\subsection,numberless}[block]
{\normalfont\large\bfseries}
{}
{0pt}
{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SUBSUBSECTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\titleformat{\subsubsection}[block]
{\normalfont\normalsize\bfseries}
{\thesubsubsection.}
{1em}
{}

\titleformat{name=\subsubsection,numberless}[block]
{\normalfont\normalsize\bfseries}
{}
{0pt}
{}


