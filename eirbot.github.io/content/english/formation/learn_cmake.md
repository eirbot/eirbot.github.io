---
title: Formation Cmake
draft : false
image : "images/cmake-logo.png"
bg_image : "images/banner.webp"
date: 2019-10-05T11:07:10+06:00
author: Sébastien Delpeuch
tags: ["Formations"]
---
<!-- Le latex la vie -->
<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

<!--------------------------------------------------------------------------------------------->
<!-- Permet d'afficher la barre de progression                                               -->
<div class="header">
  <div class="progress-container">
    <div class="progress-bar" id="myBar"></div>
  </div>
</div>


<div id="scroll_to_top">
    <a href="#top"><img src="/assets/images/fleche.jpg" alt="Retourner en haut" /></a>
</div>
<!--------------------------------------------------------------------------------------------->



Note avant lecture : Cette formation est une formation à CMake, elle permet de voir rapidement les différentes fonctionnalités de cet outil permettant de générer des règles de compilation facilement. Cependant il est bon (voir nécessaire) de savoir utiliser et construire un [Makefile](/assets/md/formation/learn_makefile) avant d'attaquer 

Formation retranscrite (et factorisée) depuis [cette page](https://florian-goujeon.developpez.com/cours/cmake/initiation/). A noter que Cmake ne dépend pas de la plateforme, il fonctionnera aussi bien sur Windows que sur Linux, sur Ubuntu, un `sudo apt install cmake` est suffisant pour avoir toutes les fonctionnalités. 

## <i class="fab fa-leanpub"></i> CMake

Cmake est un système de construction logicielle. C'est un logiciel libre, multilangage et multiplateforme. A partir du fichier descriptif du projet (nommé CMakeList.txt) et des informations sur la configuration logicielle de la machine effectuant la compilation (listées dans le fichier CMakeCache.txt, pré-rempli lors de la phase d'analyse de la configuration), CMake est capable de générer les types de fichiers suivants
+ un fichier Makefile
+ un fichier de projet d'EDI
+ ou une combinaison des deux (pour les EDI supportant les fichiers Makefile)

C'est le générateur qui permet de définir le type de fichier à générer. Il existe plusieurs générateurs pour les makefiles, ainsi qu'un générateur par EDI supporté 

![cmake](/assets/images/cmake.png)
{:class="images featured"}

## <i class="fab fa-leanpub"></i> Compilation d'un projet simple
La syntaxe d'un fichier Cmakelist.txt est on ne peut plus simple. Elle est exclusivement constituée d'appels de commandes. Les arguments à passer aux commandes sont placés entre parenthèses et sépares par des espaces ou des sautes de ligne. Les différents appels de commandes sont séparés de la même façon
```
nom de la commande(arg1 arg2 arg3)

nom d'une autre commande(
    arg1
    arg2
    arg3
)
```

### Un exemple simple 

``` 
#Déclaration du projet
project(Myproject)

#Déclaration de l'éxécutable
add_executable(
    my_executable
    src/navigation.hpp
    src/navigation.cpp
    src/world.hpp
    src/world.cpp
    ...
    src/main.hpp
    src/main.cpp
)
```

La commande `project()` est utilisée pour déclarer un projet 
+ Le premier est le nom que vous voulez donner à votre projet. Il s'agit entre autres du nom que portera le projet dans votre EDI
+ Cette commande prend également un second paramètre optionnel. Il s'agit du langage dans lequel le code du programme à compiler est écrit. Dans la majorité des cas, vous pouvez simplement ignorer cet argument, CMake étant capable de reconnaître lui-même le langage en analysant les sources

