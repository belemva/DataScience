# DataScience
Tous mes notebooks Data Science sont réunis dans cette archive. 
Vous y trouverez l'ensemble de mes codes en Python ou R ayant servis à la résolution des problématiques auxquelles mon équipe et moi avons été confrontées. 
Chaque projet est situé sur une branche qui lui est dédiée. Il vous suffira donc de naviguer entre les branches pour avoir accès au projet souhaité. 
Merci de ne faire aucun push sur les branches.


Par ailleurs, pour des besoins spécifiques liés aux fonctions que nous exploitons, il vous ai fortement recommandé d'utiliser Jupyter Notebook (vous pouvez passer par google colab mais certaines libraires ne sont pas exploitables sur la plateforme ou ne sont plus adaptées aux applications déployées dans la présente archive).
Pour ce faire, installez, si ce n'est déjà fait, une machine virtuelle Ubuntu ou Linux (si vous êtes sur Windows, ouvrez une invite de commande en tapant 'cmd' dans la barre de recherche windows) et saisissez :

    wsl --install wsl 

WSL est interpréteur de commandes Linux développé pour Windows vous permettant, ainsi, de mettre en place un environnement de développement Ubuntu. Ensuite installez Python 3, dans un premier temps, en jouant la commande :
    
    sudo apt-get install python3
    
(la commande 'pip' devrait s'intaller au passage sinon exécutez "sudo apt-get install pip")

Dans un second temps, installez Jupyter en exécutant :

    pip install jupyter

A partir de là, vous pouvez lancer votre notebook en jouant, dans votreterminal ubuntu, la commande 

    jupyter notebook

Bien sûr, pour pouvoir effectuer les imports nécessaires au fonctionnement des applications, vous devrez, au préalable, installez les packages correspondants dans votre environnement de développement AVANT de lancer le notebook (sur google colab, la plupart des packages sont déjà disponibles).
    
