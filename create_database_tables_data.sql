-- Create a new database called 'practice1' 
CREATE DATABASE practice1;

USE practice1;

/* Create a table called 'staff' that contains information
about staff, their names, departments, salary figures */
CREATE TABLE staff (
  employeeID INT NOT NULL,
  firstname VARCHAR(45) NOT NULL,
  lastname VARCHAR(45) NOT NULL,
  jobtitle VARCHAR(45) NOT NULL,
  managerID INT NOT NULL,
  department VARCHAR(45) NULL,
  salary INT NULL DEFAULT 0,
  dateofbirth DATE NULL DEFAULT '1900-01-01',
  CONSTRAINT pk_staff PRIMARY KEY (employeeID));

-- Insert data into staff table
INSERT INTO 
staff (employeeID, firstName, lastName, jobtitle, managerID, department, salary, dateofbirth) 
VALUES
(1245, 'Julie', 'Smith', 'DBA', '3333', 'Database Administrators', 50000, '1985-10-20'),
(4578, 'Jame', 'Blogs', 'DBA', '3333', 'Database Administrators', 52000, '1970-10-22');

SELECT * FROM staff;
