#Sets and params
set Cars;
set Days;
param Prices{Cars, Days};

#Variables
var BuyCar {Cars, Days} binary;

#Constraints
s.t. BuyExactlyOneCarEachDay {D in Days}:
    sum{C in Cars} BuyCar[C, D] == 1;

s.t. BuyEachCarExactlyOnce {C in Cars}:
    sum{D in Days} BuyCar[C, D] == 1;

#Objective
minimize TotalCost:
    sum{C in Cars, D in Days} BuyCar[C, D] * Prices[C, D];

solve;
printf "\n";
for{C in Cars, D in Days: BuyCar[C, D] == 1}
    printf "%s - %s\n", C, D;
printf "\n";

#Data
data;

set Cars := Wartburg Lada Kispolski Trabant Skoda;
set Days := Hetfo Kedd Szerda Csutortok Pentek;
param Prices :
                Hetfo   Kedd    Szerda  Csutortok   Pentek :=
    Wartburg    60000   65000   61000   66000       60000
    Lada        50000   55000   63000   60000       52000
    Kispolski   30000   32000   33000   30000       27000
    Trabant     70000   65000   77000   85000       100000
    Skoda       65000   70000   75000   90000       70000;
