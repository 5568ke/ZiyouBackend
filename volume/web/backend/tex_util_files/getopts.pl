;# getopts.pl - a better getopt.pl
#
# This library is no longer being maintained, and is included for backward
# compatibility with Perl 4 programs which may require it.
#
# In particular, this should not be used as an example of modern Perl
# programming techniques.
#
# Suggested alternatives: Getopt::Long  or  Getopt::Std
#
;# Usage:
;#      do Getopts('a:bc');  # -a takes arg. -b & -c not. Sets opt_* as a
;#                           #  side effect.

sub Getopts {
    local($argumentative) = @_;
    local(@args,$_,$first,$rest);
    local($errs) = 0;
    local($[) = 0;

    @args = split( / */, $argumentative );
    print("MES argumentative: $argumentative\n");
	printf("MES args: %s\n", join(' ', @args));

    while(@ARGV && ($_ = $ARGV[0]) =~ /^-(.)(.*)/) {
        printf("MES arg: %s\n", $_);

		($first,$rest) = ($1,$2);
        print("MES first: $first\n");
        print("MES rest: $rest\n");
		
        $pos = index($argumentative,$first);
        print("MES pos: $pos\n");
   
		if($pos >= $[) {
			if($args[$pos+1] eq ':') {
				shift(@ARGV);
				if($rest eq '') {
					++$errs unless(@ARGV);
					$rest = shift(@ARGV);
				}
				eval "
				push(\@opt_$first, \$rest);
				if (!defined \$opt_$first or \$opt_$first eq '') {
					\$opt_$first = \$rest;
				}
				else {
					\$opt_$first .= ' ' . \$rest;
				}

                print(\"MES opt_$first: \$opt_$first\n\");
				";
			}
			else {
				eval "\$opt_$first = 1; print(\"MES opt_$first: \$opt_$first\n\");";
				if($rest eq '') {
					shift(@ARGV);
				}
				else {
					$ARGV[0] = "-$rest";
				}
			}
		}
		else {
			print STDERR "Unknown option: $first\n";
			++$errs;
			if($rest ne '') {
				$ARGV[0] = "-$rest";
			}
			else {
				shift(@ARGV);
			}
		}

        print("====================\n");
	}
    $errs == 0;
}

1;
