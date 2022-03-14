/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  14/03/2022 11:26:32                      */
/*==============================================================*/

drop table if exists Achats;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Clients;

drop table if exists Fournisseurs;

drop table if exists Roles;

drop table if exists Utilisateurs;

drop table if exists Ventes;

/*==============================================================*/
/* Table : Categorie                                            */
/*==============================================================*/
create table Categorie
(
   idCategorie          int not null,
   nom                  varchar(254),
   primary key (idCategorie)
);


/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   idArticle            int not null,
   idCategorie          int not null,
   libelle              varchar(254),
   description          varchar(254),
   prixUnitaire         int,
   prixTotal            int,
   primary key (idArticle)
);

/*==============================================================*/
/* Table : Clients                                              */
/*==============================================================*/
create table Clients
(
   idClients            int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   email                varchar(254),
   primary key (idClients)
);

/*==============================================================*/
/* Table : Fournisseurs                                         */
/*==============================================================*/
create table Fournisseurs
(
   idFournisseurs       int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   telephone            int,
   email                varchar(254),
   primary key (idFournisseurs)
);


/*==============================================================*/
/* Table : Roles                                                */
/*==============================================================*/
create table Roles
(
   idRole               int not null,
   nom                  varchar(254),
   primary key (idRole)
);

/*==============================================================*/
/* Table : Utilisateurs                                         */
/*==============================================================*/
create table Utilisateurs
(
   idUtilisateurs       int not null,
   idRole               int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   telephone            int,
   email                varchar(254),
   primary key (idUtilisateurs)
);


/*==============================================================*/
/* Table : Achats                                               */
/*==============================================================*/
create table Achats
(
   idAchats             int not null,
   idUtilisateurs       int not null,
   idArticle            int not null,
   idFournisseurs       int not null,
   date                 datetime,
   quantite             int,
   prixUnitaire         int,
   prixTotal            int,
   primary key (idAchats)
);




/*==============================================================*/
/* Table : Ventes                                               */
/*==============================================================*/
create table Ventes
(
   idVentes             int not null,
   idUtilisateurs       int not null,
   idClients            int not null,
   idArticle            int not null,
   date                 datetime,
   quantite             int,
   prixUnitaire         int,
   pzrixTotal           int,
   primary key (idVentes)
);

INSERT INTO Article (idArticle, idCategorie,libelle, description, prixUnitaire,prixTotal)
      VALUES( 2000, 4000,  'souris','HP', 3500, 55750),
            ( 2001, 4001,  'USB','TOSHIBA', 7500, 125000);

INSERT INTO Categorie (idCategorie, nom)
      VALUES(4000,' serieC'),
            (4001,' serieA');


      INSERT INTO Clients (idClients, nom, prenom, adresse, email)
      VALUES( 1000,' Mbembe', ' Leon', 'kalgondin14', 76724792 ),
            ( 1001,'Kembe', ' Leony', 'kalo148', 75724792 ),
            ( 1002,' Membe', ' peon', 'ondin47', 55724792 );
      
    

      INSERT INTO Fournisseurs (idFournisseurs,nom,prenom,adresse,telephone,email)
      VALUES( 3000,'Kimanuka', 'Adrien', 'cap-town12', 0043565423, 'kimad@gmail.com'),
            ( 3001,'manuka', 'rien', 'town47', 0043560023, 'mad@gmail.com');

        INSERT INTO Roles ( idRole, nom)
      VALUES( 10000, 'vendre' ),
            ( 10001, 'livrer' ),
            ( 10002, 'stocker' );
      
      INSERT INTO Utilisateurs (idUtilisateurs, idRole, nom, prenom, adresse, telephone, email)
      VALUES( 100,10000,'Matayo','Jean','ma2114',76011245,'matrky@gmail.com'),
            ( 101,10001,'tyo','Farida','ty124',68012546,'ty@gmail.com');

      INSERT INTO Achats(idAchats,idUtilisateurs,idArticle,idFournisseurs,date,quantite,prixUnitaire,prixTotal)
      VALUES( 200,100,2000,3000,'2020/05/05',800, 5000, 4000000),
            ( 201,101,2001,3001,'2020/05/10',600, 5000, 3000000);

      INSERT INTO Ventes ( idVentes, idUtilisateurs,idClients, idArticle, date,quantite, prixUnitaire,pzrixTotal)
      VALUES(10,100,1000,2000 ,'2021/05/05',50, 3050, 30500 ),
            (11,101,1001,2001,'2021/05/10',100,1750,17500); 

alter table Achats add constraint FK_association2 foreign key (idFournisseurs)
      references Fournisseurs (idFournisseurs) on delete restrict on update restrict;

alter table Achats add constraint FK_association8 foreign key (idArticle)
      references Article (idArticle) on delete restrict on update restrict;

alter table Achats add constraint FK_association9 foreign key (idUtilisateurs)
      references Utilisateurs (idUtilisateurs) on delete restrict on update restrict;

alter table Article add constraint FK_association1 foreign key (idCategorie)
      references Categorie (idCategorie) on delete restrict on update restrict;

alter table Utilisateurs add constraint FK_association7 foreign key (idRole)
      references Roles (idRole) on delete restrict on update restrict;

alter table Ventes add constraint FK_association3 foreign key (idClients)
      references Clients (idClients) on delete restrict on update restrict;

alter table Ventes add constraint FK_association4 foreign key (idArticle)
      references Article (idArticle) on delete restrict on update restrict;

alter table Ventes add constraint FK_association6 foreign key (idUtilisateurs)
      references Utilisateurs (idUtilisateurs) on delete restrict on update restrict;

     

