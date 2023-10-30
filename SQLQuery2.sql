CREATE DATABASE OKUL_KUTUPHANESI2

USE OKUL_KUTUPHANESI2;


CREATE TABLE UYELER(
	UYE_NO INT IDENTITY(1,1) NOT NULL,
	UYE_ADI VARCHAR(20),
	UYE_SOYADI VARCHAR(20),
	CINSIYET VARCHAR(20),
	TELEFON VARCHAR(15),
	EPOSTA VARCHAR(40),
	ADRES_NO INT,
	PRIMARY KEY("UYE_NO")
);
CREATE TABLE ADRESLER(
	ADRES_NO INT IDENTITY(1,1),
	CADDE VARCHAR(20),
	MAHALLE VARCHAR(20),
	BINA_NO VARCHAR(20),
	SEHIR VARCHAR(20),
	POSTA_KODU INT,
	ULKE VARCHAR(20),
	PRIMARY KEY ("ADRES_NO")
);
	ALTER TABLE UYELER ADD CONSTRAINT "ADRESLER_UYELER" 
	FOREIGN KEY (ADRES_NO) REFERENCES ADRESLER(ADRES_NO);

CREATE TABLE EMANET(
	EMANET_NO INT IDENTITY(1,1),
	ISBN VARCHAR(20) NOT NULL,
	UYE_NO INT NOT NULL,
	KUTUPHANE_NO INT NOT NULL,
	EMANET_TARIHI DATETIME,
	TESLIM_TARIHI DATETIME,
	PRIMARY KEY ("EMANET_NO")
);
	ALTER TABLE EMANET ADD CONSTRAINT "UYELER_EMANET"
	FOREIGN KEY (UYE_NO) REFERENCES UYELER(UYE_NO);
	
CREATE TABLE KITAPLAR(
	ISBN VARCHAR(20),
	KITAP_ADI VARCHAR(20),
	YAYIN_TARIHI VARCHAR(20),
	S_SAYISI INT,
	PRIMARY KEY ("ISBN")
);
	ALTER TABLE EMANET ADD CONSTRAINT "EMANET_KITAPLAR"
	FOREIGN KEY (ISBN) REFERENCES KITAPLAR(ISBN);

CREATE TABLE YAZARLAR(
	YAZAR_NO INT IDENTITY(1,1),
	YAZAR_ADI VARCHAR(20),
	YAZAR_SOYADI VARCHAR(20),
	PRIMARY KEY ("YAZAR_NO")
);

CREATE TABLE KATEGORILER(
	KATEGORI_NO INT IDENTITY(1,1),
	KATEGORI_ADI VARCHAR(20),
	PRIMARY KEY ("KATEGORI_NO")
);

CREATE TABLE KUTUPHANE(
	KUTUPHANE_NO INT IDENTITY(1,1),
	KUTUPHANE_ADI VARCHAR(20),
	ACIKLAMA VARCHAR(20),
	ADRES_NO INT,
	PRIMARY KEY ("KUTUPHANE_NO")
);
	ALTER TABLE KUTUPHANE ADD CONSTRAINT "KUTUPHANE_ADRESLER"
	FOREIGN KEY (ADRES_NO) REFERENCES ADRESLER(ADRES_NO);

CREATE TABLE KITAP_KUTUPHANE(
	KUTUPHANE_NO INT NOT NULL,
	ISBN VARCHAR(20) NOT NULL,
	MIKTAR INT,
	CONSTRAINT "KITAP_KUTUPHANE_PK" PRIMARY KEY ("KUTUPHANE_NO", "ISBN"),
	CONSTRAINT "KITAP_KUTUPHANE_FK" FOREIGN KEY ("KUTUPHANE_NO") REFERENCES KUTUPHANE(KUTUPHANE_NO)
);
	ALTER TABLE KITAP_KUTUPHANE ADD CONSTRAINT "KITAP_KUTUPHANE_KITAPLAR_FK" FOREIGN KEY ("ISBN") REFERENCES KITAPLAR(ISBN);

