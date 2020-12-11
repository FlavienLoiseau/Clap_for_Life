# Accès à la plateforme

## 1. Via heroku, en production

https://clap-for-life.herokuapp.com/

## 2. Via github, en local

https://github.com/FlavienLoiseau/Clap_for_Life

Suivre les étapes :
* git clone https://github.com/FlavienLoiseau/Clap_for_Life.git
* cd Clap_for_Life
* bundle install
* rails db:create db:migrate db:seed
* rails s

# Clap for Life, qu'est ce que c'est ?

## 1. Présentation

Te sens-tu capable de citer plus de 10 associations caritatives françaises ? Probablement pas. Et pourtant, tu as certainement en toi cette volonté de mettre davantage ton énergie au service de causes qui te sont chères.

L’ambition de Clap for Life, c’est de rapprocher le monde associatif et les bénévoles.
* aider les associations à grandir en leur apportant bénévoles et dons
* aider les bénévoles à trouver l’association qui leur convient

Contribue à construire un monde meilleur !

## 2. Parcours utilisateur

Dès leur arrivée sur la page d’accueil de la plateforme, les utilisateurs peuvent rechercher l’association qui leur convient le mieux, grâce à divers filtres (thème de l’association, emplacement géographique, transparence financière, etc.). Les résultats sont affichés sous forme de liste.

Lorsque l’utilisateur clique sur une association, il accède à sa page de profil (description). Deux onglets supplémentaires lui permettent de contribuer financièrement à l’association, ou bien de s’inscrire sur une mission en tant que bénévole.

Les utilisateurs ont également la possibilité de s’inscrire ou de se connecter à leur espace personnel
* si l’utilisateur est une association, il pourra : éditer sa page de profil, suivre le cumul de ses dons perçus, proposer de nouvelles missions, suivre ses missions existantes, entrer en contact avec les bénévoles inscrits.
* si l’utilisateur est un bénévole, il pourra : éditer ses informations personnelles, suivre le cumul de ses dons émis, suivre les missions sur lesquelles il s’est inscrit, entrer en contact avec les associations
