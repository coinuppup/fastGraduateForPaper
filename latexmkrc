# vim: set ft=perl:
@default_files = ('thesis.tex');

$aux_dir = 'build';

$pdf_mode = 1;
$bibtex_use = 2;
$recorder = 1;
$clean_ext = "synctex.gz acn acr alg aux bbl bcf blg brf fdb_latexmk glg glo gls idx ilg ind lof log lot out run.xml toc pdf thm toe ist idx";
$pdflatex = "xelatex -file-line-error --shell-escape -src-specials -synctex=1 -interaction=nonstopmode %O %S";
$pdf_update_method = 0;
use File::Basename;
$makeindex = 'internal splitindex';
sub splitindex {
   my $source = basename($$Psource);
   my $ret1 = system( "makeindex", $source );
   my $ret2 = system( "splitindex", $source );
   return $ret1 || $ret2;
}
@generated_exts = (@generated_exts, 'glo');

