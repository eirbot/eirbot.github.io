---
title: Présentation de la carte Nucléo
---

Les équipes 1A de 2018 et 2019 ont travaillé sur la carte Nucléo F429ZI.

# Présentation de la carte

La NUCLEO-F767ZI est une carte semblable à une carte Arduino. Cependant, elle
est plus puissante (elle supporte des fréquences plus élevées).

# L'environnement de programmation

## MBED

[Mbed](https://www.mbed.com/en/platform/mbed-os/) est une librairie gratuite et open source conçue pour l'IoT.

Elle est prévue pour fonctionner sur les processeurs Arm.

## Platformio

### Présentation

[Platformio](https://platformio.org/) est un écosystème open source pour le développement en IoT. 
En particulier, c'est lui qui gère la compilation et l'upload du code sur la carte. 
Il supporte plus de 566 cartes et en particulier Arduino et notre Nucléo.
Platformio possède un [documentation en ligne très complète](https://docs.platformio.org/en/latest/).

### Installation pour votre IDE

Pour installer Platformio, il suffit de suivre la [procédure](https://platformio.org/platformio-ide).

Atom et VSCode sont particulièrement bien supporté, mais platformio est
également disponible pour Emacs, Sublime Text, Vim, Visual Studio, CodeBlocks et
d'autres.
Sinon, platformio existe aussi en ligne de commande (il faut pour cela installer
Platformio Core (déjà installé si vous suivez la procédure pour Atom ou VSCode)).

## Création d'un projet Platformio

Avec VSCode, il suffit de suivre le [tutoriel](https://docs.platformio.org/en/latest/ide/vscode.html#setting-up-the-project).
Avec Atom, il y a également un [tutoriel](https://docs.platformio.org/en/latest/ide/atom.html#setting-up-the-project).

Sinon, vous pouvez suivre [ce lien](https://docs.platformio.org/en/latest/quickstart.html).

# Les liens utiles

## Les ressources pour comprendre la carte

* [Page officielle MBED](https://os.mbed.com/platforms/ST-Nucleo-F429ZI/) : 
  Liste des pins, etc.
* [API MBED](https://os.mbed.com/users/mbed_official/code/mbed-dev/docs/tip/) :
  La liste des fonction disponible en utilisant mbed.

## Les liens des dépots Github des différentes année

### 2018
    [Coupe de france 1A](https://github.com/eirbot/eirbot2018-1A)
### 2016
    [Coupe de france 1A](https://github.com/eirbot/eirbot2016-1A)
    [Coupe de france 2A](https://github.com/eirbot/eirbot2016-2A-commande)
### 2015
    [Coupe de france 2A](https://github.com/eirbot/eirbot2015-2A)
    
Les autres peuvent être trouvés sur le [Github d'Eirbot](https://github.com/eirbot).
    
# Le code

## Workflow simple

Pour mettre du code sur la carte, le workflow est simple :

  1. Compilation du code
  2. Upload du code sur la carte
  
Le code s'exécute automatiquement après.

## Faire clignoter une led

Le fichier principal se trouve dans le dossier `src/`.

Pour faire clignoter une led, il suffit de lancer ce code :

```
#include "mbed.h"

DigitalOut led(LED1);

int main(int argc, char* argv[])
{

  while (1) {
    led = 1;
    wait(1);
    led = 0;
    wait(0); 
  }

  return 0;
}
```

## Génerer une PWM

Pour générer une PWM sur un pin particulier :

> Attention, il faut que le pin choisi support le mode PWM,
> allez voir [la doc](https://os.mbed.com/platforms/ST-Nucleo-F429ZI/).

```
#include "mbed.h"

PWM led(LED1);

int main(int argc, char* argv[])
{
  led = 0.3; // PWM sur la led à 30%
  return 0;
}
```

## Initialiser une liaison série

Attention à bien avoir les bon baudrate. Sur vs-code, la liaison sérial
(monitor) est par défault de 9600 Baud.

```
#include "mbed.h"

Serial usb(USBTX, USBRX); // Pour une liaison sérial sur l'USB

int main(int argc, char* argv[])
{

  usb.baud(9600);

  while (1) {
    led = 1;
    usb.printf("Led allumée\r\n");
    wait(1);
    led = 0;
    usb.printf("Led éteinte\r\n");
    wait(0); 
  }

}
```

# Erreurs

## La led1 (la verte) clignote

Il est probable que les branchement d'un module sérial soient inversés ou mal
branchés.

> Essayez d'inverser les connecteurs sur la carte, ou inversez les pins choisis
> lors de l'initialisation du serial.

Exemple : remplacez `Serial usb(USBRX, USBTX)` par `Serial usb(USBTX, USBRX)`.
