/* ---------------------
   ------- VIEWS -------
   ---------------------  */

/* 
CREATE OR REPLACE VIEW view_name - Indicates that you are
						creating a view and giving it a name.
AS 					  - This keyword is used to introduce
						the SELECT statement that defines the view.
SELECT column1,2,3..  - Specify the columns you want to include.
FROM base_table       - Table from which you are selecting data.
WHERE condition       - Optionally, you can include
						a WHERE clause to filter the data
WITH CHECK OPTION;    - ensures that any data modifications made
						through the view (e.g., INSERT, UPDATE)
                        will adhere to the specified condition
                        in the view's WHERE clause.
*/

USE practice1;

/* Create a new view called 'vw_staff_common' using the
staff tabe, that includes all columns apart from salary 
and date of birth and a filter to only show staff with a
job title that contains 'DB' */
CREATE VIEW view_staff_common
AS
SELECT employeeID, firstName, lastName, jobtitle, managerID, department
FROM staff
WHERE jobtitle LIKE "%DB%";

/* Insert the below value into the original staff table
through the 'vw_staff_common' view (8888,'Mike', 'Davies', 
'Developer', 2323, 'Database Administrators'); */
INSERT INTO view_staff_common 
VALUES (8888,"Mike", "Davies", "Developer", 2323, "Database Administrators");

/* Query the view and the original table to see if the new
data is visible */
SELECT * FROM staff;
SELECT * FROM view_staff_common;

/* Create another view that is the same as the previous
but call it 'vw_staff_common2' and include the
WITH CHECK OPTION and the end of the query */
CREATE VIEW view_staff_common2
AS
SELECT employeeID, firstName, lastName, jobtitle, managerID, department
FROM staff
WHERE jobtitle LIKE "%DB%"
WITH CHECK OPTION;

/* Try and insert the below values into the original staff
table through the 'vw_staff_common2' view (5556, 'Thomas',
'Fisher', 'Developer', 8989, 'Database Administrators')*/
INSERT INTO view_staff_common2
VALUES (5556, "Thomas", "Fisher", "Developer", 8989, "Database Administrators");

/* Try and insert the below values into the original staff
table through the 'vw_staff_common2' view (5556, 'Thomas', 
'Fisher', 'DB Developer', 8989, 'Database Administrators')*/
INSERT INTO view_staff_common2
VALUES (5556, "Thomas", "Fisher", "DB Developer", 8989, "Database Administrators");

/* Query the view and the original table to see if the
new data is visible */
SELECT * FROM staff;
SELECT * FROM view_staff_common2;
