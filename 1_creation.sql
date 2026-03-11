CREATE TABLE Passager(
   id_passager INT,
   civilte VARCHAR(50),
   nom VARCHAR(50),
   date_naissance INT,
   nationalite VARCHAR(50),
   email VARCHAR(50),
   telephone INT,
   PRIMARY KEY(id_passager)
);

CREATE TABLE Billet(
   numero_billet INT,
   date_emission_billet DATE,
   type_tarif INT,
   conditions_modification VARCHAR(50),
   conditions_remboursement boolean,
   id_passager INT NOT NULL,
   PRIMARY KEY(numero_billet),
   FOREIGN KEY(id_passager) REFERENCES Passager(id_passager)
);

CREATE TABLE Avion(
   immatriculation INT,
   modele_avion VARCHAR(50),
   capacité_totale_sieges_avion INT,
   PRIMARY KEY(immatriculation)
);

CREATE TABLE Personnel(
   matricul_personnel INT,
   qualification_principal VARCHAR(50),
   PRIMARY KEY(matricul_personnel)
);

CREATE TABLE Aeroport(
   code_iata INT,
   ville VARCHAR(50),
   nom VARCHAR(50),
   PRIMARY KEY(code_iata)
);

CREATE TABLE Réservation(
   pnr INT,
   canal_reservation VARCHAR(50),
   date_heure_creation_reservation DATETIME,
   statut_reservation BOOLEAN,
   numero_billet INT NOT NULL,
   PRIMARY KEY(pnr),
   FOREIGN KEY(numero_billet) REFERENCES Billet(numero_billet)
);

CREATE TABLE Vol(
   numero_vol INT,
   date_vol DATE,
   heure_depart_prevue TIME,
   heure_arrivee_prevue TIME,
   heure_depart_reelle TIME,
   heure_arrivee_reelle TIME,
   statu_vol VARCHAR(50),
   code_iata INT NOT NULL,
   immatriculation INT NOT NULL,
   code_iata_1 INT NOT NULL,
   PRIMARY KEY(numero_vol, date_vol),
   FOREIGN KEY(code_iata) REFERENCES Aeroport(code_iata),
   FOREIGN KEY(immatriculation) REFERENCES Avion(immatriculation),
   FOREIGN KEY(code_iata_1) REFERENCES Aeroport(code_iata)
);

CREATE TABLE Bagage(
   id_bagage INT,
   type_bagage VARCHAR(50) NOT NULL,
   poids_bagage INT,
   statu_bagage VARCHAR(50),
   numero_vol INT NOT NULL,
   date_vol DATE NOT NULL,
   id_passager INT NOT NULL,
   PRIMARY KEY(id_bagage),
   FOREIGN KEY(numero_vol, date_vol) REFERENCES Vol(numero_vol, date_vol),
   FOREIGN KEY(id_passager) REFERENCES Passager(id_passager)
);

CREATE TABLE concerne(
   id_passager INT,
   pnr INT,
   PRIMARY KEY(id_passager, pnr),
   FOREIGN KEY(id_passager) REFERENCES Passager(id_passager),
   FOREIGN KEY(pnr) REFERENCES Réservation(pnr)
);

CREATE TABLE affectation(
   numero_vol INT,
   date_vol DATE,
   matricul_personnel INT,
   rolesurvol VARCHAR(50),
   PRIMARY KEY(numero_vol, date_vol, matricul_personnel),
   FOREIGN KEY(numero_vol, date_vol) REFERENCES Vol(numero_vol, date_vol),
   FOREIGN KEY(matricul_personnel) REFERENCES Personnel(matricul_personnel)
);

CREATE TABLE comprend(
   pnr INT,
   numero_vol INT,
   date_vol DATE,
   PRIMARY KEY(pnr, numero_vol, date_vol),
   FOREIGN KEY(pnr) REFERENCES Réservation(pnr),
   FOREIGN KEY(numero_vol, date_vol) REFERENCES Vol(numero_vol, date_vol)
);

CREATE TABLE checkin(
   numero_billet INT,
   classe_cabine VARCHAR(50),
   statut_checkin VARCHAR(50),
   numero_carte_embarquement INT,
   numero_siege INT,
   id_passager INT NOT NULL,
   numero_vol INT NOT NULL,
   date_vol DATE NOT NULL,
   PRIMARY KEY(numero_billet),
   FOREIGN KEY(numero_billet) REFERENCES Billet(numero_billet),
   FOREIGN KEY(id_passager) REFERENCES Passager(id_passager),
   FOREIGN KEY(numero_vol, date_vol) REFERENCES Vol(numero_vol, date_vol)
);
