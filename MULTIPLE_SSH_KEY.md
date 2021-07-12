# Multiples Clé SSH



- Tuto / mémoire pour créer plusieurs clef ssh sur un même compte GitHub. Une pour chaque projet étant la meilleur chose à faire (la plus pratique).


#### 1. Créer la clef ssh : `ssh-keygen -t rsa -b 4096 -C benoit.bd@free.fr` 



#### 2. Déterminer le chemin ou sera stockée la clef privée : `/root/.ssh/id_rsa2`



#### 3. L'ajouter sur GitHub (`settings / deploy key  / add deploy key`)



#### 4. Ajouter la clef à l'agent ssh

Un agent SSH ? Qu’est ce que c’est ? Vous vous souvenez de la passphrase que vous avez crée plus tôt ? Le but c’est d’éviter de la retaper systématiquement à chaque fois qu’on va la solliciter. Le rôle de l’agent est de stocker ces clés, ensuite nous n’y toucherons plus.

1. Pour assigner une nouvelle clé à l’agent ssh, il faut démarrer le service

   ```
   eval "$(ssh-agent -s)"
   ```

2. Vous devriez obtenir une information du type

   ```
   Agent pid 78944
   ```

3. On ajoute la clé au ssh-agent

   ```
   ssh-add -K ~/.ssh/id_rsa2
   ```









