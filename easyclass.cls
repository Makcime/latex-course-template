%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% easyclass.cls - LaTeX2e class for Lecture Note use.
%% To Make Lecture Note for Computer Science Courses
%%	Version 1.00
%%  written by Naijia Fan, 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{easyclass}[2/6/2019 custom lecture note class]
\LoadClass[twoside=false]{scrbook}
\RequirePackage{mathtools,amssymb,bm,bbold,enumerate}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref,cleveref}

\RequirePackage{etoolbox} % Needed for \ifstrempty

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
% Bibliography
\RequirePackage[]{natbib}
\bibliographystyle{chicago}

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
\RequirePackage{scrlayer-scrpage}
\pagestyle{scrheadings}
\deftripstyle{pagestyle}
%   [0.5pt]
%   [0.3pt]
{}
{}
{\headmark}
{}
{\pagemark}
{}

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
% make title
\renewcommand{\maketitle}{
	\centering
	{\scshape{\Large  \@university, \@courseid} \par}
	\vspace{1.5cm}
	{\huge\bfseries{\@title} \par}
	\vspace{2cm}
	\@instructor
	\vspace{2cm}
	\includegraphics[width=0.25\textwidth]{figures/funny.png}
	\vfill
	% Bottom of the page
	{\Large\itshape \@author \par}
	{\large \@version \par}
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
