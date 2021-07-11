---------------- MODULE sablier ----------------

(* Le problème du sablier *)

EXTENDS Naturals, Sequences, FiniteSets

-------------------------

(* La taille du sablier <=> temps pour lequel il s'écoule *)
CONSTANT TailleSablier1
ASSUME TailleSablier1 \in Nat /\ TailleSablier1 > 0


CONSTANT NbSabliers 
ASSUME NbSabliers \in Nat /\ NbSabliers > 0

-----------------------

VARIABLES
  sableHaut,    \* la quantité de sable restante des sabliers
  sableBas,     \* la quantité de sable écoulée des sabliers
  temps         \* le temps mesuré

EnsembleSabliers == 0..NbSabliers-1

tempsPetit ==
    /\ temps \leq 100

ToujoursOk == []tempsPetit

Solution ==
  [] \neg(temps = 9)

----------------------------------------------------------------


inv(i) == 1

tailleSab(i) == TailleSablier1 

soustraire_sable(indice, valeur) == IF sableHaut[indice] \leq valeur THEN 0 ELSE sableHaut[indice] - valeur

ajouter_sable(indice, valeur) == IF sableBas[indice] + valeur \geq tailleSab(indice) THEN tailleSab(indice) ELSE sableBas[indice] + valeur


Init ==
    /\ sableHaut = [ i \in EnsembleSabliers |-> tailleSab(i) ]
    /\ sableBas = [ i \in EnsembleSabliers |-> 0 ]
    /\ temps = 0


\* Transition où l'on laisse s'écouler le sablier

ecouler(i) ==
    /\ sableHaut[i] > 0
    /\ sableHaut' = [ sableHaut EXCEPT  ![i] = 0 ]
    /\ sableBas' = [ sableBas EXCEPT  ![i] = tailleSab(i) ]
    /\ temps' = temps + sableHaut[i]

\* Transition où l'on retourne le sablier

retourner(i) ==
    /\ sableHaut' = [ sableHaut EXCEPT ![i] = sableBas[i] ]
    /\ sableBas' = [ sableBas EXCEPT ![i] = sableHaut[i] ]
    /\ UNCHANGED <<temps>>

Next == 
    \E i \in EnsembleSabliers :
        \/ ecouler(i)
        \/ retourner(i)



Spec == Init /\ [] [ Next ]_<<sableHaut,temps>>

=========================================================
