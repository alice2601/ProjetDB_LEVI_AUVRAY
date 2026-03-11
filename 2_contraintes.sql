
ALTER TABLE Passager
ADD CONSTRAINT passager_email_unique UNIQUE (email);

ALTER TABLE Passager
ADD CONSTRAINT passager_telephone_unique UNIQUE (telephone);

ALTER TABLE Passager
ADD CONSTRAINT passager_nom_not_empty
CHECK (nom <> '');

ALTER TABLE Passager
ADD CONSTRAINT passager_naissance_check
CHECK (date_naissance > 1900);


ALTER TABLE Passager
ADD CONSTRAINT passager_civilite_check
CHECK (civilte IN ('M','Mme','Mlle'));

ALTER TABLE Avion
ADD CONSTRAINT avion_capacité_check
CHECK (capacité_totale_sieges_avion >0);

ALTER TABLE Avion
ADD CONSTRAINT avion_capacite_max
CHECK (capacité_totale_sieges_avion <= 900);

ALTER TABLE Bagage
ADD CONSTRAINT bagage_poids_check
CHECK (poids_bagage >= 0);

ALTER TABLE Bagage
ADD CONSTRAINT poids_max_bagage
CHECK (poids_bagage <= 32);

ALTER TABLE Personnel
ADD CONSTRAINT qualification_not_null
CHECK (qualification_principal <> '');

ALTER TABLE checkin
ADD CONSTRAINT cabine_check
CHECK (classe_cabine IN ('Eco','Business','First'));

ALTER TABLE checkin
ADD CONSTRAINT carte_embarquement_unique
UNIQUE (numero_carte_embarquement);

ALTER TABLE checkin
ADD CONSTRAINT siege_valide
CHECK (numero_siege > 0);

ALTER TABLE Billet
ADD CONSTRAINT billet_date_check
CHECK (date_emission_billet <= CURRENT_DATE);

ALTER TABLE Vol
ADD CONSTRAINT heure_vol_check
CHECK (heure_arrivee_prevue > heure_depart_prevue);

ALTER TABLE Vol
ADD CONSTRAINT aeroport_different
CHECK (code_iata <> code_iata_1);

ALTER TABLE Vol
ADD CONSTRAINT heure_arrivee_check
CHECK (heure_arrivee_prevue > heure_depart_prevue);

ALTER TABLE Réservation
ADD CONSTRAINT statut_reservation_check
CHECK (statut_reservation IN (TRUE, FALSE));