CREATE TABLE KITAP_KATEGORI(
	ISBN VARCHAR(20) NOT NULL,
	KATEGORI_NO INT NOT NULL,
	CONSTRAINT "KITAP_KATEGORI_PK" PRIMARY KEY ("KATEGORI_NO", "ISBN"),
	CONSTRAINT "KITAP_KATEGORI_FK" FOREIGN KEY ("KATEGORI_NO") REFERENCES KATEGORILER(KATEGORI_NO)
);
	ALTER TABLE KITAP_KATEGORI ADD CONSTRAINT "KITAP_KATEGORI_KITAPLAR_FK" FOREIGN KEY ("ISBN") REFERENCES KITAPLAR(ISBN);

CREATE TABLE KITAP_YAZAR(
	ISBN VARCHAR(20) NOT NULL,
	YAZAR_NO INT NOT NULL,
	CONSTRAINT "KITAP_YAZAR_PK" PRIMARY KEY ("YAZAR_NO", "ISBN"),
	CONSTRAINT "KITAP_YAZAR_FK" FOREIGN KEY ("YAZAR_NO") REFERENCES YAZARLAR(YAZAR_NO)
);
	ALTER TABLE KITAP_YAZAR ADD CONSTRAINT "KITAP_YAZAR_KITAPLAR_FK" FOREIGN KEY ("ISBN") REFERENCES KITAPLAR(ISBN);

	ALTER TABLE EMANET ADD CONSTRAINT "KUTUPHANE_EMANET"
	FOREIGN KEY (KUTUPHANE_NO) REFERENCES KUTUPHANE(KUTUPHANE_NO);

	SELECT * FROM UYELER

	INSERT INTO UYELER VALUES('Enes', 'Tepe', 'E', '3561234539', 'kassap@hotmail.com', NULL);
	INSERT INTO UYELER VALUES('Duran', 'Erensoy', 'E', '3562345640', 'duer@kayseri.edu.tr', NULL);

	SELECT*FROM ADRESLER
	INSERT INTO ADRESLER VALUES('Kocasinan', 'Kad�', 5, 'Kayseri', '38070', 'T�rkiye' );
	INSERT INTO ADRESLER VALUES('Ye�ilhisar', 'G�ney', 142, 'Kayseri', '38037', 'T�rkiye' );
	INSERT INTO ADRESLER VALUES('Melikgazi', 'Keykubat', 3049, 'Kayseri', '38050', 'T�rkiye' );
	DELETE FROM ADRESLER WHERE ADRES_NO=4

	UPDATE UYELER
	SET EPOSTA='ksp@hotmail.com' 
	WHERE UYE_NO=1;


	--
	--(2.soru) ..... tablosuna kay�t ekleme 1 kay�t ekleyiniz g�ncelleyiniz ve siliniz.
--�YELER
-- KAYIT G�RME
INSERT INTO UYELER (UYE_ADI, UYE_SOYADI, CINSIYET, ADRES_NO, TELEFON, E_POSTA)
VALUES ('Mustafa', 'Pa�a', E, 28, '5426357844', 'pa�apa�a38@gmail.com');
--KAYIT G�NCELLEME
UPDATE UYELER
SET UYE_ADI = 'Mustafa', UYE_SOYADI = 'Pa�a', CINSIYET = 'E', ADRES_NO = '28', TELEFON = '5426357844', E_POSTA = 'pa�apa�a38@gmail.com'
WHERE UYE_NO = 1;
--KAYIT S�LME
DELETE FROM UYELER WHERE UYE_NO = 1;
-----------------
-----Adreslere Kay�t Girme
--KAYIT G�RME 
INSERT INTO ADRESLER (CADDE, MAHALLE, BINA_NO, SEHIR, POSTA_KODU, ULKE)
VALUES ('Pa�a', '�ncesu', '79', 'Kayseri', '38082', 'T�rkiye');
--KAYIT G�NCELLEME
UPDATE ADRESLER
SET CADDE = 'Abd�lhamitHan', MAHALLE = 'Esentepe', BINA_NO = '18', SEHIR = 'Kayseri', POSTA_KODU = '38009', ULKE = 'T�rkiye'
WHERE ADRES_NO = 1;
--KAYIT S�LME
DELETE FROM ADRESLER WHERE ADRES_NO = 1;
-----------------
--K�T�PHANE
--KAYIT G�RME
INSERT INTO KUTUPHANE (ADRES_NO, KUTUPHANE_ADI, ACIKLAMA)
VALUES ('1', 'Talas', 'Koca K�t�phane');


--KAYIT G�NCELLEME
UPDATE KUTUPHANE
SET KUTUPHANE_ADI = 'Gezen K�t�phane', ACIKLAMA = 'Koca K�t�phane'
WHERE KUTUPHANE_NO = 1;