Nous devons ensuite définir nos cibles, c'est à dire l'ensemble des exécutables et des bibliothèques que nous voulons générer à partir du code source. Pour le moment nous ne souhaitons créer qu'un unique exécutable à partir de notre code source. Pour ce faire, nous écrivons la commande `add_executable()`.
+ Le premier paramètre est le nom de l'exécutable. Inutile de spécifier une éventuelle extension de fichier : rappelez vous que CMake est conçu pour être utilisé sous n'importe quel système d'exploitation. En outre, lorsqu'arrivera le moment de générer le fichier exécutable, il décidera lui-même des caractères à ajouter au nom que vous lui avez passé
+ Vous l'avez certainement deviné : les arguments suivants consitutent la liste des fichiers sources qui seront passés au comilateur. Remarquez toutefois la présence apparemment inopportune des fichiers d'en tête (*.h) au sein de cette liste. En effet on ne passe jamais directement un fichier d'en-tête à un compilateur. Ces fichiers ne sont lus qu'au moment de la résolution des directives d'inclusion (#include) par le préprocesseur. Par bonheur, CMake traite spécifiquement ces fichiers de façon à ce qu'ils n'apparaissent jamais dans une commande d'appel au compilateur. Vous n'avez donc pas à vous souciez de ce qui se passe sous le capot à ce niveau-là. La raison de l'inclusion est simple : vous voudrez certainement qu'ils soient présents parmi les fichiers sources du projet dans voutre EDI, afin de pouvoir les ouvrir et les idées rapidement. Par ailleurs, même si vous n'utilisez pas d'EDI pouvant gérer des projets, imaginez que cela pourrait être le cas de la personne qui reprendre votre code dans le futur.

