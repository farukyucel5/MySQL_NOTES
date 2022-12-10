/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
SELECT * FROM personel;
SELECT * FROM sirketler;
select sirket,(select max(maas) from personel where sirketler.sirket=personel.sirket) from sirketler;
/*----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde 
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select sirket_id,sirket,(select count(sehir) from personel where sirketler.sirket=personel.sirket) from sirketler;
/*----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/
select sirket_id,sirket,(select count(sehir) from personel where sirketler.sirket=personel.sirket)
from sirketler 
where sirket_id>101;
/*----------------------------------------------------------------
SORU 5- Her sirketin ismini,personel sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/
select sirket,personel_sayisi,
(select max(maas) from personel where sirketler.sirket=personel.sirket),
(select min(maas) from personel where sirketler.sirket=personel.sirket)
 from sirketler;    
/*----------------------------------------------------------------
SORU 6- Her sirketin ismini ve personel sayisini ve iscilere
odedigi toplam maasi listeleyen bir QUERY yazin.*/

select sirket,personel_sayisi,(select sum(maas) from personel where sirketler.sirket=personel.sirket)
from sirketler;
