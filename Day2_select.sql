create table meslek_lisesi(
okul_no char(4) unique, -- bu bilgiden birden fazla olamaz
isim varchar(50) not null, -- boş brakılamaz
derece double,
adres varchar(100),
son_degisiklik date
);

insert into meslek_lisesi values ('1001','Faruk yucel',89,'Ankara','2022-12-06');
insert into meslek_lisesi values ('1002','Harun yucel',88,'Ankara','2022-12-06');
insert into meslek_lisesi values ('1003','Ahmet yucel',87,'Ankara','2022-12-06');
insert into meslek_lisesi values ('1004','Ayse ot',86,'Ankara','2022-12-06');
insert into meslek_lisesi values ('1005','ismail demir',85,'Ankara','2022-12-06');
insert into meslek_lisesi values ('1006','remzi yucel',85,null,'2022-12-06');

select*from meslek_lisesi;

select *from meslek_lisesi where derece>85;

select isim from meslek_lisesi where derece<87; -- notları 87 den küçük olanların isimlerini listeler sadece.
select isim from meslek_lisesi where adres='Ankara';

select isim,adres from meslek_lisesi where okul_no=1005;



