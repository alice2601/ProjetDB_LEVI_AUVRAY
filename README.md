# ProjetDB_LEVI_AUVRAY

Voici le promp que nous avons envoyés a l’IA générative.


Tu travailles dans le domaine de l’aviation. Ta compagnie aérienne a comme activité la gestion des vols reliant la France au reste du monde. C’est une compagnie aérienne comme Air-France. Tu as récolté les données des voyageurs sur les vols commerciaux ainsi que le personnel navigant. Inspire-toi du site d’air France suivant : https://wwws.airfrance.fr/?gclid=CjwKCAiAncvMBhBEEiwA9GU_fixZRYGIuFpV2EoveqlAsgv0qLglkJ53sjgUJDmNaF0HZKlCqHBcUhoCGbkQAvD_BwE&gclsrc=aw.ds
Ton organisation aérienne veut appliquer MERISE pour concevoir un système d'information concernant les passagers, les réservations, les billets, les vols, les avions, le personnel navigant, les paiements et les bagages.  Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données. 
D’abord, établis les règles de gestions des données de ta compagnie aérienne, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.
Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.
Fournis donc les règles de gestion et le dictionnaire de données.

Voici la résultats et les données obtenues de l'IA générative :

  Oui — voici **les mêmes livrables, mais sans toute la partie “paiement”** (ni règles, ni données).

## Règles de gestion (sans paiements)

* Chaque **passager** est identifié de manière unique et possède des informations d’état civil, de contact et éventuellement de document de voyage.
* Un passager peut effectuer **plusieurs réservations** au fil du temps.
* Une **réservation** peut regrouper **un ou plusieurs passagers** (ex. réservation famille/groupe).
* Une réservation a un **statut** (en option, confirmée, annulée, expirée…) et une **date/heure de création**.
* Une réservation est associée à **au moins un vol** et peut couvrir plusieurs vols (aller/retour, correspondances).
* Pour voyager, chaque passager doit disposer d’un **billet** lié à une réservation et à un ou plusieurs segments de vol.
* Un billet comporte un **numéro unique**, une **classe** (Eco/Premium/Business/First) et un **type de tarif** (Light/Standard/Flex…).
* Les billets portent des **conditions** (modifiabilité, remboursabilité, bagages inclus…) selon le tarif.
* Un **vol** est identifié (numéro de vol + date) et possède une origine, une destination, des horaires prévus et éventuellement des horaires réels.
* Un vol peut être **retardé**, **avancé**, **détourné** ou **annulé** ; l’état du vol doit être enregistré.
* Un vol est opéré par **un seul avion** à un instant donné ; un avion peut opérer plusieurs vols dans le temps.
* Un **avion** est caractérisé par son modèle, sa capacité (sièges) et son état d’exploitation.
* Pour chaque vol, on gère les **places disponibles** par cabine/classe et les **sièges attribués** aux passagers.
* L’**enregistrement (check-in)** d’un passager est lié à un vol et possède un statut (non fait, fait, refusé…).
* Une **carte d’embarquement** est émise après check-in et est liée au billet/au segment et au siège.
* Le **personnel navigant** est identifié et possède des informations RH (matricule, rôle, qualifications).
* Un membre d’équipage peut être affecté à plusieurs vols, mais **pas sur des vols qui se chevauchent**.
* Sur un vol donné, on enregistre la **liste d’équipage** avec le rôle tenu (commandant, copilote, chef de cabine, PNC…).
* Les **qualifications** (type avion, habilitations, langues…) conditionnent l’affectation du personnel sur un vol.
* Les **bagages** sont rattachés à un passager et à un vol (ou au voyage) et sont identifiés par une **étiquette bagage** unique.
* Un bagage a un **type** (cabine/soute/spécial), un **poids**, et un **statut de suivi** (enregistré, chargé, livré, manquant…).
* Les **franchises bagages** dépendent de la classe, du tarif et du statut fidélité ; les excédents sont simplement **signalés** (sans gérer le paiement).
* Les données conservent un **minimum d’historique** : création/modification et canal (web/app/agence/comptoir).

