CREATE DATABASE library_Database
GO
USE library_Database
GO
CREATE TABLE LIBRARY_BRANCHS(
	Branch_ID INT PRIMARY KEY NOT NULL IDENTITY(100,100),
	Branch_Name VARCHAR(50) NOT NULL,
	[Address] VARCHAR(125) NOT NULL
);
INSERT INTO LIBRARY_BRANCHS
	(Branch_Name, [Address])
	VALUES
	('Agincourt', 'Agincourt'),
	('Albert Campbell', 'Scarborough Junction'),
	('Albion', 'Smithfield'),
	('Alderwood', 'Alderwood'),
	('Amesbury Park', 'Amesbury'),
	('Annette Street', 'The Junction')
;
SELECT * FROM LIBRARY_BRANCHS;
CREATE TABLE PUBLISHER(
	Publisher_Name VARCHAR(50) PRIMARY KEY NOT NULL,
	[Address] VARCHAR(100) NOT NULL,
	Phone VARCHAR(16) NOT NULL,
);
INSERT INTO PUBLISHER
	(Publisher_Name, [Address], Phone)
	VALUES
	('Birkhäuser Science', 'Cambridge University Press University Printing House Shaftesbury Road Cambridge CB2 8BS United Kingdom', '(000) 000-0000'),
	('Cambridge University Press, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('Cengage Learning', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('Global Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('Jacksonville Magazine', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('Free Press Publishing Services', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('Heirs House Publishing', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('BluewaterPress LLC', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('Blue Hawk Publishing', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	('Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000')
;
SELECT * FROM PUBLISHER;
CREATE TABLE BORROWER(
	Card_No INT PRIMARY KEY NOT NULL,
	[Name] VARCHAR(50) NOT NULL,
	[Address] VARCHAR(75) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);
INSERT INTO BORROWER
	(Card_No, [Name], [Address], Phone)
	VALUES
	(10001, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	(10002, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	(10003, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	(10004, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	(10005, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	(10006, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	(10007, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000'),
	(10008, 'Heyday Publishing, Inc.', 'North America 10650 Toebben Drive Independence, KY 41051', '(000) 000-0000')
;
SELECT * FROM BORROWER;
CREATE TABLE BOOKS(
	Book_ID INT PRIMARY KEY NOT NULL IDENTITY(10,1),
	Title VARCHAR(50) NOT NULL,
	Publisher_Name VARCHAR(50) CONSTRAINT fk_Publisher_Name REFERENCES PUBLISHER(Publisher_Name)
);
INSERT INTO BOOKS
	(Title, Publisher_Name)
	VALUES
	('Vinayak Varma','Ammachis Incredible Investigation'),
	('Yamini Vijayan','Your Body is Yours'),
	('Shikha Tripathi','Tine and the Faraway Mountain'),
	('Anthony Sadar','In Global Warming We Trust: Too Big to Fail'),
	('Anthony Garone','Failure To Fracture'),
	('Larry Bell','Cyberwarfare'),
	('Garth Nix','Sabriel'),
	('Elizabeth Acevedo','Clap When You Land'),
	('Holly Black','The Cruel Prince'),
	('Hunter Biden','Beautiful Things.'),
	('Rupi Kaur','Home Body'),
	('Stephen R Covey','The 7 Habits of Highly Effective People'),
	('Elena Ferrante','My Brilliant Friend'),
	('Muriel Barbery','The Elegance of the Hedgehog'),
	('Alina Bronsky','The Hottest Dishes of the Tartar Cuisine'),
	('Oprah Winfrey & Bruce D. Perry','What Happened to You?'),
	('Yaara Shehori','Aquarium'),
	('Elton John','Me'),
	('Sajni Patel','The Trouble With Hating You'),
	('Grace Burrowes','When a Duchess Says I Do')
;
SELECT * FROM BOOKS;
CREATE TABLE BOOK_COPIES(
	Book_ID INT CONSTRAINT fk_Book_ID FOREIGN KEY REFERENCES BOOKS(Book_ID),
	Branch_ID INT CONSTRAINT fk_Branch_ID FOREIGN KEY REFERENCES LIBRARY_BRANCHS(Branch_ID),
	Number_Of_Copies INT NOT NULL
);
INSERT INTO BOOK_COPIES
	(Book_ID, Branch_ID, Number_Of_Copies)
	VALUES
	(30,7,4),
	(13,3,2),
	(11,5,4),
	(12,6,3),
	(16,1,3),
	(13,1,2),
	(15,2,5),
	(16,2,2),
	(17,5,3),
	(12,6,3),
	(20,2,4),
	(23,4,4),
	(22,4,2),
	(20,3,3),
	(29,5,2),
	(27,3,5),
	(25,5,4),
	(26,4,2),
	(28,6,4),
	(30,5,3)
;
SELECT * FROM BOOK_COPIES;
CREATE TABLE BOOK_AUTHORS(
	Book_ID INT, 
	Author_Name VARCHAR(50) NOT NULL,
);
INSERT INTO BOOK_AUTHORS
	(Book_ID, Author_Name)
	VALUES
	(10,'William Shakespeare'),
	(18, 'Agatha Christie'),
	(20,'Barbara Cartland	'),
	(11,'Danielle Steel'),
	(14,'Harold Robbins'),
	(17,'Georges Simenon'),
	(23,'Enid Blyton'),
	(25,'Sidney Sheldon'),
	(22,'J. K. Rowling'),
	(26,'Gilbert Patten')
;
SELECT * FROM BOOK_AUTHORS;
CREATE TABLE BOOK_LOANS(
	Book_ID INT CONSTRAINT fk_Book_ID_Loan REFERENCES BOOKS(Book_ID),
	Branch_ID INT CONSTRAINT fk_Branch_ID_Loan REFERENCES LIBRARY_BRANCHS(Branch_ID),
	Card_No INT CONSTRAINT fk_Card_No_Loan REFERENCES BORROWER(Card_No),
	Date_Out VARCHAR(20) NOT NULL,
	Date_Due varchar(20) NOT NULL
);
INSERT INTO BOOK_LOANS
	(Book_ID, Branch_ID, Card_No, Date_Out, Date_Due)
	VALUES
	(10, 6, 10001, 00000000, 00000000),
	(11, 3, 10002, 00000000, 00000000),
	(14, 2, 10003, 00000000, 00000000),
	(12, 2, 10004, 00000000, 00000000),
	(13, 2, 10005, 00000000, 00000000),
	(19, 1, 10006, 00000000, 00000000),
	(22, 5, 10007, 00000000, 00000000),
	(24, 4, 10007, 00000000, 00000000),
	(26, 6, 10001, 00000000, 00000000),
	(20, 1, 10002, 00000000, 00000000)
;
SELECT * FROM BOOK_LOANS;
SELECT *
FROM BOOK_LOANS
FULL OUTER JOIN BORROWER ON BOOK_LOANS.Card_No = BORROWER.Card_No
FULL OUTER JOIN BOOKS ON BOOK_LOANS.Book_ID = BOOKS.Book_ID;
SELECT BOOKS.Title, BOOK_AUTHORS.Author_Name
FROM BOOKS 
INNER JOIN BOOK_AUTHORS ON BOOKS.Book_ID = BOOK_AUTHORS.Book_ID;
CREATE PROCEDURE .lostTribeOwnedSharptown;
AS
	SELECT BOOK_COPIES.Number_Of_Copies [Sharpstown Copies];
	FROM LIBRARY_BRANCH;
	INNER JOIN BOOK_COPIES ON BOOK_COPIES.BranchID = LIBRARY_BRANCHS.Branch_IDs;
	WHERE LIBRARY_BRANCHS.Branch_IDs = 2 AND BOOK_COPIES.Book_IDs = 29;
GO
EXEC [dbo].[lostTribeOwnedSharptown];
CREATE PROCEDURE .lostTribeOwnedAllLibraries;
AS
	SELECT BOOK_COPIES.Number_Of_Copies [# of Copies];
	FROM LIBRARY_BRANCHS;
	INNER JOIN BOOK_COPIES ON BOOK_COPIES.Branch_IDs = LIBRARY_BRANCH.Branch_IDs;
	WHERE BOOK_COPIES.BookID = 29;
GO
EXEC [dbo].[lostTribeOwnedAllLibraries];
CREATE PROCEDURE .borrowersWithNoBooks;
AS 
SELECT BORROWER.[Name];
FROM BORROWER;
WHERE NOT EXISTS(
	SELECT BORROWER.[Name] FROM BOOK_LOANS;
	WHERE BORROWER.CardNo = BOOK_LOANS.CardNo);
GO
EXEC [dbo].[borrowersWithNoBooks];