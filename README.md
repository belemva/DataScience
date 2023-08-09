# Box Packing
Toujours dans le cadre des projets lancés par PSA, il a été demandé de développer une solution permettant le classement de différents types de colis au sein de container. 

La problématique est la suivante : nous sommes dans un entrepôt et recevons plusieurs bons de commandes. Sur chaque bon, il est fait référence du nombre de colis demandés, les références des colis (ici on parlera de l'identifiant du colis) ainsi que les caractéristiques de ceux-ci (taille, poids, fragilité...). A partir des informations transmises dans chaque bon de commande, nous devons donc sélectionner le container adéquat pour chaque commande et optimiser le rangement des colis dans ceux-ci afin de :

1 - limiter le nombre de container exploité pour le transport de la marchandise 
2 - éviter au maximum les zones "vides" dans le container (des zones où d'autres colis pourraient être stockés) => donc bien choisir son container et le placement des colis
3 - globalement mieux anticiper les dépenses à prévoir pour le chargement des paquets 

Dans notre cas, nous considérerons que les colis les plus légers sont les plus fragiles et donc ceux qui doivent être placés les plus au-dessus du container (en derniers).

De façon à ce que ce soit plus visuel, nous avons donc opter pour une génération d'aperçus 3D avec interaction permettant d'observer le placement des différents colis ausein d'un container dont les dimensions sont à définir par l'utilisateur. Ainsi, l'utilisateur charge le fichier de donnée contenant les caractéristiques de ces colis, ensuite il saisit les dimensions du container souhaité (poids, longueur, largeur, hauteur, induisant donc le volume du container) et génère l'aperçu du rangement du container. Libre à l'utilisateur, de ce fait, de modifier les paramètres de son container en fonction de ces observations.

Nous avons donc choisi 2 approches : une approche en R et une approche en Python.
