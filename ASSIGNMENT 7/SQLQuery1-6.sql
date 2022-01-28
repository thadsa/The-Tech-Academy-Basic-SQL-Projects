USE db_zoo
GO

/* Assignment One */
SELECT * FROM Table_Habitat;

/* Assignment Two */
SELECT Species_Name FROM Table_Species WHERE Species_Order = 5;

/* Assignment Three */
SELECT  Nutrition_type FROM Tbl_Nutrition WHERE Nutrition_Cost <= 800;

/* Assignment Four */
SELECT Species_Name FROM Table_Species WHERE Species_Nutrition BETWEEN 2202 AND 2206;

/* Assignment Five */
SELECT Species_Name "Species Name:", Nutrition_Type "Nutrition Type:" FROM Table_Species, Table_Nutrition WHERE Species_Nutrition = Nutrition_id;

/* Assignment Six */
SELECT * FROM Table_Species
SELECT * FROM Table_Specialist
SELECT * FROM Table_Care

SELECT Species_Name, Specialist_fname, Specialist_lname, Specialist_Contact
FROM Table_Specialist
INNER JOIN Table_Care ON Table_Specialist.Specialist_id = Care_Specialist
INNER JOIN Table_Species ON Care_id = Species_Care
WHERE Species_Name = 'Elephant';