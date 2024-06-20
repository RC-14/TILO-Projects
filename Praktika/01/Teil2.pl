% mann(Person)
% frau(Person)
frau(dorothea).
mann(heinz).

frau(elisabeth).
mann(alfred).

frau(claudia).
mann(thomas).

frau(daniela).
mann(helmut).

frau(irena).
mann(andreas).

frau(deliana).
mann(johannes).

frau(sienna).
mann(felix).
mann(titus).
mann(julius).
mann(frederik).
mann(theodor).

% kind(Kind, Elternteil)
kind(thomas, dorothea).
kind(thomas, heinz).
kind(helmut, dorothea).
kind(helmut, heinz).
kind(andreas, dorothea).
kind(andreas, heinz).
kind(johannes, dorothea).
kind(johannes, heinz).

kind(claudia, elisabeth).
kind(thomas, alfred).

kind(felix, claudia).
kind(felix, thomas).
kind(titus, claudia).
kind(titus, thomas).

kind(julius, daniela).
kind(julius, helmut).
kind(frederik, daniela).
kind(frederik, helmut).

kind(sienna, irena).
kind(sienna, andreas).
kind(theodor, irena).
kind(theodor, andreas).

% mutter(Mutter, Kind)
mutter(Mutter, Kind) :- frau(Mutter), kind(Kind, Mutter).

% vater(Vater, Kind)
vater(Vater, Kind) :- mann(Vater), kind(Kind, Vater).

% tochter(Tochter, Elternteil)
tochter(Tochter, Elternteil) :- frau(Tochter), kind(Tochter, Elternteil).

% sohn(Sohn, Elternteil)
sohn(Sohn, Elternteil) :- mann(Sohn), kind(Sohn, Elternteil).

% enkel(Enkel, Großelternteil)
enkel(Enkel, Grosselternteil) :- kind(Enkel, Elternteil), kind(Elternteil, Grosselternteil).

% großmutter(Großmutter, Enkel)
grossmutter(Grossmutter, Enkel) :- frau(Grossmutter), enkel(Enkel, Grossmutter).

% großvater(Großvater, Enkel)
grossvater(Grossvater, Enkel) :- mann(Grossvater), enkel(Enkel, Grossvater).

% geschwister(Person1, Person2)
geschwister(Person1, Person2) :- vater(Vater, Person1), mutter(Mutter, Person1), vater(Vater, Person2), mutter(Mutter, Person2), Person1 \= Person2, Vater \= Mutter.

% schwester(Schwester, Person)
schwester(Schwester, Person) :- frau(Schwester), geschwister(Schwester, Person).

% bruder(Bruder, Person)
bruder(Bruder, Person) :- mann(Bruder), geschwister(Bruder, Person).

% schwestern(Person1, Person2)
schwestern(Person1, Person2) :- frau(Person2), schwester(Person1).

% brüder(Person1, Person2)
brueder(Person1, Person2) :- mann(Person2), bruder(Person1, Person2).

% tante(Tante, Person)
tante(Tante, Person) :- kind(Person, Elternteil), schwester(Tante, Elternteil).

% onkel(Onkel, Person)
onkel(Onkel, Person) :- kind(Person, Elternteil), bruder(Onkel, Elternteil).

% cousine(Cousine, Person)
cousine(Cousine, Person) :- tochter(Cousine, TanteOnkel), geschwister(TanteOnkel, Elternteil), kind(Person, Elternteil).

% cousin(Cousin, Person)
cousin(Cousin, Person) :- sohn(Cousin, TanteOnkel), geschwister(TanteOnkel, Elternteil), kind(Person, Elternteil).
