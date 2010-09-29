#
# $Id$
#
package require nbsp::gis;

# Load the color definitions - the default is that they are in the file
# gis-color-def in the same directory as this template.
#
::nbsp::gis::init [file join [file dirname [info script]] "gis-colors.def"];

# Colors can be overriden here. For example this will set a light
# grey background for n0r images.
#
# ::nbsp::gis::radcolor_set "n0r" "background" {196 196 196}

# When this file is sourced (by nbspgismap1), the following parameters
# will have been set:
#
# map(awips1)	= e.g., n0r
# map(geodata)
# map(mapfonts)
# map(inputfile,<i>)
# map(extent)
# map(size)
#
# These (extent and size) defaults can (should) be overriden via
# the -D switch to nbspgismap1. In practice, they are set in the
# "bundle configuration file".
#
set _map(extent) {-104 25 -90 36};
set _map(size) {800 600};
#
foreach _k [list extent size] {
    if {[info exists map($_k)] == 0} {
        set map($_k) $_map($_k);
    }
}

set header {
MAP
	#
	# Allow the possibility that the extent parameters are
	# specified as "a b c d" or "a;b;c;d", and similarly with the size.
	#
	EXTENT [string map [list ";" " "] $map(extent)]
	UNITS  DD
	SIZE [string map [list ";" " "] $map(size)]
	IMAGECOLOR [::nbsp::gis::radcolor $map(awips1) background]
	FONTSET "$map(mapfonts)/fonts.list"
	#
	# IMAGECOLOR 196 196 196  will give a light grey background
	#
}

#
# The "nexrad" layer; one for each site.
#
set nexrad {
LAYER
  NAME $name
  DATA $datafile
  TYPE RASTER
  STATUS ON
  TRANSPARENCY 100
  # PROCESSING "RESAMPLE=NEAREST"
  # PROCESSING "RESAMPLE=AVERAGE"
  # PROCESSING "RESAMPLE=BILINEAR"
  CLASSITEM "\[pixel\]"

   CLASS
     EXPRESSION (\[pixel\] >= 0 && \[pixel\] < 1)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 0]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 1 && \[pixel\] < 2)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 1]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 2 && \[pixel\] < 3)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 2]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 3 && \[pixel\] < 4)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 3]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 4 && \[pixel\] < 5)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 4]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 5 && \[pixel\] < 6)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 5]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 6 && \[pixel\] < 7)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 6]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 7 && \[pixel\] < 8)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 7]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 8 && \[pixel\] < 9)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 8]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 9 && \[pixel\] < 10)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 9]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 10 && \[pixel\] < 11)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 10]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 11 && \[pixel\] < 12)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 11]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 12 && \[pixel\] < 13)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 12]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 13 && \[pixel\] < 14)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 13]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 14 && \[pixel\] < 15)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 14]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 15 && \[pixel\] < 16)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 15]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 16 && \[pixel\] < 17)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 16]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 17 && \[pixel\] < 18)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 17]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 18 && \[pixel\] < 19)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 18]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 19 && \[pixel\] < 20)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 19]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 20 && \[pixel\] < 21)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 20]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 21 && \[pixel\] < 22)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 21]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 22 && \[pixel\] < 23)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 22]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 23 && \[pixel\] < 24)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 23]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 24 && \[pixel\] < 25)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 24]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 25 && \[pixel\] < 26)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 25]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 26 && \[pixel\] < 27)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 26]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 27 && \[pixel\] < 28)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 27]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 28 && \[pixel\] < 29)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 28]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 29 && \[pixel\] < 30)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 29]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 30 && \[pixel\] < 31)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 30]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 31 && \[pixel\] < 32)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 31]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 32 && \[pixel\] < 33)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 32]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 33 && \[pixel\] < 34)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 33]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 34 && \[pixel\] < 35)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 34]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 35 && \[pixel\] < 36)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 35]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 36 && \[pixel\] < 37)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 36]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 37 && \[pixel\] < 38)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 37]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 38 && \[pixel\] < 39)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 38]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 39 && \[pixel\] < 40)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 39]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 40 && \[pixel\] < 41)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 40]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 41 && \[pixel\] < 42)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 41]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 42 && \[pixel\] < 43)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 42]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 43 && \[pixel\] < 44)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 43]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 44 && \[pixel\] < 45)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 44]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 45 && \[pixel\] < 46)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 45]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 46 && \[pixel\] < 47)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 46]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 47 && \[pixel\] < 48)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 47]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 48 && \[pixel\] < 49)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 48]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 49 && \[pixel\] < 50)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 49]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 50 && \[pixel\] < 51)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 50]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 51 && \[pixel\] < 52)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 51]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 52 && \[pixel\] < 53)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 52]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 53 && \[pixel\] < 54)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 53]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 54 && \[pixel\] < 55)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 54]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 55 && \[pixel\] < 56)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 55]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 56 && \[pixel\] < 57)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 56]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 57 && \[pixel\] < 58)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 57]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 58 && \[pixel\] < 59)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 58]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 59 && \[pixel\] < 60)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 59]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 60 && \[pixel\] < 61)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 60]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 61 && \[pixel\] < 62)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 61]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 62 && \[pixel\] < 63)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 62]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 63 && \[pixel\] < 64)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 63]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 64 && \[pixel\] < 65)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 64]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 65 && \[pixel\] < 66)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 65]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 66 && \[pixel\] < 67)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 66]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 67 && \[pixel\] < 68)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 67]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 68 && \[pixel\] < 69)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 68]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 69 && \[pixel\] < 70)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 69]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 70 && \[pixel\] < 71)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 70]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 71 && \[pixel\] < 72)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 71]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 72 && \[pixel\] < 73)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 72]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 73 && \[pixel\] < 74)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 73]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 74 && \[pixel\] < 75)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 74]
     END
   END

   CLASS
     EXPRESSION (\[pixel\] >= 75)
     STYLE
       COLOR [::nbsp::gis::radcolor $map(awips1) 75]
     END
   END

END
}

set counties {
LAYER
    NAME "counties"
    TYPE POLYGON
    STATUS ON
    DATA "$map(geodata)/c_15jl09/c_15jl09.shp"
    TRANSPARENCY 100
    LABELITEM "countyname"
    CLASS
       NAME "counties"
       STYLE
         OUTLINECOLOR 90 90 90
       END
      LABEL
        COLOR 132 31 31
        SHADOWCOLOR 218 218 218
        SHADOWSIZE 2 2
        TYPE TRUETYPE
        FONT arial-bold
        SIZE 6
        ANTIALIAS TRUE
        POSITION CL
        PARTIALS FALSE
        MINDISTANCE 300
        BUFFER 4
      END # end of label 
    END
END
}

#
# Build the main script
#
set MAP [subst $header];
set i 1;
foreach k [array names map "inputfile,*"] {
    set name "nexrad-$i";
    set datafile $map($k);
    append MAP "\n" [subst $nexrad];
    incr i;
}
append MAP "\n" [subst $counties];
append MAP "\n" "END";

set map(scriptstr) $MAP;

#
# Test
#
# source "gis.tcl";
#
# set map(awips1) "n0r";
# set map(geodata) "/usr/local/share/nbsp/defaults/geodata";
# set map(mapfonts) "/usr/local/share/nbsp/defaults/mapfonts";
# set map(inputfile,1) "/var/noaaport/data/gis/1.asc";
# set map(inputfile,2) "/var/noaaport/data/gis/2.asc";
#
# Use the defaults for these two:
#
# map(extent)
# map(size)
#
# source "map_rad.tmpl";
# puts $map(scriptstr);
