-- Project Option: University Database
-- Purpose: Table Contents - show the contents of all tables
-- Author: Nathan Cottrell, SID: 006765987

-- set formatting options
SET LINESIZE 132
SET PAGESIZE 60

-- save queries to an output file
SPOOL tableContents_showContents.txt

-- all Staff table data
SELECT *
	FROM NCOT.Staff;

-- all StaffWorkInfo table data
SELECT *
	FROM NCOT.StaffWorkInfo;

-- all Course table data
SELECT *
	FROM NCOT.Course;

-- all Department table data
SELECT *
	FROM NCOT.Department;

-- all Module table data
SELECT *
	FROM NCOT.Module;

-- all Student table data
SELECT *
	FROM NCOT.Student;

-- all NextKin table data
SELECT *
	FROM NCOT.NextKin;

-- all Performance table data
SELECT *
	FROM NCOT.Performance;

-- all Teaching table data
SELECT *
	FROM NCOT.Teaching;

-- stop saving queries to output file
SPOOL off