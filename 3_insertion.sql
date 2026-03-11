/* ======================
PASSAGER
====================== */

INSERT INTO Passager VALUES
(1,'M','Martin',1985,'France','martin@mail.com',600000001),
(2,'Mme','Dubois',1990,'France','dubois@mail.com',600000002),
(3,'M','Bernard',1978,'France','bernard@mail.com',600000003),
(4,'Mme','Thomas',1995,'France','thomas@mail.com',600000004),
(5,'M','Petit',1988,'France','petit@mail.com',600000005),
(6,'Mme','Robert',1992,'France','robert@mail.com',600000006),
(7,'M','Richard',1980,'France','richard@mail.com',600000007),
(8,'Mme','Durand',1998,'France','durand@mail.com',600000008),
(9,'M','Moreau',1975,'France','moreau@mail.com',600000009),
(10,'Mme','Simon',2000,'France','simon@mail.com',600000010);


/* ======================
AVION
====================== */

INSERT INTO Avion VALUES
(1001,'Airbus A320',180),
(1002,'Boeing 737',160),
(1003,'Airbus A321',220),
(1004,'Boeing 777',396),
(1005,'Airbus A350',350);


/* ======================
PERSONNEL
====================== */

INSERT INTO Personnel VALUES
(1,'Pilote'),
(2,'Copilote'),
(3,'Hotesse'),
(4,'Steward'),
(5,'Pilote'),
(6,'Steward'),
(7,'Hotesse'),
(8,'Copilote');


/* ======================
AEROPORT
====================== */

INSERT INTO Aeroport VALUES
(1,'Paris','Charles de Gaulle'),
(2,'Londres','Heathrow'),
(3,'New York','JFK'),
(4,'Tokyo','Haneda'),
(5,'Dubai','DXB');


/* ======================
BILLET
====================== */

INSERT INTO Billet VALUES
(101,'2024-01-10',1,'modifiable',TRUE,1),
(102,'2024-01-11',2,'non modifiable',FALSE,2),
(103,'2024-01-12',1,'modifiable',TRUE,3),
(104,'2024-01-12',2,'non modifiable',FALSE,4),
(105,'2024-01-13',1,'modifiable',TRUE,5),
(106,'2024-01-13',2,'modifiable',TRUE,6),
(107,'2024-01-14',3,'non modifiable',FALSE,7),
(108,'2024-01-14',2,'modifiable',TRUE,8),
(109,'2024-01-15',1,'modifiable',TRUE,9),
(110,'2024-01-15',1,'modifiable',TRUE,10);


/* ======================
RESERVATION
====================== */

INSERT INTO Réservation VALUES
(10001,'web','2024-01-01 10:00:00',TRUE,101),
(10002,'agence','2024-01-02 12:00:00',TRUE,102),
(10003,'web','2024-01-03 15:00:00',TRUE,103),
(10004,'mobile','2024-01-04 18:00:00',TRUE,104),
(10005,'web','2024-01-05 11:00:00',TRUE,105),
(10006,'mobile','2024-01-06 13:00:00',TRUE,106),
(10007,'web','2024-01-07 09:00:00',TRUE,107),
(10008,'agence','2024-01-08 14:00:00',TRUE,108),
(10009,'web','2024-01-09 16:00:00',TRUE,109),
(10010,'mobile','2024-01-10 17:00:00',TRUE,110);


/* ======================
VOL
====================== */

INSERT INTO Vol VALUES
(200,'2024-02-01','08:00','10:00','08:05','10:02','arrivé',1,1001,2),
(201,'2024-02-01','11:00','15:00','11:10','15:05','arrivé',1,1002,3),
(202,'2024-02-02','09:00','11:00','09:00','11:01','arrivé',2,1003,1),
(203,'2024-02-03','13:00','17:00','13:05','17:10','arrivé',3,1004,1),
(204,'2024-02-04','16:00','22:00','16:05','22:10','arrivé',1,1005,4);


/* ======================
BAGAGE
poids <= 32
====================== */

INSERT INTO Bagage VALUES
(1,'soute',23,'embarqué',200,'2024-02-01',1),
(2,'cabine',8,'embarqué',200,'2024-02-01',2),
(3,'soute',20,'embarqué',201,'2024-02-01',3),
(4,'soute',25,'embarqué',201,'2024-02-01',4),
(5,'cabine',7,'embarqué',202,'2024-02-02',5),
(6,'soute',30,'embarqué',202,'2024-02-02',6);


/* ======================
CONCERNE
====================== */

INSERT INTO concerne VALUES
(1,10001),
(2,10002),
(3,10003),
(4,10004),
(5,10005),
(6,10006);


/* ======================
AFFECTATION
====================== */

INSERT INTO affectation VALUES
(200,'2024-02-01',1,'pilote'),
(200,'2024-02-01',2,'copilote'),
(200,'2024-02-01',3,'hotesse'),
(201,'2024-02-01',5,'pilote'),
(201,'2024-02-01',6,'steward'),
(202,'2024-02-02',7,'hotesse');


/* ======================
COMPREND
====================== */

INSERT INTO comprend VALUES
(10001,200,'2024-02-01'),
(10002,200,'2024-02-01'),
(10003,201,'2024-02-01'),
(10004,201,'2024-02-01'),
(10005,202,'2024-02-02'),
(10006,203,'2024-02-03');


/* ======================
CHECKIN
siege >0
carte embarquement unique
====================== */

INSERT INTO checkin VALUES
(101,'eco','validé',5001,12,1,200,'2024-02-01'),
(102,'eco','validé',5002,13,2,200,'2024-02-01'),
(103,'business','validé',5003,2,3,201,'2024-02-01'),
(104,'eco','validé',5004,15,4,201,'2024-02-01'),
(105,'eco','validé',5005,16,5,202,'2024-02-02'),
(106,'eco','validé',5006,17,6,202,'2024-02-02');