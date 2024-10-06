#! /usr/bin/perl
#
#  purpose :
#
#      execute a series of command for latex|tex  fn
#
#         (1) latex|tex    (2) xdvi 
#         (3) dvips (-p)   (4) ghostview (-g) 
#         
#      here (3) and (4) are optional
#
#  syntax :
#
#     wtex [options] fn
#
#  options :
#
#      -A     :   includes b , c , p option
#      -b     :   special option for book publisher with paper size 200x260, generate pdf
#      -B     :   includes b , c , i , p option
#      -c     :   chinese latex
#      -C     :   chinese latex with UTF-8  
#      -d     :   start from dvips 
#      -e     :   two pages per per (pdf format)
#      -N     :   just generate pdf file quietly (no acroread) 
#      -f     :   pdf file ( use ps2pdf )
#      -F     :   pdf file ( use chitex -pdftex ) only for Big5 not UTF8
#      -g     :   view final postscript file by ghostview
#      -h     :   print the help message
#      -H     :   landscape page ( default is portrait )
#      -j     :   include jpg file ( generate pdf directly )
#      -l     :   letter size    ( default is a4 size )
#      -n no  :   view the no-th page
#      -p     :   produce the postscript file
#      -P size:   paper size , e.g. a4 a3 b4 ...
#      -t     :   tex file       ( default is latex file )
#      -x     :   use xdvi only
#      -f     :   produce pdf file
#      -i     :   produce index 
#      -s     :   style file for index
#
#
#  =======================================================
#  written by weihan wu : math dept of NCU on Mar 4 , 1997
#  =======================================================
#


sub  usage {

print <<HEADER ;
Purpose : 

    The perl script may execute a series of latex procedure.
    
         (1) latex       (2) xdvi 
         (3) dvips (-p)  (4) ghostview (-g)
         
    here (3) and (4) are optional

Syntax :

    wtex  [options]  fns.tex


Option :

     -A     :   include b c p ( do not make index repeatly )
     -b     :   special option for book publisher with paper size 200x260 
     -B     :   include b c i p
     -c     :   chinese latex
     -C     :   chinese latex with utf-8
     -d     :   start from dvips
     -e     :   two pages per page (pdf format)
     -N     :   just generate pdf file quietly (no acroread) 
     -f     :   pdf file ( use ps2pdf )
     -F     :   pdf file ( use chitex -pdftex )
                need add the following lines into tex file for A4 paper
                  \\setlength{\pdfpageheight}{29.704cm}
                  \\setlength{\pdfpagewidth}{20.99cm}
                  \\pdfcompresslevel0
                also include the following statement for graphicx
                  \\usepackage[pdftex]{graphicx} 
                use only for Big5 not for UTF8

     -g     :   view final postscript file by ghostview
     -h     :   print the help message
     -H     :   landscape page ( default is portrait )
     -l     :   letter size    ( default is a4 size )
     -j     :   include jpg file ( generate pdf directly )
     -n no  :   view the no-th page
     -p     :   produce the postscript file
     -P size:   paper size , e.g. a4 a3 b4 ...
     -t     :   tex file
     -x     :   use xdvi only
     -u     :   same as -C option
     -i     :   generate index 
     -s     :   style file for index ( used in opt_i ) 
     -S     :   screen paper (225mm x 180mm)

Examples :

  (1)  wtex  -c -n 4  foo.tex  

   ->  use xdvi to view the 4th page of Chinese latex  

  (2)  wtex  -gl      foo.tex  
      
   ->  use ghostview to view latex file by letter size page

  (3)  wtex  -cpt     foo.tex  

   ->  produce a postscript file for Chiniese tex file

Written by :

   Weihan Wu, Math. dept of NCU
   Mar 4, 1997
HEADER
    exit 0 ;

}

require '/home/mnt/ziyou/Html/e_school/mes_test/latex/getopts.pl';

chomp( $host = `hostname` ) ;

&Getopts( "ABicCudeNfFgbhHljptxSJn:s:P:" ) || &usage ;

$ghostview = 'gv' ;

$opt_n = 1 unless $opt_n ;

if ( $opt_C || $opt_u ) {
    $opt_u = 1 ;
    $opt_c = 1 ;
    $coding = '-utf8' ;
}

if( $opt_B ) {
    $opt_c = 1 ;
    $opt_b = 1 ;
    $opt_i = 1 ;
    $opt_p = 1 ;
    $opt_s = 'wubook.ist' ;   # index style file
}

if( $opt_A ) {
    $opt_c = 1 ;
    $opt_b = 1 ;
    $opt_p = 1 ;
}

if( $opt_e or $opt_f ) {
   $opt_p = 1 ;
} 

&usage if $opt_h ;

if ( $opt_b ) {    $opt_p = 1 ;  $opt_c = 1 ; }

