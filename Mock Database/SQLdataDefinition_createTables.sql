-- Project Option: University Database
-- Purpose: SQL Data Definition - create the tables of the university database
-- Author: Nathan Cottrell, SID: 006765987

DROP TABLE Staff CASCADE CONSTRAINTS;
CREATE TABLE Staff (
	staff_number CHAR(5) NOT NULL,
	networkUID CHAR(5) NOT NULL,
	fName VARCHAR(15) NOT NULL,
	lName VARCHAR(15) NOT NULL,
	address VARCHAR(40) NOT NULL,
	staff_phone NUMBER(10) NOT NULL,
	sex CHAR(1) NOT NULL,
	CONSTRAINTS Staff_staff_number_PK PRIMARY KEY (staff_number)
);

DROP TABLE StaffWorkInfo CASCADE CONSTRAINTS;
CREATE TABLE StaffWorkInfo (
	staff_number CHAR(5) NOT NULL,
	deptID CHAR(5) NOT NULL,
	office_no CHAR(5) NOT NULL,
	salary NUMBER(5) NOT NULL,
	position VARCHAR(25) NOT NULL,
	qualifications VARCHAR(30) NOT NULL,
	CONSTRAINTS StaffWorkInfo_staff_number_PK PRIMARY KEY (staff_number)
);

DROP TABLE Course CASCADE CONSTRAINTS;
CREATE TABLE Course (
	course_code CHAR(5) NOT NULL,
	deptID CHAR(5) NOT NULL,
	course_title VARCHAR(25) NOT NULL,
	staff_number CHAR(5) NOT NULL,
	duration NUMBER(2) NOT NULL,
	CONSTRAINTS Course_course_code_PK PRIMARY KEY (course_code)
);

DROP TABLE Department CASCADE CONSTRAINTS;
CREATE TABLE Department (
	deptID CHAR(5) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	staff_number CHAR(5) NOT NULL,
	mgrStartDate DATE NOT NULL,
	dept_phone NUMBER(10) NOT NULL,
	fax NUMBER(10) NOT NULL,
	location VARCHAR(20) NOT NULL,
	CONSTRAINTS Department_deptID_PK PRIMARY KEY (deptID)
);

DROP TABLE Module CASCADE CONSTRAINTS;
CREATE TABLE Module (
	module_code CHAR(5) NOT NULL,
	course_code CHAR(5),
	staff_number CHAR(5),
	module_title VARCHAR(25) NOT NULL,
	mod_start DATE,
	mod_end DATE,
	textbooks VARCHAR(35),
	CONSTRAINTS Module_module_code_PK PRIMARY KEY (module_code)
);

DROP TABLE Student CASCADE CONSTRAINTS;
CREATE TABLE Student (
	matricNo CHAR(5) NOT NULL,
	course_code CHAR(5),
	fName VARCHAR(15) NOT NULL,
	lName VARCHAR(15) NOT NULL,
	sex CHAR(1) NOT NULL,
	street VARCHAR(20) NOT NULL,
	town VARCHAR(15) NOT NULL,
	postal_code NUMBER(5) NOT NULL,
	financial_loan VARCHAR(40) NOT NULL,
	CONSTRAINTS Student_matricNo_PK PRIMARY KEY (matricNo)
);

DROP TABLE NextKin CASCADE CONSTRAINTS;
CREATE TABLE NextKin (
	matricNo CHAR(5) NOT NULL,
	NOKname VARCHAR(20) NOT NULL,
	NOKaddress VARCHAR(40) NOT NULL,
	NOKphone NUMBER(10) NOT NULL,
	relationship VARCHAR(20) NOT NULL,
	CONSTRAINTS NextKind_matricNo_PK PRIMARY KEY (matricNo)
);

DROP TABLE Performance CASCADE CONSTRAINTS;
CREATE TABLE Performance (
	matricNo CHAR(5) NOT NULL,
	module_code CHAR(5) NOT NULL,
	grade CHAR(1) NOT NULL,
	CONSTRAINTS Performance_matricNo_PK PRIMARY KEY (matricNo,module_code)
);

DROP TABLE Teaching CASCADE CONSTRAINTS;
CREATE TABLE Teaching (
	staff_number CHAR(5) NOT NULL,
	module_code CHAR(5) NOT NULL,
	hours NUMBER(2) NOT NULL,
	CONSTRAINTS Teaching_staff_number_PK PRIMARY KEY (staff_number,module_code)
);