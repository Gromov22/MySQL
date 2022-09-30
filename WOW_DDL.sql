DROP DATABASE IF EXISTS World_of_Warcraft_DB;
CREATE DATABASE World_of_Warcraft_DB;
USE World_of_Warcraft_DB;


DROP TABLE IF EXISTS items;
CREATE TABLE items (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	type ENUM('Weapon', 'Armor', 'Bags', 'Expendable', 'Symbols', 'Household', 'Recepies', 'Gems', 'Other', 'Quests', 'Keys'),
	description TEXT,
	drop_from BIGINT UNSIGNED NOT NULL,
	drop_chance INT UNSIGNED,
	quality ENUM('Trash', 'Common', 'Unusual', 'Rare', 'Epic', 'Legendary'),
	sale_price INT UNSIGNED,
	lvl_of_item INT UNSIGNED NOT NULL,
	lvl_requirement INT UNSIGNED NOT NULL,
	icon_id BIGINT UNSIGNED NOT NULL,
	
	INDEX idx_of_item_quality(quality, type)
);

DROP TABLE IF EXISTS expansions;
CREATE TABLE expansions (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) UNIQUE,
	lvl VARCHAR(10),
	started_at DATE,
	ended_at DATE
);

DROP TABLE IF EXISTS continents;
CREATE TABLE continents (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(25) UNIQUE,
	expansion INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (expansion) REFERENCES expansions(id)
);

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_name VARCHAR(100) UNIQUE,
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(255),
	created_at DATE,
	is_active BOOL DEFAULT FALSE,
	achievements JSON
);

DROP TABLE IF EXISTS fractions;
CREATE TABLE fractions (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50)
);

DROP TABLE IF EXISTS neutral_fractions;
CREATE TABLE neutral_fractions(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	expansion INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (expansion) REFERENCES expansions(id)
);

DROP TABLE IF EXISTS locations;
CREATE TABLE locations (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	continent INT UNSIGNED,
	expansion INT UNSIGNED NOT NULL,
	fraction INT UNSIGNED,
	required_level INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (continent) REFERENCES continents(id),
	FOREIGN KEY (fraction) REFERENCES fractions(id)
);

DROP TABLE IF EXISTS quests;
CREATE TABLE quests (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	location BIGINT UNSIGNED NOT NULL,
	expansion INT UNSIGNED NOT NULL,
	fraction_id INT UNSIGNED NOT NULL,
	body TEXT,
	reward BIGINT UNSIGNED NOT NULL UNIQUE,
	required_level INT UNSIGNED,
	
	FOREIGN KEY (location) REFERENCES locations(id),
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (fraction_id) REFERENCES fractions(id),
	FOREIGN KEY (reward) REFERENCES items(id)
);

DROP TABLE IF EXISTS races;
CREATE TABLE races (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255)
	
);

DROP TABLE IF EXISTS playable_races;
CREATE TABLE playable_races (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	fraction INT UNSIGNED,
	
	FOREIGN KEY (fraction) REFERENCES fractions(id)
);

DROP TABLE IF EXISTS NPC;
CREATE TABLE NPC (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 `type` ENUM('Ally', 'Enemy', 'Neutral'),
	class ENUM('Common', 'Rare', 'Elite'),
	race BIGINT UNSIGNED NOT NULL,
	name VARCHAR(255) UNIQUE,
	lvl INT UNSIGNED NOT NULL,
	location BIGINT UNSIGNED NOT NULL,
	expansion INT UNSIGNED NOT NULL,
	fraction_id INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (race) REFERENCES races(id),
	FOREIGN KEY (location) REFERENCES locations(id),
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (fraction_id) REFERENCES fractions(id)
);

DROP TABLE IF EXISTS dungeons;
CREATE TABLE dungeons (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	location BIGINT UNSIGNED NOT NULL,
	expansion INT UNSIGNED NOT NULL,
	boss BIGINT UNSIGNED NOT NULL,
	loot BIGINT UNSIGNED NOT NULL,
	quests BIGINT UNSIGNED NOT NULL,
	required_level INT UNSIGNED NOT NULL,

	FOREIGN KEY (location) REFERENCES locations(id),
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (boss) REFERENCES NPC(id),
	FOREIGN KEY (quests) REFERENCES quests(id)
);

DROP TABLE IF EXISTS raids;
CREATE TABLE raids (
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	location BIGINT UNSIGNED NOT NULL,
	expansion INT UNSIGNED NOT NULL,
	boss BIGINT UNSIGNED NOT NULL,
	loot BIGINT UNSIGNED NOT NULL,
	quests BIGINT UNSIGNED NOT NULL,
	required_level INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (location) REFERENCES locations(id),
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (boss) REFERENCES NPC(id),
	FOREIGN KEY (quests) REFERENCES quests(id)
);

DROP TABLE IF EXISTS quest_givers;
CREATE TABLE quest_givers (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	location BIGINT UNSIGNED NOT NULL,
	expansion INT UNSIGNED NOT NULL,
	quests BIGINT UNSIGNED NOT NULL,
	fraction_id INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (location) REFERENCES locations(id),
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (fraction_id) REFERENCES fractions(id),
	FOREIGN KEY (quests) REFERENCES quests(id)
);

DROP TABLE IF EXISTS resources;
CREATE TABLE resources (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(25)
	
);
DROP TABLE IF EXISTS classes;
CREATE TABLE classes (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) UNIQUE,
	class_color VARCHAR(50),
	type_of_armor VARCHAR(50),
	specializations INT UNSIGNED NOT NULL DEFAULT 3,
	resources INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (resources) REFERENCES resources(id)
);

