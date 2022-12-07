CREATE TABLE personel(
id char(5),
isim varchar(50),
maas int
);
insert into personel values('10001','Ahmet Aslan',7000);
insert into personel values('10002','Mehmet Yilmaz',12000);
insert into personel values('10003','Meryem',7215);
insert into personel values('10004','Veli Han',5000);
insert into personel values('10005','Mustafa Ali',5500);
insert into personel values('10006','Ayse Can',5600);
insert into personel values('10010','Ayse',4700);
insert into personel values('10009','Ayse Cemile',4000);
insert into personel values('10008','Ayse Cano',4300);
insert into personel values('10007','Can Ayse',7700);
SELECT * FROM personel;
/*-------------------------------------------------------------------------
Q7: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listele
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE id
BETWEEN 10005 AND 10009;
/*-------------------------------------------------------------------------
Q8: Ismi Mehmet Yilmaz ile Veli arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli' ;
/*-------------------------------------------------------------------------
Q9: Ismi Ahmet ile Ayse Cano arasinda olan personel bilgilerini listeleyin
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Cano';
/*-------------------------------------------------------------------------
Q10: Maasi 7000 ya da ismi Ayse olan personel id'lerini listeleyin
---------------------------------------------------------------------------*/
SELECT id
FROM personel
WHERE maas=7000 OR isim='Ayse';
/*-------------------------------------------------------------------------
Q11: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE id=10001 OR id=10005 OR id=10008;