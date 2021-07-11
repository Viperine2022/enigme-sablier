# 									L'énigme du sablier





​																								<img src="./img/Phantom_Hourglass.png" />



### Ce projet se propose de résoudre l'énigme du sablier en utilisant le langage **TLA+**



### Il se décompose en plusieurs niveaux, avec un sablier supplémentaire à chaque niveau.



## 											Niveau 1 

- Le premier niveau propose de **mesurer 9 minutes** avec un sablier de taille 3 minutes. Il s'agit d'un niveau très simple pour découvrir les actions possibles d'un sablier :
  - retourner
  - écouler

![niveau-1](./img/niveau-1.png)



## 												Niveau 2

- Le deuxième niveau est plus complexe, il propose de **mesurer 9 minutes** avec 2 sabliers de tailles respectives 7 et 4 minutes. Une certaines réflexion est nécessaire pour le résoudre.

![niveau-2](./img/niveau-2.png)

## 												Niveau 3

- Le troisième et dernier niveau nécessite de manipuler 3 sabliers, plus gros que les précédents : 15, 10 et 6 minutes respectivement. Il s'agit ici de **mesurer 17 minutes**.

![niveau-3](./img/niveau-3.png)





## Lancer la résolution des énigmes

- Se placer dans un des niveaux `./niveau-*`
- Lancer la commande `sudo tlc sablier.tla`

- Le solver **TLA+** donne les actions à effectuer pour mesurer le temps attendu.

Par exemple, pour le niveau 1 : 

```
sudo tlc sablier.tla 
[sudo] Mot de passe de benoit : 
TLC2 Version 2.16 of 31 December 2020 (rev: cdddf55)
Running breadth-first search Model-Checking with fp 107 and seed 3102102118800035510 with 1 worker on 8 cores with 1708MB heap and 64MB offheap memory [pid: 25964] (Linux 5.8.0-59-generic amd64, Private Build 13.0.7 x86_64, MSBDiskFPSet, DiskStateQueue).
Parsing file /home/benoit/Documents/Sablier_TLA/enigme-sablier/niveau-1/sablier.tla
Parsing file /tmp/Naturals.tla
Parsing file /tmp/Sequences.tla
Parsing file /tmp/FiniteSets.tla
Semantic processing of module Naturals
Semantic processing of module Sequences
Semantic processing of module FiniteSets
Semantic processing of module sablier
Starting... (2021-07-11 23:20:34)
Warning: The subscript of the next-state relation specified by the specification
does not seem to contain the state variable sableBas
(Use the -nowarning option to disable this warning.)
Computing initial states...
Finished computing initial states: 1 distinct state generated at 2021-07-11 23:20:34.
Error: Invariant Solution is violated.
Error: The behavior up to this point is:
State 1: <Initial predicate>
/\ sableHaut = (0 :> 3)
/\ temps = 0
/\ sableBas = (0 :> 0)

State 2: <ecouler line 55, col 5 to line 58, col 36 of module sablier>
/\ sableHaut = (0 :> 0)
/\ temps = 3
/\ sableBas = (0 :> 3)

State 3: <retourner line 63, col 5 to line 65, col 26 of module sablier>
/\ sableHaut = (0 :> 3)
/\ temps = 3
/\ sableBas = (0 :> 0)

State 4: <ecouler line 55, col 5 to line 58, col 36 of module sablier>
/\ sableHaut = (0 :> 0)
/\ temps = 6
/\ sableBas = (0 :> 3)

State 5: <retourner line 63, col 5 to line 65, col 26 of module sablier>
/\ sableHaut = (0 :> 3)
/\ temps = 6
/\ sableBas = (0 :> 0)

State 6: <ecouler line 55, col 5 to line 58, col 36 of module sablier>
/\ sableHaut = (0 :> 0)
/\ temps = 9
/\ sableBas = (0 :> 3)

9 states generated, 7 distinct states found, 0 states left on queue.
The depth of the complete state graph search is 6.
The average outdegree of the complete state graph is 1 (minimum is 0, the maximum 2 and the 95th percentile is 2).
Finished in 00s at (2021-07-11 23:20:34)
```
