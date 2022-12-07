/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/
/*-------------------------------------------------------------------------
Q12: Id'si 10001, 10005 ya da 10008 olan personel isimlerini listeleyin
---------------------------------------------------------------------------*/
use mydb;

SELECT isim
FROM personel
WHERE id IN (10001,10005,10008);

/*-------------------------------------------------------------------------
Q13: Maasi sadece 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE maas IN (7000,12000);

/*    Yanlis Yazim
SELECT *
FROM personel
WHERE maas IN (7000,'Ayse');
SELECT *
FROM personel
WHERE maas,isim IN (7000,'Ayse');
*/

/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
/*-------------------------------------------------------------------------
Q14: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE 'a%';

/*-------------------------------------------------------------------------
Q15: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE isim LIKE '%ayse%';
/*-------------------------------------------------------------------------
Q16: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT isim
FROM personel
WHERE isim LIKE '%n';
/*-------------------------------------------------------------------------
Q17: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '_e%';

/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *from personel where isim like '_e%y%';
/*-------------------------------------------------------------------------
Q19: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
select * from personel where isim not like '%a%';
/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *from personel where maas like '_____';
/*-------------------------------------------------------------------------
Q21: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/
select *from personel where maas like 'a_____a%';

