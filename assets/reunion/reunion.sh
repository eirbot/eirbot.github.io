#
# @filename script.sh
# @date 2020-24-04
# @author Sébastien Delpeuch (Prez 2020-2021) sedelpeuch@enseirb-matmeca.fr
# @brief Script automatisant la création de rapport de réunion
#

EDITOR=emacs

#!/usr/bin/env bash
nbr_valeur=$#
the_date=$(date +"%A %d %B %Y")
version=$(ls -Al | wc -l)
let version=$version-2
declare -a point_compta=("24.09" "22.10" "26.11" "17.12" "28.01" "25.02" "25.03" "22.04")


usage()
{
    echo "Ceci est une fonction de construction de squelette pour C, tex ou shell
    elle prend en argument le NOM de votre fichier et le TYPE de votre fichier.
Les types possibles sont Latex, C et Shell"
}

main()
{
read -p 'Débuter la crétion du rapport ? (y/n):' etat
if [ $etat = "yes" ] || [ $etat = "y" ]; then
    echo ">> Début de la procédure de création"
    read -p "Qui est l'auteur du rapport ? (par défaut : Ptit Lu) :" author
    if [ ${#author} = 0 ]; then
        author='Ptit Lu'
    fi

    echo -e "Génération du rapport de réunion à la date du : \033[32m $the_date \033[0m"
    echo -e "Le rapport est le rapport numéro : \033[32m $version \033[0m"
    echo -e "L'autheur du rapport est : \033[32m $author \033[0m"
    md
    bilan
    publication
fi
}

bilan()
{
    for i in ${point_compta[*]}
    do
        reduce_date=$(date +"%d.%m")
        if [ $reduce_date = $i ]; then
            echo -e "Bureau pensez à effectuer le point comptable mensuel"
        fi

    done
}

publication ()
{
    echo ">> Début de la procédure de publication"
    read -p "Voulez vous visualiser le document avec de publier ? (y/n):" visu
    if [ $visu = "y" ]; then
        read -p "Vérifiez que le site est lancé en local : sudo bundle exec jekyll server -w --livereload (y/n)" local
        if [ $local = "y" ]; then
            firefox http://localhost:4000/assets/reunion/rapport$version &
        fi
    fi
    read -p "Voulez vous modifier le rapport ? (y/n):" modif
    if [ $modif = "y" ]; then
        $EDITOR rapport$version.md &
    fi

    message=$(echo -e "\033[31mEtes vous sur de vouloir procéder à la publication ? \033[0m")
    read -p "$message (y/n):" publi
    if [ $publi = "y" ]; then
        git add /assets/reunion/rapport$version.md
        git commit -m "Rapport de réunion du $the_date"
        git push origin master
        echo -e "\033[33mLien vers le rapport de réunion https://eirbot.github.io/assets/reunion/rapport$version \033[0m"
    fi



}

coupe()
{
    cat <<EOF >>rapport$version.md

<!-- Ici chaque semaine on fait un point sur l'avancement des robots pour la coupe, -->
<!-- on discute des différents points qui bloquent, on s'organise etc -->

## <i class="fas fa-trophy"></i> Coupe

### Table

### 1A

### 2A
EOF
}

formation()
{
    cat <<EOF >>rapport$version.md

<!-- On fait un point sur les différentes formations à faire, si vous avez besoin -->
<!-- d'un formation sur quelque chose, une idée de formation à dire, c'est maintenant -->
<!-- ! -->

## <i class="fab fa-leanpub"></i> Formation
EOF
}

projet_1A() { cat <<EOF >>rapport$version.md

<!-- L'idée n'est pas de vous fliquer, les projets 1A sont là pour vous faire -->
<!-- découvrir ce qu'on fait et ce qu'on utilise et pour vous faire kiffer. Parlez de -->
<!-- ce que bon vous semble, où vous en êtes, si vous voulez continuer, pourquoi vous -->
<!-- bloquez, si vous voulez plus d'aide etc -->

## <i class="fas fa-project-diagram"></i> Projets 1A

### Projet à mettre

### Projet à mettre

### Projet à mettre
EOF

}

raclette()
{
       cat <<EOF >>rapport$version.md

<!-- Organisation de la raclette traditionnelle de eirbot -->

## <i class="fas fa-cheese"></i> Raclette

EOF

}

noel()
{
       cat <<EOF >>rapport$version.md

<!-- C'est bientôt Noel ! Secret Santa, arbre de Noël ... -->

## <i class="fas fa-sleigh"></i> Noel

EOF

}

RDA()
{
       cat <<EOF >>rapport$version.md

<!-- Organisation du traditionnel repas des anciens de Eirbot -->

## <i class="fas fa-sleigh"></i> Repas des anciens

EOF

}

commande()
{
       cat <<EOF >>rapport$version.md

<!-- Point commande de l'asso. Nans elle sont où les commandes ! -->

## <i class="fas fa-boxes"></i> Commandes

EOF

}

question()
{
       cat <<EOF >>rapport$version.md
## <i class="fas fa-question"></i> Questions

### Question Président

### Question 3A

EOF

}

partenariat()
{
        cat <<EOF >>rapport$version.md

<!-- Petit points sur les relations entre Eirbot et les entreprises / l'école / les autres asso etc -->

## <i class="fas fa-handshake"></i> Partenariats

EOF
   
}

elsys()
{
           cat <<EOF >>rapport$version.md

<!-- Organisation du petit déjeuner et de la journée partenariat avec Elsys Design -->

## <i class="fas fa-handshake"></i> Partenariat Elsys

### Petit Dejeuner

### Autre

EOF

}

md()
{
    cat <<EOF >>rapport$version.md
---
layout: page
title: <i class="fas fa-users fa-2x"></i>  Rapport de réunion du $the_date
hide: true
---

<!------------------------------------------------------------------------------->
<!-- @filename rapport$version                                                        -->
<!-- @date $the_date                                              -->
<!-- @author $author                                                           -->
<!-- @brief Rapport de la réunion hebdomadaire de EIRBOT                       -->
<!------------------------------------------------------------------------------->


<!-- Le latex la vie -->
<script type="text/javascript" async
src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

EOF
    day=$(date +"%d")
    month=$(date +"%m")
    projet_1A
    coupe
    formation
    commande
    partenariat

    if [ "$day" -ge "01" ] && [ "$month" -ge "11" ] && [ "$day" -le "31" ] && [ "$month" -le "12" ]; then
        raclette
    fi

    if [ "$day" -ge "01" ] && [ "$month" -ge "12" ] && [ "$day" -le "31" ] && [ "$month" -le "12" ]; then
        noel
    fi

    if [ "$day" -ge "15" ] && [ "$month" -ge "10" ] && [ "$day" -le "31" ] && [ "$month" -le "11" ]; then
        RDA
    fi

    if [ "$day" -ge "15" ] && [ "$month" -ge "01" ] && [ "$day" -le "31" ] && [ "$month" -le "02" ]; then
        elsys
    fi

    question

    $EDITOR rapport$version.md
}
main