if ( $opt_c ) {
    chop ( $hostname = `hostname` ) ;
#    die "Chinese Latex can be executed only on wangwei workstation\n" 
#         if ( $hostname ne "wangwei" ) ;
}

if ( `hostname` =~ m/ziyou/ ) {
    $shrink = 5 ;
} else {
    $shrink = 7 ;
}


if ( $opt_P eq 'a4' or $opt_P eq 'letter' ) {
    $shrink = 5 ;
} elsif ( $opt_P eq 'b4' ) {
    $shrink = 6 ;
} elsif ( $opt_P eq 'a3' ) {
    $shrink = 7 ;
} elsif ( $opt_P eq 'mes1' or $opt_P eq 'mes2' ) {
	$shrink = 5;
}

#print $opt_P , "\n" ;
#print $shrink , "\n" ;

#if ( $opt_f ) {
#    die "> only in dumu or wangwei\n" if `hostname` !~ m/dumu|wangwei/ ;
#}

$xdvi_color = " -bg lightblue -fg #002f2f " ;	

if ( $opt_H || $opt_S ) { 

    if ( $opt_l ) {
	$xdvi_orientation = " -paper 11x8.5 " ;
	$dvips_paper      = " -t letter -t landscape " ;
	if ( $hn =~ m/mx/ ) {
	    $gv_orientation   = " --landscape " ;
	} else {
	    $gv_orientation   = " --orientation=landscape --swap --media=letter " ;
	}
    }
    else {

	#print ">>>>>>\n" ;
	$xdvi_orientation = " -paper 29.704x20.99cm " ;
	if ( $opt_H ) {
	    if ( $opt_P eq 'a4' ) {
		$dvips_paper      = " -T 297mm,210mm " ;
	    } elsif ( $opt_P eq 'a3' ) {
		$dvips_paper      = " -T 420mm,297mm " ;
	    } elsif ( $opt_P eq 'b4' ) {
		$dvips_paper      = " -T 353mm,250mm " ;
	    } elsif ( $opt_P eq 'letter' ) {
		$dvips_paper      = " -T 279.4mm,215.9mm " ;
	    } elsif ( $opt eq 'mes1' ) {
		$dvips_paper      = " -T 156mm,117mm " ;
		} elsif ( $opt eq 'mes2' ) {
		$dvips_paper      = " -T 208mm,156mm " ;
		}
	} elsif ( $opt_S ) {
	    $dvips_paper      = " -t landscape -T 225mm,180mm " ;
	}
	$gv_orientation   = " --orientation=landscape --media=a4 --swap " ;
	#print "$dvips_paper<<<<<\n" ;
    }


} 
else {

    if ( $opt_l ) {
	$xdvi_orientation = " -paper 8.5x11 " ;
	$dvips_paper      = " -t letter " ;
	$gv_orientation   = " --orientation=portrait " ; 
    }
    else {
	$xdvi_orientation = " -paper 20.99x29.704cm " ;
	$dvips_paper      = " -t a4 " ;
	$gv_orientation   = " --orientation=portrait " ; 
    }

}

if ( $opt_P ) {
    $dvips_paper = " -t $opt_P " if ( ! ( $opt_H || $opt_S ) ) ;
    $xdvi_orientation = " -paper $opt_P " ;
    if ( $opt_H || $opt_S ) {
	$dvips_paper .= " -t landscape " ;
	$gv_orientation   = " --orientation=seascape --media=$opt_P --swap " ;
    } else {
	$gv_orientation   = " --orientation=portrait --media=$opt_P " ;
	if ( $opt_P eq 'a3' ) {
	    $gv_orientation .= "--scale=0.707 " ;
	} elsif ( $opt_P eq 'b4' ) {
	    $gv_orientation .= "--scale=0.9 " ;
        }	    
    }
}