DROP TABLE IF EXISTS spells;
CREATE TABLE spells (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	description TEXT,
	required_level INT UNSIGNED NOT NULL,
	school INT UNSIGNED NOT NULL,
	class INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (class) REFERENCES classes(id)
);

DROP TABLE IF EXISTS spell_schools;
CREATE TABLE spell_schools (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50)
);

DROP TABLE IF EXISTS realms;
CREATE TABLE realms (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) UNIQUE,
	country VARCHAR(50),
	realm_type ENUM('PVP', 'PVE', 'RP'),
	population BIGINT UNSIGNED NOT NULL
);

DROP TABLE IF EXISTS heroes;
CREATE TABLE heroes (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) UNIQUE,
	class INT UNSIGNED NOT NULL,
	gender CHAR(1),
	owner BIGINT UNSIGNED NOT NULL,
	lvl INT UNSIGNED NOT NULL,
	race INT UNSIGNED NOT NULL,
	fraction INT UNSIGNED NOT NULL,
	realm BIGINT UNSIGNED NOT NULL,
	
	INDEX idx_of_name(name, realm),
	FOREIGN KEY (class) REFERENCES classes(id),
	FOREIGN KEY (owner) REFERENCES accounts(id),
	FOREIGN KEY (fraction) REFERENCES fractions(id)
);

DROP TABLE IF EXISTS guilds;
CREATE TABLE guilds (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) UNIQUE,
	leader BIGINT UNSIGNED NOT NULL,
	fraction INT UNSIGNED NOT NULL,
	population BIGINT UNSIGNED NOT NULL,
	realm BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (fraction) REFERENCES fractions(id),
	FOREIGN KEY (leader) REFERENCES heroes(id),
	FOREIGN KEY (realm) REFERENCES realms(id)
);

DROP TABLE IF EXISTS pet_races;
CREATE TABLE pet_races (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	race VARCHAR(50)
);

DROP TABLE IF EXISTS pets;
CREATE TABLE pets (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	spells BIGINT UNSIGNED,
	
	drop_from BIGINT UNSIGNED NOT NULL,
	drop_chance INT UNSIGNED NOT NULL,
	pet_type BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (spells) REFERENCES spells(id),
	FOREIGN KEY (drop_from) REFERENCES NPC(id),
	FOREIGN KEY (pet_type) REFERENCES pet_races(id)
);

DROP TABLE IF EXISTS hunter_pets;
CREATE TABLE hunter_pets (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	category ENUM('Cunning', 'Ferocity', 'Tenacity'),
	lvl VARCHAR(50),
	abilities BIGINT UNSIGNED,
	diet VARCHAR(256),
	is_exotic BIT DEFAULT 0,
	expansion INT UNSIGNED,
	
	FOREIGN KEY (abilities) REFERENCES spells(id),
	FOREIGN KEY (expansion) REFERENCES expansions(id)
);

DROP TABLE IF EXISTS mounts;
CREATE TABLE mounts (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	drop_from BIGINT UNSIGNED NOT NULL,
	drop_chance INT UNSIGNED,
	is_flying BOOL,
	required_level INT UNSIGNED,
	
	FOREIGN KEY (drop_from) REFERENCES locations(id)
);

DROP TABLE IF EXISTS achievements;
CREATE TABLE achievements (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	requirements VARCHAR(255),
	status BOOL DEFAULT FALSE,
	achievement_type ENUM('Character', 'Quests', 'Research', 'PVP', 'Dungeons&Raids', 'Professions', 'Reputation', 'Events', 'Pet battles', 'Collections', 'Special content', 'Great feats', 'Legacy'),
	achieved_at DATE,
	reward BIGINT UNSIGNED NOT NULL,
	expansion INT UNSIGNED NOT NULL,
	
	INDEX idx_achievements_type(achievement_type),
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (reward) REFERENCES items(id)
);

DROP TABLE IF EXISTS events;
CREATE TABLE events (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	starting_at DATETIME,
	ending_at DATETIME
);

DROP TABLE IF EXISTS professions;
CREATE TABLE professions (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	profession_type ENUM('gathering', 'manufacturing')
);

DROP TABLE IF EXISTS recepies;
CREATE TABLE recepies (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	ingredients SET(''),
	profession INT UNSIGNED NOT NULL,
	required_level_of_profession INT UNSIGNED,
	drop_from BIGINT UNSIGNED NOT NULL,
	expansion INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (drop_from) REFERENCES NPC(id),
	FOREIGN KEY (expansion) REFERENCES expansions(id),
	FOREIGN KEY (profession) REFERENCES professions(id)
);

DROP TABLE IF EXISTS currency;
CREATE TABLE currency (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	expansion INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (expansion) REFERENCES expansions(id)
);

DROP TABLE IF EXISTS ranks;
CREATE TABLE ranks (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	requirements BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (requirements) REFERENCES achievements(id)
);

DROP TABLE IF EXISTS armor_types;
CREATE TABLE armor_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
	category ENUM('Cloth', 'Leather', 'Mail', 'Plate', 'Jewelry', 'Other')
);

DROP TABLE IF EXISTS weapon_types;
CREATE TABLE weapon_types (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50),
	category ENUM('One-Handed', 'Two-Handed', 'Ranged', 'Other')
);

