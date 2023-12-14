%%--------------------------------------------------------------
%% iufenbil.cls, article.cls dosyasından uyarlanmıştır.
%% Bu latex stil dosyası Astronomi ve Uzay Bilimleri bölümünde 
%% çalışmakta Hikmet ÇAKMAK tarafından hazırlanmıştır.
%% dosyanın düzenlemeye başlandığı tarihi :  4 Ekim   2016
%%             hazırlanmaın bittiği tarih : 11 Temmuz 2016.
%% --------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{iufenbil}[2014/09/29 v0.1 LaTeX class for thesis]

\newcommand\@ptsize{}

\if@compatibility\else
	\DeclareOption{a4paper}{
		\setlength\paperheight {297mm}%
		\setlength\paperwidth  {210mm}
	}
\fi

\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi

\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi

\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}

\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi

\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{line15}{\renewcommand\baselinestretch{1.43}}
\DeclareOption{line}{\renewcommand\baselinestretch{}}

\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

\newif\if@linksfromyear\@linksfromyeartrue
\DeclareOption{linksfromyear}{\@linksfromyeartrue}
\DeclareOption{nolinksfromyear}{\@linksfromyearfalse}
\newif\if@showbiblabel \@showbiblabelfalse
\DeclareOption{showbiblabels}{\@showbiblabeltrue}
\newif\if@iuhyphen \@iuhyphenfalse

\ExecuteOptions{a4paper, 12pt, twoside, final}
\ProcessOptions

\RequirePackage{graphicx} % kapak sayfasına resim koymak için gerekli
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc} 
\RequirePackage[utf8]{inputenc}
\RequirePackage{xparse}
\RequirePackage{booktabs}
\RequirePackage{mdframed}
\RequirePackage{xcolor}
\RequirePackage[bottom]{footmisc}
\RequirePackage{mathptmx}

\input{size1\@ptsize.clo}
%%% font
\renewcommand{\rmdefault}{ptm} 		% yazı fontu times
\renewcommand{\sfdefault}{ptm} 		% times

