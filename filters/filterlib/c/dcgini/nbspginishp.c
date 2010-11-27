/*
 * Copyright (c) 2010 Jose F. Nieves <nieves@ltp.upr.clu.edu>
 *
 * See LICENSE
 *
 * $Id$
 */
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <png.h>
#include <zlib.h>
#include <libgen.h>
#include "err.h"
#include "io.h"
#include "dcgini_pdb.h"
#include "dcgini_util.h"
#include "dcgini_shp.h"

/*
 * Usage: nbspginishp [output options] <file> | < <file>
 *
 * The program reads from a file or stdin, but the data must 
 * be the uncompressed gini data. Only when it is invoked with [-i]
 * to just extract the relevant info, it can take either the compressed
 * or uncompresed file as input. The output options are:
 *
 *  -a => do them all with the default names
 *  -v <csv file>
 *  -p <shp file>
 *  -x <shx file>
 *  -f <dbf file>
 *  -o <info file>
 */

struct {
  char *opt_output_dir;		/* -d */
  char *opt_shpfile;
  char *opt_shxfile;
  char *opt_dbffile;
  char *opt_csvfile;
  char *opt_infofile;
  int opt_background;		/* -b */
  int opt_all;			/* -a */
  int opt_silent;		/* -s */
} g = {NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0};

static int process_file(char *in_file);

int main(int argc, char **argv){

  int status = 0;
  int c;
  char *in_file;
  char *optstr = "absd:f:p:x:v:";
  char *usage = "nbspginishp [-a] [-b] [-s] [-d outputdir]"
    " [-f <dbfname>] [-p <shpname>] [-x <shxmname>] [-v <csvname>] <file>";

  set_progname(basename(argv[0]));

  while((status == 0) && ((c = getopt(argc, argv, optstr)) != -1)){
    switch(c){
    case 'a':
      g.opt_all = 1;
      break;
    case 'b':
      g.opt_background = 1;
      break;
    case 's':
      g.opt_silent = 1;
      break;
    case 'd':
      g.opt_output_dir = optarg;
      break;
    case 'f':
      g.opt_dbffile = optarg;
      break;
    case 'p':
      g.opt_shpfile = optarg;
      break;
    case 'x':
      g.opt_shxfile = optarg;
      break;
    case 'v':
      g.opt_csvfile = optarg;
      break;
    default:
      log_info(usage);
      exit(0);
      break;
    }
  }

  if(optind != argc - 1)
    log_errx(1, "Needs one argument.");

  in_file = argv[optind];

  if(g.opt_background == 1)
    set_usesyslog();

  if(g.opt_background == 1)
    set_usesyslog();

  status = process_file(in_file);

  return(status != 0 ? 1 : 0);
}