% !TeX spellcheck = de_DE
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gitgame}[2024/10/21 macros for Git the card game by arkonia]

\def\gitgameversion{1.1}

\PassOptionsToClass{DIV=15, fontsize=11pt, oneside}{scrartcl}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass{scrartcl}
\setkomafont{sectioning}{\normalfont\bfseries\boldmath}

\RequirePackage{xcolor}

\hyphenation{Ar-beits-ver-zeich-nis dei-n-en Ent-wick-lern Issues müs-sen ver-deckt}

\RequirePackage{iftex}
\ifPDFTeX
	\RequirePackage[T1]{fontenc}
	\RequirePackage{lmodern}
\fi

\RequirePackage{tikz}
%\usetikzlibrary{shadows}
\newcommand\dimenToMM[1]{%
	\textup{\pgfmathparse{int(round((#1)/1mm))}\pgfmathresult\,mm}%
}

\RequirePackage{enumitem}
\setlist{nolistsep}

\setlength\parindent{0pt}
\setlength\parfillskip{1em plus 1fil}
\setlength\parskip{0pt}

\newcommand\parendcentered{%
	\par
	\leftskip=0pt plus 1fil
	\rightskip=0pt plus -1fil minus 0.25em
	\parfillskip=0pt plus 2fil
}

%\usepackage{fontspec}
%\setmainfont{Linux Libertine O}
%\setsansfont{Linux Biolinum O}
\newcommand\hugefont[1]{\raisebox{-5pt}{\fontsize{50}{60}\sffamily\bfseries\selectfont #1}}
\newcommand\hugemathfont[1]{{\fontsize{40}{48}\sffamily\bfseries\selectfont #1}}
\newcommand\biggerfont[1]{{\fontsize{30}{36}\sffamily\bfseries\selectfont #1}}
\newcommand\bigfont[1]{{\fontsize{20}{24}\sffamily\bfseries\selectfont #1}}
\newcommand\subbigfont[1]{{\fontsize{16}{20}\sffamily\bfseries\selectfont #1}}
%\newcommand\textfontsize[1]{\fontsize{10}{12}\sffamily\selectfont #1}
\newcommand\textfontsize[1]{\fontsize{9}{10}\sffamily\selectfont #1}

\newcommand\rede[1]{\glqq #1\grqq{}}
\newcommand\textrule[1]{\textbf{#1}}
\newcommand\Item{$\bullet$\kern0.333em}

\newdimen\cardwidth
\cardwidth=59mm
\newdimen\cardheight
\cardheight=92mm
\newdimen\cardborder
\cardborder=4mm
\newdimen\cardborderradius
\cardborderradius=5mm
\newdimen\cardwidthplus
\cardwidthplus=65mm
\newdimen\cardtextwidth
\cardtextwidth=\cardwidth
\advance\cardtextwidth by -2.75\cardborder
\newdimen\cardlinewidth
\cardlinewidth=0.4pt

\newcount\cardnum
\cardnum=0
\newcount\auxnum
\newcommand\PlayerMarkerRound[2]{% Farbe, Zeichen
	\begin{tikzpicture}
		\draw[line width=1.5pt, fill=#1] (0,0) circle[radius=30pt] node {\hugefont{#2}};
	\end{tikzpicture}%
}
\newcommand\PlayerMarkerSquare[2]{% Farbe, Zeichen
	\begin{tikzpicture}
		\draw[line width=1.5pt, fill=#1] (0,0) rectangle (60pt,60pt) node[midway] {\hugefont{#2}};
	\end{tikzpicture}%
}
\newcommand\PlayerMarker[2]{% Farbe, Zeichen
	\PlayerMarkerRound{#1}{#2}%
}
\newcommand\PlayerMarkerWithShadow[2]{% Farbe, Zeichen
%	\PlayerMarker{#1, circular drop shadow={shadow xshift=3pt, shadow yshift=3pt, shadow scale=1.2}}{#2}%
	\PlayerMarker{#1}{#2}%
}
\newdimen\auxdim
\newif\ifschnittmarken
\schnittmarkenfalse
\newif\ifshowouterborder
\showouterbordertrue
\newcommand\Schnittmarken{%
	\clearpage
	\schnittmarkentrue
	\showouterborderfalse
	\auxdim=\cardwidth
	\advance\auxdim by \cardlinewidth
	\hbox to 0pt{\vbox to 0pt{\vskip-0.5\cardborderradius% oben
		\kern-0.5\cardlinewidth\vrule width \cardlinewidth height 0.5\cardborderradius depth 0.5\cardborderradius%
		\kern-0.5\cardlinewidth\kern-0.5\cardborderradius%
		\vrule width \cardborderradius height 0.5\cardlinewidth depth 0.5\cardlinewidth%
		\kern-0.5\cardborderradius%
	\kern\auxdim%
		\kern-0.5\cardlinewidth\vrule width \cardlinewidth height 0.5\cardborderradius depth 0.5\cardborderradius%
		\kern-0.5\cardlinewidth\kern-0.5\cardborderradius%
		\vrule width \cardborderradius height 0.5\cardlinewidth depth 0.5\cardlinewidth%
		\kern-0.5\cardborderradius%
	\kern\auxdim%
		\kern-0.5\cardlinewidth\vrule width \cardlinewidth height 0.5\cardborderradius depth 0.5\cardborderradius%
		\kern-0.5\cardlinewidth\kern-0.5\cardborderradius%
		\vrule width \cardborderradius height 0.5\cardlinewidth depth 0.5\cardlinewidth%
		\kern-0.5\cardborderradius%
	\kern\auxdim%
		\kern-0.5\cardlinewidth\vrule width \cardlinewidth height 0.5\cardborderradius depth 0.5\cardborderradius%
		\kern-0.5\cardlinewidth\kern-0.5\cardborderradius%
		\vrule width \cardborderradius height 0.5\cardlinewidth depth 0.5\cardlinewidth%
		\kern-0.5\cardborderradius%
	\vskip0.5\cardborderradius
	}}%
}
\newenvironment{CardBase}{%
	\ifschnittmarken% unten links
		\kern-0.5\cardlinewidth\vrule width \cardlinewidth height 0.5\cardborderradius depth 0.5\cardborderradius%
		\kern-0.5\cardlinewidth\kern-0.5\cardborderradius%
		\vrule width \cardborderradius height 0.5\cardlinewidth depth 0.5\cardlinewidth%
		\kern-0.5\cardborderradius%
		\fi%
	\global\advance\cardnum by 1%
	\begin{tikzpicture}
		\coordinate (URex) at (\cardwidth,\cardheight);
		\ifshowouterborder% Rahmen
			\draw[line width=\cardlinewidth, rounded corners=\cardborderradius, fill=white] (0,0) rectangle (URex);
		\fi
}{%
	\end{tikzpicture}%
	\ifnum\cardnum>2
		\ifschnittmarken% unten rechts
		\kern-0.5\cardlinewidth\vrule width \cardlinewidth height 0.5\cardborderradius depth 0.5\cardborderradius%
		\kern-0.5\cardlinewidth\kern-0.5\cardborderradius%
		\vrule width \cardborderradius height 0.5\cardlinewidth depth 0.5\cardlinewidth%
		\kern-0.5\cardborderradius%
		\vskip-0.5\cardborderradius
	\fi%
	\global\cardnum=0

	\vskip-1pt
	\fi%
}
\newcommand\CardBack[1][bgcolor2]{%
	\begin{CardBase}
		\path (0,0)--(\cardwidth,\cardheight) coordinate[midway] (Center) coordinate (URex);
		\path (URex)--+(-\cardborder,-\cardborder) coordinate (UR);
		\fill[#1, rounded corners=\cardborderradius] (\cardborder,\cardborder) coordinate (LL) rectangle (UR);
%	    \path (Center)+(0,0.15\cardheight) node {\includegraphics[width=0.5\cardwidth]{Git-Icon-Black}};
%	    \path (Center)+(0,-0.15\cardheight) node {\hugefont{git}};
%	    \path (Center)+(0,-0.35\cardheight) node {\textfontsize{v.\,\gitgameversion}};
		%
	    \path (Center) node {\includegraphics[width=0.5\cardwidth]{Git-Icon-Black}};
		\path (Center)+(0,-0.35\cardheight) node {\textfontsize{v.\,\gitgameversion}};
	\end{CardBase}%
}
\newenvironment{CardFront}[1]{%
  \begin{CardBase}
    \path (0,0)--(\cardwidth,\cardheight) coordinate[midway] (Center);
    \path (URex)--+(-\cardborder,-\cardborder) coordinate[pos=0.75] (URmed) coordinate (UR);
    \coordinate (ULex) at (0,\cardheight);
    \coordinate (LRex) at (\cardwidth,0);
    
    % innerer Rahmen
    \fill[bgcolor, rounded corners=\cardborderradius] (\cardborder,\cardborder) coordinate (LL) rectangle (UR);
    
    \path (LL)-|(UR) coordinate[midway] (LR);
    \path (LL)|-(UR) coordinate[midway] (UL);
    \path (UL)--(ULex) coordinate[pos=0.25] (ULmed);
    \path (LL)-|(UR) coordinate[midway] (LR);
    \path (LL)--(0,0) coordinate[pos=0.25] (LLmed);
    \path (LR)--(LRex) coordinate[pos=0.25] (LRmed);

    \path (Center)+(0,0.075\cardheight) coordinate (UCenter);
	
	% Überschrift
	\path (UCenter)+(0,0.2375\cardheight) node {\bigfont{#1}};
}{
  \end{CardBase}%
}

\colorlet{bgcolor}{gray!20}
\colorlet{bgcolor1}{green!20}
\colorlet{bgcolor2}{orange!25} % niedrige CRs
\colorlet{bgcolor3}{red!20}% hohe CRs
\colorlet{bg-green}{green!65}% = rgb 0.35,1,0.35
\colorlet{bg-yellow}{yellow!75}
\definecolor{bg-blue}{rgb}{0.333,0.667,1}
\colorlet{paleblue}{cyan!35}
\colorlet{errorcolor}{red!65}
\colorlet{warncolor}{orange!75}
\colorlet{nullcolor}{bg-yellow}
\colorlet{middlecolor}{bg-green}
\colorlet{highcolor}{bg-blue}
\colorlet{cherrycolor}{red!80!blue}
\colorlet{oddcolor}{magenta!65}

\newcommand\bgcolorbox[2]{{\fboxsep=0pt\colorbox{#1}{#2\strut}}}
\newcommand\CardTextField[1]{% Text
    \path (UCenter)+(0,-0.25\cardwidth-0.015\cardheight) node[anchor=north] {%
	\begin{minipage}{\cardtextwidth}
		\textfontsize\rightskip0pt minus 0.25em
		#1
	\end{minipage}};
}
\newcommand\CardFrontTikzBase[3]{% Überschrift, Tikz-Graphik, Text
	\begin{CardFront}{#1}
		% Tikz-Graphik
		#2
		
		% Textbereich
		\CardTextField{#3}
	\end{CardFront}%
}
\newcommand\CardFrontTikzCircle[4]{% Überschrift, Tikz-Graphik, Farbe, Text
	\CardFrontTikzBase{#1}{%
		% Linie
		\ifshowouterborder%
			\draw[line width=2pt] (UCenter)+(-0.5\cardwidth,0)--+(0.5\cardwidth,0);
		\else%
			\ifschnittmarken%
				\draw[line width=2pt] (UCenter)+(-0.5\cardwidth,0)--+(0.5\cardwidth,0);
			\else%
				\begin{pgfinterruptboundingbox}
					\draw[line width=2pt] 	(UCenter)+(-0.5\cardwidthplus,0)--+(0.5\cardwidthplus,0);		
				\end{pgfinterruptboundingbox}
			\fi%
		\fi%
		% Kreis
		\draw[line width=1.5pt, fill=#3] (UCenter) circle[radius=0.25*\cardwidth];
		#2}{#4}%
}
\newcommand\CardFrontTikzBox[5][0.25\cardwidth]{% halbe Breite, Überschrift, Tikz-Graphik, Farbe, Text
	\CardFrontTikzBase{#2}{%
		\draw[line width=1.5pt, rounded corners, fill=#4] (UCenter)++(-#1,-0.2\cardwidth) rectangle ++(2*#1,0.4\cardwidth);
		#3}{#5}%
}
\newcommand\CalcNumberColor[1]{% Zahlwert
	\ifnum#1<0
		\colorlet{numcolor}{errorcolor}%
	\else%
		\ifnum#1<8%
			\auxnum=#1
			\ifnum#1=0\else\advance\auxnum by -1\fi%
			\multiply\auxnum by 14
			\colorlet{numcolor}{middlecolor!\the\auxnum!nullcolor}%
		\else%
			\ifnum#1<32
				\auxnum=#1
				\advance\auxnum by -8
				\multiply\auxnum by 42
				\divide\auxnum by 10
				\colorlet{numcolor}{highcolor!\the\auxnum!middlecolor}%
			\else%
				\colorlet{numcolor}{highcolor}%
			\fi%
		\fi%
	\fi%
%
	\auxnum=#1
	\ifnum\auxnum<0%
		\multiply\auxnum by -1%
	\fi
	\loop\ifnum\auxnum>31%
		\advance\auxnum by -32%
	\repeat
	\ifnum\auxnum<16
		\def\sixteen{white}%
	\else%
		\def\sixteen{black}%
		\advance\auxnum by -16
	\fi%
	\ifnum\auxnum<8
		\def\eight{white}%
	\else%
		\def\eight{black}%
		\advance\auxnum by -8
	\fi%
	\ifnum\auxnum<4
		\def\four{white}%
	\else%
		\def\four{black}%
		\advance\auxnum by -4
	\fi%
	\ifnum\auxnum<2
		\def\two{white}%
	\else%
		\def\two{black}%
		\advance\auxnum by -2
	\fi%
	\ifnum\auxnum<1%
		\def\one{white}%
	\else%
		\def\one{black}%
	\fi%
	\auxnum=#1
}
\newcommand\DrawNumber[1][]{
	\ifnum\auxnum<0
		\path (UCenter)+(0,0.025\cardwidth) node[anchor=center] {\hugefont{X}};
	\else
		\path (UCenter)+(0,0.025\cardwidth) node[anchor=center] {#1\hugefont{\number\auxnum}};
		% Binärcode
		\ifnum\auxnum<16
			\path (UCenter)++(-0.09*\cardwidth,-0.125*\cardwidth) coordinate (aux);
		\else
			\path (UCenter)++(-0.12*\cardwidth,-0.125*\cardwidth) coordinate (aux);
			\draw[fill=\sixteen] (aux) circle[radius=1mm];
			\path (aux)++(0.06*\cardwidth,0) coordinate (aux);
		\fi
		\draw[fill=\eight] (aux) circle[radius=1mm];
		\path (aux)++(0.06*\cardwidth,0) coordinate (aux);
		\draw[fill=\four] (aux) circle[radius=1mm];
		\path (aux)++(0.06*\cardwidth,0) coordinate (aux);
		\draw[fill=\two] (aux) circle[radius=1mm];
		\path (aux)++(0.06*\cardwidth,0) coordinate (aux);
		\draw[fill=\one] (aux) circle[radius=1mm];
	\fi
}
\newcommand\DrawNumberBorder{%
	\ifnum\auxnum<0\else%
		\node[draw, line width=1pt, fill=numcolor, circle, inner sep=0pt, anchor=north west] (ULborder) at (ULmed) {\hphantom{\bigfont{0}}\clap{\bigfont{\number\auxnum}}\hphantom{\bigfont{0}}};%
		\node[draw, line width=1pt, fill=numcolor, circle, inner sep=0pt, anchor=north east] (URborder) at (URmed) {\hphantom{\bigfont{0}}\clap{\bigfont{\number\auxnum}}\hphantom{\bigfont{0}}};%
%		\node[draw, line width=1pt, fill=numcolor, circle, inner sep=0pt, anchor=north east, rotate=180] at (LLmed) {\hphantom{\bigfont{0}}\clap{\bigfont{\number\auxnum}}\hphantom{\bigfont{0}}};%
%		\node[draw, line width=1pt, fill=numcolor, circle, inner sep=0pt, anchor=north west, rotate=180] at (LRmed) {\hphantom{\bigfont{0}}\clap{\bigfont{\number\auxnum}}\hphantom{\bigfont{0}}};%
	\fi
}
\newcommand\DrawTextAtBorders[2][numcolor]{% Farbe, Text
	\node[draw, line width=1pt, fill=#1, rectangle, rounded corners, inner sep=1pt, minimum height=20pt, anchor=north west] (ULsign) at (ULmed) {\hphantom{\bigfont{0}}\clap{\bigfont{#2}}\hphantom{\bigfont{0}}};%
	\node[draw, line width=1pt, fill=#1, rectangle, rounded corners, inner sep=1pt, minimum height=20pt, anchor=north east] (URsign) at (URmed) {\hphantom{\bigfont{0}}\clap{\bigfont{#2}}\hphantom{\bigfont{0}}};%
%	\node[draw, line width=1pt, fill=#1, rectangle, rounded corners, inner sep=1pt, minimum height=20pt, anchor=north east, rotate=180] at (LLmed) {\hphantom{\bigfont{0}}\clap{\bigfont{#2}}\hphantom{\bigfont{0}}};%
%	\node[draw, line width=1pt, fill=#1, rectangle, rounded corners, inner sep=1pt, minimum height=20pt, anchor=north west, rotate=180] at (LRmed) {\hphantom{\bigfont{0}}\clap{\bigfont{#2}}\hphantom{\bigfont{0}}};%
}
\newcommand\DrawSignAtBorders[2]{% Farbe, tikz-Graphik
	\DrawTextAtBorders[#1]{}
	\begin{scope}[shift={(ULsign)}]
		#2
	\end{scope}
	\begin{scope}[shift={(URsign)}]
		#2
	\end{scope}
}
\newcommand\DrawNumberAtBorder[1][numcolor]{% Farbe
	\ifnum\auxnum<0\else%
		\DrawTextAtBorders[#1]{\number\auxnum}
	\fi
}
\newcommand\CardFrontCommit[2][\centering\rede{git push!}]{% Text, Zahlwert
	\CalcNumberColor{#2}%
	\CardFrontTikzCircle{commit}{\DrawNumber\DrawNumberBorder}{numcolor}{#1}%
}
\newcommand\CardFrontCommitPlus[5][commit]{% Überschrift, Text, Zahlwert, Symbol, Farbe
	\CalcNumberColor{#3}%
	\CardFrontTikzCircle{#1}{\DrawNumber\DrawNumberBorder %
%		\draw[line width=1.25pt, rounded corners, fill=#5] (UCenter)++(30:0.275\cardwidth) coordinate (c)++(-90:0.0866\cardwidth)--++(0:0.15\cardwidth)--++(120:0.3\cardwidth)--++(-120:0.3\cardwidth)--cycle;
%		\node[anchor=center] at (c) {\biggerfont{#4}};
		\draw[line width=1pt, rounded corners, fill=#5] (ULborder.south)++(0,-0.035\cardheight) coordinate (c)++(-90:0.0433\cardwidth)--++(0:0.075\cardwidth)--++(120:0.15\cardwidth)--++(-120:0.15\cardwidth)--cycle;
		\node[anchor=center] at (c) {\subbigfont{#4}};
		
		\draw[line width=1pt, rounded corners, fill=#5] (URborder.south)++(0,-0.035\cardheight) coordinate (c)++(-90:0.0433\cardwidth)--++(0:0.075\cardwidth)--++(120:0.15\cardwidth)--++(-120:0.15\cardwidth)--cycle;
		\node[anchor=center] at (c) {\subbigfont{#4}};
	}{numcolor}{#2}%
}
\newcommand\CardFrontSign[5][\empty]{% [Eckzeichen], Überschrift, Zeichen, Farbe, Text
	\CardFrontTikzBox{#2}{%
		% Mitte
		\path (UCenter) node[anchor=center] {\hugefont{#3}};
		% Ecken
		\DrawTextAtBorders[#4]{\ifx\empty#1#3\else#1\fi}
	}{#4}{#5}%
}

\newcommand\tagnode[3][line width=1pt]{% [tikz options], length, position
	\draw[rounded corners=0.025*#2, fill=highcolor, #1] (#3)++(-0.2*#2,-0.175*#2)--++(0.4*#2,0)--++(0.175*#2,0.175*#2)--++(-0.175*#2,0.175*#2)--++(-0.4*#2,0)--cycle;
	\draw[#1, fill=bgcolor] (#3)+(0.235*#2,0) circle[radius=0.05*#2];
	\path (#3)++(-0.2*#2,0) coordinate (tagnode_left);
	\path (#3)++(0.185*#2,0) coordinate (tagnode_hole_left);
}
\newcommand\CardRelease{%
	\CardFrontTikzBase{release}{%
		% Mitte
		\path (UCenter)++(-0.075\cardwidth,0) coordinate (tagcenter);
		\tagnode[line width=1.5pt]{\cardwidth}{tagcenter}
		\node at (tagcenter) {\bigfont{v\,1.x}};
		% Linie
		\draw[line width=2pt] (UCenter)+(-0.5\cardwidth,0)--(tagnode_left);
		\draw[line width=2pt] (UCenter)+(0.5\cardwidth,0)--(tagnode_hole_left);
		% Ecken
		\path (UL)+(1mm,-4mm) coordinate (tagcenter);
		\begin{scope}[rotate=90]
			\tagnode{0.25*\cardwidth}{tagcenter}
		\end{scope}
		\path (UR)+(-1mm,-4mm) coordinate (tagcenter);
		\begin{scope}[rotate=90]
			\tagnode{0.25*\cardwidth}{tagcenter}
		\end{scope}
	}{%
	\centerline{\rede{git tag .\,.\,. und Lieferung!}}\vskip1ex
%	Ich beschließe, dass der aktuelle Stand ausgeliefert wird:
	\Item Werte alle Karten im Repository aus und leg sie sowie die aktuellen Issues und alle Handkarten auf den Abwurfstapel.\\
	\Item Leg diese Karte auf den Abwurfstapel und ziehe einen neuen CR.}%
}
\newcommand\CardRevert{%
	\CardFrontTikzBox{revert}{%
		% Mitte
		\begin{scope}[line width=2pt]
			\path (UCenter)--+(0.05\cardwidth,0.075\cardheight) coordinate (aux);
			\node[draw, fill=gray, circle, radius=1.5mm]  (A) at (aux) {};
			\path (UCenter)--+(0.05\cardwidth,-0.075\cardheight) coordinate (aux);
			\node[draw, fill=gray, circle, radius=1.5mm]  (B) at (aux) {};
			\draw (A)--(B);
			\draw[->] (A)..controls +(-0.2\cardwidth,0) and +(-0.2\cardwidth,0)..(B);
		\end{scope}
		% Ecken:
		\DrawSignAtBorders{warncolor}{%
		\begin{scope}[line width=1pt]
			\draw[-latex] (0,-0.03\cardwidth)--++(0.02\cardwidth,0) arc (-90:90:0.025\cardwidth)--++(-0.07\cardwidth,0);
		\end{scope}
		}
	}{warncolor}{%
		\centerline{\rede{git revert!}}\vskip1ex
		Der gerade geschriebene Code ist fehlerhaft und muss wieder weg:\vskip0.5ex
		\Item Muss unmittelbar auf einen Commit folgen und negiert ihn.\\
		\Item Leg diese Karte und den Commit auf den Abwurfstapel.}%
}
\newcommand\CardMergeConflict[1]{% Zahlwert
	\CardFrontCommitPlus[conflict]{%
		\centerline{\rede{git push -- merge conflict!}}\vskip1ex
		Mit diesem Commit verursachst und löst du einen Merge Conflict:\vskip0.5ex
		\Item Übernimm den vorherigen Commit als deinen eigenen. Schieb ihn unter diese Karte, diese beiden Commits gelten ab jetzt als einer.}{#1}{!}{bg-yellow}%
}
\newcommand\CardMergeRequest[1]{% Zahlwert
	\CardFrontCommitPlus[request]{%
		\centerline{\rede{git push -- merge request!}}\vskip1ex
		Mit diesem Commit \textit{bittest} du deinen Kollegen um ein Code Review, dass er natürlich auch durchführt:\vskip0.5ex
		\Item Der nächsten Spieler muss ein Revert ausspielen oder einmal aussetzen.}{#1}{?}{paleblue}%
}
\newcommand\CardRefactoring[1][0]{% Zahlwert
	\CardFrontCommitPlus[refactoring]{%
	\centerline{\rede{git push -- refactoring!}}\vskip1ex
	\Item Mit diesem Commit übernimmst du die vorherigen drei Commits als deine eigenen. Dazu müssen schon mindestens drei Commits ausliegen. Schieb sie unter diese Karte, alle diese Commits gelten ab jetzt als einer.}{#1}{!}{errorcolor}%
}
\newcommand\CardIssue[2][CR]{% Zusatz, Zahlwert
	\CalcNumberColor{#2}%
	\CardFrontTikzBox{Issue: #1}{\DrawNumber\DrawNumberAtBorder}{numcolor}{%
		\Item Für diese Lieferung müssen mindestens #2~Codezeilen geschrieben werden.\\
		\auxnum=#2 %
		\divide\auxnum by 2 %
		\Item Bei der Lieferung erhält der Auslieferer \number\auxnum~Zusatzpunkte.}%
}
\newcommand\CardBug[2][0.25\cardwidth]{% halbe Breite, Zahlwert (ohne Pluszeichen)
	\CalcNumberColor{#2}%
	\CardFrontTikzBox[#1]{Bug}{%
%		\node at (UCenter) {\hugemathfont{+}\!\hugefont{#2}};
		\DrawNumber[\hugemathfont{+}\!]
		\DrawNumberAtBorder[errorcolor]
		}{errorcolor}{%
		\rede{Ich habe einen Fehler gefunden, der auch noch behoben werden muss.}\vskip0.5ex
		\Item Leg die Karte zum aktuellen CR.\\
		\Item Für die aktuelle Lieferung müssen noch #2~Codezeilen zusätzlich geschrieben werden.}%
}
\newcommand\CardCherryPick{%
	\CardFrontTikzBase{cherry-pick}{%
		% Stiel
		\draw[line width=3pt,green!50!black] (Center)..controls+(0,0.3\cardwidth)..+(0.2\cardwidth,0.35\cardwidth) coordinate[pos=0.8] (aux);
		% Blatt TODO
		%\fill (aux)--+()
		% Frucht
		%\shade[ball color=cherrycolor] (Center) circle[radius=0.1\cardwidth];
		\fill[cherrycolor] (Center) circle[radius=0.1\cardwidth];
		% Ecken
		\DrawSignAtBorders{white}{%
			%\shade[ball color=cherrycolor] (0,0) circle[radius=0.04\cardwidth];
			\fill[cherrycolor] (0,0) circle[radius=0.04\cardwidth];
		}
	
	}{%
		\centerline{\rede{git cherry-pick!}}\vskip1ex
		\Item \textrule{Stocke} zuerst deine Handkarten auf.\\
		\Item Wähle dir danach bei einem beliebigen Spieler aus seinen Handkarten eine aus und füge sie deinen hinzu oder spiele sie sofort aus.}%
}