%%\renewcommand\contentsname{{\.I}\c{C}{\.I}NDEK{\.I}LER}
%%\renewcommand\listfigurename{\c{S}EK{\.I}L L{\.I}STES{\.I}}
%%\renewcommand\listtablename{TABLE L{\.I}STES{\.I}}
%%\renewcommand\appendixname{EKLER}
%\renewcommand\refname{KAYNAKLAR}
%\renewcommand\indexname{{\.I}ndeks}
%\renewcommand\figurename{\c{S}ekil}
%\renewcommand\tablename{Table}
%\renewcommand\partname{B\"{o}l\"{u}m}
%\renewcommand\abstractname{\"{O}zet}   %"
%\renewcommand\prefacename{\"{O}NS\"{O}Z}

%\newcommand\contentsname{CONTENTS}
%\newcommand\listfigurename{LIST OF FIGURES}
%\newcommand\listtablename{LIST OF TABLES}
%\newcommand\appendixname{APPENDICES}
%\newcommand\refname{REFERENCES}
%\newcommand\indexname{Indeks}
%\newcommand\figurename{figure}
%\newcommand\tablename{Table}
%\newcommand\partname{Part}
%\newcommand\abstractname{Abstrac}
%\newcommand\prefacename{Preface}

\RequirePackage[english, turkish]{babel}
\select@language{turkish}

\renewcommand\title[2][tr]{
	\def\@sec{#1}
	\ifx\@sec\dtr \def\@title{#2} \fi
	\ifx\@sec\den \def\@titleen{#2} \fi
}
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\degree}[1]{
	\def\@dgr{#1}
	% girilen değişkeni küçük harflere çevirme
	\begingroup\edef\x{%
	\lowercase{\endgroup
	  \def\noexpand\@degree{\@dgr}}}%
	\x
}

\newcommand{\supervisor}[5]{
	\def\@svttl{#1}
	\def\@svttlen{#2}
	\def\@svnmsn{#3}
	\def\@svuniv{#4}
	\def\@svfaculty{#5}
	
	\gdef\@svname{\@svttl\,\@svnmsn}
	\gdef\@svnameen{\@svttlen\,\@svnmsn}
}

\newcommand{\cosupervisor}[3]{
	\def\@cosvttl{#1}
	\def\@cosvttlen{#2}
	\def\@cosvnmsn{#3}
	
	\gdef\@cosvname{\@cosvttl\,\@cosvnmsn}
	\gdef\@cosvnameen{\@cosvttlen\,\@cosvnmsn}
}

\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\tprogram}{\@program}
\newcommand{\tdepartment}{\@department}
\newcommand{\tauthor}{\@author}
\newcommand{\department}[2][tr]{
	\def\@sec{#1}
	\ifx\@sec\dtr \def\@department{#2} \fi
	\ifx\@sec\den \def\@departmenten{#2} \fi
}
\newcommand{\coverdate}[1]{\def\@coverdate{#1}}
\newcommand{\acceptdate}[1]{\def\@acceptdate{#1}}
\newcommand{\departmenten}[1]{\def\@departmenten{#1}}
\newcommand{\titleen}[1]{\def\@titleen{#1}}

\newcommand{\jurya}[3]{\def\@janame{#1}\def\@jauniv{#2}\def\@jafaculty{#3}}
\newcommand{\juryb}[3]{\def\@jbname{#1}\def\@jbuniv{#2}\def\@jbfaculty{#3}}
\newcommand{\juryc}[3]{\def\@jcname{#1}\def\@jcuniv{#2}\def\@jcfaculty{#3}}
\newcommand{\juryd}[3]{\def\@jdname{#1}\def\@jduniv{#2}\def\@jdfaculty{#3}}

\gdef\dfjname{{\"U}nvan Ad SOYAD} %"
\gdef\dfjuniv{XXX {\"U}niversitesi} %"
\gdef\dfjfacl{XXX Fak\"{u}ltesi} %"

\def\@janame{\@empty}
\def\@jauniv{\@empty}
\def\@jafaculty{\@empty}

\def\@jbname{\@empty}
\def\@jbuniv{\@empty}
\def\@jbfaculty{\@empty}

\def\@jcname{\@empty}
\def\@jcuniv{\@empty}
\def\@jcfaculty{\@empty}

\def\@jdname{\@empty}
\def\@jduniv{\@empty}
\def\@jdfaculty{\@empty}

\newcommand{\jurycheck}{
	\ifx\@janame\@empty    \def\@janame{\dfjname} \fi
	\ifx\@jauniv\@empty    \def\@jauniv{\dfjuniv} \fi
	\ifx\@jafaculty\@empty \def\@jafaculty{\dfjfacl} \fi

	\ifx\@jbname\@empty    \def\@jbname{\dfjname} \fi
	\ifx\@jbuniv\@empty    \def\@jbuniv{\dfjuniv} \fi
	\ifx\@jbfaculty\@empty \def\@jbfaculty{\dfjfacl} \fi

	\ifx\@jcname\@empty    \def\@jcname{\dfjname} \fi
	\ifx\@jcuniv\@empty    \def\@jcuniv{\dfjuniv} \fi
	\ifx\@jcfaculty\@empty \def\@jcfaculty{\dfjfacl} \fi

	\ifx\@jdname\@empty    \def\@jdname{\dfjname} \fi
	\ifx\@jduniv\@empty    \def\@jduniv{\dfjuniv} \fi
	\ifx\@jdfaculty\@empty \def\@jdfaculty{\dfjfacl} \fi
}


\newcommand{\projects}[1]{\def\@projects{#1}}
\newcommand{\papersofthesis}[1]{\def\@thesispapers{#1}}
\newcommand{\keywords}[3]{\def\@keywords{#1}\def\@presdate{#2}\def\@numpages{#3}}
\newcommand{\iuspace}{\hspace{0.3em}}
%\newcommand{\stspace}{\hspace{0.1em}}
\newcommand{\completepage}{
	\newpage
	%sayfa sayısı tek/çift olduğu kontrol edilecek
	\ifodd\value{page}\else
		\hbox{}\newpage
	\fi
}
\newcommand{\completeevenpage}{
	\newpage
	\if@twoside
		%sayfa sayısı tek/çift olduğu kontrol edilecek
		\ifodd\value{page}\else
			\hbox{}\newpage
		\fi
	\fi
}
\newcommand{\completewithemptypage}{
	\if@twoside
		%sayfa sayısı tek/çift olduğu kontrol edilecek
		\ifodd\value{page}\else
			\newpage
			\par \null
			\thispagestyle{empty}
			\newpage
		\fi
	\fi
}

\newcommand*{\makeemptypage}{
	\if@twoside
		\newpage
		\par \null
		\thispagestyle{empty}
		\newpage
	\fi
}

\ExplSyntaxOn
\NewDocumentCommand{\Param}{mmmm}{%
	\tl_set:Nx \l_tmpa_tl {#1}%
	\seq_set_split:NnV \l_tmpa_seq {#2} {\l_tmpa_tl}
	\expandafter\DeclareDocumentCommand\csname #3\endcsname{}{\seq_item:Nn \l_tmpa_seq{1}}
	\expandafter\DeclareDocumentCommand\csname #4\endcsname{}{\seq_item:Nn \l_tmpa_seq{2}}
}
\ExplSyntaxOff

\newcommand*{\vedig}{{\it ve di\u{g}.}}
\newcommand*{\startofthesis}{
	\completeevenpage
	\setcounter{section}{0}
	\setcounter{page}{0}
	\pagestyle{myheadings}
	\pagenumbering{arabic}	
}

\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{1.43}
\setlength\parskip{0\p@ \@plus \p@}

\def\dtr{tr}
\def\den{en}
\def\@title{Tez Ba\c{s}l{\i}\u{g}{\i}}
\def\@titleen{Title of Thesis}
\def\@department{Enstit\"{u} Anabilim dal{\i}} %"
\def\@departmenten{Department of Institute}
\def\phd{phd}
\def\msc{msc}
\def\phdtr{Doktora}
\def\msctr{Y\"{u}ksek Lisans} %"
\def\phdtrb{DOKTORA}
\def\msctrb{Y\"{U}KSEK L{\.I}SANS} %"
\def\phden{Ph.D.}
\def\mscen{M.Sc.}
\def\@cosvname{-}
\def\@noname{-}
\def\@projects{-}
\def\@logopath{logos/}
\def\@thesispapers{-}

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

\if@twoside
  \def\ps@headings{%
	\let\@oddfoot\@empty
	\let\@evenfoot\@empty
	\def\@evenhead{\thepage\hfil\slshape\leftmark}%
	\def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
	\let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi

\def\ps@myheadings{%
    \let\@oddfoot\@empty
	\let\@evenfoot\@empty
    \def\@evenhead{\rightmark\hfil\bfseries\small\thepage\hfil\leftmark}%
    \def\@oddhead {\@evenhead}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
	
\def\ps@plain{%
	\let\@mkboth\@gobbletwo
    \let\@oddhead\@empty
	\let\@evenhead\@empty
	\def\@evenfoot{\rightmark\hfil\bfseries\small\thepage\hfil\leftmark}%
	\def\@oddfoot{\@evenfoot}%
}

\newcommand\coverpage{
	\newpage
	% \@twosidefalse 
	\vspace*{-2.1em}
	\hspace*{2mm}
	\noindent\begin{minipage}{0.98\textwidth}
		\def\@pimage{\@logopath iulogo}
		\begin{minipage}{0.2\textwidth}
			\includegraphics[width=22.3mm]{\@pimage}
		\end{minipage}
		\hspace*{-4.5mm}
		\begin{minipage}[t]{0.63\textwidth} 
			\begin{center}
				\begin{tabular}{c}
					\bfseries {} \\[-4.2ex]
					\large\bfseries {T.C.} \\[-0.6ex]
					\large\bfseries {\.{I}STANBUL {\"U}N\.{I}VERS\.{I}TES\.{I}} \\ [-0.6ex]%"
					\large\bfseries {SOSYAL B\.{I}L\.{I}MLER\.{I} ENST\.{I}T{\"U}S{\"U}} \\
				\end{tabular}
			\end{center}
		\end{minipage}
		\hfill	
		\def\@pimage{\@logopath iuslogo}
		\begin{minipage}{0.15\textwidth}
			\includegraphics[width=21.3mm]{\@pimage}
		\end{minipage}
	\end{minipage}
	
	\vskip 8.2em%
	\ifx\@degree\phd \def\prgtype{\phdtrb} \fi
	\ifx\@degree\msc \def\prgtype{\msctrb} \fi
		
	\begin{center}
		\large\bfseries {\prgtype\; TEZ\.{I}}
	\end{center}
	
	\vspace*{-1.2em}
	\noindent
	\begin{center}
		\setlength{\fboxrule}{2.5pt}
		\setlength{\fboxsep}{1.5pt}
		\fbox{
			\setlength{\fboxrule}{0.9pt}
			\hspace*{-8.9pt}
			\fbox{
				\parbox[b][396pt][t]{396pt}{
					\vspace*{0.3em}
					\begin{center}
						\parbox[b][15mm][t]{127mm}{
							\centering
							\begin{spacing}{1.0}
								\bfseries\MakeUppercase\@title
							\end{spacing}
						}
						\vskip 4.7em
						\bfseries\@author
						\vskip 1.5em
						\bfseries\@department
						\vskip 0.7em
						\bfseries\@program
						
						\vskip 4.8em
						\parbox[b][25mm][t]{129.2mm}{
							\centering
							\bfseries {DANI\c{S}MAN}
							\vskip -0.4em
							\bfseries\@svname
							\ifx\@cosvname\@noname
							\else
								\vskip 0.4em
								\bfseries {II. DANI\c{S}MAN}
								\vskip -0.4em
								\bfseries\@cosvname
							\fi
						} % danışmaların kutusu
						\vskip 2.2em
						\@coverdate
						
					\end{center}
				} % iç parbox
			} \hspace*{-5.8pt} % iç fbox
		} % dış fbox
	\end{center}
	\vskip -1.4em
	\hspace*{12.7cm}\bfseries{\.{I}STANBUL}
	\normalfont
	\thispagestyle{empty}
	
	% çift taraflı baskıda boş sayfa oluştur
	\makeemptypage
}

\newcommand\jurypage{
	\newpage
	\vspace*{1em}
	\def\sbjury{2.4em}
	\def\sbvisr{4.7em}
	\def\sbetwn{8em}
	
	\jurycheck % jüri isimleri kontrol edilecek
	
	\ifx\@degree\phd \def\prgtype{\phdtr} \fi
	\ifx\@degree\msc 
		\def\prgtype{\msctr}
		\def\sbjury{2.4em}
		\def\sbvisr{4.7em}
		\def\sbetwn{8em}
	\fi

	\begin{minipage}{1.0\textwidth}
		\setstretch {1.5}
		Bu \c{c}al{{\i}\c{s}}ma \@acceptdate\;tarihinde a\c{s}a\u{g}{\i}daki j\"{u}ri taraf{\i}ndan 
		\@department\;\@program nda\;\prgtype\;Tezi olarak kabul edilmi\c{s}tir. %"
	\end{minipage}
	\vspace*{\sbjury}
	\begin{center}
		\bfseries {Tez J\"{u}risi}%"
	\end{center}
	
	\vspace*{\sbvisr}
	\begin{singlespace}
		\begin{tabular}{>{\centering\arraybackslash} m{0.98\textwidth}}
				\normalfont\@svname\; {(Dan{\i}\c{s}man)} \\
				\normalfont\@svuniv\; \\
				\normalfont\@svfaculty\;
		\end{tabular}

		\vspace*{\sbetwn}	
		\begin{tabular}{>{\centering\arraybackslash} m{0.49\textwidth} >{\centering\arraybackslash} m{0.49\textwidth}}
				\normalfont\@janame\;   & \normalfont\@jbname\; \\
				\normalfont\@jauniv 	& \normalfont\@jbuniv\;\\
				\normalfont\@jafaculty	& \normalfont\@jbfaculty
		\end{tabular}
		
		\vspace*{\sbetwn}
		\ifx\@degree\phd	
			\begin{tabular}{>{\centering\arraybackslash} m{0.49\textwidth} >{\centering\arraybackslash} m{0.49\textwidth}}
					\normalfont\@jcname\;   & \normalfont\@jdname\; \\
					\normalfont\@jcuniv 	& \normalfont\@jduniv\;\\
					\normalfont\@jcfaculty	& \normalfont\@jdfaculty
			\end{tabular}
		\fi
		
	\end{singlespace}
	\thispagestyle{empty}
	
	% çift taraflı baskıda boş sayfa oluştur
	\makeemptypage
}

\newcommand\accordance{
	\newpage
	\thispagestyle{empty}
	\par\null\vfill
	\begin{minipage}{1.0\textwidth}
		\hspace*{1.5em}-\hspace*{1.5em}\textbf{\.{I}ntihal Program{\i} Beyan{\i}}\vskip 0.9em
		\fbox{\begin{minipage}{1.0\textwidth}\setstretch {1.5}
		20.04.2016 tarihli resmi gazetede yay{\i}mlanan Lisans\"{u}st\"{u} E\u{g}itim ve \"{O}\u{g}retim
		Y\"{o}netmeli\u{g}inin 9/2 ve 22/2 maddeleri gere\u{g}ince$;$ Bu Lisans\"{u}st\"{u} teze, \.{I}stanbul
		\"{U}niversitesi'nin abonesi oldu\u{g}u intihal yaz{\i}l{\i}m program{\i} kullan{\i}larak Fen Bilimleri
		Enstit\"{u}s\"{u}'n\"{u}n belirlemi\c{s} oldu\u{g}u \"{o}l\c{c}\"{u}tlere uygun 
		rapor al{\i}nm{\i}\c{s}t{\i}r.
		\end{minipage}}
	
		\ifx\@projects\@noname
		\else
			\vskip 1.0em
			\hspace*{1.5em}-\hspace*{1.5em}\textbf{Proje Destekleri}\vskip 0.9em
			\fbox{\begin{minipage}{1.0\textwidth}\setstretch {1.5}
				\@projects
			\end{minipage}}
		\fi
		
		\ifx\@thesispapers\@noname
		\else
			\vskip 1.0em
			\hspace*{1.5em}-\hspace*{1.5em}\textbf{Tezden \"{U}retilmi\c{s} Yay{\i}nlar{\i}n K\"{u}nye Bilgileri}\vskip 0.9em
			\fbox{\begin{minipage}{1.0\textwidth}\setstretch {1.0}
				\@thesispapers
			\end{minipage}}
		\fi
		\vspace*{5em}	
	\end{minipage}
	
	% çift taraflı baskıda boş sayfa oluştur
	\makeemptypage	
}

\newenvironment{summary}[1][tr]{
	\newpage
	\def\sec{#1}
	
	\ifx\sec\dtr
		\let\@txttitle\@title
		\gdef\titlname{\"{O}ZET} %"
		\gdef\@txtthesis{TEZ\.{I}}
		\gdef\@txtuniv{\.{I}stanbul \"{U}niversitesi}  %"
		\gdef\@txtenstit{Sosyal Bilimleri Enstit\"{u}s\"{u}}
		\gdef\@txtdepart{\@department\;}
		\let\@txtsvname\@svname
		\let\@txtcosvname\@cosvname
		\gdef\@txtspvr{Dan{\i}\c{s}man:\;}
		\gdef\@txtcospvr{II. Dan{\i}\c{s}man:\;}
		\ifx\@degree\phd \def\prgtype{\phdtrb} \fi
		\ifx\@degree\msc \def\prgtype{\msctrb} \fi
		\vspace*{2.6em}
	\fi	
	\ifx\sec\den
		\let\@txttitle\@titleen
		\select@language{english}
		\gdef\titlname{SUMMARY}
		\gdef\@txtthesis{THESIS}
		\gdef\@txtuniv{\.{I}stanbul University}
		\gdef\@txtenstit{Institute of Graduate Studies in Sciences}
		\let\@txtdepart\@departmenten
		\let\@txtsvname\@svnameen
		\let\@txtcosvname\@cosvnameen
		\gdef\@txtspvr{Supervisor:\;}
		\gdef\@txtcospvr{Co-Supervisor:\;}
		\ifx\@degree\phd \def\prgtype{\phden} \fi
		\ifx\@degree\msc \def\prgtype{\mscen} \fi
		\vspace*{3.1em}
	\fi
	
	\bfseries{\large\MakeUppercase{\titlname}}
	\vspace*{0.25em}
	\begin{spacing}{0.95}
	\begin{center}
%		\vspace*{-0.2em}
		\bfseries{\large\prgtype\;\@txtthesis}
		\vskip 0.35em 
		\parbox[b][15mm][t]{147mm}{ % tez adı kutusu
			\centering
			\begin{spacing}{1.2}
				\bfseries\MakeUppercase\@txttitle
			\end{spacing}
		}
		\vskip 1.0em
		\@author
		\vskip 2.1em
		\@txtuniv
		\vskip -0.1em
		\@txtenstit
		\vskip 0.2em
		
		\@txtdepart
		\vskip 2.7em 
		\parbox[t][13mm][t]{147mm}{ % danışman kutusu
			\centering
				\@txtspvr \@txtsvname
				\ifx\@cosvname\@noname
				\else
					\vskip 0.6em
					\@txtcospvr \@txtcosvname
				\fi
		}
		\vspace*{-1.3em}
	\end{center}
	\normalfont
}{
	%\vfill
	\vskip 0.5em
	\ifx\sec\dtr	
		\gdef\@txtpage{sayfa.}
		\gdef\@txtkeyw{Anahtar kelimeler:}
		\gdef\@boxwdt{0.76}
	\fi
	\ifx\sec\den
		\gdef\@txtpage{pages.}
		\gdef\@txtkeyw{Keywords:}
		\gdef\@boxwdt{0.86}
	\fi
	
	\@presdate,\;\@numpages\;\@txtpage
	\vskip 0.1em
	\bfseries{\@txtkeyw}\;\normalfont
	\parbox[t][2em][t]{\@boxwdt\textwidth}{\@keywords}
	\vskip 1em	
	\end{spacing}
	\addcontentsline{toc}{section}{\titlname\iuspace}
	\ifx\sec\den
		\select@language{turkish}
	\fi
}

\newenvironment{preface}{
	\newpage
	% sayfa numaralama bu bölüm ile başlamaktadır.
	\setcounter{page}{4}
	
	\vspace*{0.2em}
	\bfseries{\large\MakeUppercase\prefacename} 
	\vskip 0.5em
	\normalfont
	\begin{singlespace}
}{\end{singlespace}
	\vskip 0.5em
	%\vfill
	\@coverdate \hfill \@author
	\addcontentsline{toc}{section}{\prefacename\iuspace}
}

\newenvironment{symbolspage}{
	\newpage
	\gdef\sympagename{S\.{I}MGE VE KISALTMA L\.{I}STES\.{I}}
	\vspace*{1.4em}
	\bfseries{\large\sympagename}
	\vskip 0.5em
}{
	\addcontentsline{toc}{section}{\sympagename\iuspace}
}

\newenvironment{symbols}{
	\bfseries{Simgeler \hspace{2cm} A\c{c}{\i}klama}
	\normalfont
	\vspace*{-1em}
	\renewcommand\descriptionlabel[1]{\hspace{1mm}\parbox[t]{2.8cm}{\textbf{\textit{##1}}}:}
	\begin{description}
		\itemsep -0.5em
		\labelsep 0.2em
	}{\end{description}}

\newenvironment{abbreviations}{
	\vspace*{1.5em}
	\bfseries{K{\i}saltmalar \hspace{3.2em} A\c{c}{\i}klama}
	\normalfont
	\vspace*{-1em}
	\renewcommand\descriptionlabel[1]{\hspace{1mm}\parbox[t]{2.8cm}{\textbf{\textit{##1}}}:}
	\begin{description}
		\itemsep -0.6em
		\labelsep 0.2em
	}{\end{description}}
	

\newenvironment{cvthesis}{
	\completepage
	\vspace*{-2.5em}
	\gdef\cvtname{\"{O}ZGE\c{C}M\.{I}\c{S}}  %"
	\bfseries{\large\cvtname}
	\vskip 3.1em
	\renewcommand{\arraystretch}{1.08}%
	\setlength{\arrayrulewidth}{0.25mm}
	\begin{table}[htbp]
}{
	\end{table}
	\addcontentsline{toc}{section}{\cvtname\iuspace}
}

\newcommand*{\cvitem}[2]{#1 & #2 \\[-0.5mm] \hline }
\newcommand*{\cvitemb}[1]{\cgray \multicolumn{2}{|c|}{\vspace*{-0.5mm}\textbf{#1}} \\ \hline}
\newcommand*{\cgray}{\rowcolor[rgb]{.851, .851, .851}}
\newcommand*{\cvimage}[1]{
	\def\@pimage{#1}
	\hspace*{-0.2mm}%
	\begin{minipage}{0.2\textwidth}
		\includegraphics[width=38mm]{\@pimage}
	\end{minipage}
}

\newcommand{\cvcheckbox}{\raisebox{0.5pt}{\setlength{\fboxsep}{3pt}\fbox{X}}\hspace{1mm}}
\newcommand{\cvemptybox}{\raisebox{0.5pt}{\fbox{\color{white}X}}\hspace{1mm}}

\newcommand*{\cvnation}[1]{
	\def\@tc{tc}
	\def\@cvn{#1}
	\ifx\@cvn\@tc
		\cvitem {Uyru\u{g}u}{\cvcheckbox T.C. \hspace{7mm} \cvemptybox Di\u{g}er: }
	\else
		\cvitem {Uyru\u{g}u}{\cvemptybox T.C. \hspace{7mm} \cvcheckbox Di\u{g}er: \MakeUppercase#1}
	\fi
}
\newcommand*{\cvarticles}{\textbf{\textit{Makaleler}}\par\vspace*{-1.8em}}
\newcommand*{\cvpapers}{\vspace*{1.5em}\textbf{\textit{Bildiriler}}\par\vspace*{-1.8em}}
\newcommand*{\cvitema}[1]{\hangindent=2.4em \singlespacing #1 \par\vspace*{-1.2em}}

\newenvironment{cvsection}[1][yeni]{
	\gdef\nosel{yeni}
	\def\entry{#1}
	%her hangi bir seçim girilmemişse
	\ifx\entry\nosel
		\gdef\sno{4}
		\noindent\begin{tabular}{|b{30mm}|b{111.0mm}|} \hline
	\else
		\Param{\entry}{, }{sno}{header}
		\ifnum\sno=0
			\noindent\begin{tabular}{|b{30mm}|b{68.3mm}|} \hline
		\else
			\noindent\begin{tabular}{|b{30mm}|b{111.0mm}|} \hline
		\fi
		\cgray \multicolumn{2}{|c|}{\vspace*{-0.5mm}\textbf{\header}} \\ \hline
	\fi
	}{
		\ifnum\sno=4
			\hline
		\else
		\fi
		
		\end{tabular}%
		\ifnum\sno=0
			\vspace*{0.5cm}
		\else
			\vspace*{0.4cm}
		\fi
	}

\setcounter{secnumdepth}{4}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thesection      {\@arabic\c@section.}
\renewcommand \thesubsection   {\thesection\@arabic\c@subsection.}
\renewcommand \thesubsubsection{\thesubsection\@arabic\c@subsubsection.}
\renewcommand \theparagraph    {\thesubsubsection\@arabic\c@paragraph.}
\renewcommand \thesubparagraph {\theparagraph\@arabic\c@subparagraph.}
	 
\newcommand\section{\@startsection {section}{1}{\z@}{\z@}{1ex}%
	{\singlespacing\normalfont\large\bfseries\MakeUppercase}}
	
\let\stdsection\section
\renewcommand\section{\newpage \vspace*{3mm} \stdsection}

\newcommand\subsection{\@startsection{subsection}{2}{\z@}{2.5ex}{0.1ex}%
	{\singlespacing\normalfont\bfseries\MakeUppercase}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}{-2.1ex}{0.1ex \vspace*{-1ex}}%
	{\singlespacing\normalfont\normalsize\bfseries}}

\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}{3ex}{1ex \vspace*{-3ex} }%
	{\singlespacing\normalfont\normalsize\bfseries\itshape}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}{2.5ex}{0.1ex}%
	{\singlespacing\normalfont\normalsize\bfseries\itshape}}

\newenvironment{section*}{\@dblfloat{section}}{\end@dblfloat}

\newcommand*\l@section[2]{%
	\ifnum \c@tocdepth >\z@
		\addpenalty\@secpenalty
		\addvspace{-0.2em \@plus\p@}
		\setlength\@tempdima{1.3em}
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode \bfseries
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\MakeUppercase{#1}\iuspace\mydots \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		\endgroup
	\fi}
	
\newcommand{\l@subsection}[2]{
	\addvspace{-0.1em}
	\@dottedtocline{2}{0.7em}{1.8em}%
	{\MakeUppercase{#1}\iuspace}{#2}
}	
%\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection[2]{\addvspace{-0.2em} \@dottedtocline{3}{1.8em}{2.5em}{#1\iuspace}{#2}}
\newcommand*\l@paragraph[2]{\addvspace{-0.2em} \@dottedtocline{4}{2.9em}{3.4em}{\textit{#1}\iuspace}{#2}}
\newcommand*\l@subparagraph[2]{\addvspace{-0.2em} \@dottedtocline{5}{6em}{4.3em}{\textit{#1}\iuspace}{#2}}

\setlength\leftmargini  {2.5em}
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}

\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}

\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

\newtheorem{theorem}{Theorem}
\newtheorem{definition}[theorem]{Tanımlama}

\@addtoreset{theorem}{section}% Reset theorem counter with every section
\@addtoreset{theorem}{subsection}
\@addtoreset{theorem}{subsubsection}
\newcommand{\theoremprefix}{}
\let\thetheoremsaved\thetheorem
\renewcommand{\thetheorem}{\theoremprefix\thetheoremsaved}
\let\sectionsaved\section
\patchcmd{\@startsection}{\par}{\renewcommand{\theoremprefix}{\csname the#1\endcsname}}{}{}

\newenvironment{description}{
	\list{}{\labelwidth\z@ \itemindent-\leftmargin
	\let\makelabel\descriptionlabel}
}{\endlist}

\newcommand*\descriptionlabel[1]{
	\hspace\labelsep
	\normalfont\bfseries #1
}

\newenvironment{verse}{
	\let\\\@centercr
	\list{}{\itemsep      \z@
	\itemindent   -1.5em%
	\listparindent\itemindent
	\rightmargin  \leftmargin
	\advance\leftmargin 1.5em}%
	\item\relax
}{\endlist}

\newenvironment{quotation}{
	\list{}{\listparindent 1.5em%
	\itemindent    \listparindent
	\rightmargin   \leftmargin
	\parsep        \z@ \@plus\p@}%
	\item\relax
}{\endlist}

\newenvironment{quote}{
	\list{}{\rightmargin\leftmargin}%
	\item\relax
}{\endlist}

\newcommand\@Applabel{EK\;}
\def\mydots{\xleaders\hbox to0.3em{\hfil.\hfil}\hfil}  

\newenvironment{appendix}{
	\newpage
	\gdef\apndxname{EKLER}
	\addcontentsline{toc}{section}{\apndxname\iuspace}
	\section*{\apndxname}
	\vspace*{3.5ex}
	\setcounter {section}{0}%
	\setcounter {subsection}{0}%
	\setcounter {equation}{0}%

	\gdef\thesection{\bfseries\@Applabel\@arabic\c@section.}

	\renewcommand\section{\@startsection {section}{2}{\z@}%
		{2.5ex}{1ex \vspace*{-3ex}}{\singlespacing\normalfont\bfseries}}
			
	\renewcommand\subsection{\@startsection{subsection}{3}{\z@}%
		{2.5ex}{0.1ex \vspace*{-2.1ex}}{\singlespacing\normalfont\bfseries}}
		
	\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
		{2.5ex}{0.1ex \vspace*{-2.1ex}}{\singlespacing\normalfont\bfseries\itshape}}
		
		
	\addtocontents{toc}{\bgroup
		\string\renewcommand\string\l@section{\string\addvspace{-0.2em}\string\@dottedtocline{1}{1.5em}{3.0em}}
		\string\renewcommand\string\l@subsection{\string\addvspace{-0.2em}\string\@dottedtocline{1}{3.8em}{3.8em}}
		\string\renewcommand\string\l@subsubsection{\string\addvspace{-0.2em}\string\@dottedtocline{1}{5.8em}{4.5em}}
	}
}{
	\addtocontents{toc}{\egroup}
	\addvspace{0em}
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

\@addtoreset{equation}{section}
\renewcommand \theequation {\@arabic\c@section.\@arabic\c@equation}

\setlength\textwidth {155mm}
\setlength\textheight {241mm}		
\setlength\hoffset {8mm}
\setlength\voffset {5mm}
\setlength\headheight {10pt}
\setlength\headsep {9.5mm}
\setlength\topmargin {-11mm}
\setlength{\parskip}{1em}
\setlength{\parindent}{0em}
\setlength{\footskip}{2mm}
\setlength\oddsidemargin {0mm}
%\setlength{\topskip}{0pt}

\if@twoside
	\setlength\evensidemargin {-15mm}
\else
	\setlength\evensidemargin {0mm}
\fi

\newcommand*\l@figure[2]{\addvspace{-0.2em}\@dottedtocline{1}{-2.316em}{4.7em}{\hspace*{2.5em}\noindent #1}{#2}}
%\newcommand*\l@table{\@dottedtocline{1}{0em}{4.5em}}
\newcommand*\l@table[2]{\addvspace{-0.2em}\@dottedtocline{1}{-2.316em}{4.7em}{\hspace*{2.5em}\noindent #1}{#2}}

\newcounter{figure}
\@addtoreset{figure}{section}
\renewcommand\thefigure{\textbf{\figurename\;\@arabic\c@section.\@arabic\c@figure:}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\small \thefigure}

\newenvironment{figure}{
	\shorthandoff{=}
	\@float{figure}}{
	\end@float
	\normalfont
	\shorthandon{=}}

\newenvironment{figure*}{
	\shorthandoff{=}
	\@dblfloat{figure}}{
	\end@dblfloat
	\normalfont
	\shorthandon{=}}

\newcounter{table}
\@addtoreset{table}{section}
\renewcommand\thetable{\textbf{\tablename\;\@arabic\c@section.\@arabic\c@table:}}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\small \thetable}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}

\newenvironment{table}
               {\setlength\belowcaptionskip{10\p@}
			    \@float{table}}			
               {\end@float
			   \normalfont
			   \setlength\belowcaptionskip{0\p@}}
\newenvironment{table*}
               {\setlength\belowcaptionskip{10\p@}
			    \@dblfloat{table}}
               {\end@dblfloat
			   \normalfont
			   \setlength\belowcaptionskip{0\p@}}

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
  
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

\newcommand\@pnumwidth{1.4em}
\newcommand\@tocrmarg{1.4em}
\newcommand\@dotsep{0.4}
\setcounter{tocdepth}{4}

\newcommand\tableofcontents{%
	\gdef\cntname{\contentsname} %{{\.I}\c{C}{\.I}NDEK{\.I}LER}
	\section*{\cntname}%
	\@mkboth{\MakeUppercase\cntname}{\MakeUppercase\cntname}
	\vspace*{1.8mm}
	\hfill \textbf{Sayfa No} \par \vspace*{0.8ex}
	\begin{spacing}{0.5}
		\@starttoc{toc}
		\addcontentsline{toc}{section}{\cntname\iuspace}
	\end{spacing}
	\normalsize
}

\newcommand*\@sayfano{
	\vspace*{-1mm}
	\hfill \textbf{Page No} \par %\vspace*{-1ex}
}

\newcommand\listoffigures{
	\gdef\lstname{\listfigurename} %{\c{S}EK{\.I}L L{\.I}STES{\.I}}
	\section*{\lstname}
		\@mkboth{\MakeUppercase\lstname}
		{\MakeUppercase\lstname}
	\@sayfano
	\vspace*{2mm}
	\small
	\begin{spacing}{1.0}
		\@starttoc{lof}
		\addcontentsline{toc}{section}{\lstname}
	\end{spacing}
	\normalsize
}

%\let\l@table\l@figure
\newcommand\listoftables{%
	\gdef\tblname{\listtablename} %{TABLE L{\.I}STES{\.I}}
	\section*{\tblname}%
	\@mkboth{%
		\MakeUppercase\tblname}%
		{\MakeUppercase\tblname}%
	\vspace*{1mm}
	\@sayfano
	\vspace*{2mm}
	\small
	\begin{spacing}{1.0}
		\@starttoc{lot}
		\addcontentsline{toc}{section}{\tblname\iuspace}
	\end{spacing}
	\normalsize
}

\newenvironment{thebibliography}{}{}% <-- keep natbib happy
%\RequirePackage[round, sort&compress]{natbib}

\newdimen\bibindent
\setlength\bibindent{2.5em}
\def\@bibnum{numeric}

\newcommand\iusosbil@bibindent{%
	\advance\leftmargin\bibindent
	\itemindent -\bibindent
	\listparindent \itemindent
	\parsep \z@
}%
\def\newblock{\hskip .11em\@plus.33em\@minus.07em}

\renewcommand\@biblabel[1]{[#1].}

\newcommand*\iubibliostart[1]{
	\gdef\@iubibstyle{#1}
	
	\renewenvironment{thebibliography}[1]{%
		\section*{\refname}%
		\@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
		\addcontentsline{toc}{section}{\MakeUppercase\refname\iuspace}
		\vspace*{0.6em}
		\begin{spacing}{1.0}
			\list{}%
			{%
				\ifx\@iubibstyle\@bibnum
					\setlength\bibindent{1.0em}
					\settowidth\labelwidth{\@biblabel{#1}}%
					\setlength{\leftmargin}{\bibindent}
					\addtolength{\leftmargin}{1.7em}%
					\setlength{\itemindent}{-\bibindent}%
					\setlength{\listparindent}{\itemindent}
					\setlength{\itemsep}{\bibsep}
					\setlength{\parsep}{\z@}
				\else
					\advance\leftmargin-\leftmargin
					\advance\leftmargin\bibindent
				\fi
			}%
			\leftmargin\labelwidth
			\iusosbil@bibindent
			\sloppy
			\clubpenalty4000
			\@clubpenalty \clubpenalty
			\widowpenalty4000%
			\sfcode`\.\@m
	}{	\def\@noitemerr
			{\@latex@warning{Empty `thebibliography' environment}}%
			\endlist
		\end{spacing}
	}
}

\renewcommand\footnoterule{%
	\kern-3\p@
	\hrule\@width.35\columnwidth
	\kern2.6\p@}

\addtolength{\skip\footins}{3pt}
\setlength{\footnotesep}{10pt}
\renewcommand{\thefootnote}{\textbf{\arabic{footnote}} \hspace*{1pt}}

\renewcommand\footnotesize{%
	\@setfontsize\footnotesize\@ixpt{8}%
	\abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
	\abovedisplayshortskip \z@ \@plus\p@
	\belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
	\def\@listi{\leftmargin\leftmargini
		\topsep 4\p@ \@plus2\p@ \@minus2\p@
		\parsep 2\p@ \@plus\p@ \@minus\p@
		\itemsep \parsep}%
	\belowdisplayskip \abovedisplayskip
}

\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.1em{\hss\@makefnmark}#1}
  
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}

\addto\extrasturkish{%
  \uccode`i=\string"9D \uccode\string"19 = `I
  \lccode\string"9D=`i \lccode`I=\string"19 
}
\addto\noextrasturkish{%
  \uccode`i=`I \lccode`I=`i
}

\mdfdefinestyle{guidelinestyle}{% 
	linecolor=black,
	linewidth=1pt,
	frametitlerule=true,
	frametitlefont=\bfseries,
	frametitlebackgroundcolor=gray!30,
	innertopmargin=\topskip,
	innerbottommargin=1cm,
	frametitle={Makale ve Bildiriler},
	frametitleaboveskip=3pt, frametitlebelowskip=3pt,
	frametitlealignment={\hspace*{0.36\linewidth}}, everyline=true,
	splitbottomskip = 5mm, splittopskip = 10mm,
} 

\newmdenv[style=guidelinestyle]{ArticlePapers}
  
\pagenumbering{roman}
\pagestyle{plain}
\raggedbottom
\onecolumn

\endinput
%%
%% End of file `iusosbil.cls'.
