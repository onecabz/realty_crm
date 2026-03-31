DROP DATABASE IF EXISTS realty_newone;
CREATE DATABASE realty_newone;
USE realty_newone;


DROP TABLE IF EXISTS objects;
CREATE TABLE objects (
	#`id` SERIAL PRIMARY KEY,
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, # убрал UNSIGNED ЧТОБЫ ОСТАВТИТЬ ТОЛЬКО PRIMARY KEY
	# id SERIAL PRIMARY KEY, # BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	law_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id права###########################################',
	owner_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id права###########################################',
	kadastr_num VARCHAR(30) UNIQUE COMMENT 'кадастровый номер',
	object_type ENUM ('Здание', 'Сооружение', 'Помещение', 'Земельный участок') COMMENT 'вид объекта',#VARCHAR(100)
	name VARCHAR(300),
	`assignment` VARCHAR(100) COMMENT 'назначение/разрешенное использование',
	space_longness FLOAT DEFAULT 0.00 COMMENT 'площадь/протяженность',
	build_year YEAR COMMENT 'год завершения строительства/ввода в эксплуатацию',
	adress VARCHAR(500) COMMENT '',
	rnki_number VARCHAR(12) UNIQUE COMMENT 'РНКИ',
	carrying_ammount FLOAT DEFAULT 0 COMMENT 'балансовая стоимость',
	status ENUM('действующий', 'архивный') COMMENT 'статус объекта: действующий/архивный',
	status_date DATETIME DEFAULT NOW() COMMENT 'дата установления статуса'
);


DROP TABLE IF EXISTS owners;
CREATE TABLE owners (
	#`id` SERIAL PRIMARY KEY,
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, # убрал UNSIGNED ЧТОБЫ ОСТАВТИТЬ ТОЛЬКО PRIMARY KEY
	# id SERIAL PRIMARY KEY, # BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	object_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id объекта###########################################',
	law_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id права###########################################',
	encumbrance_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id обременения ###########################################',
	name VARCHAR(300),
	inn INT UNIQUE,
	ogrn INT UNIQUE,
	adress VARCHAR(500) COMMENT '',
	telephone INT UNIQUE,
	email VARCHAR (100) UNIQUE,
	status ENUM('действующий', 'архивный') COMMENT 'статус данной записи: действующий/архивный',
	status_date DATETIME DEFAULT NOW() COMMENT 'дата установления статуса',
	
	FOREIGN KEY (object_id) REFERENCES objects(id)
);


DROP TABLE IF EXISTS law;
CREATE TABLE law (
	#`id` SERIAL PRIMARY KEY,
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, # убрал UNSIGNED ЧТОБЫ ОСТАВТИТЬ ТОЛЬКО PRIMARY KEY
	# id SERIAL PRIMARY KEY, # BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	#law_owner_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id правообладателя###########################################',
	object_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id объекта###########################################',
	right_type ENUM('собственность', 'оперативное управление', 'постоянное (бессрочное) пользование') COMMENT 'вид иного вещного права',
	law_registration_date DATE COMMENT 'дата регистрации иного вещного права',
	owner_registration_number VARCHAR(100) COMMENT 'номер записи о регистрации иного вещного права',
	owner_right_document VARCHAR(1000) COMMENT 'документ-основание возникнования иного вещного права',
	status ENUM('действующий', 'архивный') COMMENT 'статус данной записи: действующий/архивный',
	status_date DATETIME DEFAULT NOW() COMMENT 'дата установления статуса',
	
	###FOREIGN KEY (ject_id) REFERENCES objects(id),
	FOREIGN KEY (object_id) REFERENCES objects(id)#,
	#FOREIGN KEY (law_owner_id) REFERENCES owners(id)
);


