#include <stdio.h>

void gini_gray(void){

  int r, g, b;
  int N = 255;
  int i;

  for(i = 0; i <= N; ++i){
    r = i;
    g = i;
    b = i;
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }

  return(0);
}

int main(void){

  int r, g, b;
  int N = 255;
  int step = 1;

  /* blue
  r = 0;
  b = 255;
  for(g = N; g >= 0; g -= step){
    fprintf(stdout, "0 %d %d #00%.2x%.2x\n", g, b, g, b);
  }
  */

  /* green
  b = 0;
  g = 255;
  for(r = 127; r >= 0; r -= step){
    fprintf(stdout, "%d %d 0 #%.2x%.2x00\n", r, g, r, g);
    --g;
  }
  */

  /* yellow
  r = 255;
  g = 255;
  for(b = 127; b >= 0; b -= step){
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }
  */

  /* orange
  r = 255;
  b = 0;
  for(g = 255; g >= 128; g -= step){
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }
  */

  /* red
  r = 255;
  b = 0;
  for(g = 128; g >= 0; g -= step){
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }
  b = 0;
  g = 0;
  for(r = 254; r >= 128; r -= step){
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }
  */

  /* magenta
  r = 255;
  b = 255;
  g = 0;
  for(r = 255, b = 255; r >= 96; r -= step, b -= step){
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }
  */

  /* gray
  r = 205;
  b = 205;
  g = 205;
  for(r = 205, b = 205, g = 205; r >= 118; r -= step, b -= step, g -= step){
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }
*/

  /* baige */
  r = 242;
  g = 242;
  b = 180;

  for(r = 242, g = 242, b = 196; b >= 149; g -= step, b -= step){
    fprintf(stdout, "%d %d %d #%.2x%.2x%.2x\n", r, g, b, r, g, b);
  }

  return(0);
}
