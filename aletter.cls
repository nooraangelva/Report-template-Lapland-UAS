%********************************************************
% Aalto Letter "aletter.cls"
%
% @author: Michal Serkieza 2010
%
% [some adjustments & additions by EL 2010]
%********************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aletter}
\RequirePackage[finnish, english]{babel}
\LoadClassWithOptions{article}

\RequirePackage[paper=a4paper,portrait,top=48mm,bottom=35mm,left=66mm,
right=20mm,headsep=11mm,headheight=20mm,footskip=11mm]{geometry}
\RequirePackage[first=1,last=9]{lcg}  % Generating random number for logo

\RequirePackage{epsfig}
\RequirePackage{paralist}
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{eurosym}
\RequirePackage{helvet} % by EL

\RequirePackage{ifthen} % by EL

\pagestyle{fancy}
\setlength{\parindent}{0mm}
\setlength{\parskip}{\baselineskip}
\renewcommand*\familydefault{\sfdefault}
\renewcommand{\headrulewidth}{0mm}
\renewcommand{\footrulewidth}{0mm}

%\setlength{\oddsidemargin}{40mm}
\setlength{\evensidemargin}{40.6mm}
%----------------------------------------------------------------------------------
%Variables

\newcommand{\@headtitle}{}
\newcommand{\@headsubtitle}{}
\newcommand{\@toaddress}{}
\newcommand{\@signature}{}
\newcommand{\headtitle}[1]{\renewcommand{\@headtitle}{#1}}
\newcommand{\headsubtitle}[1]{\renewcommand{\@headsubtitle}{#1}}
\renewcommand{\date}[1]{\renewcommand{\@date}{#1}}
\newcommand{\toaddress}[1]{\renewcommand{\@toaddress}{#1}}
\newcommand{\signature}[1]{\renewcommand{\@signature}{#1}}

%----------------------------------------------------------------------------------

%----------------------------------------------------------------------------------
%Letter



\newenvironment{letter}[1]{
\cleardoublepage
\setcounter{page}{1}
\setcounter{footnote}{0}
\setcounter{part}{0}
\setcounter{section}{0}
\setcounter{paragraph}{0}
\setcounter{equation}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{mpfootnote}{0}
\setcounter{enumi}{0}
\renewcommand{\@toaddress}{#1}
\hspace*{-47.5mm}
\begin{tabular}{@{}l}
\frenchspacing\@toaddress
\end{tabular}
\ifthenelse{\equal{#1}{}}{}{\vspace*{2\bigskipamount}}
}{}


\def\cleardoublepage{%
\clearpage
\if@twoside 
\ifodd\c@page\else
\hbox{}
\vspace*{\fill}
\begin{center}
\end{center}
\vspace{\fill}
\thispagestyle{empty}
\newpage
\fi
\fi
}


%----------------------------------------------------------------------------------
%Head

%%% these by EL 
\newcommand{\chooselogo}[1]{1}
\newcommand{\fixlogo}[1]{\renewcommand{\chooselogo}[1]{#1}}
\newcommand{\varylogo}{\renewcommand{\chooselogo}[1]{##1}}

\newcommand{\@logoseries}{Aalto}
\newcommand{\logoseries}[1]{\renewcommand{\@logoseries}{#1}}
%%%

\lhead{%
\hspace*{-47.5mm}
\rand\rand\rand\rand\rand
\epsfig{file=logo/\@logoseries_\iflanguage{finnish}{fi}{en}_\chooselogo{\arabic{rand}}.pdf,height=11mm}
%%% \epsfig{file=logo/Aalto_logo_\iflanguage{finnish}{fi}{en}_\arabic{rand}.pdf,height=11mm}
}

\chead{%
\hspace*{-46mm}
\raisebox{3mm}{\hspace*{30mm}\small\begin{tabular}{l}
\textbf{\@headtitle}\\\@headsubtitle\\\@date\\\ 
\end{tabular}}}

\newcommand{\@showpagenumber}{\thepage\ (\pageref{LastPage})}
\newcommand{\hidepagenumbers}{\renewcommand{\@showpagenumber}{\ }}


\rhead{\raisebox{3mm}{\small
\begin{tabular}{l}
% \thepage\ (\pageref{LastPage})\\\ \\\ \\\ 
\@showpagenumber\\\ \\\ \\\ 
\end{tabular}}}




%----------------------------------------------------------------------------------
%Opening


\newcommand{\opening}[1]{%
\ifthenelse{\equal{\@title}{}}{\vspace*{-\bigskipamount}}{}% by EL 
\par\vspace{-2.5mm}%
{\hspace*{-46mm}\huge\bf\begin{tabular}{@{}p{172mm}@{}}\@title\end{tabular}}
\ifthenelse{\equal{#1}{}}
{}
{\bigskip\\\hspace*{-46mm}\begin{tabular}{@{}l@{}}\frenchspacing#1\end{tabular}}
\par}


%----------------------------------------------------------------------------------
%Signature


\newcommand{\closing}[1]{
\medskip
%%% \hspace*{20mm} % excluded by EL
\begin{tabular}{@{}l}
#1\vspace{\bigskipamount}\vspace{\bigskipamount}
\vspace{\medskipamount}\vspace{\smallskipamount}\\
\frenchspacing\@signature\vspace*{\medskipamount}\vspace*{\smallskipamount}
%\vspace*{\bigskipamount}
\end{tabular}
}


%----------------------------------------------------------------------------------
% cc, encl and extra 

%\newcommand{\cc}[1]{\iflanguage{finnish}{\extra{Kopio}{#1}}{\extra{cc}{#1}}}
%\newcommand{\encl}[1]{\iflanguage{finnish}{\extra{Liitteet}{#1}}{\extra{encl}{#1}}}
%\newcommand{\extra}[2]{\hspace*{-46mm}\makebox[44mm][l]{#1:}\parbox[t]{100mm}{#2}\\\\}
%%% instead, the following by EL:
\newcommand{\extra}[2]{%
\par\hspace*{-46mm}%
\makebox[46mm][l]{#1}%
\parbox[t]{124mm}{{\frenchspacing#2}}%
\vspace*{\smallskipamount}%
}


%----------------------------------------------------------------------------------
%Footer

% these by EL:
\newcommand{\@enAa}{}\newcommand{\@fiAa}{}
\newcommand{\@enAb}{}\newcommand{\@fiAb}{}
\newcommand{\@enAc}{}\newcommand{\@fiAc}{}
\newcommand{\@enBa}{}\newcommand{\@fiBa}{}
\newcommand{\@enBb}{}\newcommand{\@fiBb}{}
\newcommand{\@enBc}{}\newcommand{\@fiBc}{}
\newcommand{\@enCa}{}\newcommand{\@fiCa}{}
\newcommand{\@enCb}{}\newcommand{\@fiCb}{}
\newcommand{\@enCc}{}\newcommand{\@fiCc}{}
\newcommand{\@enDa}{}\newcommand{\@fiDa}{}
\newcommand{\@enDb}{}\newcommand{\@fiDb}{}
\newcommand{\@enDc}{}\newcommand{\@fiDc}{}
\newcommand{\@enEa}{}\newcommand{\@fiEa}{}
\newcommand{\@enEb}{}\newcommand{\@fiEb}{}
\newcommand{\@enEc}{}\newcommand{\@fiEc}{}

\lfoot{%
\hspace*{-46mm}
\rule{169mm}{0.4mm}\\[1mm]
\hspace*{-46mm}
\scriptsize
\begin{tabular*}{169mm}{@{}l@{\extracolsep{\fill}}l@{\extracolsep{\fill}}l%
@{\extracolsep{\fill}}l@{\extracolsep{\fill}}l@{}}
\iflanguage{finnish}{%
\@fiAa&\@fiBa&\@fiCa&\@fiDa&\@fiEa\\
\@fiAb&\@fiBb&\@fiCb&\@fiDb&\@fiEb\\
\@fiAc&\@fiBc&\@fiCc&\@fiDc&\@fiEc
}{%
\@enAa&\@enBa&\@enCa&\@enDa&\@enEa\\
\@enAb&\@enBb&\@enCb&\@enDb&\@enEb\\
\@enAc&\@enBc&\@enCc&\@enDc&\@enEc
}
\end{tabular*}
}

\cfoot{}
\rfoot{}


%*****************************************************
% How to (re)define the footer texts 
%  - See also "A-EditFoot"                            
% @author: EL 2010                                   
%*****************************************************

\newcommand{\enAa}[1]{\renewcommand{\@enAa}{#1}}
\newcommand{\enAb}[1]{\renewcommand{\@enAb}{#1}}
\newcommand{\enAc}[1]{\renewcommand{\@enAc}{#1}}
\newcommand{\enBa}[1]{\renewcommand{\@enBa}{#1}}
\newcommand{\enBb}[1]{\renewcommand{\@enBb}{#1}}
\newcommand{\enBc}[1]{\renewcommand{\@enBc}{#1}}
\newcommand{\enCa}[1]{\renewcommand{\@enCa}{#1}}
\newcommand{\enCb}[1]{\renewcommand{\@enCb}{#1}}
\newcommand{\enCc}[1]{\renewcommand{\@enCc}{#1}}
\newcommand{\enDa}[1]{\renewcommand{\@enDa}{#1}}
\newcommand{\enDb}[1]{\renewcommand{\@enDb}{#1}}
\newcommand{\enDc}[1]{\renewcommand{\@enDc}{#1}}
\newcommand{\enEa}[1]{\renewcommand{\@enEa}{#1}}
\newcommand{\enEb}[1]{\renewcommand{\@enEb}{#1}}
\newcommand{\enEc}[1]{\renewcommand{\@enEc}{#1}}

\newcommand{\fiAa}[1]{\renewcommand{\@fiAa}{#1}}
\newcommand{\fiAb}[1]{\renewcommand{\@fiAb}{#1}}
\newcommand{\fiAc}[1]{\renewcommand{\@fiAc}{#1}}
\newcommand{\fiBa}[1]{\renewcommand{\@fiBa}{#1}}
\newcommand{\fiBb}[1]{\renewcommand{\@fiBb}{#1}}
\newcommand{\fiBc}[1]{\renewcommand{\@fiBc}{#1}}
\newcommand{\fiCa}[1]{\renewcommand{\@fiCa}{#1}}
\newcommand{\fiCb}[1]{\renewcommand{\@fiCb}{#1}}
\newcommand{\fiCc}[1]{\renewcommand{\@fiCc}{#1}}
\newcommand{\fiDa}[1]{\renewcommand{\@fiDa}{#1}}
\newcommand{\fiDb}[1]{\renewcommand{\@fiDb}{#1}}
\newcommand{\fiDc}[1]{\renewcommand{\@fiDc}{#1}}
\newcommand{\fiEa}[1]{\renewcommand{\@fiEa}{#1}}
\newcommand{\fiEb}[1]{\renewcommand{\@fiEb}{#1}}
\newcommand{\fiEc}[1]{\renewcommand{\@fiEc}{#1}}

\newcommand{\enGetPostHead}{}   \newcommand{\fiGetPostHead}{}
\newcommand{\enGetVisitHead}{}  \newcommand{\fiGetVisitHead}{}
\newcommand{\enGetUniversity}{} \newcommand{\fiGetUniversity}{}
\newcommand{\enGetSchool}{}     \newcommand{\fiGetSchool}{}
\newcommand{\enGetDepartment}{} \newcommand{\fiGetDepartment}{}
\newcommand{\enGetPerson}{}     \newcommand{\fiGetPerson}{}

\newcommand{\enGetUnivPostA}{}  \newcommand{\fiGetUnivPostA}{}
\newcommand{\enGetUnivPostB}{}  \newcommand{\fiGetUnivPostB}{}
\newcommand{\enGetUnivVisitA}{} \newcommand{\fiGetUnivVisitA}{}
\newcommand{\enGetUnivVisitB}{} \newcommand{\fiGetUnivVisitB}{}
\newcommand{\enGetUnivTel}{}    \newcommand{\fiGetUnivTel}{}
\newcommand{\enGetUnivFax}{}    \newcommand{\fiGetUnivFax}{}
\newcommand{\enGetUnivVat}{}    \newcommand{\fiGetUnivVat}{}
\newcommand{\enGetUnivWeb}{}    \newcommand{\fiGetUnivWeb}{}
\newcommand{\enGetUnivEmail}{}  \newcommand{\fiGetUnivEmail}{}

\newcommand{\enGetSchlPostA}{}  \newcommand{\fiGetSchlPostA}{}
\newcommand{\enGetSchlPostB}{}  \newcommand{\fiGetSchlPostB}{}
\newcommand{\enGetSchlVisitA}{} \newcommand{\fiGetSchlVisitA}{}
\newcommand{\enGetSchlVisitB}{} \newcommand{\fiGetSchlVisitB}{}
\newcommand{\enGetSchlTel}{}    \newcommand{\fiGetSchlTel}{}
\newcommand{\enGetSchlFax}{}    \newcommand{\fiGetSchlFax}{}
\newcommand{\enGetSchlVat}{}    \newcommand{\fiGetSchlVat}{}
\newcommand{\enGetSchlWeb}{}    \newcommand{\fiGetSchlWeb}{}
\newcommand{\enGetSchlEmail}{}  \newcommand{\fiGetSchlEmail}{}

\newcommand{\enGetDeptPostA}{}  \newcommand{\fiGetDeptPostA}{}
\newcommand{\enGetDeptPostB}{}  \newcommand{\fiGetDeptPostB}{}
\newcommand{\enGetDeptVisitA}{} \newcommand{\fiGetDeptVisitA}{}
\newcommand{\enGetDeptVisitB}{} \newcommand{\fiGetDeptVisitB}{}
\newcommand{\enGetDeptTel}{}    \newcommand{\fiGetDeptTel}{}
\newcommand{\enGetDeptFax}{}    \newcommand{\fiGetDeptFax}{}
\newcommand{\enGetDeptVat}{}    \newcommand{\fiGetDeptVat}{}
\newcommand{\enGetDeptWeb}{}    \newcommand{\fiGetDeptWeb}{}
\newcommand{\enGetDeptEmail}{}  \newcommand{\fiGetDeptEmail}{}

\newcommand{\enGetPersPostA}{}  \newcommand{\fiGetPersPostA}{}
\newcommand{\enGetPersPostB}{}  \newcommand{\fiGetPersPostB}{}
\newcommand{\enGetPersVisitA}{} \newcommand{\fiGetPersVisitA}{}
\newcommand{\enGetPersVisitB}{} \newcommand{\fiGetPersVisitB}{}
\newcommand{\enGetPersTel}{}    \newcommand{\fiGetPersTel}{}
\newcommand{\enGetPersFax}{}    \newcommand{\fiGetPersFax}{}
\newcommand{\enGetPersVat}{}    \newcommand{\fiGetPersVat}{}
\newcommand{\enGetPersWeb}{}    \newcommand{\fiGetPersWeb}{}
\newcommand{\enGetPersEmail}{}  \newcommand{\fiGetPersEmail}{}

\newcommand{\enPostHead}[1]{\renewcommand{\enGetPostHead}{#1}}
\newcommand{\enVisitHead}[1]{\renewcommand{\enGetVisitHead}{#1}}
\newcommand{\enUniversity}[1]{\renewcommand{\enGetUniversity}{#1}}
\newcommand{\enSchool}[1]{\renewcommand{\enGetSchool}{#1}}
\newcommand{\enDepartment}[1]{\renewcommand{\enGetDepartment}{#1}}
\newcommand{\enPerson}[1]{\renewcommand{\enGetPerson}{#1}}

\newcommand{\fiPostHead}[1]{\renewcommand{\fiGetPostHead}{#1}}
\newcommand{\fiVisitHead}[1]{\renewcommand{\fiGetVisitHead}{#1}}
\newcommand{\fiUniversity}[1]{\renewcommand{\fiGetUniversity}{#1}}
\newcommand{\fiSchool}[1]{\renewcommand{\fiGetSchool}{#1}}
\newcommand{\fiDepartment}[1]{\renewcommand{\fiGetDepartment}{#1}}
\newcommand{\fiPerson}[1]{\renewcommand{\fiGetPerson}{#1}}

\newcommand{\enPersPostA}[1]{\renewcommand{\enGetPersPostA}{#1}}
\newcommand{\enDeptPostA}[1]{\renewcommand{\enGetDeptPostA}{#1}\enPersPostA{#1}}
\newcommand{\enSchlPostA}[1]{\renewcommand{\enGetSchlPostA}{#1}\enDeptPostA{#1}}
\newcommand{\enUnivPostA}[1]{\renewcommand{\enGetUnivPostA}{#1}\enSchlPostA{#1}}
\newcommand{\enPersPostB}[1]{\renewcommand{\enGetPersPostB}{#1}}
\newcommand{\enDeptPostB}[1]{\renewcommand{\enGetDeptPostB}{#1}\enPersPostB{#1}}
\newcommand{\enSchlPostB}[1]{\renewcommand{\enGetSchlPostB}{#1}\enDeptPostB{#1}}
\newcommand{\enUnivPostB}[1]{\renewcommand{\enGetUnivPostB}{#1}\enSchlPostB{#1}}
\newcommand{\enPersVisitA}[1]{\renewcommand{\enGetPersVisitA}{#1}}
\newcommand{\enDeptVisitA}[1]{\renewcommand{\enGetDeptVisitA}{#1}\enPersVisitA{#1}}
\newcommand{\enSchlVisitA}[1]{\renewcommand{\enGetSchlVisitA}{#1}\enDeptVisitA{#1}}
\newcommand{\enUnivVisitA}[1]{\renewcommand{\enGetUnivVisitA}{#1}\enSchlVisitA{#1}}
\newcommand{\enPersVisitB}[1]{\renewcommand{\enGetPersVisitB}{#1}}
\newcommand{\enDeptVisitB}[1]{\renewcommand{\enGetDeptVisitB}{#1}\enPersVisitB{#1}}
\newcommand{\enSchlVisitB}[1]{\renewcommand{\enGetSchlVisitB}{#1}\enDeptVisitB{#1}}
\newcommand{\enUnivVisitB}[1]{\renewcommand{\enGetUnivVisitB}{#1}\enSchlVisitB{#1}}
\newcommand{\enPersTel}[1]{\renewcommand{\enGetPersTel}{#1}}
\newcommand{\enDeptTel}[1]{\renewcommand{\enGetDeptTel}{#1}\enPersTel{#1}}
\newcommand{\enSchlTel}[1]{\renewcommand{\enGetSchlTel}{#1}\enDeptTel{#1}}
\newcommand{\enUnivTel}[1]{\renewcommand{\enGetUnivTel}{#1}\enSchlTel{#1}}
\newcommand{\enPersFax}[1]{\renewcommand{\enGetPersFax}{#1}}
\newcommand{\enDeptFax}[1]{\renewcommand{\enGetDeptFax}{#1}\enPersFax{#1}}
\newcommand{\enSchlFax}[1]{\renewcommand{\enGetSchlFax}{#1}\enDeptFax{#1}}
\newcommand{\enUnivFax}[1]{\renewcommand{\enGetUnivFax}{#1}\enSchlFax{#1}}
\newcommand{\enPersVat}[1]{\renewcommand{\enGetPersVat}{#1}}
\newcommand{\enDeptVat}[1]{\renewcommand{\enGetDeptVat}{#1}\enPersVat{#1}}
\newcommand{\enSchlVat}[1]{\renewcommand{\enGetSchlVat}{#1}\enDeptVat{#1}}
\newcommand{\enUnivVat}[1]{\renewcommand{\enGetUnivVat}{#1}\enSchlVat{#1}}
\newcommand{\enPersWeb}[1]{\renewcommand{\enGetPersWeb}{#1}}
\newcommand{\enDeptWeb}[1]{\renewcommand{\enGetDeptWeb}{#1}\enPersWeb{#1}}
\newcommand{\enSchlWeb}[1]{\renewcommand{\enGetSchlWeb}{#1}\enDeptWeb{#1}}
\newcommand{\enUnivWeb}[1]{\renewcommand{\enGetUnivWeb}{#1}\enSchlWeb{#1}}
\newcommand{\enPersEmail}[1]{\renewcommand{\enGetPersEmail}{#1}}
\newcommand{\enDeptEmail}[1]{\renewcommand{\enGetDeptEmail}{#1}\enPersEmail{#1}}
\newcommand{\enSchlEmail}[1]{\renewcommand{\enGetSchlEmail}{#1}\enDeptEmail{#1}}
\newcommand{\enUnivEmail}[1]{\renewcommand{\enGetUnivEmail}{#1}\enSchlEmail{#1}}

\newcommand{\fiPersPostA}[1]{\renewcommand{\fiGetPersPostA}{#1}}
\newcommand{\fiDeptPostA}[1]{\renewcommand{\fiGetDeptPostA}{#1}\fiPersPostA{#1}}
\newcommand{\fiSchlPostA}[1]{\renewcommand{\fiGetSchlPostA}{#1}\fiDeptPostA{#1}}
\newcommand{\fiUnivPostA}[1]{\renewcommand{\fiGetUnivPostA}{#1}\fiSchlPostA{#1}}
\newcommand{\fiPersPostB}[1]{\renewcommand{\fiGetPersPostB}{#1}}
\newcommand{\fiDeptPostB}[1]{\renewcommand{\fiGetDeptPostB}{#1}\fiPersPostB{#1}}
\newcommand{\fiSchlPostB}[1]{\renewcommand{\fiGetSchlPostB}{#1}\fiDeptPostB{#1}}
\newcommand{\fiUnivPostB}[1]{\renewcommand{\fiGetUnivPostB}{#1}\fiSchlPostB{#1}}
\newcommand{\fiPersVisitA}[1]{\renewcommand{\fiGetPersVisitA}{#1}}
\newcommand{\fiDeptVisitA}[1]{\renewcommand{\fiGetDeptVisitA}{#1}\fiPersVisitA{#1}}
\newcommand{\fiSchlVisitA}[1]{\renewcommand{\fiGetSchlVisitA}{#1}\fiDeptVisitA{#1}}
\newcommand{\fiUnivVisitA}[1]{\renewcommand{\fiGetUnivVisitA}{#1}\fiSchlVisitA{#1}}
\newcommand{\fiPersVisitB}[1]{\renewcommand{\fiGetPersVisitB}{#1}}
\newcommand{\fiDeptVisitB}[1]{\renewcommand{\fiGetDeptVisitB}{#1}\fiPersVisitB{#1}}
\newcommand{\fiSchlVisitB}[1]{\renewcommand{\fiGetSchlVisitB}{#1}\fiDeptVisitB{#1}}
\newcommand{\fiUnivVisitB}[1]{\renewcommand{\fiGetUnivVisitB}{#1}\fiSchlVisitB{#1}}
\newcommand{\fiPersTel}[1]{\renewcommand{\fiGetPersTel}{#1}}
\newcommand{\fiDeptTel}[1]{\renewcommand{\fiGetDeptTel}{#1}\fiPersTel{#1}}
\newcommand{\fiSchlTel}[1]{\renewcommand{\fiGetSchlTel}{#1}\fiDeptTel{#1}}
\newcommand{\fiUnivTel}[1]{\renewcommand{\fiGetUnivTel}{#1}\fiSchlTel{#1}}
\newcommand{\fiPersFax}[1]{\renewcommand{\fiGetPersFax}{#1}}
\newcommand{\fiDeptFax}[1]{\renewcommand{\fiGetDeptFax}{#1}\fiPersFax{#1}}
\newcommand{\fiSchlFax}[1]{\renewcommand{\fiGetSchlFax}{#1}\fiDeptFax{#1}}
\newcommand{\fiUnivFax}[1]{\renewcommand{\fiGetUnivFax}{#1}\fiSchlFax{#1}}
\newcommand{\fiPersVat}[1]{\renewcommand{\fiGetPersVat}{#1}}
\newcommand{\fiDeptVat}[1]{\renewcommand{\fiGetDeptVat}{#1}\fiPersVat{#1}}
\newcommand{\fiSchlVat}[1]{\renewcommand{\fiGetSchlVat}{#1}\fiDeptVat{#1}}
\newcommand{\fiUnivVat}[1]{\renewcommand{\fiGetUnivVat}{#1}\fiSchlVat{#1}}
\newcommand{\fiPersWeb}[1]{\renewcommand{\fiGetPersWeb}{#1}}
\newcommand{\fiDeptWeb}[1]{\renewcommand{\fiGetDeptWeb}{#1}\fiPersWeb{#1}}
\newcommand{\fiSchlWeb}[1]{\renewcommand{\fiGetSchlWeb}{#1}\fiDeptWeb{#1}}
\newcommand{\fiUnivWeb}[1]{\renewcommand{\fiGetUnivWeb}{#1}\fiSchlWeb{#1}}
\newcommand{\fiPersEmail}[1]{\renewcommand{\fiGetPersEmail}{#1}}
\newcommand{\fiDeptEmail}[1]{\renewcommand{\fiGetDeptEmail}{#1}\fiPersEmail{#1}}
\newcommand{\fiSchlEmail}[1]{\renewcommand{\fiGetSchlEmail}{#1}\fiDeptEmail{#1}}
\newcommand{\fiUnivEmail}[1]{\renewcommand{\fiGetUnivEmail}{#1}\fiSchlEmail{#1}}

\enPostHead{Postal address:}
\enVisitHead{Visiting address:}
\enUniversity{Aalto University}

\fiPostHead{Postiosoite:}
\fiVisitHead{K\"{a}yntiosoite:}
\fiUniversity{Aalto-yliopisto}

\enUnivPostA{}
\enUnivPostB{FI-00076 Aalto}
\enUnivVisitA{}
\enUnivVisitB{}
\enUnivTel{Tel +358 9 47001}
\enUnivFax{}
\enUnivVat{VAT FI22283574}
\enUnivWeb{www.aalto.fi/en/}
\enUnivEmail{}

\fiUnivPostA{}
\fiUnivPostB{00076 Aalto}
\fiUnivVisitA{}
\fiUnivVisitB{}
\fiUnivTel{Puhelin 09 47001}
\fiUnivFax{}
\fiUnivVat{VAT FI22283574}
\fiUnivWeb{www.aalto.fi/fi/}
\fiUnivEmail{}

\newcommand{\deptfooter}{
\enAa{\enGetUniversity}
\enAb{\enGetSchool}
\enAc{\enGetDepartment}
\enBa{\enGetPostHead}
\enBb{\enGetDeptPostA}
\enBc{\enGetDeptPostB}
\enCa{\enGetVisitHead}
\enCb{\enGetDeptVisitA}
\enCc{\enGetDeptVisitB}
\enDa{\enGetDeptTel}
\enDb{\enGetDeptFax}
\enDc{\enGetUnivVat}
\enEa{\enGetUnivWeb}
\enEb{\enGetSchlWeb}
\enEc{\enGetDeptWeb}

\fiAa{\fiGetUniversity}
\fiAb{\fiGetSchool}
\fiAc{\fiGetDepartment}
\fiBa{\fiGetPostHead}
\fiBb{\fiGetDeptPostA}
\fiBc{\fiGetDeptPostB}
\fiCa{\fiGetVisitHead}
\fiCb{\fiGetDeptVisitA}
\fiCc{\fiGetDeptVisitB}
\fiDa{\fiGetDeptTel}
\fiDb{\fiGetDeptFax}
\fiDc{\fiGetUnivVat}
\fiEa{\fiGetUnivWeb}
\fiEb{\fiGetSchlWeb}
\fiEc{\fiGetDeptWeb}
}

\newcommand{\persdeptfooter}{
\enAa{\enGetUniversity}
\enAb{\enGetDepartment}
\enAc{\enGetPerson}
\enBa{\enGetPostHead}
\enBb{\enGetPersPostA}
\enBc{\enGetPersPostB}
\enCa{\enGetVisitHead}
\enCb{\enGetPersVisitA}
\enCc{\enGetPersVisitB}
\enDa{\enGetPersTel}
\enDb{\enGetPersFax}
\enDc{\enGetPersEmail}
\enEa{\enGetUnivWeb}
\enEb{\enGetDeptWeb}
\enEc{\enGetPersWeb}

\fiAa{\fiGetUniversity}
\fiAb{\fiGetDepartment}
\fiAc{\fiGetPerson}
\fiBa{\fiGetPostHead}
\fiBb{\fiGetPersPostA}
\fiBc{\fiGetPersPostB}
\fiCa{\fiGetVisitHead}
\fiCb{\fiGetPersVisitA}
\fiCc{\fiGetPersVisitB}
\fiDa{\fiGetPersTel}
\fiDb{\fiGetPersFax}
\fiDc{\fiGetPersEmail}
\fiEa{\fiGetUnivWeb}
\fiEb{\fiGetDeptWeb}
\fiEc{\fiGetPersWeb}
}

\newcommand{\persschlfooter}{
\persdeptfooter
\enAb{\enGetSchool}
\enEb{\enGetSchlWeb}
\fiAb{\fiGetSchool}
\fiEb{\fiGetSchlWeb}
}

\deptfooter % the default

%******************************************
% For "A-AddrBook": commands to be used 
% @author: EL 2010                                   %
%******************************************

\newcommand{\makecopy}[2]{}

\newcommand{\@mcprefix}{}
\newcommand{\@mcsuffix}{}

\newcommand{\mcaffixes}[2]{%
\ifthenelse{\equal{#1}{}}
{\renewcommand{\@mcprefix}{}}
{\renewcommand{\@mcprefix}{#1~}} % Note the trailing space for nonempty prefixes
\renewcommand{\@mcsuffix}{#2}
}

\newcommand{\@mcone}[1]{\@mcprefix#1\@mcsuffix}
\newcommand{\@mcpick}[3]{} % to be redefined below
\newcommand{\@mcthree}[3]{\@mcprefix\@mcpick{#1 #3}{#2}\@mcsuffix}

\newcommand{\mcyn}[2]{\makecopy{\@mcone{#1}}{#1 #2}}
\newcommand{\mcnyn}[3]{\makecopy{\@mcone{#2}}{#1 #2 #3}}
\newcommand{\mcynyn}[4]{\makecopy{\@mcthree{#1}{#2}{#3}}{#1 #2 #3 #4}}
\newcommand{\mcnynyn}[5]{\makecopy{\@mcthree{#2}{#3}{#4}}{#1 #2 #3 #4 #5}}

\newcommand{\mcdefault}{\renewcommand{\@mcpick}[2]{##1}}
\newcommand{\mccasual}{\renewcommand{\@mcpick}[2]{##2}}
\mcdefault % initialization

\newcommand{\mcfree}[3]{\makecopy{\@mcprefix\@mcpick{#1}{#2}\@mcsuffix}{#3}}

% These three to be redefined by every \@abentry instance
\newcommand{\@mceith}[2]{}
\newcommand{\@mcsepa}[1]{}
\newcommand{\@mcsepb}[1]{}

\newcommand{\abentry}[7]{%
\ifthenelse{\equal{#1}{}}
{\renewcommand{\@mcsepa}[1]{}}
{\renewcommand{\@mcsepa}[1]{##1\ }}
\ifthenelse{\equal{#4}{}}
{\renewcommand{\@mceith}[2]{##1}}
{\renewcommand{\@mceith}[2]{##2}}
\ifthenelse{\equal{#5}{}}
{\renewcommand{\@mcsepb}[1]{}}
{\renewcommand{\@mcsepb}[1]{##1\ }}
\makecopy{\@mcthree{#2}{\@mceith{#3}{#4}}{#6}}{\@mcsepa{#1}#2 #3 \@mcsepb{#5}#6 #7}
}