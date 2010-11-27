/*
 * Copyright (c) 2010 Jose F. Nieves <nieves@ltp.upr.clu.edu>
 *
 * See LICENSE
 *
 * $Id$
 */
#ifndef DCGINI_SHP_H
#define DCGINI_SHP_H

#include "dcgini_pdb.h"

struct dcgini_point_st {
  double lon;
  double lat;
  int level;
};

struct dcgini_point_map_st {
  struct dcgini_point_st *points;
  int numpoints;
  double lon_min;
  double lat_min;
  double lon_max;
  double lat_max;
};

struct dcgini_data_st {
  unsigned char *data;    /* file data excluding wmo and pdb headers */
  size_t data_size;       /* numlines * linesize */
  struct nesdis_pdb pdb;
};

struct dcgini_shp_st {
  unsigned char *b;     /* buffer */
  uint32_t size;
  uint32_t shpsize;
  uint32_t shxsize;
};

#endif