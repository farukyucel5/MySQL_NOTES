/*==================================SELECT-REGEXP_LIKE=============================================
 Daha karmasik pattern ile sorgulama islemi icin REGEXP_LIKE kullanilabilir.
  -- 'c' => case-sensitive demektir
  -- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.
  
-----Syntax-----
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]','c'[])
=========================================================================================*/
use mydb;
    CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 7);
SELECT * FROM kelimeler;
-- Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e dikkat ederek listele
    -- NOT: VEYA islemi icin | karakteri kullanilir.
    SELECT kelime
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'c');
    
-- Q2 : Icerisinde 'ot' veya 'at' bulunan kelimeleri case-sensitive'e dikkat etmeksizin listele
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
-- Q3 : 'ho' veya 'hi' ile baslayan kelimeleri case-sensitive'e dikkat etmeksizin listele
    -- NOT: Baslangici gostermek icin ^ karakteri kullanilir.
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^ho|^hi');
    
-- Q4 : Sonu 't' veya 'm' ile bitenleri case-sensitive'e dikkat etmeksizin listele
    -- NOT: Bitisi gostermek icin $ karakteri kullanilir.
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'t$|m$');
    
-- Q5 : h ile baslayip t ile biten 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz
    -- NOT : [!-~] = [a-zA-Z0-9]
    
    SELECT *
    FROM kelimeler
    WHERE kelime LIKE 'h_t'; -- case sensitive olmaz.
    
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[a-zA-Z0-9]t', 'c');
-- Q6 : 2. harfi O olan 3 harfli kelimeleri (o harfi buyuk olanlari) listeleyiniz
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[a-zA-Z0-9]O[a-zA-Z0-9]', 'c');
-- Q7 : 2. ve 3. harfi o olan tum kelimeleri (case sensitive olmaksizin) listeleyiniz 
    SELECT *
    FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[a-zA-Z0-9]oo[a-zA-Z0-9]', 'c');