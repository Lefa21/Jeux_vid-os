DROP SCHEMA Jeux_video CASCADE;
CREATE SCHEMA Jeux_video;
SET search_path to Jeux_video;


CREATE TABLE utilisateur(
        pseudo_user Varchar (50) NOT NULL ,
        nom         Varchar (50) NOT NULL ,
        prenom      Varchar (50) NOT NULL ,
        mail        Varchar (50) NOT NULL ,
        numTel      Int NOT NULL
	,CONSTRAINT utilisateur_PK PRIMARY KEY (pseudo_user)
);




CREATE TABLE jeu(
        idJeu      Int NOT NULL ,
        descriptif Varchar (100) NOT NULL ,
        titre      Varchar (50) NOT NULL,
	CONSTRAINT jeu_PK PRIMARY KEY (idJeu)
);



CREATE TABLE solo(
        idJeu      Int NOT NULL ,
        tempsDeJeu Int NOT NULL ,
        descriptif Varchar (100) NOT NULL ,
        titre      Varchar (50) NOT NULL
	,CONSTRAINT solo_PK PRIMARY KEY (idJeu)

	,CONSTRAINT solo_jeu_FK FOREIGN KEY (idJeu) REFERENCES jeu(idJeu)
);



CREATE TABLE Multijoueur(
        idJeu            Int NOT NULL ,
        nombreExtensions Int NOT NULL ,
        descriptif       Varchar (100) NOT NULL ,
        titre            Varchar (50) NOT NULL
	,CONSTRAINT Multijoueur_PK PRIMARY KEY (idJeu)

	,CONSTRAINT Multijoueur_jeu_FK FOREIGN KEY (idJeu) REFERENCES jeu(idJeu)
);




CREATE TABLE serveur(
        idServeur      Int NOT NULL ,
        adresseIp      Varchar (50) NOT NULL ,
        nom            Varchar (50) NOT NULL ,
        capaciteJoueur Int NOT NULL
	,CONSTRAINT serveur_PK PRIMARY KEY (idServeur)
);



CREATE TABLE sauvetage_Solo(
        pseudo_user   Varchar (50) NOT NULL ,
        idJeu         Int NOT NULL ,
        nbPoint       Int NOT NULL ,
        niveauAtteint Int NOT NULL ,
        nombrevie     Int NOT NULL
	,CONSTRAINT sauvetage_Solo_PK PRIMARY KEY (pseudo_user,idJeu)

	,CONSTRAINT sauvetage_Solo_utilisateur_FK FOREIGN KEY (pseudo_user) REFERENCES utilisateur(pseudo_user)
	,CONSTRAINT sauvetage_Solo_solo_FK FOREIGN KEY (idJeu) REFERENCES solo(idJeu)
);




CREATE TABLE sauvetageMulti(
        idJeu             Int NOT NULL ,
        idServeur         Int NOT NULL ,
        pseudo_user       Varchar (50) NOT NULL ,
        adversaire        Varchar (50) NOT NULL ,
        nombreMort        Int NOT NULL ,
        nombreElimination Int NOT NULL ,
        gagnant           Varchar (50) NOT NULL
	,CONSTRAINT sauvetageMulti_PK PRIMARY KEY (idJeu,idServeur,pseudo_user)

	,CONSTRAINT sauvetageMulti_Multijoueur_FK FOREIGN KEY (idJeu) REFERENCES Multijoueur(idJeu)
	,CONSTRAINT sauvetageMulti_serveur_FK FOREIGN KEY (idServeur) REFERENCES serveur(idServeur)
	,CONSTRAINT sauvetageMulti_utilisateur_FK FOREIGN KEY (pseudo_user) REFERENCES utilisateur(pseudo_user)
);


-------- Insertion ----------

