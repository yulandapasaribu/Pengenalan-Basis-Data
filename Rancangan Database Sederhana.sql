CREATE DATABASE Introduction_To_Database
USE Introduction_To_Database
DROP DATABASE Introduction_To_Database

CREATE TABLE Akun_Admin(
username VARCHAR(50) PRIMARY KEY,
pasword VARCHAR(50),
id_admin VARCHAR(50),
FOREIGN KEY (id_admin) REFERENCES Admin(id_admin)
);
SELECT *FROM Akun_Admin
INSERT INTO Akun_Admin VALUES
('iokapurba','iokapurba500','a111'),
('jonathanhutabarat','jonathan300','a112'),
('marudutpasaribu','marudut100','a113'),
('yizrelsipahutar','yizrel400','a114'),
('yosanchoselien','yosancho200','a115')

CREATE TABLE Akun_Customer(
username VARCHAR(50) PRIMARY KEY,
pasword VARCHAR(50),
id_customer VARCHAR(50),
FOREIGN KEY (id_customer) REFERENCES Customer(id_customer)
);
SELECT *FROM Akun_Customer
INSERT INTO Akun_Customer VALUES
('joynapitupulu','joynapitupulu005','c933'),
('salomosinambela','salomo003','c934'),
('rivaelsagala','rivael001','c935'),
('franspanjaitan','frans004','c936'),
('davidsilalahi','david002','c937')

CREATE TABLE Admin(
id_admin VARCHAR(50) PRIMARY KEY,
email VARCHAR(50),
no_hp CHAR(12)
);
SELECT * FROM Admin
INSERT INTO Admin VALUES
('a111','iokapurba15@gmail.com','082247845762'),
('a112','jonathanhutabarat13@gmail.com','085227815768'),
('a113','marudutpasaribu11@gmail.com','085247809765'),
('a114','yizrelsipahutar14@gmail.com','082247805969'),
('a115','yosanchoselien12@gmail.com','085247805769')

CREATE TABLE Kategori(
id_kategori INT PRIMARY KEY UNIQUE KEY,
nama_kategori VARCHAR(50)
);
SELECT *FROM Kategori
INSERT INTO Kategori VALUES
(11,'Keripik'),
(22,'Sambal'),
(33,'Minuman'),
(44,'Kacang'),
(55,'Keripik')

CREATE TABLE Customer(
id_customer VARCHAR(50) PRIMARY KEY UNIQUE KEY,
nama VARCHAR(100),
alamat VARCHAR(100),
kecamatan VARCHAR(100),
kabupaten VARCHAR(100),
no_hp CHAR(12) UNIQUE KEY
);

SELECT *FROM Customer
INSERT INTO Customer VALUES
('c933','James Pasaribu','Jl.Sisingamangaraja,Ds.Huta Ginjang','Balige','Toba','082276907711'),
('c934','Angel Sibarani','Jl.Ahmad Yani,Kel.Sosor Dolok','Balige','Toba','085276707922'),
('c935','Jordan Simangunsong','Jl.Imam Bonjol,Kel.Sitoluama','Laguboti','Toba','082370908833'),
('c936','Margareth Simorangkir','Jl.Merdeka','Laguboti','Toba','082277117744'),
('c937','Gloria Steinem Hasibuan','Jl.Diponegoro,Kel.Sipoholon','Borbor','Toba','085206917755')

CREATE TABLE Transaksi(
id_transaksi INT PRIMARY KEY UNIQUE KEY,
jumlah_transaksi VARCHAR(20),
tanggal_transaksi DATE,
status_transaksi VARCHAR(50) CHECK (status_transaksi IN('berhasil','gagal','sedang diproses')),
id_customer INT UNIQUE KEY,
FOREIGN KEY(id_customer) REFERENCES Customer(id_customer)
);

SELECT *FROM Transaksi
INSERT INTO Transaksi VALUES
(50,'Rp.125.000','2023-03-22','berhasil',933),
(60,'Rp.125.000','2023-01-11','berhasil',934),
(70,'Rp.100.000','2023-01-11','berhasil',935),
(80,'Rp.30.000','2022-12-25','sedang diproses',936),
(90,'Rp.75.000','2022-11-27','gagal',937)

