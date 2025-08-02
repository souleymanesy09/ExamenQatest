Mon Projet - Travaux Pratiques
Ce dépôt contient mes travaux pratiques réalisés dans le cadre du cours [Nom du cours : par exemple, QA et Automatisation des Tests]. Ci-dessous, je présente les détails des différents labos réalisés ainsi que des informations concernant les difficultés rencontrées lors de la réalisation du Labo 3.

Labo 1 - Tests d'API sur Base de Données MongoDB
Description : Le Labo 1 portait sur l'automatisation des tests d'API pour une base de données MongoDB. En se basant sur le concept de CRUD (Create, Read, Update, Delete) et sur le schéma d'une API de e-commerce, l'objectif était de valider les fonctionnalités de gestion des données.

Objectifs :

Implémenter des tests automatisés avec Robot Framework pour chaque opération CRUD (Create, Read, Update, Delete).

Couvrir un scénario passant pour chaque opération, c'est-à-dire le bon déroulement de l'action.

Couvrir au moins un scénario non passant pour chaque opération, par exemple en tentant de lire un élément inexistant ou de supprimer un élément avec un identifiant invalide.

Résultats : Les tests du Labo 1 ont permis de valider que l'API et la base de données gèrent correctement la création, la lecture, la mise à jour et la suppression des entités, tout en retournant les codes d'erreur appropriés pour les cas non passants.

Conclusion : Ce labo a permis de se familiariser avec l'automatisation des tests au niveau de la couche API, une pratique essentielle pour garantir la robustesse et la sécurité d'une application avant même l'interface utilisateur.

Labo 2 - Tests Fonctionnels UI avec Robot Framework
Description : Le Labo 2 a consisté à implémenter une suite de tests fonctionnels pour l'application Web CRM, en se basant sur un cahier de tests existant. L'objectif était de mettre en place de bonnes pratiques d'automatisation en utilisant Robot Framework et SeleniumLibrary.

Objectifs :

Automatiser les scénarios de test pour la fonctionnalité de connexion (succès, échec, "se souvenir de moi").

Automatiser les scénarios de test pour la gestion des clients (affichage du tableau, ajout de nouveau client, annulation de l'ajout).

Appliquer une structure de projet modulaire (Page Object Model) pour la maintenabilité et la réutilisation du code.

Résultats : Les tests ont été implémentés avec succès et sont désormais passants. Un travail important a été réalisé pour identifier et corriger les sélecteurs (locators) d'éléments, ainsi que pour ajuster les mots-clés pour s'adapter aux comportements de l'application (par exemple, la gestion des redirections d'URL).

Conclusion : Ce labo a renforcé la compréhension de l'automatisation de l'interface utilisateur, des bonnes pratiques de structuration de projet, et de l'importance du débogage pour créer des tests fiables.

Labo 3 - Tests d'APIs REST - Intégration avec eBay
Description : Le Labo 3 était supposé consister en l'automatisation des tests pour l'API Fulfillment d'eBay, en utilisant la RequestsLibrary de Robot Framework pour valider les opérations getOrder, getOrders et issueRefund.

Difficultés rencontrées : Malheureusement, j'ai rencontré un problème bloquant qui m'a empêché de commencer et de terminer ce travail. La principale difficulté résidait dans l'authentification à l'API eBay, qui nécessite un jeton d'accès OAuth 2.0.

État actuel : Le Labo 3 n'a pas été achevé. J'ai pu préparer la structure de base du fichier de test et importer les bibliothèques nécessaires, mais sans un jeton d'authentification valide, il n'était pas possible d'envoyer des requêtes à l'API et de valider les scénarios.

Solutions envisagées : Pour progresser, il aurait été nécessaire d'obtenir un jeton d'accès de développement pour l'environnement sandbox d'eBay ou d'adapter les tests pour simuler les réponses de l'API.

Labo 4 - Tests Mobile

Objectifs :

Objectif 1: Se connecter

Objectif 2 : creation et affichage d'un produit


Conclusion Générale
Ce projet représente l'aboutissement des Labos 1, 2, et 4. Le Labo 3 reste en suspens à cause des difficultés d'authentification rencontrées, mais la démarche et la compréhension des tests d'API ont été étudiées.

Remerciements
Je tiens à remercier [mentionner des personnes, des ressources, etc.] pour leur aide et leur soutien dans la réalisation de ce projet.
