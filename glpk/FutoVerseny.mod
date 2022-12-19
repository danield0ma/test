#Variables
var Cola >= 0;
var Isotony >= 0;
var Banana >= 0;
var SaltyParadise >= 0;
var Water >= 0;
var Coffee >= 0;

#Constraints
s.t. Calory:
    410 * Cola + 1500 * Isotony + 105 * Banana + 180 * SaltyParadise + 0 * Water + (23 * Coffee + 0 * Water) >= 6000;

s.t. WaterConsumption:
    0.9 * Cola + 0.9 * Isotony + 0 * Banana + 0.1 * SaltyParadise + 1 * Water + (0 * Coffee + 1 * Water) >= 10;

s.t. Caffeine:
    80 * Cola + 20 * Isotony + 0 + Banana + 0 + SaltyParadise + 0 * Water + (400 * Coffee + 0 * Water) >= 300;

s.t. Minerals:
    100 * Cola + 1400 * Isotony + 4000 * Banana + 420 * SaltyParadise + 100 * Water + (200 * Coffee + 100 * Water) >= 15000;

s.t. WaterMustBeAtLeastTheAmountOfCola:
    Water >= Cola;

#Objective
minimize TotalCost:
    250 * Cola + 2000 * Isotony + 600 * Banana + 700 * SaltyParadise + 300 * Water + 2000 * Coffee;