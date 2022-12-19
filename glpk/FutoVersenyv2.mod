#sets and params
set Foods;
set Specs;
param AvailableFoods{Foods, Specs};
param Price{Foods};
param NeededAmount{Specs};

#variables
var Consume{Foods} >= 0;

#constraints
s.t. Amounts{S in Specs}:
    sum{F in Foods} Consume[F] * AvailableFoods[F, S] >= NeededAmount[S];

s.t. WaterMustBeAtLeastTheAmountOfCola:
    Consume["Water"] >= Consume["Cola"];

s.t. DrinkingCoffeeMeansDrinkingWaterAsWell:
    Consume["Water"] >= Consume["Water"] + Consume["Coffee"];

#objective
minimize TotalCost:
    sum{F in Foods} Consume[F] * Price[F];

#data
data;

set Foods := Cola Isotony Banana SaltyParadise Water Coffee;
set Specs := Calory Water Caffeine Minerals;
param NeededAmount :=
        Calory      6000
        Water       10
        Caffeine    300
        Minerals    15000;
param Price :=
        Cola            250
        Isotony         2000
        Banana          600
        SaltyParadise   700
        Water           300
        Coffee          2000;
param AvailableFoods:
                Calory  Water   Caffeine    Minerals :=
Cola            410     0.9     80          100
Isotony         1500    0.9     20          1400
Banana          105     0       0           4000
SaltyParadise   180     0.1     0           420
Water           0       1       0           100
Coffee          23      0       400         200;