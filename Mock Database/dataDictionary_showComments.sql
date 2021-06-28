-- Project Option: University Database
-- Purpose: Data dictionary - display comments on the tables and columns
-- Author: Nathan Cottrell, SID: 006765987

-- set formatting options
COLUMN table_name FORMAT A20
COLUMN column_name FORMAT A20
COLUMN comments FORMAT A40 WRAPPED
SET LINESIZE 132
SET PAGESIZE 60

-- save results to an ouput file
SPOOL Data_Dictionary_comments.txt

-- query comments of the tables made in my account
SELECT table_name, comments
	FROM user_tab_comments
	WHERE table_name IN ('STAFF','STAFFWORKINFO','COURSE','DEPARTMENT','MODULE','STUDENT',
			     'NEXTKIN','PERFORMANCE','TEACHING')
	ORDER BY table_name;

-- query comments of columns for each table
SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'STAFF';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'STAFFWORKINFO';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'COURSE';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'DEPARTMENT';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'MODULE';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'STUDENT';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'NEXTKIN';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'PERFORMANCE';

SELECT table_name, column_name, comments
	FROM user_col_comments
	WHERE table_name = 'TEACHING';

-- stop saving queries to output file
SPOOL off