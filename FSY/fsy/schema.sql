DROP TABLE IF EXISTS company;
-- DROP TABLE IF EXISTS youth_group;
-- DROP TABLE IF EXISTS company_responsable;
DROP TABLE IF EXISTS lider;
DROP TABLE IF EXISTS participant;
DROP TABLE IF EXISTS presence;
DROP TABLE IF EXISTS rooms;


CREATE TABLE company (
  id INTEGER PRIMARY KEY AUTOINCREMENT
);


-- CREATE TABLE youth_group (
--   id INTEGER PRIMARY KEY AUTOINCREMENT,
--   gender TEXT CHECK(gender IN ('M','F')),
--   company_id INTEGER,
--   FOREIGN KEY (company_id) REFERENCES company (id)
--     ON UPDATE SET NULL
--     ON DELETE SET NULL 
-- );


-- CREATE TABLE company_responsable (
--   lider_id INTEGER,
--   company_id INTEGER,
--   FOREIGN KEY (lider_id) REFERENCES lider (id)
--     ON UPDATE SET NULL
--     ON DELETE SET NULL,
--   FOREIGN KEY (company_id) REFERENCES company (id)
--     ON UPDATE SET NULL
--     ON DELETE SET NULL 
-- );


CREATE TABLE lider (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  responsability_level TEXT CHECK(responsability_level IN ('ADMINISTRADOR','COORDENADOR','CONSULTOR')),
  gender TEXT CHECK(gender IN ('M','F')),
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  telephone TEXT NOT NULL,
  photo BLOB,
  company_id INTEGER,
  room TEXT,
  hotel TEXT,
  FOREIGN KEY (company_id) REFERENCES company (id) 
    ON UPDATE SET NULL 
    ON DELETE SET NULL
  -- FOREIGN KEY (room) REFERENCES rooms (room)
  --   ON UPDATE SET NULL
  --   ON DELETE SET NULL,
  -- FOREIGN KEY (hotel) REFERENCES rooms (hotel)
  --   ON UPDATE SET NULL
  --   ON DELETE SET NULL
);


CREATE TABLE participant (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  age INTEGER NOT NULL,
  stake TEXT,
  ward TEXT,
  document TEXT,
  gender TEXT CHECK(gender IN ('M','F')),
  checked_in TEXT CHECK(checked_in IN ('SIM','NAO')),
  kit TEXT CHECK(kit IN ('SIM','NAO')),
  name_tag TEXT CHECK(name_tag IN ('SIM','NAO')),
  shirt TEXT CHECK(shirt IN ('SIM','NAO')),
  shirt_size TEXT CHECK(shirt IN ('P', 'M', 'G', 'GG', 'XG')),
  musical_program TEXT CHECK(musical_program IN ('SIM','NAO')),
  varieties_show TEXT CHECK(varieties_show IN ('SIM','NAO')),
  photo BLOB,
  company_id INTEGER,
  room INTEGER,
  hotel TEXT,
  FOREIGN KEY (company_id) REFERENCES company (id)
    ON UPDATE SET NULL
    ON DELETE SET NULL
  -- FOREIGN KEY (room) REFERENCES rooms (room)
  --   ON UPDATE SET NULL
  --   ON DELETE SET NULL,
  -- FOREIGN KEY (hotel) REFERENCES rooms (hotel)
  --   ON UPDATE SET NULL
  --   ON DELETE SET NULL
);


-- CREATE TABLE presence (
--   participant_id INTEGER,
--   sabado INTEGER DEFAULT(FALSE) NOT NULL,
--   domingo INTEGER DEFAULT(FALSE) NOT NULL,
--   segunda INTEGER DEFAULT(FALSE) NOT NULL,
--   terca INTEGER DEFAULT(FALSE) NOT NULL,
--   quarta INTEGER DEFAULT(FALSE) NOT NULL,
--   FOREIGN KEY (participant_id) REFERENCES participant (id)
--     ON UPDATE SET NULL
--     ON DELETE SET NULL 
-- );


-- CREATE TABLE rooms (
--   room INTEGER NOT NULL,
--   hotel TEXT CHECK(hotel IN ('NACIONAL INN','GOLDEN PARK')),
--   PRIMARY KEY (room, hotel)
-- );



-- DEFAULT ADDED DATA

INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);
INSERT INTO company (id) VALUES (NULL);

-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 1);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 1);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 2);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 2);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 3);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 3);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 4);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 4);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 5);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 5);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 6);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 6);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 7);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 7);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 8);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 8);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 9);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 9);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 10);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 10);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 11);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 11);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 12);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 12);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 13);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 13);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 14);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 14);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 15);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 15);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 16);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 16);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 17);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 17);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 18);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 18);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 19);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 19);
-- INSERT INTO youth_group (gender, company_id) VALUES ('M', 20);
-- INSERT INTO youth_group (gender, company_id) VALUES ('F', 20);