DROP TABLE IF EXISTS armor;
CREATE TABLE armor (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	armor_type INT UNSIGNED NOT NULL,
	item_id BIGINT UNSIGNED NOT NULL,
	stats JSON,
	required_lvl INT UNSIGNED,
	drop_from BIGINT UNSIGNED NOT NULL,
	drop_chance INT UNSIGNED,
	repair_price INT UNSIGNED,
	
	FOREIGN KEY (armor_type) REFERENCES armor_types(id),
	FOREIGN KEY (item_id) REFERENCES items(id),
	FOREIGN KEY (drop_from) REFERENCES locations(id)
);

DROP TABLE IF EXISTS weapons;
CREATE TABLE weapons (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) UNIQUE,
	weapon_type INT UNSIGNED NOT NULL,
	item_id BIGINT UNSIGNED NOT NULL,
	stats JSON,
	required_lvl INT UNSIGNED,
	drop_from BIGINT UNSIGNED NOT NULL,
	drop_chance INT UNSIGNED,
	repair_price INT UNSIGNED,
	
	FOREIGN KEY (weapon_type) REFERENCES weapon_types(id),
	FOREIGN KEY (item_id) REFERENCES items(id),
	FOREIGN KEY (drop_from) REFERENCES locations(id)
);

DROP TABLE IF EXISTS specializations;
CREATE TABLE specializations (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	class INT UNSIGNED NOT NULL,
	category ENUM('Damage Dealer', 'Healer', 'Tank'),
	
	FOREIGN KEY (class) REFERENCES classes(id)
);

ALTER TABLE items ADD CONSTRAINT fk_drop_from_id
FOREIGN KEY (drop_from) REFERENCES NPC(id);

ALTER TABLE spells ADD CONSTRAINT fk_spell_school
FOREIGN KEY (school) REFERENCES spell_schools(id);


DROP TABLE IF EXISTS arenas;
CREATE TABLE arenas (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) UNIQUE,
	expansion INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (expansion) REFERENCES expansions(id)
);

DROP TABLE IF EXISTS battlegrounds;
CREATE TABLE battlegrounds (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) UNIQUE,
	lvl INT UNSIGNED NOT NULL,
	number_of_players VARCHAR(25),
	expansion INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (expansion) REFERENCES expansions(id)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(25) UNIQUE,
	fraction INT UNSIGNED,
	
	FOREIGN KEY (fraction) REFERENCES fractions(id)
);

DROP TABLE IF EXISTS class_halls;
CREATE TABLE class_halls (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(25) UNIQUE,
	class INT UNSIGNED NOT NULL,
	
	FOREIGN KEY (class) REFERENCES classes(id)
);

INSERT INTO expansions(name, lvl, started_at, ended_at) VALUES
	('Classic', '1-30', '2004-11-24', '2007-01-01'),
	('The Burning Crusade', '10-30', '2007-01-16', '2008-11-01'),
	('Wrath of the Lich King', '10-30', '2008-11-13', '2010-12-01'),
	('Cataclysm', '30-35', '2010-12-07', '2012-09-01'),
	('Mists of Pandaria', '10-35', '2012-09-25', '2014-10-01'),
	('Warlords of Draenor', '10-40', '2014-10-13', '2016-08-01'),
	('Legion', '10-45', '2016-08-30', '2018-08-01'),
	('Battle for Azeroth', '10-50', '2018-08-14', '2020-11-01'),
	('Shadowlands', '50-60', '2020-11-23', NULL),
	('Dragonflight', '60-70', NULL, NULL);
	
INSERT INTO resources(name) VALUES
	('Arcane Charges'),
	('Astral Power'),
	('Chi'),
	('Combo Points'),
	('Energy'),
	('Focus'),
	('Fury'),
	('Health'),
	('Holy Power'),
	('Insanity'),
	('Maelstrom'),
	('Mana'),
	('Pain'),
	('Rage'),
	('Runes'),
	('Runic Power'),
	('Soul Shards');
	
INSERT INTO spell_schools(name) VALUES
	('Shadow'),
	('Physical'),
	('Nature'),
	('Fire'),
	('Frost'),
	('Arcane'),
	('Holy');
	
INSERT INTO fractions(name) VALUES
	('Alliance'),
	('Horde');
	
INSERT INTO professions(name, profession_type) VALUES
	('Alchemy', 'manufacturing'),
	('Blacksmithing', 'manufacturing'),
	('Enchanting', 'manufacturing'),
	('Engineering', 'manufacturing'),
	('Herbalism', 'gathering'),
	('Inscription', 'gathering'),
	('Jewelcrafting', 'manufacturing'),
	('Leatherworking', 'manufacturing'),
	('Mining', 'gathering'),
	('Skinning', 'gathering'),
	('Tailoring', 'manufacturing'),
	('Archaeology', 'manufacturing'),
	('Cooking', 'manufacturing');
	
