
/*CREATE DATABASE db_car;*/
/*USE db_car;*/

CREATE TABLE table_owners (
	owner_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	owner_fname varchar(30),
	owner_lname varchar(30),
	owner_contact varchar(30)
);

CREATE TABLE table_car (
	car_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	car_brand varchar(20) NOT NULL,
	car_age INT,
	car_color varchar(20) NOT NULL,
	car_owner INT NOT NULL CONSTRAINT fk_owner_id FOREIGN KEY REFERENCES table_owner(owner_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO table_owner
	(owner_fname, owner_lname, owner_contact)
	VALUES
	('kavi', 'Liya', '425-562-0808'),
	('Aji', 'Salu', '206-608-7576'),
	('Kamal', 'dimal', '425-351-5179')
;

INSERT INTO table_car
	(car_brand, car_age, car_color, car_owner)
	VALUES
	('Audi', 2006, 'blue', 4),
	('BMW', 2020, 'black', 2),
	('Hyundai', 2013, 'red', 1)
;

SELECT * FROM table_car;
SELECT * FROM table_owner;