---

## Dictionnaire de données brutes (sans paiements) — 30 données

| Signification de la donnée                          |           Type | Taille (car./chiffres) |
| --------------------------------------------------- | -------------: | ---------------------: |
| Identifiant passager (client)                       | Alphanumérique |                     12 |
| Civilité (M., Mme, etc.)                            | Alphanumérique |                      4 |
| Nom du passager                                     | Alphanumérique |                     50 |
| Prénom du passager                                  | Alphanumérique |                     50 |
| Date de naissance                                   |           Date |                     10 |
| Nationalité                                         | Alphanumérique |                     30 |
| Email passager                                      | Alphanumérique |                     80 |
| Téléphone passager (format international)           | Alphanumérique |                     20 |
| Numéro de document (passeport/CI)                   | Alphanumérique |                     20 |
| Type de document (passeport/CI/titre séjour)        | Alphanumérique |                     15 |
| Date d’expiration du document                       |           Date |                     10 |
| Identifiant réservation (PNR)                       | Alphanumérique |                      6 |
| Canal de réservation (web, agence, comptoir, appli) | Alphanumérique |                     15 |
| Date/heure création réservation                     |      DateHeure |                     19 |
| Statut réservation                                  | Alphanumérique |                     12 |
| Nombre de passagers dans la réservation             |      Numérique |                      2 |
| Numéro de billet (e-ticket)                         | Alphanumérique |                     13 |
| Date d’émission du billet                           |           Date |                     10 |
| Classe cabine                                       | Alphanumérique |                     10 |
| Type de tarif (Light/Standard/Flex)                 | Alphanumérique |                     15 |
| Conditions de modification                          | Alphanumérique |                     15 |
| Conditions de remboursement                         | Alphanumérique |                     15 |
| Numéro de vol commercial (ex. AF1234)               | Alphanumérique |                      8 |
| Date du vol                                         |           Date |                     10 |
| Aéroport origine (code IATA)                        | Alphanumérique |                      3 |
| Aéroport destination (code IATA)                    | Alphanumérique |                      3 |
| Heure départ prévue                                 |          Heure |                      5 |
| Heure arrivée prévue                                |          Heure |                      5 |
| Statut du vol (prévu, retardé, annulé…)             | Alphanumérique |                     12 |
| Heure départ réelle                                 |          Heure |                      5 |
| Heure arrivée réelle                                |          Heure |                      5 |
| Immatriculation avion                               | Alphanumérique |                     10 |
| Modèle avion                                        | Alphanumérique |                     20 |
| Capacité totale sièges avion                        |      Numérique |                      3 |
| Siège attribué (ex. 12A)                            | Alphanumérique |                      4 |
| Statut check-in                                     | Alphanumérique |                     12 |
| Numéro carte d’embarquement                         | Alphanumérique |                     18 |
| Statut embarquement (non embarqué/embarqué/refusé)  | Alphanumérique |                     12 |
| Identifiant personnel navigant (matricule)          | Alphanumérique |                     10 |
| Rôle équipage (commandant, copilote, PNC…)          | Alphanumérique |                     20 |
| Qualification principale (type avion/habilitation)  | Alphanumérique |                     30 |
| Identifiant bagage (étiquette)                      | Alphanumérique |                     12 |
| Type bagage (cabine/soute/spécial)                  | Alphanumérique |                     10 |
| Poids bagage (kg)                                   |        Décimal |           5 (ex. 99.9) |
| Statut bagage (enregistré, chargé, livré…)          | Alphanumérique |                     12 |
| Nombre de bagages inclus (franchise)                |      Numérique |                      2 |
| Poids total autorisé (kg)                           |      Numérique |                      3 |

Si tu veux, je peux aussi te donner une **liste d’événements/états** (ex. “réservation expirée”, “vol détourné”, “bagage manquant”) pour aider l’étudiant à prévoir les statuts dans le MCD.


