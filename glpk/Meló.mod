#sets and params
set Workers;
set Tasks;
param Wages{Workers, Tasks};

#variables
var Assignations{Workers, Tasks} binary;

#constraints
s.t. ExactlyOneWorkerForEachTask {T in Tasks}:
    sum{W in Workers} Assignations[W, T] = 1;

s.t. ExactlyOneTaskForEachWorker {W in Workers}:
    sum{T in Tasks} Assignations[W, T] = 1;

s.t. VizElekAndKapukBela:
    Assignations["Viz_Elek", "Vonatkerek_pumpalas"] + Assignations["Kapuk_Bela", "Erdekfeszites"] <= 1;

#objective
minimize Cost:
    sum{W in Workers, T in Tasks} Assignations[W, T] * Wages[W, T];

#data
data;
set Workers := Zsiros_B._Odon Viz_Elek Kapuk_Bela;
set Tasks := Vonatkerek_pumpalas Erdekfeszites Le-hutes;
param Wages:
                Vonatkerek_pumpalas Erdekfeszites   Le-hutes :=
Zsiros_B._Odon  10                  15              4
Viz_Elek        23                  10              8
Kapuk_Bela      12                  12              10;
