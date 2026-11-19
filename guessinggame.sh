#!/bin/bash

function compter_fichiers {
    ls | wc -l
}

nb_fichiers=$(compter_fichiers)
reponse=-1

echo "Bienvenue dans le jeu de devinettes !"
echo "Combien de fichiers y a-t-il dans le répertoire actuel ?"

while [[ $reponse -ne $nb_fichiers ]]
do
    read -p "Entrez votre estimation : " reponse
    if ! [[ $reponse =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre entier."
        reponse=-1
    elif [[ $reponse -lt $nb_fichiers ]]
    then
        echo "Trop bas ! Essayez encore."
    elif [[ $reponse -gt $nb_fichiers ]]
    then
        echo "Trop haut ! Essayez encore."
    else
        echo "Bravo, vous avez trouvé !"
    fi
done