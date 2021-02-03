/* Tablas de AmongMeme */

DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS weapons_types;

DROP TABLE IF EXISTS characters_armours;
DROP TABLE IF EXISTS characters_armors;
DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS armors;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS armors_types;
DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS skills;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters;

CREATE TABLE characters(
	id_character INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(24) NOT NULL,
	age INT NOT NULL,
	hp INT NOT NULL,
	gender CHAR(1) NOT NULL,
	style CHAR(1) NOT NULL,
	mana INT NOT NULL,
	class CHAR(2) NOT NULL,
	race CHAR(2) NOT NULL,
	xp INT NOT NULL,
	level INT NOT NULL,
	height FLOAT NOT NULL
);
INSERT INTO characters (name,age,hp,gender,style,mana,class,race,xp,`level`,height) 
VALUES
	('Jacinto',12309,999,'F','R',100000,'Mg','Sg',1000000,0,2.1),
	('Alejandro',2,0,'M','M',1,'De','Nd',100,2,1.2),
	('Paca',43,100,'F','G',0,'Wa','Lo',500,70,4.52),
	('Maricarmen',2,100,'N','H',100,'T','B',200,100,0.25);

CREATE TABLE stats(
	id_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	intel INT NOT NULL,
	strength INT NOT NULL,
	charisma INT NOT NULL,
	`level` INT NOT NULL,
	id_character INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character)
);
INSERT INTO stats (intel,strength,charisma,`level`,id_character) 
VALUES
	(33,22,333,33,1),(1,1,1,1,2),(75,2000,60,70,3),(9999,20,1,10,4);


CREATE TABLE skills(
	id_skill INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	skill VARCHAR(24) NOT NULL,
	description TEXT,
	icon VARCHAR(16)
);


CREATE TABLE items_types(
	id_item_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(16) NOT NULL
);
INSERT INTO items_types (type)
VALUES
	("Otros"),("Equipable"),("Consumible"),("Clave"),("Especial"),("Municion");

CREATE TABLE items(
	id_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	item VARCHAR(24) NOT NULL,
	cost INT NOT NULL,
	consumable BOOLEAN NOT NULL,
	tradeable BOOLEAN NOT NULL,
	weight FLOAT NOT NULL,
	image VARCHAR(32),
	description TEXT,
	id_item_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_item_type) REFERENCES items_types(id_item_type)
	ON DELETE CASCADE ON UPDATE RESTRICT
);
INSERT INTO items (item, cost, consumable, weight, tradeable, image, description, id_item_type)
VALUES ("pocion de vida", 10, true, 1, true, "pocion_vida.png", "pocion que restaura 40hp", 3),
("pocion de mana", 10, true, 1, true, "pocion_mana.png", "pocion que restaura 100 de mana", 3),
("gafas de sol", 100, false, 2, true, "gafas_sol.png", "proteccion ante la luz estelar", 2),
("materializador", 500, false, 15, true, "materializador.png", "objeto capaz de crear materia", 2),
("asteroide", 500, false, 5, true, "asteroide.png", "asteroide comun que viajaba por el esapcio", 1),
("pata de Goh", 30, true, 1, true, "pata_goh.png", "resto que suelta un Goh al morir", 4),
("bombona de O", 999, false, 25, true, "bombona_O.png", "bombona llena de Oxigeno dejandote respirar en el exterior de la nave", 4),
("traje espacial", 899, false, 20, true, "traje.png", "traje basico para soportar la presion espacial", 4),
("portatil chungo", 350, false, 2, true, "portatil_chungo.png", "portatil chungo de Intel", 1);


CREATE TABLE characters_items (
	id_character_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_character INT UNSIGNED NOT NULL,
	id_item INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_item) REFERENCES items(id_item)
	ON DELETE CASCADE ON UPDATE RESTRICT
);
INSERT INTO characters_items (id_character, id_item)
VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(2,1),(2,2),(2,9),(3,1),(3,2),(3,5),(3,6),(4,4),(4,9);


CREATE TABLE weapons_types(
	id_weapon_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(24) NOT NULL
);
INSERT INTO weapons_types(type)
VALUES
	('Espada'),('Lanza'),('Hacha');

CREATE TABLE weapons(
	id_weapon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	weapon VARCHAR(16) NOT NULL,
	damage INT NOT NULL,
	quality INT NOT NULL,
	rarity INT NOT NULL,
	weight INT NOT NULL,
	durability INT NOT NULL,
	`range` INT NOT NULL,
	id_weapon_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_weapon_type) REFERENCES weapons_types(id_weapon_type)
	ON DELETE CASCADE ON UPDATE RESTRICT
);
INSERT INTO weapons(weapon, damage, quality, rarity, weight, durability, `range`, id_weapon_type)
VALUES
	('Espada larga',200,30,10,10,500,100,1),
	('Espada corta',100,5,5,10,300,50,1),
	('Lanza de Midgar',400,100,50,100,1000,400,2),
	('Lanza de Shojin',500,70,20,50,900,300,2),
	('Cuchilla Negra',250,50,700,30,1200,250,3);

CREATE TABLE characters_weapons(
	id_character_weapon INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_character INT UNSIGNED NOT NULL,
	id_weapon INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
	ON DELETE CASCADE ON UPDATE RESTRICT
);
INSERT INTO characters_weapons (id_character,id_weapon)
VALUES
	(1,3), (2,2), (3,4), (4,3);

CREATE TABLE armors_types (
	id_armor_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	type VARCHAR(24) NOT NULL
);
INSERT INTO armors_types(type)
VALUES
	('Ligera'),('Mediana'),('Pesada');

CREATE TABLE armors(
	id_armor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	armor VARCHAR(16) NOT NULL,
	defence INT NOT NULL,
	durability INT NOT NULL,
	weight INT NOT NULL,
	quality INT NOT NULL,
	rarity INT NOT NULL,
	toughness INT NOT NULL,
	id_armor_type INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_armor_type) REFERENCES armors_types(id_armor_type)
	ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE characters_armors(
	id_character_armor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_character INT UNSIGNED NOT NULL,
	id_armor INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_armor) REFERENCES armors(id_armor)
	ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE users(
	id_user INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(16),
	name VARCHAR(16),
	surname VARCHAR(32),
	birthdate DATE,
	email VARCHAR(32),
	password CHAR(32),
	register TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

DELIMITER //

CREATE PROCEDURE fill_users_table (
    IN in_username VARCHAR(16),
    IN in_name VARCHAR(16),    
    IN in_surname VARCHAR(32),    
    IN in_birthdate DATE,    
    IN in_email VARCHAR(32),
    IN in_password VARCHAR(16) )
BEGIN
INSERT INTO users (username, name, surname, birthdate, email, password)
VALUES ( in_username ,in_name, in_surname, in_birthdate, in_email, MD5(in_password) );
END //

DELIMITER ;

CALL fill_users_table ('Pedro', 'Bad', 'Bunny', '1996-05-30', 'pedro.fernandez@enti.cat','enti');
    
