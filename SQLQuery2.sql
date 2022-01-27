CREATE DATABASE schoolDB
GO

USE schoolDB
GO

/* CREATE Students Table */
CREATE TABLE Students(
	Student_ID INT PRIMARY KEY NOT NULL IDENTITY(1000,1),
	Student_Name VARCHAR(50) NOT NULL
	);

--INSERT names into table
INSERT INTO Students
	(Student_Name)
	VALUES
	('abishek Vijay');
;

--CREATE Instructors table
CREATE TABLE Instructors(
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY(10000,1),
	Instructor_Name VARCHAR(50) NOT NULL,
	);

--INSERT Names into Instructors table
INSERT INTO Instructors
	(Instructor_Name)
	VALUES
	('Kavi Liya'),
	('Thadsa Yoga')
;

--CREATE Classes Table
CREATE TABLE Classes(
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Class_Name VARCHAR(50) NOT NULL,
	);

--INSERT Class names into table
INSERT INTO Classes
	(Class_Name)
	VALUES
	('Java Script'),
	('SQL')
;

--UPDATE Foreign Key fields
UPDATE Students
SET Instructor_ID = 10000
WHERE Student_ID = 1000
;

--ALTER table data to add Foreign Key Constraints
ALTER TABLE Students
ADD Instructor_ID INT CONSTRAINT fk_InstructorS_ID FOREIGN KEY REFERENCES Instructors(Instructor_ID);

ALTER TABLE Classes
ADD Instructor_ID INT CONSTRAINT fk_Instructor_ID FOREIGN KEY REFERENCES Instructors(Instructor_ID);

--Query to display all Instructor names
SELECT Instructor_Name FROM Instructors;

--Query to display all student names in alphabetical order
SELECT Student_Name FROM Students ORDER BY Student_Name ASC;

--Query to display all classes, with the students and Instructors assigned to each
SELECT 
	s1.Student_Name, i1.Instructor_Name, c1.Class_ID
	FROM Students s1, Instructors i1
	INNER JOIN Classes c1 ON c1.Instructor_ID = i1.Instructor_ID;

--Display all data from any table
SELECT * FROM Students;
SELECT * FROM Instructors;
SELECT * FROM Classes;