--K�T�PHANE VER� S�LME
DELETE FROM KUTUPHANE WHERE KUTUPHANE_NO = 1;
-----------------
--EMANET
--KAYIT G�RME 
INSERT INTO EMANET (ISBN, UYE_NO, KUTUPHANE_NO, EMANET_TARIHI, TESLIM_TARIHI)
VALUES ('15104405211', 1, 1, '2023-10-10', '2023-10-18');

--KAYIT G�NCELLEME 
UPDATE EMANET
SET ISBN = '1123456789'
WHERE EMANET_NO = 1;

--KAYIT S�LME 
DELETE FROM EMANET WHERE EMANET_NO = 1;
-----------------
--K�TAPLAR
--KAYIT G�RME 
INSERT INTO KITAPLAR (ISBN, KITAP_ADI, YAYIN_TARIHI, S_SAYISI)
VALUES ('14115155217', 'Mektup', , '2022-11-12', 1);

--KAYIT G�NCELLEME 
UPDATE KITAPLAR
SET YAYIN_TARIHI = 2022-09-19
WHERE ISBN = '14115155217';

--KAYIT S�LME 
DELETE FROM KITAPLAR WHERE ISBN = '14115155217';
-----------------
--YAZARLAR
-- KAYIT G�RME
 INSERT INTO YAZARLAR (YAZAR_ADI, YAZAR_SOYADI)
VALUES ('Enes', 'Tepe');

 --KAYIT G�NCELLEME 
 UPDATE YAZARLAR
SET YAZAR_ADI = 'Faruk',
WHERE YAZAR_NO = 1;

 --KAYIT S�LME 
 DELETE FROM YAZARLAR WHERE YAZAR_NO = 1;
 -----------------
 --KATEGOR�LER
 --KAYIT EKLEME 
 INSERT INTO KATEGORILER (KATEGORI_ADI)
 VALUES ('Mektup');

 --KAYIT G�NCELLEME 
 UPDATE KATEGORILER
 SET KATEGORI_ADI = '�lim'
 WHERE KATEGORI_NO = 2;

 --KAYIT S�LME 
 DELETE FROM KATEGORILER WHERE KATEGORI_NO = 2;
 -----------------
  --K�TAP_K�T�PHANE
  --KAYIT EKLEME 
 INSERT INTO KITAP_KUTUPHANE (KUTUPHANE_NO, ISBN, MIKTAR)
 VALUES ('2', '1234567891', 2); 


 --KAYIT G�NCELLEME 
 UPDATE KITAP_KUTUPHANE
 SET MIKTAR = 20
 WHERE ISBN = '1234567891';

 --KAYIT S�LME 
DELETE FROM KITAP_KUTUPHANE
WHERE ISBN = '1234567891';
-----------------
 --K�TAP_KATEGOR�
 --KAYIT EKLEME 
INSERT INTO KITAP_KATEGORI (ISBN, KATEGORI_NO)
VALUES ('1234567890', 1); 

 --KAYIT G�NCELLEME 
UPDATE KITAP_KATEGORI
SET ISBN = '1123456789'
WHERE ISBN = '1234567891'

 --KAYIT S�LME 
DELETE FROM KITAP_KATEGORI
WHERE ISBN = '1234567891'
-----------------
 --K�TAP_YAZAR
 --KAYIT EKLEME 
INSERT INTO KITAP_YAZAR (ISBN, YAZAR_NO)
VALUES ('1234567890', 1); 

 --KAYIT G�NCELLEME
UPDATE KITAP_YAZAR
SET YAZAR_NO = 5
WHERE ISBN = '1234567890'

 --KAYIT S�LME 
