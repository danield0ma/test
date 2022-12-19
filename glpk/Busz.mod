var jarat1 binary;
var jarat2 binary;
var jarat3 binary;
var jarat4 binary;
var jarat5 binary;

s.t. Gyor:
    jarat1 + jarat2 + jarat3 + jarat4 + jarat5 >= 1;

s.t. Ravazd:
    jarat2 + jarat3 + jarat5 >= 1;

s.t. Veszpremvarsany:
    jarat1 + jarat2 + jarat4 >= 1;

s.t. Csesznek:
    jarat3 + jarat4 + jarat5 >= 1;

s.t. Zirc:
    jarat1 + jarat3 + jarat4 >= 2;

s.t. Epleny:
    jarat2 + jarat4 + jarat5 >= 1;

s.t. Veszprem:
    jarat1 + jarat2 + jarat3 + jarat4 + jarat5 >= 1;

minimize MinimumJarat:
    jarat1 + jarat2 + jarat3 + jarat4 + jarat5;