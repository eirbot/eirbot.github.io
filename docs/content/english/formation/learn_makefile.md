---
title: Formation makefile
description : "Formation pour l'utilisation et la création de makefile"
draft : false
image : "images/gnu-make.png"
bg_image : "images/banner.webp"
date: 2020-04-05T11:07:10+06:00
author: Sébastien Delpeuch
tags: ["Formations"]
---

<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

Les [Makefiles](https://gl.developpez.com/tutoriel/outil/makefile/) sont des fichiers permettant d'executer un ensemble d'actions,
comme la compilation d'un projet, la mise à jour d'un rapport, où l'archivage de
données. Les Makefiles sont des fichiers shell particulier ils respectent
cependant les conventions de codages du shell. L'idée de
ce document est de présenté l'idée générale d'un Makefile via un exemple
basique, puis d'aller vers un exemple plus complexe, le Makefile pour notre
robot.

## <i class="fab fa-leanpub "></i> Un exemple basique
Considérons un exemple de projet très basique, constitué de 3 fichiers :
hello.c, hello.h et main.c.De manière littérale nous avons définit des fonctions
dans hello.c, ces fonctions sont reférencées par leurs prototypes dans hello.h.
Par ailleurs nous avons définies des fonctions dans main.c, nous sous entendons
que les fonctions de main.c font appels à celles de hello.c (d'où l'inclusion de
hello.h dans main.c).

Nous voulons donc compiler main.c pour créer un executable que nous appellerons
**project**. Si nous essayons directement de faire ```shell gcc -Wall -Werror
-std=c99 main.c project ``` nous allons avoir des références indéfinies. En
effet il faut d'abbord compiler hello.c en hello.o pour que la machine connaisse
les fonctions définit dans le hello.c (c'est le rôle du hello.o). Ainsi pour
créer project il faut faire deux lignes de commande `gcc -Wall -Werror -std=c99
hello.c -c` puis `gcc -Wall -Werror -std=c99 hello.o main.c -o project`.

Deux nouvelles options se présentent `-c` qui permet de dire au compilateur de
créer un fichier ".o" et `-o` qui permet d'appeler le linker (c'est lui qui
dit au compilateur que certainnes fonctions appelées dans main.c sont définies
dans hello.o).

Maintenant que nous avons compris comment nous pouvions compiler ce projet, nous
allons regarder comment automatiser ces étapes. Pour cela regardons la synthaxe
type d'un Makefile.

```makefile
  cible : dependances
          commandes
```

Analysons ces deux lignes de commandes, le `cible` permet de donner un nom
ainsi dans le shell nous pourrons taper `make cible` pour effectuer les
actions correspondantes. Dans notre cas la cible serait `project`. Ensuite les
`dépendances` sont les fichiers nécessaires à la création de la cible, dans
notre cas cela serait ``hello.o''. Un exemple de Makefile complet pour ce projet
serait le suivant

  ``` makefile
  hello.o:
          gcc -Wall -Werror -std=c99 hello.c -c

  project : hello.o
            gcc -Wall -Werror -std=c99 hello.o main.c -o project
  ```

## <i class="fab fa-leanpub "></i> Un exemple plus complexe
Nous allons maintenant passer à un exemple plus complexe, l'exemple du Makefile
utilisé pour le robot. Plusieurs complications et exigences vont se révéler avec ce projet
+ Beaucoup de fichiers pour le projet
+ Des dépendances entre les fichiers
+ Arreter de compiler les dépendances ``à la main''
+ Avoir deux main (un main et un test)
+ Nettoyer son dossier
+ Vouloir changer les options de compilation / le compilateur facilement
+ Avoir des fichiers dans différents dossier

Commençons par présenter les différents fichiers du projet.

![organisation]
``` text
code/
| Makefile
| rasp
|   | src
|   |   | actionneur.hpp
|   |   | affichage.cpp
|   |   | affichage.hpp
|   |   | asserv.cpp
|   |   | asserv.hpp
|   |   | detection.cpp
|   |   | detection.hpp
|   |   | main.cpp
|   |   | main.hpp
|   |   | navigation.cpp
|   |   | navigation.hpp
|   |   | protocole.cpp
|   |   | protocole.hpp
|   |   | world.cpp
|   |   | world.hpp
|   | tst
|   |   | test.cpp
|   |   | test.hpp
|
```

[organisation]:/assets/images/organisation.png
{:class="image about right"}

Chaque figure de ce graphique correspond à un .cpp et un .hpp (même principe que
un .c et un .h en c++). Cela soulève donc un premier point : beaucoup de fichier
à gérer il va donc falloir créer tous les fichiers binaires (les .o) pour tout
ces fichiers. Nous devons donc créer asserv.o, world.o, navigation.o,
detection.o, protocole.o, affichage.o. Nous allons vouloir automatiser la
création de ces binaires pour cela nous allons utiliser des commandes spéciales
aux Makefile[^1]. Pour automatiser la
transformation des .cpp en .o nous avons les lignes suivantes

[^1]:Je passe sous silence les commandes spéciales, si vous voulez des précision demandez à Lucas H. ou SD

``` makefile
%.o: rasp/src/%.cpp
   $(CC) $(CFLAGS) -c $<
```

Cela constitue la première règle de notre Makefile, elle permet de transformer
n'importe quel .cpp dans code/rasp/src/ en un .o (qui sera mis dans code/).
Nous voyons apparaitre deux variables inconnues `$(CC)` et `$(CFLAGS)`, ces
variables seront définies en début de Makefile et permettent de régler le
problème 6. En effet `CC` va contenir le compilateur et `CFLAGS` les options
de compilation. Nous ajustons donc notre Makefile comme suit.

``` makefile
CFLAGS = -Wall -Wextra -std=c++11 -g -O3
CC=g++
%.o: rasp/src/%.cpp
	$(CC) $(CFLAGS) -c $<
```

Maintenant que nous avons obtenu un moyen de transformer tous les fichiers .cpp en
fichier binaire .o nous allons voir comment créer nos deux executables que nous
appelerons project (qui contiendra le projet en entier) et le test (qui
contiendra le test à effectuer) nous créons alors deux règles :

``` makefile
CFLAGS = -Wall -Wextra -std=c++11 -g -O3
FILE=navigation.o detection.o protocole.o asserv.o world.o affichage.o
CC=g++

all: project

%.o: rasp/src/%.cpp
	$(CC) $(CFLAGS) -c $<

project: $(FILE) rasp/src/main.cpp
	$(CC) $(CFLAGS) $(FILE) rasp/src/main.cpp -o project

test: $(FILE) rasp/tst/test.cpp
	$(CC) $(CFLAGS) $(FILE) rasp/tst/test.cpp -o test
```

Nous voyons alors une nouvelle variable apparaitre, la variable `$FILE`,
cette dernière va lister les dépendances (c'est à dire tous les fichier .o
nécessaire pour la réalisation des règles). A ce stade il ne reste plus beaucoup
de chose à faire sur le Makefile, si vous avez tout compris jusque là vous
pourrez comprendre et créer un Makefile sans trop de soucis. Il faut encore
rajouter deux règles qui sont très souvent présentes dans les Makefile `all`. 
et `clean` (qui permet de nettoyer le dossier). Nous fournissons alors le
Makefile final qui permet de réaliser le projet. Ce Makefile est totalement
générique et est réutilisable pour tous vos projets.

CFLAGS = -Wall -Wextra -std=c++11 -g -O3
FILE=navigation.o detection.o protocole.o asserv.o world.o affichage.o
CC=g++

``` makefile
## Ceci Bloc de documentation doxygen ... pour plus tard
# Project Title
#
# @file
# @version 0.1

all: project

%.o: rasp/src/%.cpp
	$(CC) $(CFLAGS) -c $<

project: $(FILE) rasp/src/main.cpp
	$(CC) $(CFLAGS) $(FILE) rasp/src/main.cpp -o project

test: $(FILE) rasp/tst/test.cpp
	$(CC) $(CFLAGS) $(FILE) rasp/tst/test.cpp -o test

clean:
	rm -f *.o project test test_protocole
# end
```

## <i class="fab fa-leanpub "></i> Automatiser un makefile avec Cmake <i class="fas fa-wrench "></i>