INSERT INTO events(name, starting_at, ending_at) VALUES
	('Brewfest', '2022-09-20 10:00', '2022-10-06 10:00'),
	("Children's Week", '2023-05-01 10:00', '2023-05-08 10:00'),
	('Day of the Dead', '2022-11-01 11:00', '2022-11-03 11:00'),
	('Feast of Winter Veil', '2022-12-16 10:00', '2023-01-02 6:00'),
	('Fireworks Spectacular', '2023-07-04 10:00', '2023-07-05 4:00'),
	("Hallow's End", '2022-10-18 10:00', '2022-11-01 11:00'),
	('Harvest Festival', '2022-09-06 10:00', '2022-09-13 10:00'),
	('Love is in the Air', '2023-02-06 10:00', '2023-02-20 10:00'),
	('Lunar Festival', '2023-01-20 10:00', '2023-02-03 10:00'),
	('Midsummer Fire Festival', '2023-06-21 10:00', '2023-07-05 10:00'),
	('Noblegarden', '2023-04-10 10:00', '2023-04-17 10:00'),
	("Piligrim's Bounty", '2022-11-22 10:00', '2022-11-29 9:00'),
	("Pirate's Day", '2022-09-19 10:00', '2022-09-20 10:00');

INSERT INTO playable_races(name, fraction) VALUES
	('Dark Iron Dwarf', 1),
	('Draenei', 1),
	('Dwarf', 1),
	('Gnome', 1),
	('Human', 1),
	('Kul Tiran', 1),
	('Lightforged Draenei', 1),
	('Mechagnome', 1),
	('Night Elf', 1),
	('Pandaren', NULL),
	('Void Elf', 1),
	('Worgen', 1),
	('Blood Elf', 2),
	('Goblin', 2),
	('Highmountain Tauren', 2),
	("Mag'har Orc", 2),
	('Nightborne', 2),
	('Orc', 2),
	('Tauren', 2),
	('Troll', 2),
	('Undead', 2),
	('Vulpera', 2),
	('Zandalari Troll', 2);
	
INSERT INTO races(name) VALUES
	('Aberration'),
	('Beast'),
	('Critter'),
	('Demon'),
	('Dragokin'),
	('Elemental'),
	('Giant'),
	('Humanoid'),
	('Mechanical'),
	('Uncategorized'),
	('Undead');

INSERT INTO weapon_types(name, category) VALUES
	('Dagger', 'One-Handed'),
	('Fist Weapon', 'One-Handed'),
	('One-Handed Axe', 'One-Handed'),
	('One-Handed Mace', 'One-Handed'),
	('One-Handed Sword', 'One-Handed'),
	('Warglave', 'One-Handed'),
	('Polearm', 'Two-Handed'),
	('Stave', 'Two-Handed'),
	('Two-Handed Axe', 'Two-Handed'),
	('Two-Handed Mace', 'Two-Handed'),
	('Two-Handed Sword', 'Two-Handed'),
	('Bow', 'Ranged'),
	('Crossbow', 'Ranged'),
	('Gun', 'Ranged'),
	('Wand', 'Ranged'),
	('Fishing Pole', 'Other'),
	('Miscellaneous', 'Other');


INSERT INTO armor_types(name, category) VALUES 
	('Chest', 'Cloth'),
	('Feet', 'Cloth'),
	('Hands', 'Cloth'),
	('Head', 'Cloth'),
	('Legs', 'Cloth'),
	('Shoulder', 'Cloth'),
	('Waist', 'Cloth'),
	('Wrist', 'Cloth'),
	('Chest', 'Leather'),
	('Feet', 'Leather'),
	('Hands', 'Leather'),
	('Head', 'Leather'),
	('Legs', 'Leather'),
	('Shoulder', 'Leather'),
	('Waist', 'Leather'),
	('Wrist', 'Leather'),
	('Chest', 'Mail'),
	('Feet', 'Mail'),
	('Hands', 'Mail'),
	('Head', 'Mail'),
	('Legs', 'Mail'),
	('Shoulder', 'Mail'),
	('Waist', 'Mail'),
	('Wrist', 'Mail'),
	('Chest', 'Plate'),
	('Feet', 'Plate'),
	('Hands', 'Plate'),
	('Head', 'Plate'),
	('Legs', 'Plate'),
	('Shoulder', 'Plate'),
	('Waist', 'Plate'),
	('Wrist', 'Plate'),
	('Amulet', 'Jewelry'),
	('Ring', 'Jewelry'),
	('Trinket', 'Jewelry'),
	('Cloak', 'Other'),
	('Off-Hand Frill', 'Other'),
	('Shield', 'Other'),
	('Shirt', 'Other'),
	('Tabard', 'Other'),
	('Cosmetic', 'Other'),
	('Miscellaneous', 'Other');
	
INSERT INTO classes(name, class_color, type_of_armor, specializations, resources) VALUES
	('Death Knight', 'Red', 'Plate', 3, 16),
	('Demon Hunter', 'Magenta', 'Leather', 2, 13),
	('Druid', 'Orange', 'Leather', 4, 12),
	('Hunter', 'Emerald', 'Plate', 3, 6),
	('Mage', 'Azure', 'Cloth', 3, 12),
	('Monk', 'Green', 'Leather', 3, 3),
	('Paladin', 'Pink', 'Plate', 3, 9),
	('Priest', 'White', 'Cloth', 3, 12),
	('Rogue', 'Yellow', 'Leather', 3, 4),
	('Shaman', 'Blue', 'Plate', 3, 11),
	('Warlock', 'Purple', 'Cloth', 3, 17),
	('Warrior', 'Brown', 'Plate', 3, 14);
	
