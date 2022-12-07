create table fen_lisesi(
okul_no char(4) unique, -- bu bilgiden birden fazla olamaz
isim varchar(50) not null, -- boş brakılamaz
derece double,
adres varchar(100),
son_degisiklik date
);
 
select * from fen_lisesi;

-- ####################################### --

insert into fen_lisesi values ('1001','Faruk yucel',89,'Ankara','2022-12-06');
insert into fen_lisesi values ('1002','Harun yucel',88,'Ankara','2022-12-06');
insert into fen_lisesi values ('1003','Ahmet yucel',87,'Ankara','2022-12-06');
insert into fen_lisesi values ('1004','Ayse ot',86,'Ankara','2022-12-06');
insert into fen_lisesi values ('1005','ismail demir',85,'Ankara','2022-12-06');
insert into fen_lisesi values ('1006','remzi yucel',85,null,'2022-12-06');
insert into fen_lisesi (okul_no,isim,derece,son_degisiklik) values  ('1007','Aydın yokus',84,'2022-12-06');
-- insert into fen_lisesi (okul_no,derece,son_degisiklik) values  ('1008',84,'2022-12-06'); -- yapılamaz çünkü isim not null dır 
insert into fen_lisesi (isim,derece,son_degisiklik) values  ('Ozan',84,'2022-12-06');
insert into fen_lisesi (isim,derece,son_degisiklik) values  ('hasan',83,'2022-12-06');



select * from fen_lisesi;

-- #################################################### --

-- okul_no,isim,adres,derece
-- okul_no unique, isim not null

create table anadolu_lisesi(
okul_no int unique, -- bu bilgiden birden fazla olamaz
isim varchar(50) not null, -- boş brakılamaz
adres varchar(100),
derece double
);

insert into anadolu_lisesi values(100,'sule saglam','Ankara',97);
insert into anadolu_lisesi values(101,'bunyamin','istanbul',96);
insert into anadolu_lisesi values(102,'nurten','antalya',95);
insert into anadolu_lisesi values(103,'tugay','bayburt',99);
insert into anadolu_lisesi (isim,adres)values('tugay','bayburt');
-- insert into anadolu_lisesi (okul_no,isim,adres)values('','tugay','bayburt'); -- kabul etmez çünkü integer bir değere boşluk atanamaz.
insert into anadolu_lisesi (okul_no,isim,adres)values(null,'fatma','bayburt'); -- fakat null da sorun çıkarmaz


select *from anadolu_lisesi;













