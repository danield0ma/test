#Sets and Params
set Festivals;
set Bands;
param performs {Bands, Festivals};

#Variables
var goto {Festivals} binary;

#Constraints
s.t. MustSeeEachBandAtLeastOnce {b in Bands}:
        sum{f in Festivals} goto[f] * performs[b, f] >= 1;

#Objective
minimize FestivalsWeGoTo:
        sum{f in Festivals} goto[f];

solve;
printf "\n\n";
for{f in Festivals: goto[f] == 1}
        printf "%s\n", f;
printf "\n\n";

#Data
data;
set Festivals := RockMarathon Sziget Volt MetalFest;
set Bands := Dalriada Metallica Eluveitie Liva IcedEarth Virrasztok;
param performs:
                        RockMarathon    Sziget  Volt    MetalFest :=
        Dalriada        0               1       1       1
        Metallica       1               1       0       0
        Eluveitie       1               0       1       0
        Liva            1               1       1       0
        IcedEarth       0               1       1       1
        Virrasztok      0               0       1       1;