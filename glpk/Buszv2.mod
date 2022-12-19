#sets and params
set Cities;
set BusLines;
param Stops{Cities, BusLines} binary;

#Variables
var LineChosen{BusLines} binary;

#Constraints
s.t. AtLeastOneLineInEachCity{C in Cities}:
    sum{L in BusLines} LineChosen[L] * Stops[C, L] >= 1;

s.t. ZircMustHaveAtLeastTwoLines:
    sum{L in BusLines} LineChosen[L] * Stops["Zirc", L] >= 2;

#Objective
minimize BusLineCount:
    sum{L in BusLines} LineChosen[L];

#Data
data;

set Cities := Gyor Ravazd Veszpremvarsany Csesznek Zirc Epleny Veszprem;
set BusLines := line1 line2 line3 line4 line5;
param Stops:
                line1   line2   line3   line4   line5 :=
Gyor            1       1       1       1       1
Ravazd          0       1       1       0       1
Veszpremvarsany 1       1       0       1       0
Csesznek        0       0       1       1       1
Zirc            1       0       1       1       0
Epleny          0       1       0       1       1
Veszprem        1       1       1       1       1;