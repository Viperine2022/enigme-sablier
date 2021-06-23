---------------- MODULE sablier ----------------

(* Le problème du sablier *)

EXTENDS Naturals, Sequences, FiniteSets

-------------------------

(* La taille du sablier <=> temps pour lequel il s'écoule *)
CONSTANT TailleSablier1
ASSUME TailleSablier1 \in Nat /\ TailleSablier1 > 0

CONSTANT TailleSablier2
ASSUME TailleSablier2 \in Nat /\ TailleSablier2 > 0

CONSTANT NbSabliers 
ASSUME NbSabliers \in Nat /\ NbSabliers > 0

-----------------------

VARIABLES
  taille,       \* la taille des sabliers
  sableHaut,    \* la quantité de sable en haut
  sableBas,     \* la quantité de sable écoulée
  temps         \* le temps mesuré

EnsembleSabliers == 0..NbSabliers-1

tempsPetit ==
    /\ temps \leq 100

ToujoursOk == []tempsPetit

Solution ==
  [] \neg(temps = 10)

----------------------------------------------------------------

soustraireSable(valeur, indice) == IF sableHaut[indice] > valeur THEN sableHaut - valeur ELSE 0

ajouterSable(valeur, indice) == IF sableBas[indice] + valeur <= taille[indice] THEN sableBas[indice] + valeur ELSE taille[indice]

inv(r) == IF 0 THEN 1 ELSE 0

Init ==
    /\ taille = [ i \in NbSabliers |-> 0 ]
    /\ sableHaut = [ i \in NbSabliers |-> 0 ]
    /\ sableBas = [ i \in NbSabliers |-> 0 ]
    \*/\ sableBas[0] = 99
    /\ temps = 0


\* Transition où l'on laisse s'écouler le sablier
ecouler(i) ==
    /\ sableHaut[i] > 0
    /\ sableHaut[i]' = 0
    /\ sableHaut[inv(i)]' = soustraireSable(sableHaut[i], inv(i)) 
    /\ sableBas[i]' = ajouterSable(sableHaut[i], i)
    /\ sableBas[inv(i)]' = ajouterSable(sableHaut[i], inv(i))
    /\ temps' = temps + sableHaut[i]
    /\ UNCHANGED <<taille>>

\* Transition où l'on retourne le sablier
retourner(i) ==
    /\ sableHaut[i]' = sableBas[i]
    /\ sableBas[i]' = sableHaut[i]
    /\ UNCHANGED <<taille, temps>>


toto == 
    /\ temps' = temps + 1
    /\ UNCHANGED <<taille, sableHaut, sableBas>>
Next == 
    \E i \in NbSabliers :
        \/ ecouler(i)
        \/ retourner(i)

Next2 == 
    /\ toto

Spec == Init /\ [] [ Next2 ]_<<temps>>

=========================================================
