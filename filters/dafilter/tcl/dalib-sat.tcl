proc filter_sat {seq fpath savedir savename {polarsatflag 0}} {
#
# This function optionally uncompresses the file, and renames it according
# to the way the image files are saved by the rst filter. This is done
# only for the non-polarsat ginis.
#
    global dafilter;
    global filtersprogs;

    if {[is_sat_rule_enabled $savedir] == 0} {
	return;
    }

    if {$dafilter(archive_sat_enable) == 2} {
	return;
    }

    set _pwd [pwd];

    # This is now (Sun Nov 29 23:34:49 AST 2009) done in the filterlib
    # through the rc variables.
    #
    # First extract the relevant information from the raw data file
    # in order to rename the data file to match the image
    # (which this filter does not produce); e.g,
    #
    # knes_tigp01.070101_1414381 (raw, compressed)
    # tigp01_20060307_0101.png   (image)
    # tigp01_20060307_0101.gini  (optionally uncompressed data)
    #
    # set output [filter_sat_info $fpath];
    # set status [lindex $output 0];
    # set datetime [lindex $output 1];

    cd $dafilter(datadir);
    file mkdir $savedir;
    set datafpath [file join $dafilter(datadir) $savedir $savename];

    set status [catch {
	if {$polarsatflag == 0} {
	    if {$dafilter(satuncompress) == 0} {
	        # Gini sat files do not have a ccb
	        file copy -force $fpath $datafpath;
	    } else {
	        exec $filtersprogs(nbspunz) -o $datafpath $fpath;
	    }
	} else {
	    filterlib_cspool_nbspfile $seq $fpath $savedir $savename;
	}
    } errmsg];

    if {$status != 0} {
	file delete $datafpath;
	log_msg $errmsg;
	return;
    }

    filter_sat_insert_inventory $savedir $datafpath;

    # Create the link to the latest
    make_sat_latest $savedir $savename;

    cd $_pwd;
}
