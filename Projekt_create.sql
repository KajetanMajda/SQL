-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-10 12:52:51.019

-- tables
-- Table: Clubs
CREATE TABLE Clubs (
    name varchar(50) NOT NULL,
    Leagues_id int NOT NULL,
    Stadiums_id int NOT NULL,
    CONSTRAINT Clubs_pk PRIMARY KEY (name)
);

-- Table: Countries
CREATE TABLE Countries (
    fifa_code varchar(3) NOT NULL,
    name varchar(50) NOT NULL,
    capitol varchar(50) NOT NULL,
    CONSTRAINT Countries_pk PRIMARY KEY (fifa_code)
);

-- Table: Euro
CREATE TABLE Euro (
    year varchar(4) NOT NULL,
    Countries_fifa_code varchar(3) NOT NULL,
    CONSTRAINT Euro_pk PRIMARY KEY (year)
);

-- Table: Footballers
CREATE TABLE Footballers (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    surname varchar(50) NOT NULL,
    data_of_birth date NOT NULL,
    tshirt_number varchar(2) NOT NULL,
    Countries_fifa_code varchar(3) NOT NULL,
    Clubs_name varchar(50) NOT NULL,
    CONSTRAINT Footballers_pk PRIMARY KEY (id)
);

-- Table: Footballers_performance
CREATE TABLE Footballers_performance (
    id int NOT NULL AUTO_INCREMENT,
    goals int NOT NULL,
    assists int NOT NULL,
    enemy varchar(50) NOT NULL,
    Footballers_id int NOT NULL,
    CONSTRAINT Footballers_performance_pk PRIMARY KEY (id)
);

-- Table: Golden_Ball
CREATE TABLE Golden_Ball (
    year varchar(4) NOT NULL,
    Footballers_id int NOT NULL,
    CONSTRAINT Golden_Ball_pk PRIMARY KEY (year)
);

-- Table: Leagues
CREATE TABLE Leagues (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    CONSTRAINT Leagues_pk PRIMARY KEY (id)
);

-- Table: Stadiums
CREATE TABLE Stadiums (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(50) NOT NULL,
    capacity int NOT NULL,
    CONSTRAINT Stadiums_pk PRIMARY KEY (id)
);

-- Table: Wages
CREATE TABLE Wages (
    id int NOT NULL AUTO_INCREMENT,
    salary int NOT NULL,
    Footballers_id int NOT NULL,
    CONSTRAINT Wages_pk PRIMARY KEY (id)
);

-- Table: World_Cup
CREATE TABLE World_Cup (
    year varchar(4) NOT NULL,
    Countries_fifa_code varchar(3) NOT NULL,
    CONSTRAINT World_Cup_pk PRIMARY KEY (year)
);

-- foreign keys
-- Reference: Clubs_Leagues (table: Clubs)
ALTER TABLE Clubs ADD CONSTRAINT Clubs_Leagues FOREIGN KEY Clubs_Leagues (Leagues_id)
    REFERENCES Leagues (id);

-- Reference: Clubs_Stadiums (table: Clubs)
ALTER TABLE Clubs ADD CONSTRAINT Clubs_Stadiums FOREIGN KEY Clubs_Stadiums (Stadiums_id)
    REFERENCES Stadiums (id);

-- Reference: Euro_Countries (table: Euro)
ALTER TABLE Euro ADD CONSTRAINT Euro_Countries FOREIGN KEY Euro_Countries (Countries_fifa_code)
    REFERENCES Countries (fifa_code);

-- Reference: Footballers_Clubs (table: Footballers)
ALTER TABLE Footballers ADD CONSTRAINT Footballers_Clubs FOREIGN KEY Footballers_Clubs (Clubs_name)
    REFERENCES Clubs (name);

-- Reference: Footballers_Countries (table: Footballers)
ALTER TABLE Footballers ADD CONSTRAINT Footballers_Countries FOREIGN KEY Footballers_Countries (Countries_fifa_code)
    REFERENCES Countries (fifa_code);

-- Reference: Footballers_performance_Footballers (table: Footballers_performance)
ALTER TABLE Footballers_performance ADD CONSTRAINT Footballers_performance_Footballers FOREIGN KEY Footballers_performance_Footballers (Footballers_id)
    REFERENCES Footballers (id);

-- Reference: Golden_Ball_Footballers (table: Golden_Ball)
ALTER TABLE Golden_Ball ADD CONSTRAINT Golden_Ball_Footballers FOREIGN KEY Golden_Ball_Footballers (Footballers_id)
    REFERENCES Footballers (id);

-- Reference: World_Cup_Countries (table: World_Cup)
ALTER TABLE World_Cup ADD CONSTRAINT World_Cup_Countries FOREIGN KEY World_Cup_Countries (Countries_fifa_code)
    REFERENCES Countries (fifa_code);

-- Reference: wages_Footballers (table: Wages)
ALTER TABLE Wages ADD CONSTRAINT wages_Footballers FOREIGN KEY wages_Footballers (Footballers_id)
    REFERENCES Footballers (id);

-- End of file.

