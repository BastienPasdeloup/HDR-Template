# Build configuration for latexmk
# The template needs LuaLaTeX (fonts, emoji flags) and biber (bibliography),
# and the list of acronyms requires an extra makeglossaries pass that latexmk
# does not know about by default -- the rules below teach it

use File::Basename;

$pdf_mode = 4;    # LuaLaTeX
$bibtex_use = 2;  # Run biber, and clean its output with -c

# Glossaries / acronyms
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');

sub run_makeglossaries
{
    my ($base_name, $path) = fileparse($_[0]);
    pushd $path;
    my $return = system "makeglossaries", $base_name;
    popd;
    return $return;
}

push @generated_exts, 'acn', 'acr', 'alg', 'glg', 'glo', 'gls', 'ist';
