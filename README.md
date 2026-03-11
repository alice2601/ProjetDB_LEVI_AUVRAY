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


<img width="1314" height="513" alt="image" src="https://github.com/user-attachments/assets/cd93ab7f-f77b-412b-af34-7334aebdfddf" />


PROMPT pour insertion des données : 
Donne les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant : 

Passager = (id_passager INT, civilte VARCHAR(50), nom VARCHAR(50), date_naissance INT, nationalite VARCHAR(50), email VARCHAR(50), telephone INT);
Billet = (numero_billet INT, date_emission_billet DATE, type_tarif INT, conditions_modification VARCHAR(50), conditions_remboursement LOGICAL, #id_passager);
Avion = (immatriculation INT, modele_avion VARCHAR(50), capacité_totale_sieges_avion INT);
Personnel = (matricul_personnel INT, qualification_principal VARCHAR(50));
Aeroport = (code_iata INT, ville VARCHAR(50), nom VARCHAR(50));
Réservation = (pnr INT, canal_reservation VARCHAR(50), date_heure_creation_reservation DATETIME, statut_reservation LOGICAL, #numero_billet);
Vol = (numero_vol INT, date_vol DATE, heure_depart_prevue TIME, heure_arrivee_prevue TIME, heure_depart_reelle TIME, heure_arrivee_reelle TIME, statu_vol VARCHAR(50), #code_iata, #immatriculation, #code_iata_1);
Bagage = (id_bagage INT, type_bagage VARCHAR(50), poids_bagage INT, statu_bagage VARCHAR(50), #(numero_vol, date_vol), #id_passager);
concerne = (#id_passager, #pnr);
affectation = (#(numero_vol, date_vol), #matricul_personnel, rolesurvol VARCHAR(50));
comprend = (#pnr, #(numero_vol, date_vol));
checkin = (#numero_billet, classe_cabine VARCHAR(50), statut_checkin VARCHAR(50), numero_carte_embarquement INT, numero_siege INT, #id_passager, #(numero_vol, date_vol));

 Les clés primaires correspondent aux id, sauf si autre chose est précisé (quand c'est un attribut composé) les clés étrangères sont identifiées par les #, et ont le même nom que les clés primaires auxquelles elles font référence. Met environ 50 lignes par tables si possible mais si de façon pertinente tu dois en mettre moins mets en moins ou plus. Les clés étrangères doivent faire référence aux clés primaires existantes : donne les lignes en commençant par remplir les tables dans lesquelles il n'y a pas de clés étrangères, puis les tables dans lesquelles les clés étrangères font références à des clés primaires des tables déjà remplies. Fournis l'ensemble sous la forme d’un script SQL prêt à être exécuté.