CREATE TABLE Transaksi_Customer(
id_transaksi INT UNIQUE KEY,
id_customer INT UNIQUE KEY,
PRIMARY KEY(id_transaksi,id_customer),
FOREIGN KEY(id_transaksi) REFERENCES Transaksi(id_transaksi),
FOREIGN KEY(id_customer) REFERENCES customer(id_customer)
);
SELECT *FROM Transaksi_Customer
INSERT INTO Transaksi_Customer VALUES
(50,933),
(60,934),
(70,935),
(80,936),
(90,937)

CREATE TABLE Product (
id_product INT PRIMARY KEY UNIQUE KEY,
nama_product VARCHAR(100),
harga DECIMAL(15,3),
berat_product FLOAT,
stok INT,
id_admin INT,
id_kategori INT,
id_transaksi INT,
id_customer INT,
FOREIGN KEY (id_admin) REFERENCES Admin(id_admin),
FOREIGN KEY (id_kategori) REFERENCES Kategori(id_kategori),
FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi),
FOREIGN KEY (id_customer) REFERENCES Customer(id_customer)
);

SELECT *FROM Product
INSERT INTO Product VALUES
(55,'Keripik varian pedas manis','15','200',23,111,11,50,933),
(66,'Sambal teri andaliman','35','500',45,112,22,60,934),
(77,'Meinoel drink','20','700',43,113,33,70,935),
(88,'Meinoel kacang telur','15','200',32,114,44,80,936),
(99,'Keripik varian original','15','200',22,115,55,90,937)

CREATE TABLE Product_Customer(
id_product INT UNIQUE KEY,
id_customer INT UNIQUE KEY,
PRIMARY KEY(id_product,id_customer),
FOREIGN KEY(id_product) REFERENCES product(id_product),
FOREIGN KEY(id_customer) REFERENCES customer(id_customer)
);

SELECT *FROM Product_Customer
INSERT INTO Product_Customer VALUES
(55,933),
(66,934),
(77,935),
(88,936),
(99,937)

CREATE TABLE Transaksi_Product(
id_transaksi INT UNIQUE KEY,
id_product INT UNIQUE KEY,
PRIMARY KEY(id_transaksi,id_product),
FOREIGN KEY(id_transaksi) REFERENCES Transaksi(id_transaksi),
FOREIGN KEY(id_product) REFERENCES Product(id_product)
);

SELECT *FROM Transaksi_Product
INSERT INTO Transaksi_Product VALUES
(50,55),
(60,66),
(70,77),
(80,88),
(90,99)

CREATE TABLE Feedback(
id_feedback INT PRIMARY KEY UNIQUE KEY,
isi_feedback TEXT,
tanggal_feedback DATE,
id_admin INT UNIQUE KEY,
id_customer INT UNIQUE KEY,
FOREIGN KEY(id_admin) REFERENCES Admin(id_admin),
FOREIGN KEY(id_customer) REFERENCES customer(id_customer)
);

SELECT *FROM Feedback
INSERT INTO Feedback VALUES
(31,'Ini adalah keripik pisang terbaik yang pernah saya coba!Saya suka aromanya yang membuat saya ingin terus makan.','2022-12-29',111,933),
(32,'Saya suka sambal pedas, dan sambal andaliman ini menjadi favorit saya.Pedasnya pas,dan rasa andaliman-nya membuat saya ketagihan.','2022-09-18',112,934),
(33,'Saya sangat menyukai minuman ini. Rasanya segar dan manis.Sangat cocok untuk diminum di siang hari atau saat cuaca sedang panas.','2022-12-29',113,935),
(34,'Saya suka kacang telur ini karena tidak terlalu keras saat digigit dan memiliki rasa yang lezat.','2023-07-23',114,936),
(35,'Keripik pisang varian original ini sangat enak! Teksturnya renyah dan rasanya sangat autentik.','2023-06-23',115,937)

CREATE TABLE Feedback_Customer(
id_feedback INT UNIQUE KEY,
id_customer INT UNIQUE KEY,
PRIMARY KEY(id_feedback,id_customer),
FOREIGN KEY(id_feedback) REFERENCES Feedback(id_feedback),
FOREIGN KEY(id_customer) REFERENCES customer(id_customer)
);

SELECT *FROM Feedback_Customer
INSERT INTO Feedback_Customer VALUES
(31,933),
(32,934),
(33,935),
(34,936),
(35,937)





