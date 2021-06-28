-- Project Option: University Database
-- Purpose: Project Queries - transaction requirements for the University database
-- Author: Nathan Cottrell, SID: 006765987

-- set formatting options
SET PAUSE OFF
SET ECHO ON
SET LINESIZE 132
SET PAGESIZE 60

-- save queries to an output file
SPOOL projectQueries.txt

-- 1. List details of all departments located in E Block.
SELECT *
	FROM NCOT.Department
	WHERE location = 'E Block';

-- 2. List title, start and end dates of all modules run in the PgDIT course.
SELECT module_title, mod_start, mod_end
	FROM NCOT.Module
	WHERE course_code = 'PgDIT';

-- 3. List name, address, and salary for each female member of academic staff
--    who manages a department.
SELECT s.fName || ' ' || s.lName AS Name, s.address, m.salary
	FROM NCOT.Staff s, NCOT.StaffWorkInfo m
	WHERE s.staff_number = m.staff_number AND s.sex = 'F' AND m.position LIKE '%Dept. Manager%';

-- 4. List name, sex, and salary for each lecturer with a PhD degree.
SELECT s.fName || ' ' || s.lName AS Name, s.sex, sw.salary
	FROM NCOT.Staff s, NCOT.StaffWorkInfo sw
	WHERE s.staff_number = sw.staff_number AND sw.position LIKE '%Lecturer%' AND sw.qualifications LIKE '%PhD%';

-- 5. List last name, position, and qualifications of all members of academic staff
--    who are employed by CIS department.
SELECT s.lName, sw.position, sw.qualifications
	FROM NCOT.Staff s, NCOT.StaffWorkInfo sw
	WHERE s.staff_number = sw.staff_number AND sw.deptID = 'BSCIS';

-- 6. List matriculation number, last name, and sex of all students who are
--    studying 'multi-media' module. Order result alphabetically by last name.
SELECT matricNo, lName, sex
	FROM NCOT.Student
	WHERE course_code IN
		(SELECT course_code
			FROM NCOT.Module
			WHERE module_code = 'MULTM')
	ORDER BY lName;

-- 7. List staff number, last name, sex, and post of all academic staff whose
--    salary is greater than the average salary of all academic staff.
SELECT s.staff_number, s.lName, s.sex, sw.position
	FROM NCOT.Staff s, NCOT.StaffWorkInfo sw
	WHERE s.staff_number = sw.staff_number AND sw.salary > 
		(SELECT AVG(salary)
			FROM NCOT.StaffWorkInfo);

-- 8. For each course with more than 10 students, list course title and the
--    number of students (under an appropriate header).
SELECT course_code, COUNT(matricNo) "Number of Students"
	FROM NCOT.Student
	WHERE course_code = 'FADES'
	GROUP BY course_code;

-- 9. List the number of female members of academic staff and the number of
--    male members of academic staff employed by CIS department.
SELECT COUNT(CASE WHEN s.sex = 'F' THEN 1 END) "Female Staff",
	COUNT(CASE WHEN s.sex = 'M' THEN 1 END) "Male Staff"
	FROM NCOT.Staff s, NCOT.StaffWorkInfo sw
	WHERE s.staff_number = sw.staff_number AND sw.deptID = 'BSCIS';

-- 10. For each member of academic staff who spends more than 6 hours teaching
--     any module list the member of academic staff last name, the module title
--     and the number of hours.
SELECT s.lName, m.module_title, t.hours
	FROM NCOT.Staff s, NCOT.Module m, NCOT.Teaching t
	WHERE s.staff_number = m.staff_number AND m.staff_number = t.staff_number AND t.hours > 6;

-- 11. For each department list the department name, and the number of female
--     members of academic staff, and the number of male members of academic
--     staff under appropriate headers.
SELECT d.dept_name, COUNT(CASE WHEN s.sex = 'F' THEN 1 END) "Female Staff",
	COUNT(CASE WHEN s.sex = 'M' THEN 1 END) "Male Staff"
	FROM NCOT.Department d, NCOT.Staff s, NCOT.StaffWorkInfo sw
	WHERE d.deptID = sw.deptID AND s.staff_number = sw.staff_number
	GROUP BY d.dept_name
	ORDER BY d.dept_name;

SET ECHO OFF
-- stop saving queries to output file
SPOOL off