INSERT INTO specializations(name, class, category) VALUES
	('Blood', 1, 'Tank'),
	('Frost', 1, 'Damage Dealer'),
	('Unholy', 1, 'Damage Dealer'),
	('Havoc', 2, 'Damage Dealer'),
	('Vengeance', 2, 'Tank'),
	('Balance', 3, 'Damage Dealer'),
	('Feral', 3, 'Damage Dealer'),
	('Guardian', 3, 'Tank'),
	('Restoration', 3, 'Healer'),
	('Beast Mastery', 4, 'Damage Dealer'),
	('Marksmanship', 4, 'Damage Dealer'),
	('Survival', 4, 'Damage Dealer'),
	('Arcane', 5, 'Damage Dealer'),
	('Fire', 5, 'Damage Dealer'),
	('Frost', 5, 'Damage Dealer'),
	('Brewmaster', 6, 'Tank'),
	('Mistweaver', 6, 'Healer'),
	('Windwalker', 6, 'Damage Dealer'),
	('Holy', 7, 'Healer'),
	('Protection', 7, 'Tank'),
	('Retribution', 7, 'Damage Dealer'),
	('Discipline', 8, 'Healer'),
	('Holy', 8, 'Healer'),
	('Shadow', 8, 'Damage Dealer'),
	('Assassination', 9, 'Damage Dealer'),
	('Outlaw', 9, 'Damage Dealer'),
	('Sublety', 9, 'Damage Dealer'),
	('Elemental', 10, 'Damage Dealer'),
	('Enchancement', 10, 'Damage Dealer'),
	('Restoration', 10, 'Healer'),
	('Affliction', 11, 'Damage Dealer'),
	('Demonology', 11, 'Damage Dealer'),
	('Destruction', 11, 'Damage Dealer'),
	('Arms', 12, 'Damage Dealer'),
	('Fury', 12, 'Damage Dealer'),
	('Protection', 12, 'Tank');
	
INSERT INTO pet_races(race) VALUES
	('Aquatic'),
	('Beast'),
	('Critter'),
	('Dragonkin'),
	('Elemental'),
	('Flying'),
	('Humanoid'),
	('Magic'),
	('Mechanical'),
	('Undead'),
	('Passive');

	
INSERT INTO hunter_pets(name, category, lvl, diet, is_exotic, expansion) VALUES
	('Raptor', 'Cunning', '4-52', 'Meat', 0, 1),
	('Aqiri', 'Cunning', '19-52', 'Meat, Fungus', 1, 3),
	('Hound', 'Cunning', '5-62', 'Meat, Cheese, Fish, Bread, Fungus, Fruit', 0, 4),
	('Mechanical', 'Cunning', NULL, NULL, 0, 5),
	('Hyena', 'Cunning', '12-50', 'Meat', 0, 1),
	('Serpent', 'Cunning', '1-60', 'Meat', 0, 1),
	('Bird of Prey', 'Cunning', '1-61', 'Meat, Fish', 0, 1),
	('Shale Beast', 'Cunning', '1-61', 'Meat, Fish, Raw Meat, Raw Fish', 1, 4),
	('Fox', 'Cunning', '3-60', 'Meat, Fish, Fruit', 0, 4),
	('Pterrodax', 'Cunning', '10-50', 'Meat, Fish, Fruit, Raw Meat, Raw Fish', 1, 8),
	('Rodent', 'Cunning', '3-62', 'Fungus', 0, 5),
	('Boar', 'Cunning', '1-60', 'Meat, Fish, Cheese, Bread, Fungus, Fruit', 0, 1),
	('Water Strider', 'Cunning', '7-60', 'Fungus, Fruit', 1, 5),
	('Gruffhorn', 'Cunning', '3-60', 'Meat, Fish, Cheese, Bread, Fungus, Fruit, Raw Meat, Raw, Fish', 0, 5),
	('Basilisk', 'Cunning', '10-60', 'Meat, Fish', 0, 5),
	('Warp Stalker', 'Cunning', '19-50', 'Fish, Fruit', 0, 2),
	('Sporebat', 'Cunning', '10-60', 'Cheese, Bread, Fungus, Fruit', 0, 2),
	('Moth', 'Cunning', '1-61', 'Cheese, Bread, Fungus, Fruit', 0, 3),
	('Monkey', 'Cunning', '7-61', 'Fungus, Fruit', 0, 4),
	('Camel', 'Cunning', '30-50', 'Bread, Fungus, Fruit', 0, 9),
	('Core Hound', 'Ferocity', '30-60', 'Meat', 1, 3),
	('Devilsaur', 'Ferocity', '20-51', 'Meat', 1, 3),
	('Wolf', 'Ferocity', '1-60', 'Meat', 0, 1),
	('Clefthoof', 'Ferocity', '12-50', 'Cheese, Bread, Fungus, Fruit', 0, 6),
	('Ravager', 'Ferocity', '11-60', 'Meat', 0, 2),
	('Cat', 'Ferocity', '1-60', 'Meat, Fish', 0, 1),
	('Scalehide', 'Ferocity', '6-60', 'Cheese, Bread, Fungus, Fruit', 0, 7),
	('Chimaera', 'Ferocity', '17-62', 'Meat', 1, 3),
	('Wasp', 'Ferocity', '1-61', 'Cheese, Bread, Fungus, Fruit', 0, 3),
	('Courser', 'Ferocity', '5-62', 'Fungus, Fruit', 0, 9),
	('Gorilla', 'Ferocity', '19-51', 'Bread, Fungus, Fruit', 0, 1),
	('Wind Serpent', 'Ferocity', '14-61', 'Fish, Cheese, Bread', 0, 1),
	('Carrion Bird', 'Ferocity', '5-61', 'Meat, Fish', 0, 1),
	('Scorpid', 'Ferocity', '2-60', 'Meat', 0, 1),
	('Spider', 'Ferocity', '1-62', 'Meat', 0, 1),
	('Bat', 'Ferocity', '4-61', 'Meat, Fungus, Fruit', 0, 1),
	('Ray', 'Ferocity', '11-60', 'Meat, Fungus', 0, 2),
	('Crocolisk', 'Ferocity', '9-60', 'Meat, Fish', 0, 1),
	('Tallstrider', 'Ferocity', '5-46', 'Cheese, Bread, Fungus, Fruit', 0, 1),
	('Spirit Beast', 'Tenacity', '22-60', 'Meat, Fish', 1, 3),
	('Stone Hound', 'Tenacity', '11-62', 'Meat, Fish, Raw Meat, Raw Fish', 1, 5),
	('Turtle', 'Tenacity', '7-60', 'Fish, Bread, Fungus, Fruit', 0, 1),
	('Direhorn', 'Tenacity', '20-50', 'Fungus, Fruit', 0, 6),
	('Hydra', 'Tenacity', '11-52', 'Meat, Fish, Raw Meat, Raw Fish', 0, 6),
	('Bear', 'Tenacity', '6-60', 'Meat, Fish, Cheese, Bread, Fungus, Fruit', 0, 1),
	('Lizard', 'Tenacity', '11-60', 'Meat, Fish, Fungus, Fruit, Raw Meat, Raw Fish', 0, 8),
	('Feathermane', 'Tenacity', '9-60', 'Meat, Fish, Cheese, Bread, Fungus, Fruit, Raw Meat, Raw Fish', 0, 7),
	('Blood Beast', 'Tenacity', '11-52', 'Meat, Fish, Raw Meat, Raw Fish', 0, 8),
	('Riverbeast', 'Tenacity', '20-61', 'Bread, Fungus, Fruit', 0, 6),
	('Crab', 'Tenacity', '1-60', 'Fish, Bread, Fungus, Fruit', 0, 1),
	('Carapid', 'Tenacity', '11-61', 'Meat, Raw Meat', 1, 8),
	('Mammoth', 'Tenacity', '19-48', 'Cheese, Bread, Fungus, Fruit', 0, 9),
	('Dragonhawk', 'Tenacity', '5-35', 'Meat, Fish, Fruit', 0, 2),
	('Worm', 'Tenacity', '11-60', 'Cheese, Bread, Fungus', 1, 3),
	('Stag', 'Tenacity', '11-61', 'Cheese, Bread, Fungus, Fruit', 0, 6),
	('Crane', 'Tenacity', '6-61', 'Fish, Bread, Raw Fish', 0, 5),
	('Oxen', 'Tenacity', '17-60', 'Cheese, Bread, Fungus, Fruit', 0, 7),
	('Toad', 'Tenacity', '10-61', 'Meat, Fish, Fungus, Fruit, Raw Meat, Raw Fish', 0, 8),
	('Beetle', 'Tenacity', '14-61', 'Fungus, Fruit', 0, 4);
	
