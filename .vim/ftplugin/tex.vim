"My stuff
let g:Tex_MultipleCompileFormats = 'dvi,pdf'


"General Macros
call IMAP('EAN', "\\begin{align}\<enter><++>\<enter>\\end{align}<++>", 'tex') "align environment
call IMAP('EA*', "\\begin{align*}\<enter><++>\<enter>\\end{align*}<++>", 'tex') "align* environment
call IMAP('HWSEC', "\\section{Problem <+Problem Number+>}<++>", 'tex') "Mcro for a homework section
call IMAP('ECA', "\\begin{cases}\<enter><++>\<enter>\\end{cases}<++>", 'tex') "cases environment
call IMAP('EEX',"\\begin{exmp}\<enter><++>\<enter>\\end{exmp}<++>", 'tex') "example environment
call IMAP('DOC', "\\documentclass{article}\<enter>\<enter>\\input{/Users/lwassink/Dropbox/school/latex/preamble.tex}\<enter>\<enter>\\title{<+document title+>}\<enter>\<enter>\\author{Luke Wassink}\<enter>\\date{<+date+>}\<enter>\<enter>\<enter>\<enter>\\begin{document}\<enter>\<enter>\\maketitle\<enter>\<enter>\<enter>\<enter>\<enter><++>\<enter>\<enter>\<enter>\<enter>\\end{document}", 'tex') "standard generic document


"Teaching Macros
call IMAP('QUIZPRE', "\\documentclass{article}\<enter>\<enter>\\input{/Users/lwassink/Dropbox/school/latex/preamble.tex}\<enter>\<enter>\\pagestyle{empty}\<enter>\<enter>\<enter>\<enter>\\begin{document}\<enter>\<enter>\\vspace{-10cm}\<enter>\\begin{center}\<enter>\\textbf{22M:<+course number+> Quiz <+Quiz number+>\\\\}\<enter>\\vspace{1cm}\<enter>Full name: \\makebox[2in]{\\hrulefill}\\hspace{.5in}\\\\ \\vspace{1cm}\<enter>\\end{center}\<enter>\<enter>\<enter>%QUESTIONS\<enter>\\begin{enumerate}\<enter>\\item<++>\<enter>\\end{enumerate}\<enter>\<enter>\<enter>\\end{document}", 'tex') "quiz preamble


"Amsthm Macros
call IMAP('ETHM', "\\begin{thm}\<enter><++>\<enter>\\end{thm}<++>", 'tex') "theorem environment
call IMAP('EPRP', "\\begin{prop}\<enter><++>\<enter>\\end{prop}<++>", 'tex') "align environment
call IMAP('ECOR', "\\begin{cor}\<enter><++>\<enter>\\end{cor}<++>", 'tex') "corallary environment
call IMAP('EDF', "\\begin{df}\<enter><++>\<enter>\\end{df}<++>", 'tex') "definition environment


"Compilation settings
let g:Tex_DefaultTargetFormat='pdf' "Make vim complie to PDF by default
let g:Tex_CompileRule_pdf='/Library/TeX/texbin/pdflatex $*' "make vim compile with pdflatex
let g:Tex_IgnoredWarnings ='
         \"Underfull\n".
         \"Overfull\n".
         \"specifier changed to\n".
         \"You have requested\n".
         \"Missing number, treated as zero.\n".
         \"There were undefined references\n".
         \"Citation %.%# undefined\n".
         \"\oval, \circle, or \line size unavailable\n"' "tell vim which errors to ignore when compiling pdfs



"viewing settings
"let g:Tex_ViewRule_pdf='/Applications/Skimapp/Contents/MacOS/Skim' "set skim to default pdf viewer
let g:Tex_ViewRule_pdf = 'Skim'




"Homework Macros
call IMAP('PRB', "\\section{Problem <++>, Page <++>}\<enter><++>\<enter>\<enter>\<enter>\<enter>\<enter><++>", 'tex') "Macro for a problem
call IMAP('HWPRE', "\\documentclass{article}\<enter>\<enter>\\input{/Users/lwassink/Dropbox/school/latex/preamble.tex}\<enter>\<enter>%margins and other settings \<enter>\\setcounter{secnumdepth}{0}\<enter>\<enter>\\title{22M:<+course number+> \Homowork <+Problem set number+>}\<enter>\\author{Luke Wassink}\<enter>\\date{}\<enter>\<enter>\<enter>\<enter>\\begin{document}\<enter>\<enter>\\maketitle\<enter>\<enter>\<enter>\<enter>\<enter><++>\<enter>\<enter>\<enter>\<enter>\\end{document}", 'tex') "Macro to setup standard hw preamble



