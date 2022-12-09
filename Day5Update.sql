 /* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;
========================================================================================*/
/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/
use mydb;
CREATE TABLE firmalar
(
id INT,
isim VARCHAR(5),
iletisim_isim VARCHAR(20),
CONSTRAINT id_isim_pk 
PRIMARY KEY (id,isim)
);
/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/
INSERT INTO firmalar VALUES (1, 'ACB', 'Ali Can');
INSERT INTO firmalar VALUES (2, 'RDB', 'Veli Gul');
INSERT INTO firmalar VALUES (3, 'KMN', 'Ayse Gulmez');
SELECT * FROM firmalar;
-- Id'si 3 olan firmanin ismini 'KRM' olarak guncelleyiniz.
UPDATE firmalar
SET isim = 'KRM'
WHERE id=3;
-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.
-- +++++++++++++++ 1. Yol ++++++++++++++++++
UPDATE firmalar
SET id=4
WHERE iletisim_isim = 'Veli Gul';
UPDATE firmalar
SET isim='FDS'
WHERE iletisim_isim = 'Veli Gul';
-- +++++++++++++++ 2. Yol ++++++++++++++++++
UPDATE firmalar
SET id=4,isim='FDS'
WHERE iletisim_isim = 'Veli Gul';
-- Ismi ACB olan firmanin iletisim ismini 'Osman Can' olarak guncelleyiniz.
UPDATE firmalar
SET iletisim_isim='Osman Can'
WHERE isim='ACB';
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- id, isim ve irtibat fieldlarinin oldugu bir tedarik tablosu olusturun.
-- id field'ini Primary Key yapin.
CREATE TABLE tedarik(
id int,
isim VARCHAR(10),
irtibat VARCHAR(20),
CONSTRAINT id_pk PRIMARY KEY (id)
);
-- tedarikci_id , urun_id , urun_isim , musteri_isim  fieldlari olan urun 
-- tablosu olusturun. Bu tablodaki tedarikci_id fieldini tedarik tablosunun
-- PK 'si ile Foreign Key yapin.
CREATE TABLE urun
(
tedarikci_id INT,
urun_id INT ,
urun_isim VARCHAR(10),
musteri_isim VARCHAR(20),
CONSTRAINT urun_fk 
FOREIGN KEY (tedarikci_id)
REFERENCES tedarik (id)
);
INSERT INTO tedarik VALUES(100, 'IBM', 'Ali Can'); 
INSERT INTO tedarik VALUES(101, 'APPLE', 'Merve Temiz'); 
INSERT INTO tedarik VALUES(102, 'SAMSUNG', 'Kemal Can'); 
INSERT INTO tedarik VALUES(103, 'LG', 'Ali Can');
INSERT INTO urun VALUES(100, 1001,'Laptop', 'Suleyman'); 
INSERT INTO urun VALUES(101, 1002,'iPad', 'Fatma'); 
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan'); 
INSERT INTO urun VALUES(103, 1004,'Phone', 'Ali Can');
SELECT * FROM tedarik;
SELECT * FROM urun;
/*
a) Urun tablosundan Ali Can'in aldigi urunun ismini, 
tedarik tablosunda irtibat Merve Temiz olan 
sirketin ismi ile degistirin. */
-- 1 . Asama : Ali Can'in aldigi urunun ismini Apple olarak degistirin :
UPDATE urun
SET urun_isim='Apple'
WHERE musteri_isim='Ali Can';
-- 2. Asama : Irtibat'i Merve Temiz olan kaydin sirket ismini getirin :
SELECT isim
FROM tedarik
WHERE irtibat='Merve Temiz';
-- 3. Asama : 
UPDATE urun
SET urun_isim=( SELECT isim
                FROM tedarik
                WHERE irtibat='Merve Temiz')
WHERE musteri_isim='Ali Can';
/*-------------------------------------------------------------------------
b) TV satin alan musterinin ismini, 
IBM'in irtibat'i ile degistirin.
-------------------------------------------------------------------------*/
UPDATE urun
SET musteri_isim = (SELECT irtibat
                    FROM tedarik
                    WHERE isim='IBM')
WHERE urun_isim='TV';
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*-------------------------------------------------------------------------
1) Bebeler tablosu olusturun.
 Icinde id,isim,veli_isim ve grade field'lari olsun. 
 Id field'i Primary Key olsun.
 --------------------------------------------------------------------------*/
CREATE TABLE bebeler(
id INT,
isim VARCHAR(20),
veli_isim VARCHAR(10),
grade DOUBLE,
CONSTRAINT id_pk PRIMARY KEY (id)
);
/*-------------------------------------------------------------------------
 2)  Kayitlari tabloya ekleyin.
 (123, 'Ali Can', 'Hasan',75), 
 (124, 'Merve Gul', 'Ayse',85), 
 (125, 'Kemal Yasa', 'Hasan',85),
 (126, 'Rumeysa Aydin', 'Zeynep',85);
 (127, 'Oguz Karaca', 'Tuncay',85);
 (128, 'Resul Can', 'Tugay',85);
 (129, 'Tugay Kala', 'Osman',45);
 --------------------------------------------------------------------------*/
INSERT INTO bebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO bebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO bebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO bebeler VALUES(126, 'Rumeysa Aydin', 'Zeynep',85);
INSERT INTO bebeler VALUES(127, 'Oguz Karaca', 'Tuncay',85);
INSERT INTO bebeler VALUES(128, 'Resul Can', 'Tugay',85);
INSERT INTO bebeler VALUES(129, 'Tugay Kala', 'Osman',45);
/*-------------------------------------------------------------------------
3)notlar tablosu olusturun. 
ogrenci_id, ders_adi, yazili_notu field'lari olsun, 
ogrenci_id field'i Foreign Key olsun 
--------------------------------------------------------------------------*/
CREATE TABLE notlar(
ogrenci_id INT,
ders_adi VARCHAR(10),
yazili_notu DOUBLE,
CONSTRAINT notlar_fk 
FOREIGN KEY (ogrenci_id) 
REFERENCES bebeler (id)
);
/*-------------------------------------------------------------------------
4) notlar tablosuna kayitlari ekleyin
 ('123','kimya',75), 
 ('124','fizik',65),
 ('125','tarih',90),
 ('126','kimya',87),
 ('127','tarih',69),
 ('128','kimya',93),
 ('129','fizik',25)
--------------------------------------------------------------------------*/
INSERT INTO notlar VALUES ('123','kimya',75); 
INSERT INTO notlar VALUES ('124','fizik',65); 
INSERT INTO notlar VALUES ('125','tarih',90); 
INSERT INTO notlar VALUES ('126','kimya',87); 
INSERT INTO notlar VALUES ('127','tarih',69); 
INSERT INTO notlar VALUES ('128','kimya',93); 
INSERT INTO notlar VALUES ('129','fizik',25); 
SELECT * FROM bebeler;
SELECT * FROM notlar;
/*-------------------------------------------------------------------------
5) Tum bebelerin yazili notlarini notlar tablosundaki grade ile update edin. 
--------------------------------------------------------------------------*/
UPDATE bebeler
SET grade = (SELECT yazili_notu
             FROM notlar
             WHERE bebeler.id = notlar.ogrenci_id )
WHERE id;