INSERT INTO utilisateur (pseudo_user,nom, prenom, mail,numTel) VALUES

	('Tonnere', 'Betz','sarah', 'betz.sarah@gmail.com', '0623154872'),
	('Bonnie', 'Suda', 'Bonnie', 'suda.bonnie@gmail.com', '0723159695'),
	('white_whalt', 'White','walter', 'white.walter@gmail.com', '0747474747'),
	('Kujota', 'kujo', 'Jotaro', 'kujo.jotaro@gmail.com', '0600001111'),
	('CrimsonKnigh', 'Noris', 'Chucks', 'chucks.noris@gmail.com', '0785653216'),
	('Gugus', 'Fring', 'Gus', 'fring.gus@gmail.com', '0654923711'),
	('Lannitir', 'Lannister','Tirion', 'lannister.tirion@gmail.com','0746565474'),
	('IceQueen', 'Sacquet', 'Bilbon', 'sacquet.bilbon@gmail.com', '0600121198'),
	('DragonMaster_21', 'Maitre', 'Yoda', 'maitre.yoda@gmail.com', '0765153296'),
	('OmbreAssassinX', 'Freecs', 'Gin', 'freecs.gin@gmail.com', '0654923711'),
	('DarkWarriorX','Scofield', 'Michael', 'Michael.Scofield@gmail.com','0754963680'),
	('FireDragon','Burrows', 'Lincoln', 'Lincoln.Burrows@gmail.com','0754963681'),
	('LightningBlade_','Mbappe', 'Kylian', 'Mbappe.Kylian@gmail.com','0754963682'),
	('OceanWarr','Golozer', 'Gazouza', 'Golozer.Gazouza@gmail.com','0754963683'),
	('Dompteur_de_dragon_','AbdelKinder', 'Karim', 'AbdelKinder.Karim@gmail.com','0754963684'),
	('CrimsonAssassin','Zizou', 'Zinedine', 'Zizou.Zinedine@gmail.com','0754963685'),
	('MystiqueMage','Escobar', 'Pablo', 'Escobar.Pablo@gmail.com','0754963686'),
	('StormBringer','Sangoku', 'Vegeta', 'Sangoku.Vegeta@gmail.com','0754963687'),
	('Guerrier_de_glace','Bruce', 'Lee', 'Bruce.Lee@gmail.com','0754963688'),
	('ThunderGuardian','Ip','Man', 'Ip.Man@gmail.com','0754963689');



INSERT INTO serveur (idServeur,adresseIp,nom,capaciteJoueur) VALUES
    (1,'201.191.108.158','Europe',1000),
    (2,'31.138.239.121','Asie',1000),
    (3,'81.33.67.125','Afrique',1000),
    (4,'1.143.176.175','Amerique_nord',1000),
    (5,'5.82.228.251','Amerique_sud',1000);


INSERT INTO jeu (idJeu,titre,descriptif) VALUES sa

    (1,'Minecraft','jeux_Créatif'),
    (2,'Call_Of_Duty','Jeux_de_guerre'), 
    (3,'League_of_Legend','Jeux_de_strategie'), 
    (4,'Fortnite','Battle_Royale'),
    (5,'GTAV','Action_Aventure'), 
    (6,'Geometry_dash','jeux_Parcours'), 
    (7,'God_of_war','Action_Aventure'),
    (8,'Star_wars','jeux_Aventure'), 
    (9,'Fall_guys','Battle_Royale'),
    (10,'Assassins_creed','jeux_Action');

INSERT INTO solo (idJeu,titre,descriptif,tempsDeJeu) VALUES

	(1,'Minecraft','jeux_Créatif',6),
	(6,'Geometry_dash','jeux_Parcours',100), 
	(7,'God_of_war','Action_Aventure',20),
	(8,'Star_wars','jeux_Aventure',50),
	(10,'Assassins_creed','jeux_Action',40);


INSERT INTO Multijoueur (idJeu,titre,nombreExtensions,descriptif) VALUES

	(2,'Call_Of_Duty',10,'Jeux_de_guerre'),    
	(3,'League_of_Legend',1,'Jeux_de_strategie'),
	(5,'GTAV',50,'Action_Aventure'),
	(4,'Fortnite',5,'Battle_Royale'),
	(9,'Fall_guys',1,'Battle_Royale');





INSERT INTO sauvetage_Solo (idJeu,pseudo_user,nombrevie,nbPoint,niveauAtteint) VALUES

	(1,'Tonnere',6,4,45),
	(6,'CrimsonKnigh',4,10,10), 
	(7,'DragonMaster_21',3,20,5),
	(8,'FireDragon',1,50,30),
	(10,'Dompteur_de_dragon_',2,40,25),
	(1,'Guerrier_de_glace',6,10,17),
	(6,'Guerrier_de_glace',13,300,30),
	(7,'StormBringer',14,60,15),
	(8,'DarkWarriorX',17,30,5),
	(10,'MystiqueMage',5,70,10);



