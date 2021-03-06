#!%TCLSH%
#
# $Id$
#
# Example: test-sat.tcl tip02
#
package require gempak;

# Uncomment this if necessary
source /usr/local/etc/nbsp/gempak.env

# Edit this is necessary
set ginidir "/var/noaaport/data/digatmos/sat/gini";

# main
set usage "Usage: $argv0 <type>";
if {$argc != 1} {
    puts stderr $usage;
    exit 1;
}
set type [lindex $argv 0];

set datafile [file join $ginidir $type "latest"];
if {[file exists $datafile] == 0} {
    puts stderr "$datafile not found.";
    exit 1;
}

gempak::init gpmap;

gempak::define satfil $datafile;
gempak::define proj "sat";
gempak::define device "gif|${type}.gif";
gempak::define garea "dset";

gempak::run;
gempak::end;
