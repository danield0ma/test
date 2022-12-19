var RockMarathon binary;
var Sziget binary;
var Volt binary;
var MetalFest binary;

s.t. Dalriada:
        Sziget + Volt + MetalFest >= 1;

s.t. Metallica:
        RockMarathon + Sziget >= 1;

s.t. Eluveitie:
        RockMarathon + MetalFest >= 1;

s.t. Liva:
        RockMarathon + Sziget + Volt >= 1;

s.t. IcedEarth:
        Sziget + Volt + MetalFest >= 1;

s.t. Virrasztok:
        Volt + MetalFest >= 1;

minimize festivals:
        RockMarathon + Sziget + Volt + MetalFest;