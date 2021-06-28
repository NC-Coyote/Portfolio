-- Project Option: University Database
-- Purpose: Table Structure - show the contents/data categories of each table
-- Author: Nathan Cottrell, SID: 006765987

-- set formatting options
SET PAUSE OFF
SET LINESIZE 80
SET PAGESIZE 55

-- save queries to an output file
SPOOL tableStructures.txt

-- display a description of each table
DESC NCOT.Staff
DESC NCOT.StaffWorkInfo
DESC NCOT.Course
DESC NCOT.Department
DESC NCOT.Module
DESC NCOT.Student
DESC NCOT.NextKin
DESC NCOT.Performance
DESC NCOT.Teaching

-- stop saving queries to output file
SPOOL off