/* ======================== ALIASES ===========================
   Aliases kodu ile tablo yazdirilirken, field isimleri sadece
   o cikti icin degistirilebilir.
===============================================================*/
use mydb;
CREATE TABLE employees1
(
employee_id char(9),
employee_name varchar(50),
employee_birth_city varchar(50)
);
INSERT INTO employees1 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO employees1 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO employees1 VALUES(345678901, 'Mine Bulut', 'Izmir');
SELECT * FROM employees1;
SELECT employee_id AS id,
       employee_name AS name,
       employee_birth_city AS city
FROM employees1;       
/* ======================== GROUP BY CLAUSE ===========================
   Group By komutu sonuclari bir veya daha fazla sutuna gore
   gruplamak icin SELECT komutuyla birlikte kullanilir.
   
   GROUP BY komutu her grup basina bir satir dondurur.
   
   GROUP BY AGGREGATE fonksiyonlariyla birlikte kullanilir.
======================================================================*/  
CREATE TABLE manav (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', null, 2);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav VALUES( 'Ayse', null, 3);
SELECT * FROM manav;
-- 1) Isme gore alinan urunlerin toplam kilosunu bulup,
-- isim sirasina gore siralayin. 
SELECT isim, SUM(urun_miktar) AS top_kg
FROM manav
GROUP BY isim
ORDER BY isim;
-- Bunlari bir de toplam kiloya gore ters sirali yapalim
SELECT isim, SUM(urun_miktar) top_kg
FROM manav
GROUP BY isim
ORDER BY top_kg DESC;
-- 2) Urun ismine gore, urunu alan toplam kisi sayisini, 
-- kisi sayisina gore siralayiniz.
SELECT urun_adi, COUNT(isim) kisi_sayisi
FROM manav
GROUP BY urun_adi
ORDER BY kisi_sayisi;
-- 3) Alinan kilo miktarina gore musteri sayisini listeleyiniz.
SELECT urun_miktar, COUNT(isim) kg_gore_kisi_sayisi
FROM manav
GROUP BY urun_miktar;
-- 4) Satilan meyve turune (urun_adi) gore urun alan kisi sayisini 
-- NATURAL ORDER'a gore gosteren QUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
SELECT urun_adi, COUNT(isim) kisi_sayisi
FROM manav
WHERE urun_adi IS NOT NULL
GROUP BY urun_adi
ORDER BY urun_adi;
-- 5) Satilan meyve turune (urun_adi) gore satilan (urun_miktari)
-- MIN ve MAX urun miktarlarini, MAX urun miktarina gore siralayarak
-- listeleyen OUERY yaziniz.
-- NULL olarak girilen meyveyi listelemesin.
SELECT urun_adi, MAX(urun_miktar) AS max , MIN(urun_miktar) AS min -- as kullanmadan da
FROM manav
WHERE urun_adi IS NOT NULL
GROUP BY urun_adi
ORDER BY max;
-- 6) Kisi ismine ve urun_adina gore satilan urunlerin toplamini
-- gruplandiran ve isime gore ters sirada listeleyen QUERY yaziniz.
SELECT isim, urun_adi, SUM(urun_miktar) top_kg
FROM manav
GROUP BY isim, urun_adi
ORDER BY isim DESC;
-- ==================================================================
CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500,'Honda');
INSERT INTO isciler VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
SELECT * FROM isciler;
-- 1) Isme gore toplam maaslari bulun
SELECT isim, SUM(maas) top_maas
FROM isciler
GROUP BY isim;
-- 2) Sehre gore toplam isci sayisini bulun
SELECT sehir, COUNT(id) isci_sayisi
FROM isciler
GROUP BY sehir;
-- 3) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun
SELECT sirket, COUNT(id) isci_sayisi
FROM isciler
WHERE maas>5000
GROUP BY sirket;
-- 4) Her sirket icin Min ve Max maasi bulun
SELECT sirket,MAX(maas), MIN(maas)
FROM isciler
GROUP BY sirket;
/*============================ LIMIT ===========================
>Tablodaki verilerin belli bir kismini listelemek icin LIMIT
 komutunu kullaniriz.
>LIMIT komutundan sonra kullandigimiz sayi kadar kaydi bize getirir.
>Eger belirli bir aralikta calismak istiyorsak bu durumda 
iki sayi gireriz, ancak bu sayilardan ilki baslangic noktamizi 
ifade ederken ikincisi kac kayit getirecegimizi belirtir. Baslangic 
noktasi dahil edilmez!
===============================================================*/
-- 1) Tablodan ilk 5 kaydi getiriniz.
SELECT * 
FROM isciler
LIMIT 5;
-- 2) Isim sirali tablodan ilk 3 kaydi listeleyin.
SELECT *
FROM isciler
ORDER BY isim
LIMIT 3;
-- 3) Maas sirali tablodan 4. kayittan 6. kayda kadar olan
-- kayitlarin isim ve sehir bilgilerini listeleyin.
SELECT isim, sehir
FROM isciler
ORDER BY maas
LIMIT 3,3;
-- 4) Maasi en yuksek 3 kisinin bilgilerini listeleyen sorguyu yaziniz.
SELECT *
FROM isciler
ORDER BY maas DESC
LIMIT 3;
-- 5) Maasi en dusuk 3 kisinin sadece isimlerini listeleyen sorguyu yaziniz.
SELECT isim
FROM isciler
ORDER BY maas
LIMIT 3;
-- 6) Maas'i 4000'den buyuk olan 3 kisinin sehrini siralayiniz.
SELECT sehir
FROM isciler
WHERE maas>4000
ORDER BY maas
LIMIT 3;