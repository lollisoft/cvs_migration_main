-- +---------------------------------------------------------
-- | MODEL       : lbDMF
-- | AUTHOR      :
-- | GENERATED BY: Data Architect
-- +---------------------------------------------------------

CREATE TABLE column_types
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  name char(30) NOT NULL,
  tablename char(30) NOT NULL,
  ro BOOL DEFAULT 'false',
  specialColumn BOOL DEFAULT 'false',
  controlType char(30) DEFAULT '',
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: Actions
-- | This defines custom actions for an application. These
-- | actions may be displayed in formulars as buttons or later
-- | as detail views in a tab view manner.
-- +---------------------------------------------------------

CREATE TABLE actions
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  name char(50) NOT NULL,
  typ  INTEGER,
  source char(100),
  target INTEGER,
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: action_types
-- | This table defines general action types, that could be
-- | used for actions. This may be 'button press'
-- | 
-- +---------------------------------------------------------

CREATE TABLE action_types
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  bezeichnung char(100),
  action_handler char(100),	-- the functor with the implementation of the handler
  module	 char(100),	-- the module with the implementation of the handler
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: action_target
-- | 
-- | 
-- | 
-- +---------------------------------------------------------

CREATE TABLE action_steps
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  actionid	INTEGER,
  bezeichnung	char(100),
  a_order_nr	INTEGER,
  type		INTEGER, -- May be NULL for the first target
  what		char(100),
  PRIMARY KEY (id)
);

CREATE TABLE formular_actions
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  formular	INTEGER,
  action	INTEGER,
  event		CHAR(100),
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: Translations
-- +---------------------------------------------------------


CREATE TABLE translations
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  text VARCHAR(100),
  translated VARCHAR(100),
  language CHAR(30) default 'german',
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: Anwendungen
-- +---------------------------------------------------------

CREATE TABLE Anwendungen
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100),
  Titel VARCHAR(100),
  ModuleName VARCHAR(100),
  Functor VARCHAR(100),
  Interface VARCHAR(100),
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: Anwendungs_Parameter
-- +---------------------------------------------------------

CREATE TABLE Anwendungs_Parameter
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  ParameterName VARCHAR(30),
  ParameterValue VARCHAR(255),
  AnwendungID INTEGER,
  PRIMARY KEY (id)
);



-- +---------------------------------------------------------
-- | TABLE: Formulare
-- +---------------------------------------------------------
CREATE TABLE Formulare
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  Name VARCHAR(30),
  MenuName VARCHAR(30),
  EventName VARCHAR(30),
  MenuHilfe VARCHAR(100),
  AnwendungID INTEGER,
  Typ INTEGER NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY FK_AnwendungID (AnwendungID) REFERENCES Anwendungen (id)
);


ALTER TABLE `Formulare` ADD FOREIGN KEY `FK_Typ` (`Typ`)
    REFERENCES `Formulartypen` (`id`);

-- +---------------------------------------------------------
-- | TABLE: Formular_Parameters
-- +---------------------------------------------------------
CREATE TABLE Formular_Parameters
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  ParameterName VARCHAR(30),
  ParameterValue VARCHAR(255),
  FormularID INTEGER,
  PRIMARY KEY (id)
);

ALTER TABLE `Formular_Parameters` ADD FOREIGN KEY `FK_FormularID` (`FormularID`)
    REFERENCES `Formulare` (`id`);

-- +---------------------------------------------------------
-- | TABLE: ForeignKey_VisibleData_Mapping
-- +---------------------------------------------------------

CREATE TABLE ForeignKey_VisibleData_Mapping
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  FKName	VARCHAR(100),
  FKTable	VARCHAR(100),
  PKName	VARCHAR(100),
  PKTable	VARCHAR(100),
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: Anwendungen_Formulare
-- +---------------------------------------------------------
CREATE TABLE Anwendungen_Formulare
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  AnwendungID INTEGER NOT NULL,
  FormularID INTEGER NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE `Anwendungen_Formulare` ADD FOREIGN KEY `FK_AnwendungID` (`AnwendungID`)
    REFERENCES `Anwendungen` (`id`);

ALTER TABLE `Anwendungen_Formulare` ADD FOREIGN KEY `FK_FormularID` (`FormularID`)
    REFERENCES `Formulare` (`id`);

-- +---------------------------------------------------------
-- | TABLE: Anwendungsberechtigungen
-- +---------------------------------------------------------
CREATE TABLE Anwendungsberechtigungen
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  idUser INTEGER,
  idFormular INTEGER,
  PRIMARY KEY (id)
);

ALTER TABLE `Anwendungsberechtigungen` ADD FOREIGN KEY `FK_idUser` (`idUser`)
    REFERENCES `Users` (`id`);

ALTER TABLE `Anwendungsberechtigungen` ADD FOREIGN KEY `FK_idFormular` (`idFormular`)
    REFERENCES `Formulare` (`id`);

-- +---------------------------------------------------------
-- | TABLE: Formulartypen
-- +---------------------------------------------------------
CREATE TABLE Formulartypen
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  HandlerModule VARCHAR(30),
  HandlerFunctor VARCHAR(100),
  HandlerInterface VARCHAR(100),
  Beschreibung VARCHAR(254),
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: User
-- +---------------------------------------------------------
CREATE TABLE Users
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  Name VARCHAR(30),
  Vorname VARCHAR(30),
  userid VARCHAR(30),
  passwort VARCHAR(30),
  lastapp INTEGER,
  PRIMARY KEY (id)
);

-- +---------------------------------------------------------
-- | TABLE: User_Anwendungen
-- +---------------------------------------------------------
CREATE TABLE User_Anwendungen
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  userid INTEGER NOT NULL,
  AnwendungenId INTEGER NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE `User_Anwendungen` ADD FOREIGN KEY `FK_userid` (`userid`)
    REFERENCES `Users` (`id`);

ALTER TABLE `User_Anwendungen` ADD FOREIGN KEY `FK_AnwendungenId` (`AnwendungenId`)
    REFERENCES `Anwendungen` (`id`);

CREATE TABLE report_parameters
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  report CHAR(50),
  name CHAR(50) NOT NULL,
  value INTEGER  NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE report_texts
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  report CHAR(50),
  line INTEGER,
  text CHAR(255),
  PRIMARY KEY (id)
);


-- +---------------------------------------------------------
-- | DATA
-- +---------------------------------------------------------

commit;
