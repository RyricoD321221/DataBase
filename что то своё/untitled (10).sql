CREATE TABLE `Students` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`FIO` varchar(100) NOT NULL,
	`id_Group` INT NOT NULL,
	`Sex` BOOLEAN NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Torg` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`FIO` varchar(100) NOT NULL,
	`id_Groups` INT NOT NULL,
	`id_Way` INT(100) NOT NULL,
	`id_Tray` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Tray` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Groups` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`id_Way` INT NOT NULL,
	`id_Teacher` INT NOT NULL,
	`id_Format` INT NOT NULL,
	`id_Student` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Teacher` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`FIO` varchar(100) NOT NULL,
	`Date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Format` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Forma` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Way` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Languages` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Students` ADD CONSTRAINT `Students_fk0` FOREIGN KEY (`id_Group`) REFERENCES `Groups`(`id`);

ALTER TABLE `Torg` ADD CONSTRAINT `Torg_fk0` FOREIGN KEY (`id_Groups`) REFERENCES `Groups`(`id`);

ALTER TABLE `Torg` ADD CONSTRAINT `Torg_fk1` FOREIGN KEY (`id_Way`) REFERENCES `Way`(`id`);

ALTER TABLE `Torg` ADD CONSTRAINT `Torg_fk2` FOREIGN KEY (`id_Tray`) REFERENCES `Tray`(`id`);

ALTER TABLE `Groups` ADD CONSTRAINT `Groups_fk0` FOREIGN KEY (`id_Way`) REFERENCES `Way`(`id`);

ALTER TABLE `Groups` ADD CONSTRAINT `Groups_fk1` FOREIGN KEY (`id_Teacher`) REFERENCES `Teacher`(`id`);

ALTER TABLE `Groups` ADD CONSTRAINT `Groups_fk2` FOREIGN KEY (`id_Format`) REFERENCES `Format`(`id`);

ALTER TABLE `Groups` ADD CONSTRAINT `Groups_fk3` FOREIGN KEY (`id_Student`) REFERENCES `Students`(`id`);

ALTER TABLE `Teacher` ADD CONSTRAINT `Teacher_fk0` FOREIGN KEY (`id`) REFERENCES `Расписание`(`Преподаватель`);

ALTER TABLE `Teacher` ADD CONSTRAINT `Teacher_fk1` FOREIGN KEY (`FIO`) REFERENCES `Группы`(`id`);

ALTER TABLE `Way` ADD CONSTRAINT `Way_fk0` FOREIGN KEY (`id`) REFERENCES `Группы`(`id_Направление`);