### Lancement de CMake 
Notre fichier CMakeLists.txt est maintenant complet, lançons CMake sans plus attendre. Placez vous dans le dossier racine de votre projet et entrez une commande cmake de cette forme `cmake . -G "nom_du_generateur"`. Le premier paramètre désigne le répertoire où se site le fichier CMakeLists.txt du projet. Dans notre cas, il s'agit du dossier courant. L'option `-G` permet de définir le générateur (dans le cas d'Eirbot `Makefile`). Si tout se passe bien, la commande devrait retourner quelque chose comme ceci 
```
-- The C compiler identification is nom_de_votre_compilateur_C

-- The CXX compiler identification is nom_de_votre_compilateur_C++

-- Check for working C compiler : chemin_vers_votre_compilateur_C

-- Check for working C compiler : chemin_vers_votre_compilateur_C -- works

-- Detecting C compiler ABI info

-- Detecting C compiler ABI info - done

-- Check for working CXX compiler : chemin_vers_votre_compilateur_C++

-- Check for working CXX compiler : chemin_vers_votre_compilateur_C++ -- works

-- Detecting CXX compiler ABI info

-- Detecting CXX compiler ABI info - done

-- Configuring done

-- Generating done

-- Build files have been written to : adresse_du_dossier_de_votre_projet
```

CMake devrait avoir généré les fichiers suivants 
+ CMakeFiles : dossier contenant les fichiers intermédiaires de compilation, des fichiers temporaires et autres fichiers de configuration qui ne regardent que CMake 
+ CMakeCache.txt : fichier définissant un ensemble de variables de configuration et d'informations sur votre système
+ cmake_install.cmake : script CMake d'installation de votre programme 
+ Makefile 

Remarquez que votre dossier `src` reste inchangé. Aucun fichier d'aucune sorte n'y a été créé. C'est un des aspects qui explique pourquoi CMake est autant apprécié chez les maniaques du rangement. 

### Ajouter des options de compilation 
Que vous compiliez un exécutable ou une librairie, vous pouvez avoir besoin d'ajouter des flags de compilation/linkage à votre cible.

1. les flags de compilation :
+ les flags de compilation tels que les répertoires non-standards dans lesquels rechercher des headers : -I/chemin/vers/les/headers
+ les flags qui sont des options passées au compilateur, tels que les flags d'optimisation, les flags de diagnostic, les flags de debug, les flags pour le préprocesseur e.g. -O3 -Wall -Wno-pedantic -std=c++11 ...
2. les flags pour l'édition de lien :
+ les librairies avec lesquelles linker votre cible (e.g. -lmalib) ou les options passés à l'éditeur de liens (e.g. -Wl,--no-as-needed)Link options
+ les flags pour indiquer des répertoires : -L/chemin/vers/des/libs

Pour modifier ces différents flags, on peut utiliser les commandes cmake ci-dessous, appliquées à "macible" construite par add_executable ou add_library :
+ target_include_directories(macible PUBLIC /chemin/vers/les/headers;chemin2;chemin3)
Se réécrit dans la ligne de compilation en :`-I/chemin/vers/les/headers -Ichemin2 -Ichemin3`
+ `target_compile_options(macible PUBLIC -std=c++11 -Wall -Wno-pedantic)`
+ `target_link_libraries(macible -Wl,--allow-multiple-definition;/chemin/vers/libtruc.so)`

Pour voir le chemin de compilation/linkage utilisé à la compilation, vous pouvez invoquer make VERBOSE=true. Vous pouvez aussi inspecter et modifier les variables utilisées pour construire votre cible :
	
Notez que certaines options sont déjà passées par cmake lors de l'appel de certaines macros :
+ `set(CMAKE_BUILD_TYPE Release) -> -O3 -DNDEBUG`
+ `set(CMAKE_BUILD_TYPE Debug) -> -g`
+ `add_library(... SHARED ...) -> -shared`

## <i class="fab fa-leanpub"></i> Améliorations
### Génération automatique de la liste des fichiers source 
Au fur et à mesure que votre projet évolue, de nouvelles classes, de nouveaux fichiers sources apparaissent, tandis que d'autres disparaissent. Chaque modification de l'arborescence vous contraint à modifier le fichier CMakeLists.txt encore et encore. CMake possède toute la panoplie de commandes nécessaires à la résolution de ce type de désagréments. Pour ce cas, utilisons la commande `file()`

```
cmake_minimum_required(VERSION 2.6)

#Déclaration du projet 
project(MyProject)

#Génération de la liste des fichiers sources

file(

    GLOB_RECURSE
    source_files
    src/*
)

#Déclaration de l'éxécutable
add_executable(
    my_exe
    ${source_files}
)
```

`file()` est une commande pouvant effectuer un vas nombre d'opérations différentes. Le premier paramètre est le type d'opérations à exécuter. L'opération `GLOB` récupère une liste de fichiers à partir d'une expression. La variante `GLOB_RECURSE` cherche dans les sous-dossiers des dossiers spécifiés.  Le troisième paramètre est une expression à laquelle le chemin de chaque fichier doit correspondre pour que celui-ci soit ajouté à la liste `/src/*` désigne tous les fichiers situés dans le dossier `src`, ainsi que tous les fichiers situés dans chaque sous-dossier de `src` (spécificité de la variante `GLOB_RECURSE`). 

Le deuxième paramètre est la variable (ici `source_files`) dans laquelle la liste de fichiers est écrite. 

La suite est évidente : parmi les arguments de la commande `add_executable()`, en lieu et place de la liste de fichiers sources se trouve désormais la variable contenant la liste des fichiers récupérés par la commande `file()`. Comme vous le voyez, pour accéder à la valeur d'une variable, il faut entourer son nom d'accolades et faire précéder le tout pour le symbôle $.

L'utilisation de la commande `file()` nécessite de spécifier une version minimale de CMake.

### Modification du chemin de sortie de l'exécutable
Définissez le dossier où vos exécutables doivent être produits via la variable `EXECUTABLE_OUTPUT_PATH`. Optons pour un nouveau dossier nommé bin 
```
set(EXECUTABLE_OUTPUT_PATH bin)
```

Mieux encore : placez vos exécutables dans dossiers portant le nom du type de compilation (Release, Debug ...). Ce dernier est défini par la variable `CMAKE_BUILD_TYPE` (qui n'a d'effet seulement si le générateur choisi est basé sur Make)

```
cmake_minimum_required(VERSION 2.6)

#Configuration du projet
project(MyProject)
set(EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE})

#Génération de la liste des fichiers sources 
file(
    GLOB_RECURSE
    source_files
    src/*
)

#Déclaration de l'executable 
add_executable(
    my_exe
    ${source_files}
)
```

Ne vous inquiétez pas si aucun sous dossier n'est créé dans bin : la variable `CMAKE_BUILD_TYPE` doit être définie par vous même. Par défaut, cette variable est vide, dans ce cas, CMake crée un script de compilation en mode Debug. Avant de faire l'erreur de la définir directement dans le fichier CMakeLists.txt regardez la section qui suit

### Edition du fichier CMakeCache.txt 
Les fichiers sources et la documentation mis à part, CMakeLists.txt est le seul fichier que vous partagerez avec les autres collaborateurs du projet. Par conséquent, ce fichier doit décrire la construction du projet de façon totalement indépendante du système et du cas d'utilisation. En effet, les collaborateurs n'utiliseront pas tous le même système avec les mêmes paramètres, votre système lui même pourrait très bien évoluer au cours du projet. En bref **ne définissez rien** dans CMakeLists.txt qui puisse varier d'un ordinateur à l'autre ou d'un cas d'utilisation à l'autre. Voici quelques exemples d'informations qui ne doivent pas figurer dans le fichier
+ le chemin vers votre compilateur
+ le chemin vers une bibliothèque tierce 
+ les options de compilation propres au système 
+ le niveau de verbosité des scripts de compilation généres

Tous ces paramètre personnes doivent être définis ailleurs : dans le fichier CMakeCache.txt 

Un exemple typique : nous allons modifier le mode de compilation, caractérisé par la variable `CMAKe_BUILD_TYPE`. Ouvrez le fichier CMakeCache.txt et trouvez la ligne définissant cette variable. La ligne en question devrait être dans cet état 
```
CMAKE_BUILD_TYPE:STRING=
```
Optons pour une compilation en mode Release 
```
CMAKE_BUILD_TYPE:STRING=Release
```
Relancez la commande cmake et compilez. Si le niveau d'optimisation est élevé et que la macro NDEBUG est définie, alors l'opération est une succès. Remarquez que vous pouvez également modifier les variables définies par CMakeCache.txt directement via la commande cmake grâce à l'option `-D`. Voici la commande correspondant à la modification que nous venons d'effectuer. 

## <i class="fab fa-leanpub"></i> Compilation d'un projet utilisant une bibliothèque tierce 
Nous allons maintenant configurer la compilation d'un nouvel exécutable faisant usage d'une bibliothèque. Dans cet exemple, nous aimerions inclure l'une bibliothèque. L'unique fichier du projet `main.cpp` permet d'afficher "Hello World !" sur la sortie standard 

Noous débutons avec le CMakeLists.txt suivant
```cmake
cmake_minimum_required(VERSION 2.6)

                

#Configuration du projet

project(MyProject)

set(EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE})



#Configuration de l'exécutable

file(

        GLOB_RECURSE

        source_files

        src/*

)

add_executable(

        my_exe

        ${source_files}

)
```

Il y a deux méthodes pour inclure une bibliothèque avec CMake : la méthode manuelle et la méthode assistée. La méthode assistée est celle qui nécessiste le moins de travail de votre part. Toutefois, il n'est possible de l'utiliser qu'avec un nombre resteint de bibliothèques. C'est pourquoi nous allons passer en revue la méthode manuelle car elle peut s'appliquer à tous les cas, pour plus de précision sur la [méthode assistée](https://florian-goujeon.developpez.com/cours/cmake/initiation/#LIV-B). 

### Méthode manuelle 
De la même façon que lors d'une compilation en ligne de commande ou via un EDI, nous devons 
1. ajouter le répertoire des fichiers d'en-tête de la bibliothèque à la liste des repertoires parcourus par le préprocesseur lors de la recherche d'un fichier d'en tête externe 
2. ajoute le répertoire des fichiers de bibliothèques partagées de la bibliothèque à la liste des répertoires parcourus par l'éditeur de liens lors de la recherche d'une bibliothèque
3. lier le fichier de bibliothèque partagée de la bibliothèque à notre exécutable 

Pour remplir la première condition, nous utiliserons la commande `include_directories()`

``` cmake
include_directories(/chemin/vers/bib)
```
La commande `link_directories()` nous permettra de répondre à la deuxième condition 

``` cmake
link_directories(chemin/vers/bib/stage/lib)
```
Enfin la commande `target_link_librairies()`, qui sert à spécifier les différentes bibliothèques à lier à une cible (indiquée en premier argument), remplira la dernière

``` cmake
target_link_libraries(

        my_exe

        bib

)
```

Comme expliqué dans la section précédente, le fichier CMakelist.txt ne devrait pas comporter d'informations relatives à votre système. Utilisons donc des variables à la place des chemins et des noms de fichiers spécifiés. 

``` cmake
cmake_minimum_required(VERSION 2.6)



#Configuration du projet

project(MyProject)

set(EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE})



#Inclusion de Boost

include_directories(/chemin/vers/boost_x_xx_x)

link_directories(/chemin/vers/boost_x_xx_x/stage/lib)



#Configuration de l'exécutable

file(

        GLOB_RECURSE

        source_files

        src/*

)

add_executable(

        my_exe

        ${source_files}

)



#Configuration de l'édition de liens

target_link_libraries(

        my_exe

        boost_signals-mt

)cmake_minimum_required(VERSION 2.6)



#Configuration du projet

project(MyProject)

set(EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE})



#Inclusion de Boost

include_directories(${boost_include_dir})

link_directories(${boost_lib_dir})



#Configuration de l'exécutable

file(

        GLOB_RECURSE

        source_files

        src/*

)

add_executable(

        my_exe

        ${source_files}

)



#Configuration de l'édition de liens

target_link_libraries(

        my_exe

        ${boost_signals_lib_name}

)
```

Encore une fois définissez la valeur de ces variables dans le fichier CMakeCache.txt, ajoutez-y les lignes suivantes 

``` cmake
//Chemin vers le dossier des fichiers d'en-tête de Boost

boost_include_dir:FILEPATH=/chemin/vers/boost_x_xx_x



//Chemin vers le dossier des fichiers bibliothèques de Boost

boost_lib_dir:FILEPATH=/chemin/vers/boost_x_xx_x/stage/lib



//Nom du fichier de la bibliothèque Boost.Signals

boost_signals_lib_name:STRING=boost_signals-mt
```

##  <i class="fab fa-leanpub"></i> Compilation d'une bibliothèque 
Poursuivons notre mise en pratique avec la compilation d'une bibliothèque. Restons dans la simplicité et imaginons une bibliothèque permettant de dire bonjour dans la langue de votre choix. La bibliothèque sera dans le dossier `include` et contient les en-têtes publics dans un sous dossier portant le nom de la bibliothèque. Un CMakelists.txt permettant d'inclure cette bibliothèque est le suivant 
```
cmake_minimum_required(VERSION 2.6)



#Configuration du projet

project(Hello)

set(LIBRARY_OUTPUT_PATH lib/${CMAKE_BUILD_TYPE})



#Inclusion des en-têtes publics

include_directories(include)



#Configuration de la bibliothèque

file(

        GLOB_RECURSE

        source_files

        src/*

        include/*

)

add_library(

        hello

        SHARED

        ${source_files}

)
```

<!------------------>
<!-- END DOCUMENT -->
<!------------------>

<style>
/* Style the header: fixed position (always stay at the top) */
.header {
  position: fixed;
  top: 0;
  z-index: 1;
  width: 100%;
  background-color: #f1f1f1;
}

/* The progress container (grey background) */
.progress-container {
  width: 100%;
  height: 8px;
  background: #ccc;
}

/* The progress bar (scroll indicator) */
.progress-bar {
  height: 8px;
  background: #707070;
  width: 0%;
}

#scroll_to_top {
  position: fixed;
  width: 25px;
  height: 25px;
  bottom: 50px;
  right: 30px;
}
#scroll_to_top img {
  width: 25px;
}
</style>

<script>
// When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

function myFunction() {
  var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
  var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
  var scrolled = (winScroll / height) * 100;
  document.getElementById("myBar").style.width = scrolled + "%";
}
</script>
