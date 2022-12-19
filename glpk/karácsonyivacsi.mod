#sets and params
set Foods;
param Budget >= 0, integer;
param Prices{Foods} >= 0, integer;
param Reviews{Foods} >= 0, integer;
param MaxAmount{Foods} >= 0, integer;

#variables
var FoodCounts{Foods} >= 0, integer;

#constraints
s.t. CantExceedBudget:
    sum{F in Foods} FoodCounts[F] * Prices[F] <= Budget;

s.t. CantExceedMaxAmount {F in Foods}:
    FoodCounts[F] <= MaxAmount[F];

s.t. Turkey:
    FoodCounts["Pulyka"] <= (FoodCounts["Rizs"] + FoodCounts["Krumpli"]) / 2;

#objective
maximize Scores:
    sum{F in Foods} FoodCounts[F] * Reviews[F];

#data
data;
set Foods := Pulyka Rizs Krumpli Salata Halaszle Koromporkolt;
param Budget := 50000;
param Prices :=
    Pulyka          2200
    Rizs            1600
    Krumpli         1800
    Salata          500
    Halaszle        3000
    Koromporkolt    550;
param Reviews :=
    Pulyka          8
    Rizs            4
    Krumpli         3
    Salata          4
    Halaszle        5
    Koromporkolt    2;
param MaxAmount :=
    Pulyka          5
    Rizs            4
    Krumpli         9
    Salata          20
    Halaszle        4
    Koromporkolt    22;
