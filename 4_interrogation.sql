/* =========================================================
   1) PROJECTIONS / SELECTIONS
   ========================================================= */

/* Q1 - Afficher la liste des vols arrivés, triés par date puis heure de départ prévue. */
SELECT numero_vol, date_vol, heure_depart_prevue, heure_arrivee_prevue, statu_vol
FROM Vol
WHERE statu_vol = 'arrivé'
ORDER BY date_vol, heure_depart_prevue;

/* Q2 - Afficher les différents canaux de réservation utilisés par les clients. */
SELECT canal_reservation
FROM Réservation
ORDER BY canal_reservation;

/* Q3 - Rechercher les passagers dont qui utilisent Gmail */
SELECT id_passager, nom, email
FROM Passager
WHERE email LIKE '%@mail.com'
ORDER BY nom;

/* Q4 - Afficher les billets de type tarif 1 ou 2. */
SELECT numero_billet, type_tarif, conditions_modification, conditions_remboursement
FROM Billet
WHERE type_tarif IN (1, 2)
ORDER BY numero_billet;

/* Q5 - Afficher les bagages dont le poids est compris entre 20 et 30 kg. */
SELECT id_bagage, id_passager, poids_bagage, type_bagage
FROM Bagage
WHERE poids_bagage BETWEEN 20 AND 30
ORDER BY poids_bagage DESC;


/* =========================================================
   2) AGREGATIONS + GROUP BY + HAVING (au moins 5)
   ========================================================= */

/* Q6 - Compter le nombre de passagers par vol. */
SELECT c.numero_vol, c.date_vol, COUNT(*) AS nb_passagers
FROM comprend c
GROUP BY c.numero_vol, c.date_vol
ORDER BY nb_passagers DESC, c.numero_vol;

/* Q7 - Calculer le poids moyen des bagages par vol pour les vols dont la moyenne dépasse 15 kg. */
SELECT b.numero_vol, b.date_vol, AVG(b.poids_bagage) AS poids_moyen_bagages
FROM Bagage b
GROUP BY b.numero_vol, b.date_vol
HAVING AVG(b.poids_bagage) > 15
ORDER BY poids_moyen_bagages DESC;

/* Q8 - Compter le nombre de réservations par canal, en gardant uniquement les canaux ayant au moins 2 réservations. */
SELECT canal_reservation, COUNT(*) AS nb_reservations
FROM Réservation
GROUP BY canal_reservation
HAVING COUNT(*) >= 2
ORDER BY nb_reservations DESC;

/* Q9 - Compter le nombre de bagages par type, en gardant uniquement les types présents au moins 2 fois. */
SELECT type_bagage, COUNT(*) AS nb_bagages
FROM Bagage
GROUP BY type_bagage
HAVING COUNT(*) >= 2
ORDER BY nb_bagages DESC;

/* Q10 - Compter le nombre de membres du personnel affectés à chaque vol, en gardant uniquement les vols ayant au moins 2 personnes affectées. */
SELECT a.numero_vol, a.date_vol, COUNT(*) AS nb_personnel
FROM affectation a
GROUP BY a.numero_vol, a.date_vol
HAVING COUNT(*) >= 2
ORDER BY nb_personnel DESC, a.numero_vol;


/* =========================================================
   3) JOINTURES (au moins 5)
   ========================================================= */

/* Q11 - Associer chaque passager à son billet. */
SELECT p.id_passager, p.nom, b.numero_billet, b.date_emission_billet
FROM Passager p
INNER JOIN Billet b ON p.id_passager = b.id_passager
ORDER BY p.id_passager;

/* Q12 - Afficher chaque vol avec son aéroport de départ, son aéroport d'arrivée et l'avion utilisé. */
SELECT v.numero_vol,
       v.date_vol,
       ad.nom AS aeroport_depart,
       aa.nom AS aeroport_arrivee,
       av.modele_avion