INSERT INTO sauvetageMulti (idJeu,idServeur,pseudo_user,adversaire,nombreMort,nombreElimination,Gagnant) VALUES
	    (2,2,'Gugus','CrimsonKnigh',8,3,'Gugus'),
	    (9,2,'Bonnie','Gugus',8,2,'Gugus'),    
	    (5,5,'Lannitir','CrimsonKnigh',2,3,'Lannitir'),    
	    (3,3,'Kujota','white-whalt',0,7,'Kujota'),    
	    (4,3,'Kujota','CrimsonKnigh',0,9,'Kujota'),
	    (3,3,'white_whalt','CrimsonKnigh',0,2,'white_whalt'),
	    (2,1,'DragonMaster_21','Bonnie',1,7,'DragonMaster_21'),    
	    (4,1,'Bonnie','DragonMaster_21',3,0,'DragonMaster_21'),    
	    (9,3,'OmbreAssassinX','CrimsonKnigh',3,5,'OmbreAssassinX'),    
	    (5,4,'Bonnie','OmbreAssassinX',9,5,'OmbreAssassinX');



 


/*

------- requête SQL ----------

1 ère requête : 

La requête affiche les utilisateurs n'ayant jamais jouer à un jeu multi


SELECT pseudo_user from utilisateur EXCEPT SELECT pseudo_user From utilisateur NATURAL JOIN sauvetagemulti;


     pseudo_user     
---------------------
 Dompteur_de_dragon_
 CrimsonKnigh
 LightningBlade_
 StormBringer
 OceanWarr
 IceQueen
 DarkWarriorX
 Guerrier_de_glace
 CrimsonAssassin
 FireDragon
 Tonnere
 ThunderGuardian
 MystiqueMage
(13 lignes)



2 ème requête : 

La requête affiche les joueurs qui ont atteint un niveau supérieur >=15 quelle que soit le jeu




SELECT sauvetage_Solo.pseudo_user,jeu.titre,sauvetage_Solo.niveauAtteint from sauvetage_Solo INNER JOIN jeu using (idjeu) WHERE niveauatteint >= 15;


     pseudo_user     |      titre      | niveauatteint 
---------------------+-----------------+---------------
 Tonnere             | Minecraft       |            45
 FireDragon          | Star_wars       |            30
 Dompteur_de_dragon_ | Assassins_creed |            25
 Guerrier_de_glace   | Minecraft       |            17
 Guerrier_de_glace   | Geometry_dash   |            30
 StormBringer        | God_of_war      |            15
(6 lignes

3 ème requête :

La requête affiche les jeux multijoueurs remporté par Kujota sur le serveur 3



SELECT titre from Multijoueur  INNER JOIN sauvetagemulti using(idjeu) WHERE idserveur = 3 and gagnant = 'Kujota';


      titre       
------------------
 League_of_Legend
 Fortnite
(2 lignes)


4 ème : 

Le joueur ayant joué en solo et gagné au moins une partie en multijoueur



SELECT pseudo_user,nom,prenom FROM utilisateur INNER JOIN sauvetage_Solo using(pseudo_user) INNER JOIN sauvetagemulti using(pseudo_user)  WHERE gagnant = pseudo_user;


   pseudo_user   |  nom   | prenom 
-----------------+--------+--------
 DragonMaster_21 | Maitre | Yoda
(1 ligne)



5 ème requete :

La requête affiche le nom de l'utilisateur qui a moins de 10 vie, plus de 15 point sur le jeu assasin's creed.




SELECT titre,pseudo_user,nom,prenom FROM jeu INNER JOIN sauvetage_Solo using(idjeu) INNER JOIN utilisateur using(pseudo_user)  WHERE nombrevie < 10 and nbpoint > 15 and idjeu = 10;  
      titre      |     pseudo_user     |     nom     | prenom 
-----------------+---------------------+-------------+--------
 Assassins_creed | Dompteur_de_dragon_ | AbdelKinder | Karim
 Assassins_creed | MystiqueMage        | Escobar     | Pablo


*/