-- INSERT INTO rooms (room, hotel) VALUES (101, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (102, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (103, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (104, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (105, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (106, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (107, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (108, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (109, 'NACIONAL INN');
-- INSERT INTO rooms (room, hotel) VALUES (110, 'NACIONAL INN');


-- INSERT INTO rooms (room, hotel) VALUES (101, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (102, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (103, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (104, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (105, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (106, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (107, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (108, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (109, 'GOLDEN PARK');
-- INSERT INTO rooms (room, hotel) VALUES (110, 'GOLDEN PARK');


INSERT INTO lider (name, gender, telephone, username, password, responsability_level)
  VALUES (UPPER('carlos roberto dos santos junior'), 'M', '16981129918', 'carlos', 'carlos', 'ADMINISTRADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level)
  VALUES (UPPER('isabella moreira da silva'), 'F', '19993111886', 'isabella', 'isabella', 'ADMINISTRADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level)
  VALUES (UPPER('heitor de carvalho fatori'), 'M', '16991749629', 'heitor', 'heitor', 'ADMINISTRADOR');



INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('MARINA MIRANDA', 'F', '11965619358', 'marina.miranda', 'marina.miranda', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('ENIO MARTINELLI', 'M', '35999833058', 'enio.martinelli', 'enio.martinelli', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('MARIANA CARDOSO DE OLIVEIRA', 'F', '19982708737', 'mariana.cardoso', 'mariana.cardoso', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('ISABELA DA SILVA', 'F', '16992542212', 'isabela.da', 'isabela.da', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('ISABELLE MONIQUE MARIANO', 'F', '19993432592', 'isabelle.monique', 'isabelle.monique', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('JUDIY GRACIELE MAIA CLEMENTE', 'F', '19991198065', 'judiy.graciele', 'judiy.graciele', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('RAYSSA DE SOUSA TAVARES', 'F', '(19) 99543-5907', 'rayssa.de', 'rayssa.de', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('GUSTAVO GONCALVES MADUREIRA PARA', 'M', '19989272686', 'gustavo.goncalves', 'gustavo.goncalves', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('MATHEUS DE CARVALHO', 'M', '19997756604', 'matheus.de', 'matheus.de', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('BRENDA LOREN DANTAS PEREIRA', 'F', '19992061079', 'brenda.loren', 'brenda.loren', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('HENRIQUE DOS SANTOS LIRA', 'M', '19991129435', 'henrique.dos', 'henrique.dos', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('TAYNA LOPES FERREIRA', 'F', '16991226691', 'tayna.lopes', 'tayna.lopes', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('MARCELO DA SILVA BOTELHO', 'M', '19995961092', 'marcelo.da', 'marcelo.da', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('TAYRONE JORGE DE CAMPOS JUNIOR', 'M', '19996517938', 'tayrone.jorge', 'tayrone.jorge', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('LEANDRO SOROCABA DOS SANTOS', 'M', '19997021308', 'leandro.sorocaba', 'leandro.sorocaba', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('SABRINA VIANA SALIK', 'F', '16992432787', 'sabrina.viana', 'sabrina.viana', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('DEBORAH OLIVEIRA', 'F', '16991663416', 'deborah.oliveira', 'deborah.oliveira', 'COORDENADOR');
INSERT INTO lider (name, gender, telephone, username, password, responsability_level) 
  values ('MICHELLE DE PAIVA BATISTON', 'F', '35920017654', 'michelle.de', 'michelle.de', 'COORDENADOR');


INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('ANDRE PEREIRA', 'CONSULTOR', 'M', '19982335328', 7, 'andre.pereira', 'andre.pereira');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('PABLO MATIAS', 'CONSULTOR', 'M', '19987315075', 12, 'pablo.matias', 'pablo.matias');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('MARCOS BATISTA DELLA-LIBERA', 'CONSULTOR', 'M', '19996001125', 8, 'marcos.batista', 'marcos.batista');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('JEFERSON ROQUE DA SILVA', 'CONSULTOR', 'M', '(19) 98325-4739', 6, 'jeferson.roque', 'jeferson.roque');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('ANA CLARA ALEXANDRE', 'CONSULTOR', 'F', '19982164909', 11, 'ana.clara', 'ana.clara');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('ANDERSON PANTOLFI MORAES', 'CONSULTOR', 'M', '19994844296', 14, 'anderson.pantolfi', 'anderson.pantolfi');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('ANNE MOTA LAZZARI', 'CONSULTOR', 'F', '19989054829', 15, 'anne.mota', 'anne.mota');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('TIFFANY LUISANA FERMIN', 'CONSULTOR', 'F', '19988352800', 13, 'tiffany.luisana', 'tiffany.luisana');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('GABRIELA LUZ RIBEIRO', 'CONSULTOR', 'F', '(19) 9 9581-4936', 4, 'gabriela.luz', 'gabriela.luz');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('SUNAMITA ALVES DE OLIVEIRA YONEYAMA', 'CONSULTOR', 'F', '14997453033', 2, 'sunamita.alves', 'sunamita.alves');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('RAQUEL ELISA MENDONCA GOMES SALES', 'CONSULTOR', 'F', '19991139266', 16, 'raquel.elisa', 'raquel.elisa');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('RAFAELA ARAUJO SANTANA DA SILVA', 'CONSULTOR', 'F', '(19) 98992-6492', 6, 'rafaela.araujo', 'rafaela.araujo');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('EMERSON CALISTA', 'CONSULTOR', 'M', '69992099892', 20, 'emerson.calista', 'emerson.calista');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('RIELLY BELLINI', 'CONSULTOR', 'F', '19991834125', 9, 'rielly.bellini', 'rielly.bellini');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('KHRISTOPHER SOARES', 'CONSULTOR', 'M', '84998172356', 15, 'khristopher.soares', 'khristopher.soares');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('ISABELLA ESTEVAM MOLINA', 'CONSULTOR', 'F', '19998458230', 17, 'isabella.estevam', 'isabella.estevam');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('LETICIA MORAES', 'CONSULTOR', 'F', '16993754930', 18, 'leticia.moraes', 'leticia.moraes');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('KARLA REGINA DOS SANTOS ARRUDA', 'CONSULTOR', 'F', '(19)99632-4651', 14, 'karla.regina', 'karla.regina');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('RONEI CASTRO PEREIRA FILHO', 'CONSULTOR', 'M', '(19) 99709-8487', 18, 'ronei.castro', 'ronei.castro');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('GABRIELLY RODRIGUES LOPES', 'CONSULTOR', 'F', '19991801612', 6, 'gabrielly.rodrigues', 'gabrielly.rodrigues');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('TIAGO FRANCA', 'CONSULTOR', 'M', '19997247572', 10, 'tiago.franca', 'tiago.franca');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('BIANCA ROBERTA OLIVEIRA', 'CONSULTOR', 'F', '14996537020', 5, 'bianca.roberta', 'bianca.roberta');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('IGOR HENRIQUE DA SILVA', 'CONSULTOR', 'M', '14981191866', 5, 'igor.henrique', 'igor.henrique');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('DALIA CRISTINA DA SILVA', 'CONSULTOR', 'F', '19991233184', 8, 'dalia.cristina', 'dalia.cristina');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('CESANDRY LILIET MARIN RODRIGUEZ', 'CONSULTOR', 'F', '19992319455', 12, 'cesandry.liliet', 'cesandry.liliet');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('EMANUELY VALENTIM DE CAMARGO', 'CONSULTOR', 'F', '16988012493', 1, 'emanuely.valentim', 'emanuely.valentim');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('YOHANN CANDIDO', 'CONSULTOR', 'M', '19993694206', 16, 'yohann.candido', 'yohann.candido');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('RICARDO BELLINI', 'CONSULTOR', 'M', '19995237710', 2, 'ricardo.bellini', 'ricardo.bellini');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('FABRICIO JARED PIVETTA DA SILVA', 'CONSULTOR', 'M', '19987557753', 9, 'fabricio.jared', 'fabricio.jared');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('JOAO BIASOTTI', 'CONSULTOR', 'M', '14998552382', 19, 'joao.biasotti', 'joao.biasotti');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('WELLINGTON APOLINARIO', 'CONSULTOR', 'M', '19983652066', 4, 'wellington.apolinario', 'wellington.apolinario');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('PALOMA RAQUEL GOMES', 'CONSULTOR', 'F', '14991077171', 19, 'paloma.raquel', 'paloma.raquel');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('LUIZ PAULO FENIMAM', 'CONSULTOR', 'M', '16997301305', 3, 'luiz.paulo', 'luiz.paulo');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('THAIENE CABRAL', 'CONSULTOR', 'F', '19989096762', 7, 'thaiene.cabral', 'thaiene.cabral');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('KEILA FEITOSA', 'CONSULTOR', 'F', '16981071369', 10, 'keila.feitosa', 'keila.feitosa');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('GUILHERME HENRIQUE PRESUNTO', 'CONSULTOR', 'M', '19992883436', 11, 'guilherme.henrique', 'guilherme.henrique');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('GIOVANI LEAO MACHADO', 'CONSULTOR', 'M', '16992245151', 13, 'giovani.leao', 'giovani.leao');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('GUILHERME PINHO', 'CONSULTOR', 'M', '19982513761', 1, 'guilherme.pinho', 'guilherme.pinho');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('YASMIN TEIXEIRA', 'CONSULTOR', 'F', '19971527432', 3, 'yasmin.teixeira', 'yasmin.teixeira');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('LOREANNA VICTORIA BLANCO SANCHEZ', 'CONSULTOR', 'F', '15991419012', 20, 'loreanna.victoria', 'loreanna.victoria');
INSERT INTO lider (name, responsability_level, gender, telephone, company_id, username, password) VALUES ('GUILHERME MENEZES SALES', 'CONSULTOR', 'M', '19998004583', 17, 'guilherme.menezes', 'guilherme.menezes');