DROP TABLE IF EXISTS encumbrance;
CREATE TABLE encumbrance (
	#`id` SERIAL PRIMARY KEY,
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, # убрал UNSIGNED ЧТОБЫ ОСТАВТИТЬ ТОЛЬКО PRIMARY KEY
	# id SERIAL PRIMARY KEY, # BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
	#is_encumbrance BIT COMMENT 'обременение: есть/нет (bool)',
	object_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id объекта###########################################', 
	#object_owner_id BIGINT UNSIGNED NOT NULL COMMENT 'создать foreign key с id правообладателя###########################################',
	encumbrance_type ENUM
		('аренда', 'безвозмездное пользование', 'залог', 'арест', 'ограничение регистрационных действий')
		COMMENT 'виды обремений',
	encumbrance_right_document VARCHAR(300) COMMENT 'документ-основание возникнования обременения',
	encumbrance_registration_date DATE DEFAULT (CURRENT_DATE()) COMMENT 'дата регистрации обременения',
	status ENUM('действующий', 'архивный') COMMENT 'статус данной записи: действующий/архивный',
	status_date DATETIME DEFAULT NOW() COMMENT 'дата установления статуса',
	
	FOREIGN KEY (object_id) REFERENCES objects(id)#,
	#FOREIGN KEY (object_owner_id) REFERENCES owners(id)
);

ALTER TABLE owners ADD CONSTRAINT encumbrance_owner_id
FOREIGN KEY (encumbrance_id) REFERENCES encumbrance(id);
ALTER TABLE owners ADD CONSTRAINT law_owner_id
FOREIGN KEY (law_id) REFERENCES law(id);


/*
ALTER TABLE objects ADD CONSTRAINT obj_owner_id
FOREIGN KEY (owner_id) REFERENCES owners(id);
ALTER TABLE objects ADD CONSTRAINT law_obj_id
FOREIGN KEY (law_id) REFERENCES law(id);
ALTER TABLE objects ADD CONSTRAINT encum_obj_id
FOREIGN KEY (encumbrance_id) REFERENCES encumbrance(id);
/*
INSERT INTO objects (kadastr_num, object_type, name, `assignment`, space_longness, liter, build_year, adress, rnki_number, carrying_ammount, status)
VALUES ('24:50:0600051:27', 'Здание', 'Нежилое здание', 'Здания спортивных объектов', 1505.8, 'Б2', 1970, 'Красноярский край, г. Красноярск, ул. академика Павлова, зд. 21, строение 6', 'П12000004917', 5093401.29, 'действующий'),
('24:50:0660051:27', 'Здание', 'Нежилое здание', 'Здания спортивных объектов', 1575.8, 'Б2', 1970, 'Красноярский край, г. Красноярск, ул. академика Павлова, зд. 21, строение 9', 'П12000009917', 5093401.29, 'действующий');


INSERT INTO objects (kadastr_num, object_type, name, `assignment`, space_longness, liter, build_year, adress, rnki_number, carrying_ammount, status)
VALUES ('24:50:0600051:27', 'Здание', 'Нежилое здание', 'Здания спортивных объектов', 1505.8, 'Б2', 1970, 'Красноярский край, г. Красноярск, ул. академика Павлова, зд. 21, строение 6', 'П12000004917', 5093401.29, 'действующий'),
('24:50:0660051:27', 'Здание', 'Нежилое здание', 'Здания спортивных объектов', 1575.8, 'Б2', 1970, 'Красноярский край, г. Красноярск, ул. академика Павлова, зд. 21, строение 9', 'П12000009917', 5093401.29, 'действующий');


#INSERT INTO owners (object_id, law_id, encumbrance_id, name, inn, ogrn, adress, telephone, email, status, status_date)
#VALUES (1, )
*/


/*
INSERT INTO owners (name, inn, ogrn, adress, telephone, email, status)
VALUES ('КГАУ "РЦСС"', 24615131, 354161435, 'г. Красноярск', 315351515, 'adafsd@mail.ru', 'Действующий');

INSERT INTO law (object_id, right_type, law_registration_date, owner_registration_number, owner_right_document, status)
VALUES (1 , 'оперативное управление', '2010-11-30', '24-24-01/248/2010-100', 'Приказ агентства по управлению государственным имуществом Красноярского края от 30.06.2010 № 11-1074п', 'действующий');
#, 'собственность', 2010-06-28, '24-24-01/130/2010-223', 'Распоряжение Правительства Красноярского края от 17.05.2010 №393-р, акт приема-передачи имущества от 10.06.2010');
*/