FROM Vol v
INNER JOIN Aeroport ad ON v.code_iata = ad.code_iata
INNER JOIN Aeroport aa ON v.code_iata_1 = aa.code_iata
INNER JOIN Avion av ON v.immatriculation = av.immatriculation
ORDER BY v.numero_vol;

/* Q13 - Afficher les check-in réalisés avec le passager concerné et le vol associé. */
SELECT p.nom,
       c.numero_billet,
       c.numero_carte_embarquement,
       c.numero_siege,
       c.numero_vol,
       c.date_vol
FROM checkin c
INNER JOIN Passager p ON c.id_passager = p.id_passager
INNER JOIN Vol v ON c.numero_vol = v.numero_vol AND c.date_vol = v.date_vol
ORDER BY c.numero_vol, c.numero_siege;

/* Q14 - Afficher tous les passagers et leurs bagages éventuels (jointure externe gauche). */
SELECT p.id_passager,
       p.nom,
       b.id_bagage,
       b.type_bagage,
       b.poids_bagage
FROM Passager p
LEFT JOIN Bagage b ON p.id_passager = b.id_passager
ORDER BY p.id_passager, b.id_bagage;

/* Q15 - Afficher tous les vols et le personnel éventuellement affecté dessus (jointure externe gauche). */
SELECT v.numero_vol,
       v.date_vol,
       per.matricul_personnel,
       per.qualification_principal,
       a.rolesurvol
FROM Vol v
LEFT JOIN affectation a ON v.numero_vol = a.numero_vol AND v.date_vol = a.date_vol
LEFT JOIN Personnel per ON a.matricul_personnel = per.matricul_personnel
ORDER BY v.numero_vol, per.matricul_personnel;


/* =========================================================
   4) REQUETES IMBRIQUEES (au moins 5)
   ========================================================= */

/* Q16 - Trouver les passagers qui n'ont enregistré aucun bagage (NOT IN). */
SELECT p.id_passager, p.nom
FROM Passager p
WHERE p.id_passager NOT IN (
    SELECT b.id_passager
    FROM Bagage b
)
ORDER BY p.id_passager;

/* Q17 - Trouver les vols pour lesquels aucun personnel n'est affecté (NOT EXISTS). */
SELECT v.numero_vol, v.date_vol
FROM Vol v
WHERE NOT EXISTS (
    SELECT 1
    FROM affectation a
    WHERE a.numero_vol = v.numero_vol
      AND a.date_vol = v.date_vol
)
ORDER BY v.numero_vol;

/* Q18 - Trouver les passagers ayant un billet avec un type de tarif supérieur à ANY des billets non remboursables. */
SELECT p.id_passager, p.nom, b.type_tarif
FROM Passager p
INNER JOIN Billet b ON p.id_passager = b.id_passager
WHERE b.type_tarif > ANY (
    SELECT b2.type_tarif
    FROM Billet b2
    WHERE b2.conditions_remboursement = FALSE
)
ORDER BY b.type_tarif DESC, p.id_passager;

/* Q19 - Trouver le ou les vols ayant le plus grand nombre de passagers (ALL). */
SELECT c.numero_vol, c.date_vol, COUNT(*) AS nb_passagers
FROM comprend c
GROUP BY c.numero_vol, c.date_vol
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM comprend c2
    GROUP BY c2.numero_vol, c2.date_vol
)
ORDER BY c.numero_vol;

/* Q20 - Trouver les passagers ayant effectué leur check-in pour un vol à destination de New York (EXISTS). */
SELECT p.id_passager, p.nom
FROM Passager p
WHERE EXISTS (
    SELECT 1
    FROM checkin c
    INNER JOIN Vol v ON c.numero_vol = v.numero_vol AND c.date_vol = v.date_vol
    INNER JOIN Aeroport a ON v.code_iata_1 = a.code_iata
    WHERE c.id_passager = p.id_passager
      AND a.ville = 'New York'
)
ORDER BY p.id_passager;