DELETE FROM KITAP_YAZAR
WHERE ISBN = '6055937515'
-------------------------------------------------------
--(3.soru)�YELER tablosunda kay�tlar�n var oldu�u varsay�ld���nda, kay�tlar� �UyeNo� s�tununa g�re artan s�rada listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT * FROM UYELER ORDER BY UYE_NO ASC;
-------------------------------------------------------
-- (4.soru)Ocak 2023 �ten sonra emanet al�nan kitaplar� listelemek i�in gerekli SQL ifadeleri yaz�n�z.
SELECT * FROM EMANET WHERE EMANET_TARIHI > '2023-01-31';
-------------------------------------------------------
-- (5.soru)Kayseri�de ikamet eden ve telefonu i�erisinde 6 i�eren �yeleri listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT * FROM UYELER WHERE SEHIR = 'Kayseri' AND TELEFON LIKE '%6';
-------------------------------------------------------
--(6.soru)Teslim tarihi 1 ay dan az kalan kitaplar� listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT * FROM EMANET WH.ERE DATEDIFF(day, GETDATE(), TESLIM_TARIHI) < 30;---------------------------------------------------------
--(7.soru)Soyad� be� karakterden fazla olan m��terilerin ad ve soyad bilgisini ad�n�n ilk harfini ve soyad�n�n ilk be� karakterini birle�tirerek tek bir s�tunda ad�na g�re alfabetik s�rada listelemek i�in gerekli SQL ifadesini yaz�n�z.
soyad�n�n ilk be� karakterini birle�tirerek tek bir s�tunda ad�na g�re alfabetik s�rada listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT CONCAT(LEFT(UYE_ADI, 1),LEFT(UYE_SOYADI, 5)) AS COMPLETENAME
FROM UYELER WHERE LEN(UYE_SOYADI) > 5 ORDER BY COMPLETENAME
--(8.sou)�yelerin sadece �Sehir� bilgisini alfabetik olarak listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT Sehir FROM UYELER ORDER BY Sehir
--(9.soru)2020 y�l�nda yap�lan emanet say�s�n� bulmak i�in gerekli SQL ifadesini yaz�n�z.
SELECT COUNT(*) FROM EMANET WHERE YEAR(EMANET_TARIHI) = 2020;-------------------------------------------------------
--(10.soru)Emanet al�nan k�t�phanenin ismi �Kayseri Belediyesi Merkez K�t�phanesi� olan kitaplar�n emanet s�resi 6 aydan fazla olan al�mlar� listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT * FROM EMANET
WHERE KUTUPHANE_NO IN (SELECT KUTUPHANE_NO FROM KUTUPHANE WHERE KUTUPHANE_ADI = 'Kayseri Belediyesi Merkez K�t�phanesi')
AND DATEDIFF(MONTH, EMANET_TARIHI, TESLIM_TARIHI) > 6;
-------------------------------------------------------
--(11.soru)Eski�ehir�de ya�ayan �yelerin say�s�n� bulmak i�in gerekli SQL ifadesini yaz�n�z.
SELECT COUNT(*) AS Eski�ehirde_Yasayan_Uye_Sayisi FROM ADRESLER WHERE SEHIR = 'Eski�ehir';-------------------------------------------------------
--(12.soru)�Yay�nTarihi� 3 ya��ndan b�y�k olan kitaplar�n yazar bilgisini listelemek i�in gerekli SQL ifadesini yaz�n�z.
SELECT YAZARLAR.YAZAR_ADI, YAZARLAR.YAZAR_SOYADI FROM KITAPLAR
INNER JOIN KITAP_YAZAR ON KITAPLAR.ISBN = KITAP_YAZAR.ISBN
INNER JOIN YAZARLAR ON KITAP_YAZAR.YAZAR_NO = YAZARLAR.YAZAR_NO
WHERE DATEDIFF(YEAR, KITAPLAR.YAYIN_TARIHI, GETDATE()) > 3;-------------------------------------------------------
--(13.soru)Her bir kitab�n emanet edildi�i s�relerin en uzun ve en k�sa olanlar� bulunuz.
SELECT ISBN, MAX(DATEDIFF(DAY, EMANET_TARIHI, TESLIM_TARIHI)) AS En_Uzun_Sure FROM EMANET
GROUP BY ISBN;
SELECT ISBN, MIN(DATEDIFF(DAY, EMANET_TARIHI, TESLIM_TARIHI)) AS En_Kisa_Sure
FROM EMANET GROUP BY ISBN;
--------------------------
--(14.soru)Emanet verilen kitaplar�, emanet alan �yelerin ad ve soyad bilgisini listelemek i�in gerekli SQL ifadesini yaz�n�z 
SELECT KITAPLAR.ISBN, KITAP_ADI, UYE_ADI, UYE_SOYADI FROM EMANET
INNER JOIN UYELER ON EMANET.UYE_NO = UYELER.UYE_NO 

--*Enes Tepe 223010720075 2.S�n�f 2.��retim*