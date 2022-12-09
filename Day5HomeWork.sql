-- +++++++++++++++++++++ Bebeler - Notlar Tablolari ++++++++++++++++++++++++
/*-------------------------------------------------------------------------
6) Ismi Kemal Yasa olan ogrencinin notunu notlar tablosundaki 
ogrenci id'si 128 olan yazili notu ile update edin. 
--------------------------------------------------------------------------*/
use mydb;
select * from bebeler;
select*from notlar;

update bebeler set grade =(select yazili_notu from notlar where ogrenci_id=128)
where isim="Kemal yasa";
/*-------------------------------------------------------------------------
7) Ders adi fizik olan kayitlarin yazili notunu Oguz Karaca'nin grade'i
ile update edin.
--------------------------------------------------------------------------*/
update notlar set yazili_notu=(select grade from bebeler where isim ="Oguz Karaca")
 where ders_adi="fizik";
/*-------------------------------------------------------------------------
8) Ali Can'in grade'ini, 124 ogrenci_id'li yazili_notu ile guncelleyin.
--------------------------------------------------------------------------*/
update bebeler set grade=(select yazili_notu from notlar where ogrenci_id=124) where isim="Ali Can";
/*-------------------------------------------------------------------------
9) Ders adi Kimya olan yazili notlarini Rumeysa Aydin'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
update notlar set yazili_notu=(select grade from bebeler where isim="Rumeysa Aydin") where ders_adi="kimya";
/*-------------------------------------------------------------------------
9) Ders adi tarih olan yazili notlarini Resul Can'in 
grade'i ile guncelleyin.
--------------------------------------------------------------------------*/
update notlar set yazili_notu=(select grade from bebeler where isim="Resul Can") where ders_adi="tarih";

select * from bebeler;
select*from notlar;