ALTER TABLE heroes ADD CONSTRAINT fk_playable_race
FOREIGN KEY (race) REFERENCES playable_races(id);

INSERT INTO currency(name, expansion) VALUES
	('Bronze', 1),
	('Silver', 1),
	('Gold', 1),
	('Spirit Shard', 2),
	("Champion's Seal", 3),
	("Dalaran Jewelcrafter's Token", 3),
	('Mark of the World Tree', 4),
	("Illustrious Jewelcrafter's Token", 4),
	('Mote of Darkness', 4),
	('Essence of the Corrupted Deathwing', 4),
	('Elder Charm of Good Fortune', 5),
	('Lesser Charm of Good Fortune', 5),
	('Timeless Coin', 5),
	('Mogu Rune of Fate', 5),
	('Bloody Coin', 5),
	('Warforged Seal', 5),
	('Apexis Crystal', 6),
	('Garrison Resources', 6),
	('Oil', 6),
	('Dingy Iron Coins', 6),
	('Seal of Tempered Fate', 6),
	('Seal of Inevitable Fate', 6),
	('Artifact Fragment', 6),
	('Curious Coin', 7),
	('Sightless Eye', 7),
	('Coins of Air', 7),
	('Veiled Argunite', 7),
	('Neithershard', 7),
	('Wakening Essence', 7),
	('Ancient Mana', 7),
	('Order Resources', 7),
	('Seal of Broken Fate', 7),
	('Legionfall War Supplies', 7),
	('Lingering Soul Fragment', 7),
	('Echoes of Battle', 7),
	('Echoes of Domination', 7),
	('Timeworn Artifact', 7),
	('Felessence', 7),
	('Shadowy Coins', 7),
	("Seafarer's Dubloon", 8),
	('Honorbound Service Medal', 8),
	('7th Legion Service Medal', 8),
	('Corrupted Mementos', 8),
	('War Resources', 8),
	('Seal of Warton Fate', 8),
	('Prismatic Manapearl', 8),
	('Coalescing Visions', 8),
	("Echoes of Ny'alotha", 8),
	("Brawler's Gold", 8),
	('Titan Residuum', 8),
	('Rich Azerite Fragment', 8),
	('War Supplies', 8),
	('Progenitor Shard', 8),
	('Cosmic Flux', 9),
	('Soul Cinders', 9),
	('Grateful Offering', 9),
	('Valor', 9),
	('Cyphers of the First Ones', 9),
	('Stygia', 9),
	('Soul Ash', 9),
	('Infused Ruby', 9),
	('Reservoir Anima', 9),
	('Tower Knowledge', 9),
	('Sinstone Fragments', 9),
	('Cataloged Research', 9),
	('Medallion of Service', 9),
	('Argent Commendation', 9),
	('Stygian Ember', 9),
	('Renown-Venthyr', 9),
	('Renown-Kyrian', 9),
	('Renown-NightFae', 9),
	('Renown-Necrolord', 9);

