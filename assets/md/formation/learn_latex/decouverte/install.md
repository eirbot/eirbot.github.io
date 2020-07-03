---
layout: page
title: <i class="fab fa-leanpub fa-2x"></i> Installer LaTex
hide: true
---
<!-- Le latex la vie -->
<script type="text/javascript" async
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

<div class="PageNavigation">
    <a class="prev" href="/assets/md/formation/learn_latex/latex">&laquo; Qu'est ce que Latex ? </a>
    <a class="next" href="/assets/md/formation/learn_latex/decouverte/first_doc"> Structurer son premier document &raquo;</a>
</div>

Cette section traite de façon détaillée de l'installation des logiciels permettant d'utiliser LaTeX sur votre machine. LaTeX étant libre, de nombreux environnements graphiques ont été développés, le choix est vaste et vous pourrez trouver des dizaines de méthodes et de logiciels permettant d'installer un éditeur LaTeX.

Des site en ligne permettent aussi l'édition LaTeX le plus connu [Overleaf](https://fr.overleaf.com/) vous permez de sauter cette partie si vous ne souhaitez pas faire du LaTeX sur votre machine. 

## L'installation typique

Une installation classique de LaTeX comporte trois éléments 
* Une distribution LaTeX : c'est elle qui va contenir le noyau Tex, cela va permettre de transformer votre code tapé dans l'éditeur en un document. 
* Un lecteur PDF ou PostScript, pour pouvoir lire et imprimer vos productions.
* Un éditeur LaTeX : c'est un logiciel vous permettant de taper votre texte (Emacs, TexMaker, VisualStudio, Bloc note etc).

## Installation sur Windows
Notre installation logicielle pour LaTeX sur windows se déroulera en trois temps.

### MikTeX, la distribution LaTeX
Tout d'abord nous allons installer MiKTeX, une des distributions LaTeX disponibles pour Windows. Pour l'installer, la procédure est plutot simple mais minutieuse. 
* créer un dossier appelé Latex sur votre disque, il servira à ranger la masse de fichiers que MiKTeX utilise pour son fonctionnement interne
* Allez sur le site de [MiKTeX](https://miktex.org/). Dans la colonne de gauche vous pourrez installer une version de MiKTeX, installer le dans votre dossier LaTeX
* Lancez le gestionnaire d'installation et suivez les instructions 
* Lorsque MiKTeX vous demande où vous voulez qu'il enregistre ses fichiers sélectionnez votre dossier LaTeX

### TexnicCenter, l'éditeur LaTeX

TeXnicCenter sera votre éditeur LaTeX, vous avez d’ailleurs pu voir une capture d'écran de ce programme dans le paragraphe traitant des logiciels nécessaires. Pour l'installer, il vous faudra d'abord aller le chercher sur le site officiel : [Télécharger TeXnicCenter](https://openclassrooms.com/fr/courses/1617396-redigez-des-documents-de-qualite-avec-latex/1617747-installer-latex#/id/r-1622466).

## Installation sur Linux 
Sur linux le paquet `texlive` est suffisant pour faire du $$\LaTeX$$.

<style>
.PageNavigation {
  font-size: 20px;
  width: auto;
  overflow: hidden;
}

.PageNavigation a {
  display: block;
  width: 50%;
  float: left;
  margin: 1em 0;
}

.PageNavigation .next {
  text-align: right;
}
</style>
