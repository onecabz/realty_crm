DROP DATABASE IF EXISTS realty_v04;
CREATE DATABASE realty_v04;
USE realty_v04;


DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(400) NOT NULL,
	`inn` BIGINT UNSIGNED UNIQUE,
	`ogrn` BIGINT UNSIGNED UNIQUE,
	`adress` VARCHAR(600),
	`telephone` BIGINT UNSIGNED,
	`email` VARCHAR(100) UNIQUE,
	`is_active` ENUM ('действующий', 'архивный') COMMENT 'статус записи',
	`status_date` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'дата установления статуса'
);


DROP TABLE IF EXISTS `laws`;
CREATE TABLE `laws` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`object_id` BIGINT UNSIGNED NOT NULL,
	`owner_id` BIGINT UNSIGNED NOT NULL,
	`right_type` ENUM ('собственность','оперативное управление','постоянное (бессрочное) пользование')
	COMMENT 'вид иного вещного права',
	`law_registration_date` DATE COMMENT 'дата регистрации иного вещного права',
	`owner_registration_number` VARCHAR(100) COMMENT 'номер записи о регистрации иного вещного права',
	`owner_right_document` TEXT COMMENT 'документ-основание возникнования иного вещного права',
	`is_active` ENUM ('действующий', 'архивный') COMMENT 'статус записи',
	`status_date` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'дата установления статуса',
	
	FOREIGN KEY (owner_id) REFERENCES owners(id)
);


DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`object_id` BIGINT UNSIGNED NOT NULL,
	`owner_id` BIGINT UNSIGNED NOT NULL,
	`oper_type` ENUM('аренда','безвозмездное пользование','арест','ограничение регистрационных действий'),
	`oper_right_document` TEXT COMMENT 'документы согласования собственника/учредителя. Заполнять в одну строку. Разделитель \",\"',
	`oper_reg_date` DATE COMMENT 'дата сделки/операции', #убрал DEFAULT CURRENT_DATE/CURDATE() - не работает
	`is_active` ENUM('действующий', 'архивный'),
	`status_dateTime` DATETIME DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY (owner_id) REFERENCES owners(id)
);



DROP TABLE IF EXISTS `objects`;
CREATE TABLE `objects` (
	`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	#`object_law_id` BIGINT UNSIGNED COMMENT 'ссылка на объект', #  -NOT NULL 
	`object_owner_id` BIGINT UNSIGNED, #  -NOT NULL
	`kadastr_num` VARCHAR(30) UNIQUE NOT NULL COMMENT 'кадастровый номер',
	`object_type` ENUM('Здание','Сооружение','Помещение','Земельный участок') COMMENT 'вид объекта',
	`object_name` VARCHAR(300),
	`assignment` VARCHAR(300) COMMENT 'назначение/разрешенное использование',
	`space` DECIMAL(15,2) DEFAULT 0.00 COMMENT 'площадь',
	`longness` DECIMAL(15,2) DEFAULT 0.00 COMMENT 'протяженность',
	`liter` VARCHAR(20) COMMENT 'литера',
	`build_year` YEAR COMMENT 'год завершения строительства/ввода в эксплуатацию',
	`adress` VARCHAR(700),
	`rnki_number` VARCHAR(12) UNIQUE COMMENT 'РНКИ',
	`carrying_ammount` DECIMAL(18,2) DEFAULT 0.00 COMMENT 'балансовая/кадастровая стоимость',
	`is_active` ENUM ('действующий', 'архивный') COMMENT 'статус записи',
	`status_date` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'дата установления статуса',
	
	#FOREIGN KEY (object_law_id) REFERENCES laws(law_id),
	FOREIGN KEY (object_owner_id) REFERENCES owners(id)
);

ALTER TABLE laws ADD CONSTRAINT lawfor_object_id
FOREIGN KEY (object_id) REFERENCES objects(id);

ALTER TABLE operations ADD CONSTRAINT operfor_object_id
FOREIGN KEY (object_id) REFERENCES objects(id);
