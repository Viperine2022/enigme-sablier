---------------- MODULE sablier ----------------

(* Le problème du sablier *)

EXTENDS Naturals, Sequences, FiniteSets

-------------------------

(* La taille du sablier <=> temps pour lequel il s'écoule *)
CONSTANT sand_Top
CONSTANT sand_Down
VARIABLES
    hourglass,      \* Le contenu des sabliers
    time            \* Le temps écoulé <=> calculé
  

ASSUME sand_Top  \in [1..NbSabliers -> Nat]
ASSUME sand_Down \in [1..NbSabliers -> Nat]

-----------------------


EnsembleSabliers == 0..NbSabliers-1

tempsPetit ==
    /\ temps \leq 100

ToujoursOk == []tempsPetit



Solution ==
  [] \neg(temps = 0)

----------------------------------------------------------------


Init ==
    /\ hourglass = <<sand_Top, sand_Down>>
    /\ temps = 0


\* Transition où l'on laisse s'écouler le sablier


\* Transition où l'on retourne le sablier


Next == 
    \E i \in EnsembleSabliers :
        \/ ecouler(i)
        \/ retourner(i)



Spec == Init /\ [] [ Next ]_<<sableHaut,temps>>

=========================================================
