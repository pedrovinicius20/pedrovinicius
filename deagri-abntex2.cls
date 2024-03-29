%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Customizações do abnTeX2 para o Departamento de Computação (DCOMP)               %
%% da Universidade Federal de Sergipe (UFS)                                         %
%% This work may be distributed and/or modified under the                           %
%% conditions of the LaTeX Project Public License, either version 1.3               %
%% of this license or (at your option) any later version.                           %
%% The latest version of this license is in                                         %
%%   http://www.latex-project.org/lppl.txt                                          %
%% and version 1.3 or later is part of all distributions of LaTeX                   %
%% version 2005/12/01 or later.                                                     %
%% This work has the LPPL maintenance status `maintained'.                          %
%%                                                                                  %  
%%                                                                                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{deagri-abntex2}[05/01/2019 v1.0 Modelo do DEAGRI baseado em abnTeX2]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PARÂMETROS INICIAIS ABNTEX2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{bsc}{%
  \let\@degreetype=0}

\DeclareOption{msc}{%
  \let\@degreetype=1}

\DeclareOption{prop-msc}{%
  \let\@degreetype=2}

\DeclareOption{pibic}{%
  \let\@degreetype=3}

% Repassa todos os parametros a classe abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}
}


\ProcessOptions\relax
\LoadClass[sumario = tradicional, 12pt, openright, oneside, a4paper]{abntex2}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACOTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{cmap}               % Mapear caracteres especiais no PDF
\usepackage[utf8]{inputenc}     % Codificacao do documento
\usepackage{lastpage}           % Para total de páginas

\usepackage{mathptmx}           % Usa a fonte times
\renewcommand{\ABNTEXchapterfont}{\rmfamily\bfseries}

\usepackage[T1]{fontenc}		% Selecao de codigos de fonte
\usepackage{lastpage}			% Usado pela Ficha catalográfica
\usepackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção
\usepackage{color}			    % Controle das cores
\usepackage{graphicx}			% Inclusão de gráficos
\usepackage{microtype} 			% para melhorias de justificação

\usepackage[brazilian,hyperpageref]{backref}
\usepackage[alf]{abntex2cite}	% Citações padrão ABNT

\usepackage{parskip}			% espaçamento entre os parágrafos
\usepackage{xcolor}
\usepackage[newfloat]{minted}

\usepackage{url}            % deve ser carregado para tratar url de forma correta e usado pelo abntex2cite
\usepackage{breakurl}    % trata de forma correta a quebra de url entre linhas

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACOTES POR TIPO DE DOCUMENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if \@degreetype0
   \usepackage{Graduacao}
   \else \if \@degreetype1
       \usepackage{Mestrado}
   \fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CONFIGURAÇÕES DO PACOTE BACKREF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}
% Texto padrão antes do número das páginas
\renewcommand{\backref}{}
% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma citação no texto.%
	\or
		Citado na página #2.%
	\else
		Citado #1 vezes nas páginas #2.%
	\fi}%
% ---

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CAPA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comandos de dados - Curso
\providecommand{\imprimircurso}{}
\newcommand{\curso}[1]{\renewcommand{\imprimircurso}{#1}}

\local{S\~ao Crist\'ov\~ao -- Sergipe}
\data{\the\year}

\renewcommand{\imprimircapa}{%
  \begin{capa}%
  
		\centering \includegraphics[scale=0.2]{Imagens/logo_ufs}
		
		\imprimirinstituicao
	    \vspace*{\fill}
    
	    \centering
    	\vspace*{\fill}
	    \vspace*{3.0cm}
    	
    	%{\ABNTEXchapterfont\bfseries\imprimirtitulo}
	    {\ABNTEXchapterfont\Large\imprimirtitulo}
    	\vspace*{1.0cm}
    	
	    {\Large\bloud\imprimirtipotrabalho}
	    \vspace*{2.0cm}
    	\vspace*{\fill}

	    {\Large\imprimirautor}
    	\vspace*{2.0cm}
	    \vspace*{\fill}
    
    	\imprimirlogo
    
    	{\imprimirlocal}
	    \par
    	{\imprimirdata}

	    \vspace*{1cm}
  \end{capa}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOLHA DE ROSTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\renewcommand{\folhaderostocontent}{
	\begin{center}
		\imprimirinstituicao
		\par
		\vspace*{\fill}

		{\Large\imprimirautor}

		\vspace*{3.5cm}
		{\ABNTEXchapterfont\Large\imprimirtitulo}
		
		\vspace*{\fill}

		\abntex@ifnotempty{\imprimirpreambulo}{%
			 \hspace{.40\textwidth}
			  \begin{minipage}{9cm}
				  \SingleSpacing
				  \imprimirpreambulo
			  \end{minipage}%
		}%
		
		\vspace*{1.0cm}
		\abntex@ifnotempty{\imprimirorientador}{%
			\hspace{.40\textwidth}
  				\begin{minipage}{9cm}
					\SingleSpacing
					Orientador(a):
					\imprimirorientador
					\vfill
					\ifthenelse{\equal{\imprimircoorientador}{}}
						{
							%Não escreve nada se não tiver coorientador
						}
						{
							Coorientador(a): \imprimircoorientador
							\vfill
						}
						
				\end{minipage}%
			\vspace*{\fill}
		}%

\vspace*{\fill}
{\imprimirlocal\par}
{\imprimirdata\vspace*{1cm}}
\end{center}
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CONFIGURAÇÃO DE APARÊNCIA DO PDF FINAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

% informações do PDF
\makeatletter

\hypersetup{
	unicode=true,
	pdftitle={\@title}, 
	pdfauthor={\@author},
	pdfsubject={\imprimirpreambulo},
	pdfcreator={LaTeX with abnTeX2},
	pdfkeywords={abnt}{latex}{abntex}{abntex2}{trabalho acadêmico}, 
	colorlinks=true,       		% false: boxed links; true: colored links
	linkcolor=blue,          	% color of internal links
	citecolor=blue,        		% color of links to bibliography
	filecolor=magenta,      	% color of file links
	urlcolor=blue,
	bookmarksdepth=4,
	breaklinks=true            % deve ser usado com o pacote breakurl, sem ele não fuciona
}

\makeatother
% --- 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ESPAÇAMENTO ENTRE LINHAS E PARÁGRAFOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.3cm}

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{0.2cm}  % tente também \onelineskip

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FICHA CATALOGRÁFICA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apenas em Mestrado.sty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOLHA DE APROVAÇÃO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apenas em Mestrado.sty


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SUMARIO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Uso do sumário tradicional, com espaçamento entre os capítulos
\setlength{\cftbeforechapterskip}{1em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% LISTA DE CÓDIGOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setminted{ bgcolor = gray!15, 
            frame = lines,
            mathescape,
            autogobble,
            %breakanywhere,
            breaklines,
            framesep = 2mm,
            baselinestretch = 1.2,
            fontsize = \footnotesize,
            linenos
            %style=borland,
}

\makeatletter
\let\l@listing\l@figure
\def\newfloat@listoflisting@hook{\let\figurename\listingname}
\makeatother

\SetupFloatingEnvironment{listing}{%
  fileext=lol,
  listname={Lista de códigos},
  name=Código,
  placement=p,
  within=none,
  chapterlistsgaps=on}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FORMATO DOS CAPÍTULOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% impressao do numero do capitulo
  \renewcommand{\chapternamenum}{}
  
  % impressao do nome do capitulo
  \renewcommand{\printchaptername}{%
   \chaptitlefont
   \ifthenelse{\boolean{abntex@apendiceousecao}}{\appendixname}{}%
  }
    
  % impressao do titulo do capitulo
  \def\printchaptertitle#1{%
    \chaptitlefont%
    \ifthenelse{\boolean{abntex@innonumchapter}}{\centering\ABNTEXchapterupperifneeded{#1}}{%
    \ifthenelse{\boolean{abntex@apendiceousecao}}{%
        \centering%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \ABNTEXchapterupperifneeded{#1}%
      }{%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupperifneeded{#1}}}%
     }    
  }
       
  % impressao do numero do capitulo     	
  \renewcommand{\printchapternum}{%
     \tocprintchapter
     \setboolean{abntex@innonumchapter}{false}
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
       \tocinnonumchapter
       \ABNTEXcaptiondelim%
     }{} % else
  }
  \renewcommand{\afterchapternum}{}
  
  % impressao do capitulo nao numerado
  \renewcommand\printchapternonum{%
     \tocprintchapternonum
     \setboolean{abntex@innonumchapter}{true}%
    }

\chapterstyle{abnt}
% ---

% -----
% Declaracoes de cabecalhos 
% -----
% Cabecalho padrao
\makepagestyle{abntheadings}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{abntheadings}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}

% Cabecalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddhead{abntchapfirst}{}{}{\ABNTEXfontereduzida\thepage}
% ---