ALTER TABLE armor DROP COLUMN repair_price;
ALTER TABLE weapons DROP COLUMN repair_price;

INSERT INTO neutral_fractions(name, expansion) VALUES
	('Steamwheedle Cartel', 1),
	('Shattrah City', 2),
	('Alliance Vanguard', 3),
	('Horde Expedition', 3),
	('Sholazar Basin', 3),
	('The Anglers', 5),
	('The Trillers', 5),
	('Barracks Bodyguards', 6),
	('The Nightfallen', 7),
	('Order of Embers', 8),
	('Proudmoore Admiralty', 8),
	("Storm's Wake", 8),
	('The Ember Court', 9),
	('The Wild Hunt', 9);

INSERT INTO arenas (name, expansion) VALUES
	("Ashamane's Fall", 7),
	('Black Rook Hold Arena', 7),
	("Blade's Edge Arena", 2),
	('Dalaran Arena', 3),
	('Empyrean Domain', 9),
	('Enigma Arena', 9),
	('Kul Tiras Arena', 8),
	('Maldrazzus Arena', 9),
	('Mugambala', 8),
	('Nagrand Arena', 2),
	('Ruins of Lordaeron', 2),
	('Shado-Pan Showdown', 5),
	('The Robodrome', 8),
	("The Tiger's Peak", 5),
	("Tol'Viron Arena", 4);

INSERT INTO battlegrounds(name, lvl, number_of_players, expansion) VALUES
	('Strand of the Ancients', 10, '15v15', 3),
	('Warsong Gulch', 10, '10v10', 1),
	('Alterac Valley', 20, '40v40', 1),
	('Ashran', 20, '25v25', 6),
	('Isle of Conquest', 20, '25v25', 3),
	('The Battle for Gilneas', 20, '10v10', 4),
	('Twin Peaks', 30, '10v10', 4),
	('Seething Shore', 50, '10v10', 7),
	('Arathi Basin', 50, '15v15', 1),
	('Deepwind Gorge', 50, '15v15', 5),
	('Eye of the Storm', 50, '15v15', 2),
	('Silvershard Mines', 50, '15v15', 5),
	('Temple of Kotmogu', 50, '10v10', 5),
	('Wintergrasp', 50, '40v40', 3);

INSERT INTO cities(name, fraction) VALUES
	('Boralus', 1),
	('Darnassus', 1),
	('Ironforge', 1),
	('Shrine of Seven Stars', 1),
	('Stormshield', 1),
	('Stormwind City', 1),
	('The Expdar', 1),
	("Dazar'Alor", 2),
	('Orgrimmar', 2),
	('Shrine of Two Moons', 2),
	('Silvermoon City', 2),
	('Thunder Bluff', 2),
	('Undercity', 2),
	('Warspear', 2),
	('Dalaran', NULL),
	('Dalaran (Legion)', NULL),
	('Oribos', NULL),
	('Shattrath City', NULL);

INSERT INTO class_halls(name, class) VALUES
	('Acherus: The Ebon Hold', 1),
	('Chamber of Shadows', 9),
	('Dreadscar Rift', 11),
	('Hall of the Guardian', 5),
	('Netherlight Temple', 8),
	('Sanctum of Light', 7),
	('Skyhold', 12),
	('Temple of Five Dawns', 6),
	('The Dreamgrove', 3),
	('The Fell Hammer', 2),
	('The Maelstorm', 10),
	('Trueshot Lodge', 4);

INSERT INTO continents(name, expansion) VALUES
	('The Shadowlands', 9),
	('Kul Tiras', 8),
	('Zandalar', 8),
	('Broken Isles', 7),
	('Draenor', 6),
	('Pandaria', 5),
	('The Maelstrom', 5),
	('Northrend', 3),
	('Outland', 2),
	('Eastern Kingdoms', 1),
	('Kalimdor', 1);

