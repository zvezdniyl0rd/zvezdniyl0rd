USE Автосервис
CREATE TABLE Марки_автомобилей
(ID_Brand INTEGER PRIMARY KEY CHECK (ID_Brand >= 1 AND ID_Brand <= 9999) IDENTITY(1,1),
Name VARCHAR (15) NOT NULL CHECK (Name LIKE REPLICATE('[а-я А-Я]', LEN(Name))));

CREATE TABLE Владельцы
(ID_Code_Owner INTEGER PRIMARY KEY CHECK (ID_Code_Owner >= 1 AND ID_Code_Owner <= 9999) IDENTITY(1,1),
Surname VARCHAR (30) NOT NULL CHECK (Surname LIKE REPLICATE('[а-я А-Я]', LEN(Surname))),
First_Name VARCHAR (15) NOT NULL CHECK (First_Name LIKE REPLICATE('[а-я А-Я]', LEN(First_Name))),
Last_Name VARCHAR (20) NULL CHECK (Last_Name LIKE REPLICATE('[а-я А-Я]', LEN(Last_Name))),
Passport VARCHAR (10) NOT NULL CHECK (Passport LIKE REPLICATE('[0-9]', LEN(Passport))),
Num_License VARCHAR (10) NOT NULL CHECK (Num_License LIKE REPLICATE('[0-9]', LEN(Num_License))),
Phone VARCHAR (11) NOT NULL CHECK (Phone LIKE REPLICATE('[0-9]', LEN(Phone))));

CREATE TABLE Сотрудники
(ID_Code_Assistant INTEGER PRIMARY KEY CHECK (ID_Code_Assistant >= 1 AND ID_Code_Assistant <= 9999) IDENTITY(1,1),
Surname VARCHAR (30) NOT NULL CHECK (Surname LIKE REPLICATE('[а-я А-Я]', LEN(Surname))),
First_Name VARCHAR (15) NOT NULL CHECK (First_Name LIKE REPLICATE('[а-я А-Я]', LEN(First_Name))),
Last_Name VARCHAR (20) NULL CHECK (Last_Name LIKE REPLICATE('[а-я А-Я]', LEN(Last_Name))),
Birthday CHAR (8) NOT NULL CHECK (Birthday BETWEEN '01.01.1950' AND '31.12.2003'),
Sex CHAR (1) NOT NULL CHECK (Sex LIKE REPLICATE('[МЖ]', LEN(Sex))),
Adres VARCHAR (15) NOT NULL CHECK (Adres LIKE REPLICATE('[а-яА-Я , - 0-9]', LEN(Adres))),
Phone VARCHAR (11) NOT NULL CHECK (Phone LIKE REPLICATE('[0-9]', LEN(Phone))),
Passport VARCHAR (10) NOT NULL CHECK (Passport LIKE REPLICATE('[0-9]', LEN(Passport))));

create table Автомобили
(ID_Code_Auto INTEGER PRIMARY KEY CHECK (ID_Code_Auto >= 1 AND ID_Code_Auto <= 9999) IDENTITY(1,1),
ID_Brand INTEGER not null foreign KEY references Марки_автомобилей(ID_Brand),
Reg_Num varchar (8) not null check (Reg_Num like replicate('[0-9 АВЕКМНОРСТХУ]', len(Reg_Num))),
Body varchar (12) null check (Body like replicate('[0-9 A-Z -]', len(Body))),
Engine varchar (6) null check (Engine like replicate('[0-9 A-Z -]', len(Engine))),
Passport VARCHAR (10) NOT NULL CHECK (Passport LIKE REPLICATE('[0-9 A-Z -]', LEN(Passport))),
Birthday CHAR (4) NOT NULL CHECK (Birthday BETWEEN '1985' AND '2022'));

create table Заказ
(ID_Code_Order INTEGER PRIMARY KEY CHECK (ID_Code_Order >= 1 AND ID_Code_Order <= 9999) IDENTITY(1,1),
ID_Code_Owner INTEGER NOT NULL FOREIGN KEY REFERENCES Владельцы(Id_Code_Owner),
ID_Code_Auto INTEGER NOT NULL FOREIGN KEY REFERENCES Автомобили(Id_Code_Auto),
ID_Code_Assistant INTEGER NOT NULL FOREIGN KEY REFERENCES Сотрудники(Id_Code_Assistant),
Data1 DATE NOT NULL CHECK (Data1 BETWEEN '01.01.2013' AND '16.02.2023'),
Data2 DATE NOT NULL CHECK (Data2 BETWEEN '01.01.2013' AND '16.02.2023'));

create table Виды_работ
(ID_Code_Works INTEGER PRIMARY KEY CHECK (ID_Code_Works >= 1 AND ID_Code_Works <= 9999) IDENTITY(1,1),
Name_work VARCHAR (40) NOT NULL CHECK (Name_work LIKE REPLICATE('[а-я А-Я]', LEN(Name_work))),
Price INTEGER NOT NULL CHECK (Price >= 1 AND Price <= 9999),
Garant INTEGER NULL CHECK (Garant >= 1 AND Garant <= 9));

create table Услуги_заказа
(ID_Code_Service INTEGER PRIMARY KEY CHECK (ID_Code_Service >= 1 AND ID_Code_Service <= 9999) IDENTITY(1,1),
ID_Code_Order INTEGER NOT NULL FOREIGN KEY REFERENCES Заказ(Id_Code_Order),
ID_Code_Works INTEGER NOT NULL FOREIGN KEY REFERENCES Виды_работ(Id_Code_Works));
