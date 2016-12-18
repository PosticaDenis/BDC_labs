CREATE TABLE imprimante1
(Cod NUMBER(10) NOT NULL, 
 Model VARCHAR2(4) NOT NULL,
 Color CHAR(2) NOT NULL,
 Tip VARCHAR2(6) NOT NULL,
 Pret FLOAT(49) NOT NULL,
 PRIMARY KEY(Cod));

 CREATE TABLE laptop_uri
(Cod NUMBER(10) NOT NULL, 
 Model VARCHAR2(4) NOT NULL,
 Viteza NUMBER(3,0) NOT NULL,
 Ram NUMBER(3,0) NOT NULL,
 Hd NUMBER(2,0) NOT NULL,
 Pret FLOAT(49) NOT NULL,
 Ecran NUMBER(10) NOT NULL, 
 PRIMARY KEY(Cod));

 CREATE TABLE pc_uri
(Cod NUMBER(10) NOT NULL, 
 Model VARCHAR2(4) NOT NULL,
 Viteza NUMBER(3,0) NOT NULL,
 Ram NUMBER(3,0) NOT NULL,
 Hd NUMBER(2,0) NOT NULL,
 Cd VARCHAR2(3) NOT NULL,
 Pret FLOAT(49) NOT NULL,
 PRIMARY KEY(Cod));

 CREATE TABLE produse
(Producator CHAR NOT NULL, 
 Model VARCHAR2(4) NOT NULL,
 Tip VARCHAR2(10) NOT NULL,
 PRIMARY KEY(Producator));
 commit;

CREATE TABLE imprimante_stoc
(Cod NUMBER(10) NOT NULL, 
 Model VARCHAR2(4) NOT NULL,
 Color CHAR(2) NOT NULL,
 Tip VARCHAR2(6) NOT NULL,
 Pret FLOAT(49) NOT NULL,
 PRIMARY KEY(Cod));
commit;
 
select * from imprimante_stoc;
 
INSERT INTO imprimante_stoc
SELECT * FROM imprimante;
commit;

INSERT ALL
  INTO produse(Producator, Model, Tip) VALUES ('Z', 4003, 'Imprimante')
  INTO produse(Producator, Model, Tip) VALUES ('Z', 4001, 'PC')
  INTO produse(Producator, Model, Tip) VALUES ('Z', 4002, 'Laptop_uri')
SELECT * FROM dual;
commit;
select * from produse;

ALTER TABLE pc_uri
MODIFY (Ram DEFAULT 32);
ALTER TABLE pc_uri
MODIFY (Hd DEFAULT 5);
ALTER TABLE pc_uri
MODIFY (Cd DEFAULT '12x');
ALTER TABLE pc_uri
MODIFY (Viteza NUMBER(4,0));
commit;

INSERT INTO pc_uri(Cod, Model, Viteza, Pret) VALUES (22, 4444, 1200, 1350);
commit;

insert into pc_uri(Cod, Model, Viteza, Ram, Hd, Pret)
  select min(Cod) + 30 as Cod, Model + 100 as Model, 
         max(Viteza) as Viteza, max(Ram) * 2 as Ram, 
         max(Hd) * 2 as Hd, round(max(Pret)/1.5, 2) as Pret
  from laptop_uri
  group by Model;
commit;
select * from pc_uri;

CREATE UNIQUE INDEX impr ON imprimante(Cod);
CREATE UNIQUE INDEX lptp ON laptop_uri(Cod);
CREATE UNIQUE INDEX pc ON pc_uri(Cod);
CREATE UNIQUE INDEX prd ON produse(Model);
