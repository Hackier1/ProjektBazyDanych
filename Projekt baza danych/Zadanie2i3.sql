DROP TABLE IF EXISTS `zamowienia`;
DROP TABLE IF EXISTS `klienci`;
DROP TABLE IF EXISTS `pracownicy`;
DROP TABLE IF EXISTS `produkty`;
DROP TABLE IF EXISTS `przesylka`;


CREATE TABLE `klienci` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Imie` varchar(30) NOT NULL,
  `Nazwisko` varchar(40) DEFAULT NULL,
  `Plec` varchar(1) DEFAULT NULL,
  `NrZamowienia` bigint DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Tel` int DEFAULT NULL,
  `Adres` varchar(40) DEFAULT NULL,
  `Ulica` varchar(40) DEFAULT NULL,
  `NrRachunku` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `pracownicy` (
  `ID` bigint NOT NULL,
  `Imie` varchar(20) DEFAULT NULL,
  `DrugieImie` varchar(20) DEFAULT NULL,
  `Nazwisko` varchar(20) DEFAULT NULL,
  `Plec` varchar(1) DEFAULT NULL,
  `DataUrodzenia` date DEFAULT NULL,
  `AdresEmail` varchar(40) DEFAULT NULL,
  `Telefon` int DEFAULT NULL,
  `MiejsceZamieszkania` varchar(20) DEFAULT NULL,
  `Ulica` varchar(255) DEFAULT NULL,
  `Zarobek` int DEFAULT NULL,
  `Stanowisko` varchar(30) DEFAULT NULL,
  `RodzajUmowy` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `produkty` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(40) DEFAULT NULL,
  `CenaOryginalna` int DEFAULT NULL,
  `CenaPoPromocji` int DEFAULT NULL,
  `TypProduktu` varchar(30) DEFAULT NULL,
  `OkresGwarancji` varchar(30) DEFAULT NULL,
  `Producent` varchar(30) DEFAULT NULL,
  `StanMagazynu` int DEFAULT NULL,
  `Waga` varchar(6) DEFAULT NULL,
  `Rozmiar` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

CREATE TABLE `przesylka` (
  `IDPrzesylki` int NOT NULL AUTO_INCREMENT,
  `DataWysylki` date DEFAULT NULL,
  `FirmaPrzewozowa` varchar(30) DEFAULT NULL,
  `NrZamowienia` bigint UNIQUE NOT NULL,
  PRIMARY KEY (`IDPrzesylki`)
);

CREATE TABLE `zamowienia` (
  `DataZamowienia` date DEFAULT NULL,
  `IDPracownika` bigint DEFAULT NULL,
  `IDKlienta` int DEFAULT NULL,
  `NrProduktu` int NOT NULL,
  `NrZamowienia` bigint UNIQUE NOT NULL,
  PRIMARY KEY `NrZamowienia` (`NrZamowienia`),
  FOREIGN KEY (`IDPracownika`) REFERENCES `pracownicy`(`ID`),
  FOREIGN KEY (`IDKlienta`) REFERENCES `klienci`(`ID`),
  FOREIGN KEY (`NrProduktu`) REFERENCES `produkty`(`ID`),
  FOREIGN KEY (`NrZamowienia`) REFERENCES `przesylka`(`NrZamowienia`)
);

INSERT INTO `klienci` VALUES (1,'Grażyna','Piorkowska','K',738291084612,'PirokowskaG@wp.pl',509909009,'Procownice','3','PL 08 9125 1015 2641 9485 8404 3848'),(2,'Marian','Piekny','M',738291394612,'Bulbak@gmail.com',509909328,'Pszczolki','Miodowa6','PL 08 9125 1015 2641 7209 8404 3848'),(3,'Urszula','Piorkowska','K',738227104612,'PirokowskaU@wp.pl',709909009,'Procownice','3','PL 08 9125 1015 2641 9485 9087 3848'),(4,'Urszula','Nowak','K',790183764612,'N0wak@wp.pl',709909088,'Nowakowice','10','PL 08 9125 1015 2641 9999 9087 3848'),(5,'Filip','Klimek','M',509583764612,'Klima@wp.pl',515609088,'NowaWies','32','PL 10 1111 1015 2641 9999 9087 3848'),(6,'Drozd','Bjorn','M',789583764612,'csoimcisdmo@wp.pl',789609088,'StaraWies','32','PL 88 1111 1015 2641 9999 9087 3848'),(7,'Bjorn','Kolka','M',675583764612,'dawidus@wp.pl',675609088,'ZloteMiasto','Miastowa67','PL 23 6111 1015 2641 9999 9087 3848'),(8,'Andrzej','Banach','M',175583764612,'Banan@wp.pl',175609088,'GumiMiasto','MiastoGumisi17','PL 23 2200 1015 2641 9999 9087 3848'),(9,'Bogdan','Banach','M',175583764612,'Banan@wp.pl',175609088,'GumiMiasto','MiastoGumisi17','PL 23 2200 1015 2641 9999 9087 3848'),(10,'Kasia','Banach','K',175583764612,'Banan@wp.pl',785609088,'GumiMiasto','MiastoGumisi17','PL 23 2200 1015 2641 9999 9087 3848'),(11,'Karol','Krawczyl','M',175111111111,'TadeuszNorek@wp.pl',111111188,'Scieki','2','PL 23 2200 1123 2641 9999 9087 3848');
INSERT INTO `pracownicy` VALUES (938201948,'Katarzyna','-','Goralska','K','2001-12-04','KasiaG@wp.pl',515344304,'Siemcichy','3',1500,'ObslugaKlienta','NaCzasNieokreslony'),(1234567811,'Joseph','-','Martyniuk','M','1988-12-04','Zenon123@wp.pl',532844304,'Gwizadki','Polna11',2500,'ObslugaKlienta','OkresProbny'),(1234567890,'Marek','-','Slon','M','1978-11-20','Zyrafa@wp.pl',579487478,'Poznan','MarkaAureliusza2',15000,'KierownikSprzedazy','NaCzasOkreslony'),(2212604444,'Jan','-','Kowalski','M','1990-04-25','JanKowalski@wp.pl',515333405,'Krakow','Kopernika3',3000,'Sprzedawca','NaOkresProbny'),(2212605973,'Marcin','Filip','Dondalski','M','1996-05-06','Dondalskii@wp.pl',808333405,'Warszawa','3Maja50',10000,'DoradcaKlienta','NaCzasNieokreslony'),(6839601756,'Marian','-','Pazdzioch','M','1983-11-18','Kiepski@wp.pl',738103854,'Skazani','Cela2',3300,'OblugaKlienta','OkresProbny'),(6839601758,'Katarzyna','-','Dondalska','K','1999-12-04','KasiaD@wp.pl',515844304,'Kluchy','30',2500,'ObslugaKlienta','NaCzasNieokreslony'),(7380193786,'Anna','Mariola','Kaszuba','K','2000-04-25','Anusia@wp.pl',832091284,'Gdansk','Wyzwolenia113',3000,'Sprzedawca','NaOkresProbny'),(8462091789,'Grzegorz','-','Brzeczyszczykiewicz','M','1976-12-20','Brzeczyk@wp.pl',578297109,'Krakow','Curie30',4000,'Sprzedawca','NaCzasOkreslony'),(9045678960,'Marek','-','Aureliusz','M','1975-11-20','Toja@wp.pl',579487109,'Krakow','Sklodowska40',4500,'Sprzedawca','NaCzasNieokreslony'),(9045678967,'Aneta','Katarzyna','Slon','K','1979-11-10','Zyrafa2@wp.pl',678528109,'Poznan','MarkaAureliusza2',14000,'KierownikOslugiKlienta','NaCzasOkreslony');
INSERT INTO `produkty` VALUES (2,'SAMSUNG 3Agf',2000,2000,'Telewizor','2lata','SAMSUNG',5,'1kg','2mmx3mx5m'),(3,'kabel zasilający 58c',100,100,'kabel','','Logitech',1,'5dag','50m'),(4,'Nokia3310',50,20,'Telefon','rok','Nokia',30,'3kg','3cmx3cmx5cm'),(5,'Nokia1212',5000,5000,'Telefon','3lata','Nokia',100,'50dag','2mmx5cmx10cm'),(6,'Tableto56',50000,50000,'Tablet','4lata','Nokia',0,'2dag','2mmx4mx4m'),(7,'Tableto57',500000,500000,'Tablet','4lata','Nokia',0,'1dag','2mmx4mx5m'),(8,'Telephone2',50,45,'Telefon','','Nokia',100,'3dag','5mmx10cmx20cm'),(9,'Telephone3',45,45,'Telefon','','Nokia',100,'5dag','5mmx10cmx20cm'),(10,'SAMSSUNG a3',4000,3500,'Telefon','3lata','SAMSUNG',20,'3dag','2mmx50cmx30cm'),(11,'SAMSSUNG a4',5000,3500,'Telefon','3lata','SAMSUNG',30,'2dag','1mmx50cmx30cm'),(12,'SAMSSUNG a5pro',6000,3500,'Telefon','3lata','SAMSUNG',10,'2dag','0,5mmx50cmx30cm');
INSERT INTO `przesylka` VALUES (1,'2002-12-12','HDPKurier',1234),(2,'2002-12-20','HDPKurier',1235),(3,'2002-12-21','Najpredsi',1236),(4,'2002-12-21','Najpredsi',1237),(5,'2002-12-25','PocztaPolska',1238),(6,'2002-12-30','PocztaPolska',1239),(7,'2003-12-01','PocztaPolska',1240),(8,'2003-12-02','PocztaPolska',1241),(9,'2003-12-02','PocztaPolska',1242),(10,'2003-12-02','PocztaPolska',1243),(11,'2003-12-05','PocztaPolska',1244);