foreach $file ( @ARGV ) {

    print  "file $file does not exist !!\n"  unless ( -e $file || -e "$file.tex" ) ;

    # �h�����ɦW
    $file =~ s/\.texi?$// ;

    print "===WTEX: b> [$file]!!!!!!!!!!!!!!!!!!!!!!!!!\n" ;
    if ( $opt_f && ! opt_u ) {
	print( "===WTEX: chitex $coding -dvips2pdf $file\n" ) ;
	system( "chitex $coding -dvips2pdf $file" ) ;
	#system( "chitex $coding $file" ) ;
	next ;
    } elsif ( $opt_j || $opt_F ) {
	
	print( "===WTEX: chitex $coding -pdftex $file\n" ) ;
	system( "chitex $coding -pdftex $file" ) ;
	next ;
    }

    if ( $opt_x ) {

#	system( "xdvi $xdvi_color +$opt_n $xdvi_orientation -s $shrink  -cr red -bd yellow $file.dvi" ) ;
	print( "===WTEX: xdvi -s $shrink +$opt_n $xdvi_orientation $file.dvi\n" ) ;
	system( "xdvi -s $shrink +$opt_n $xdvi_orientation $file.dvi" ) ;

    } else {

	if ( ! $opt_d ) {    

	    REPEAT : 

	    if ( $opt_c ) {
			if ( $opt_B ) {
			    #exit if system ( "chitex -dvipdfm $file" ) ;
				print( "===WTEX: chitex $coding  $file\n" );
			    exit if system ( "chitex $coding  $file" ) ;
			} 
			else {
			    if ( $opt_t ) {
					print( "===WTEX: chitex $coding $file\n" ) ;
					exit if system ( "chitex $coding $file" ) ;
			    } 
				else { 
#			    exit if system ( "chilatex $file" ) ;
					print( "===WTEX: chitex $coding $file\n" ) ;
					exit if system ( "chitex $coding $file" ) ;
			    }
			}
	    }
		else {
			if ( $opt_t ) {
				print( "===WTEX: tex $file" ) ;
			    exit if system ( "tex $file" ) ;
			} 
			else { 
				print( "===WTEX: latex $file" )  ;
			    exit if system ( "latex $file" )  ;
			}
	    }

	    # generate index
	    if ( $opt_i ) {
		print "*" x 80 , "\n" , "*" x 80 , "\n" ;
		print "> generate index \n" ;

		$style = ( $opt_s ? "-s $opt_s" : "" ) ; 
		
		if ( $opt_c ) {
			print( "===WTEX: cmakeindex" , "$style" ,  "$file" ) ;
		    system( "cmakeindex" , "$style" ,  "$file" ) ;
		} 
		else {
			print( "===WTEX: makeindex" , "$style" , "$file" ) ;
		    system( "makeindex" , "$style" , "$file" ) ;
		}
		print "*" x 80 , "\n" , "*" x 80 , "\n" ;

		$opt_i = 0 ;
		goto REPEAT ;
	    }

	}

	if ( ! ( $opt_p || $opt_g || $opt_d ) ) {
		print( "===WTEX: xdvi -s $shrink +$opt_n $xdvi_orientation $file.dvi" ) ;
	    system( "xdvi -s $shrink +$opt_n $xdvi_orientation $file.dvi" ) ;
	}
	else {

	    $file =~ m!^(.*?)\.! ;

	    if ( $file =~ m!^(.*?)\.! ) {
			$dvifile = $1 . "\.dvi" ;
			$psfile = $1 . "\.ps" ;
	    } 
		else {
			$dvifile = $file . "\.dvi" ;
			$psfile = $file . "\.ps" ;
	    }

	    print "a> [$file] , [$dvifile]\n" ;

	    if ( $opt_b ) {
			print( "===WTEX: dvips -T 22.2cm,29.1cm -O 1.5cm,0.9cm $file" ) ;
			system( "dvips -T 22.2cm,29.1cm -O 1.5cm,0.9cm $file" ) ;
	    } 
		else {
			printf( ">>>>>>>>>> dvips $dvips_paper $dvifile\n" ) ;
			system( "dvips $dvips_paper $dvifile" ) ;
	    }

	    if ( $opt_g ) {
#		if ( $host =~ m/mx/ ) {
		print "$ghostview --page=$opt_n $gv_orientation $psfile\n" ;
		system( "$ghostview --page=$opt_n $gv_orientation $psfile" ) ;
#		} else {
#		    print "$ghostview --page=$opt_n $gv_orientation $file.ps\n" ;
#		    system( "$ghostview -page $opt_n  file.ps" ) ;
#		}
#		system( "gv --page=$opt_n $gv_orientation --resize $file.ps" ) ;
	    }

	    if ( $opt_b ) {
#                print "> generate pdf\n" ;
#		system( "ps2pdf13 $file.ps" ) ;
#		system( "acroread $file.pdf" ) ;
	    }

	    if ( $opt_u && $opt_f ) {
                print "> generate pdf\n" ;
		system( "ps2pdf13 $file.ps" ) ;
		system( "acroread $file.pdf" ) if ( ! $opt_N ) ;
	    }

	}

	if ( $opt_e ) {
        $f2 = $file . '2.ps' ;
		print( "===WTEX: psnup -2 $file.ps > $f2" ) ;
        system( "psnup -2 $file.ps > $f2" ) ;
		print( "===WTEX: ps2pdf -sPAPERSIZE=a4 $f2" ) ;
	    system( "ps2pdf -sPAPERSIZE=a4 $f2" ) ;
        unlink $f2 if ( -e $f2 ) ;
	}

    }

    $filegz = $file . '.synctex.gz' ;
    unlink  $filegz if ( -e  $filegz ) ;

}
