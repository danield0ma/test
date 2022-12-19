#sets and params
set Hamburgers;
set Ingredients;
param IngredientAmounts{Ingredients, Hamburgers} >= 0;
param MaxStock{Ingredients} integer;
param Price{Hamburgers} integer;

#variables
var BurgerCount{Hamburgers} >= 0, integer;

#constraints
s.t. CantExceedDailyStock{I in Ingredients}:
    sum{H in Hamburgers} BurgerCount[H] * IngredientAmounts[I, H] <= MaxStock[I];

s.t. RoyalAndBigMacGreaterThanOrEqualToAnanasz:
    BurgerCount["Ananasz"] <= BurgerCount["Royal"] + BurgerCount["BigMac"];

#objective
maximize Income:
    sum{H in Hamburgers} BurgerCount[H] * Price[H];

#data
data;
set Hamburgers := Royal BigMac Ananasz;
set Ingredients := Buci Sajt Hus Ananasz Szosz;
param IngredientAmounts :
        Royal   BigMac  Ananasz :=
Buci    1       2       1.5
Sajt    100     50      40
Hus     200     300     150
Ananasz 0       0       2
Szosz   40      60      30;
param MaxStock :=
    Buci    100
    Sajt    5000
    Hus     10000
    Ananasz 60
    Szosz   2700;
param Price :=
    Royal   1100
    BigMac  1600
    Ananasz 2200;
