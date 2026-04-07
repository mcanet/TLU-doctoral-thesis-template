# Force Overleaf to use XeLaTeX + biber
$pdflatex = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
$bibtex = 'biber %O %B';
$use_biber = 1;
$max_repeat = 5;