INSERT INTO locations(name, continent, expansion, fraction, required_level) VALUES
	('Azuremist Isle', 11, 2, 1, 1),
	('Bloodmyst Isle', 11, 2, 1, 1),
	('Dun Morogh', 10, 1, 1, 1),
	('Elwynn Forest', 10, 1, 1, 1),
	('Teldrassil', 11, 1, 1, 1),
	('Darkshore', 11, 1, 1, 5),
	('Loch Modan', 10, 1, 1, 5),
	('Westfall', 10, 1, 1, 5),
	('Redbridge Mountains', 10, 1, 1, 7),
	('Duskwood', 10, 1, 1, 10),
	('Wetlands', 10, 1, 1, 10),
	('Durotar', 11, 1, 2, 1),
	('Eversong Woods', 10, 2, 2, 1),
	('Ghostlands', 10, 2, 2, 1),
	('Mulgor', 11, 1, 2, 1),
	('Tirisfal Glades', 10, 1, 2, 1),
	('Azshara', 11, 1, 2, 5),
	('Northern Barrens', 11, 1, 2, 5),
	('Silverpine Forest', 10, 1, 2, 5),
	('Hilbsrad Foothills', 10, 1, 2, 7),
	('Arathi Highlands', 10, 1, NULL, 10),
	('Deadwing Pass', 10, 1, NULL, 10),
	('Stranglethorn Vale', 10, 1, NULL, 10),
	('The Hinterlands', 10, 1, NULL, 10),
	('Badlands', 10, 1, NULL, 15),
	('Blasted Lands', 10, 1, NULL, 15),
	('Burning Steppes', 10, 1, NULL, 15),
	('Eastern Plaguelands', 10, 1, NULL, 15),
	('Searing Gorge', 10, 1, NULL, 15),
	('Swamp of Sorrows', 10, 1, NULL, 15),
	('Western Plaguelands', 10, 1, NULL, 15),
	("Isle if Quel'Danas", 10, 1, NULL, 25),
	('Moonglade', 11, 1, NULL, 1),
	('Ashenvale', 11, 1, NULL, 7),
	('Desolace', 11, 1, NULL, 10),
	('Southern Barrens', 11, 1, NULL, 10),
	('Dustwallow Marsh', 11, 1, NULL, 15),
	('Felwood', 11, 1, NULL, 15),
	('Feralas', 11, 1, NULL, 15),
	('Silithus', 11, 1, NULL, 15),
	('Tanaris', 11, 1, NULL, 15),
	('Thousand Needles', 11, 1, NULL, 15),
	("Un'Goro Crater", 11, 1, NULL, 15),
	('Winterspring', 11, 1, NULL, 15),
	('Hellfire Peninsula', 9, 2, NULL, 10),
	('Zangarmash', 9, 2, NULL, 10),
	('Nagrand', 9, 2, NULL, 15),
	('Terrokar Forest', 9, 2, NULL, 15),
	("Blade's Edge Mountains", 9, 2, NULL, 20),
	('Netherstorm', 9, 2, NULL, 25),
	('Shadowmoon Valley', 9, 2, NULL, 25),
	('Borean Tundra', 8, 3, NULL, 10),
	('Howling Fjord', 8, 3, NULL, 10),
	('Dragonblight', 8, 3, NULL, 15),
	('Grizzly Hills', 8, 3, NULL, 15),
	('Sholazar Basin', 8, 3, NULL, 20),
	("Zul'Drak", 8, 3, NULL, 20),
	('Crystalsong Forest', 8, 3, NULL, 25),
	("Hrothgar's Landing", 8, 3, NULL, 25),
	('Icecrown', 8, 3, NULL, 25),
	('The Storm Peaks', 8, 3, NULL, 25),
	('Wintergrasp', 8, 3, NULL, 25),
	('Deepholm', 7, 4, NULL, 30),
	('Mount Hyjal', 11, 4, NULL, 30),
	('The Maelstrom', 7, 4, NULL, 30),
	('Tol Barad Peninsula', NULL, 4, NULL, 30),
	('Twilight Highlands', 10, 4, NULL, 30),
	('Uldum', 11, 4, NULL, 30),
	("Vashj'ir", 10, 4, NULL, 30),
	('Tol Barad', 7, 4, NULL, 35),
	('The Jade Forest', 6, 5, NULL, 10),
	('Krasarang Wilds', 6, 5, NULL, 15),
	('Valley of the Four Winds', 6, 5, NULL, 15),
	('Kun-Lai Summit', 6, 5, NULL, 20),
	('Townlong Steppes', 6, 5, NULL, 25),
	('Dread Wasters', 6, 5, NULL, 30),
	('The Veiled Stair', 6, 5, NULL, 30),
	('Timeless Island', 6, 5, NULL, 30),
	('Vale of Eternal Blossoms', 6, 5, NULL, 35),
	('Isle of Thunder', 6, 5, NULL, 32),
	('Isle of Giants', 6, 5, NULL, 35),
	('Ashran', 5, 6, NULL, 10),
	('Frostfire Ridge', 5, 6, NULL, 10),
	('Shadowmoon Valley (Draenor)', 5, 6, NULL, 10),
	('Gorgrond', 5, 6, NULL, 15),
	('Talador', 5, 6, NULL, 20),
	('Spires of Arak', 5, 6, NULL, 30),
	('Nagrand (Draenor)', 5, 6, NULL, 35),
	('Tanaan Jungle', 5, 6, NULL, 40),
	('Azsuna', 4, 7, NULL, 10),
	('Eye of Azshara', 4, 7, NULL, 10),
	('Highmountain', 4, 7, NULL, 10),
	('Stormheim', 4, 7, NULL, 10),
	('Broken Shore', 4, 7, NULL, 45),
	('Suramar', 4, 7, NULL, 45),
	('Tiragarde Sound', 2, 8, 1, 10),
	('Drustvar', 2, 8, 1, 20),
	('Stormsong Valley', 2, 8, 1, 30),
	('Mechagon', 2, 8, NULL, 50),
	('Zuldazar', 3, 8, 2, 10),
	('Nazmir', 3, 8, 2, 20),
	("Vol'Dun", 3, 8, 2, 30),
	('Nazjatar', NULL, 8, NULL, 50),
	('Bastion', 1, 9, NULL, 51),
	('Maldraxxus', 1, 9, NULL, 53),
	('Ardenweald', 1, 9, NULL, 55),
	('Revendreth', 1, 9, NULL, 58),
	('The Maw', 1, 9, NULL, 60),
	('Zereth Mortis', 1, 9, NULL, 62);