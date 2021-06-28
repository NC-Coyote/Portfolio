-- Project Option: University Database
-- Purpose: Data dictionary - create comments on the tables and columns
-- Author: Nathan Cottrell, SID: 006765987

-- Staff Table
COMMENT ON TABLE Staff IS 'Contains personal info about all staff in the database.';
COMMENT ON COLUMN Staff.staff_number IS 'Uniqe staff number for each staff member.';
COMMENT ON COLUMN Staff.networkUID IS 'Unique computer network ID for all staff and students.';
COMMENT ON COLUMN Staff.fName IS 'The first name of the staff member.';
COMMENT ON COLUMN Staff.lName IS 'The last name of the staff member.';
COMMENT ON COLUMN Staff.address IS 'Where the staff member lives.';
COMMENT ON COLUMN Staff.staff_phone IS 'Phone number of the staff member.';
COMMENT ON COLUMN Staff.sex IS 'The gender of the staff member.';

--StaffWorkInfo Table
COMMENT ON TABLE StaffWorkInfo IS 'Contains work-related info about all staff.';
COMMENT ON COLUMN StaffWorkInfo.staff_number IS 'Unique staff number for each staff member.';
COMMENT ON COLUMN StaffWorkInfo.deptID IS 'The department that this staff member works for.';
COMMENT ON COLUMN StaffWorkInfo.office_no IS 'The office number where the staff member works.';
COMMENT ON COLUMN StaffWorkInfo.salary IS 'How much money the staff member earns per month.';
COMMENT ON COLUMN StaffWorkInfo.position IS 'What type of job the staff member performs (i.e. professor).';
COMMENT ON COLUMN StaffWorkInfo.qualifications IS 'The type(s) of qualifications for each staff member.';

-- Course Table
COMMENT ON TABLE Course IS 'All information about the universities academic courses.';
COMMENT ON COLUMN Course.course_code IS 'Unique number to identify each course.';
COMMENT ON COLUMN Course.deptID IS 'The department in charge of managing this course.';
COMMENT ON COLUMN Course.course_title IS 'The name of each course.';
COMMENT ON COLUMN Course.staff_number IS 'The staff number of the course manager.';
COMMENT ON COLUMN Course.duration IS 'How long the course will run (in months).';

-- Department Table
COMMENT ON TABLE Department IS 'All information about each university department.';
COMMENT ON COLUMN Department.deptID IS 'Unique number to identify each department.';
COMMENT ON COLUMN Department.dept_name IS 'The name of each department.';
COMMENT ON COLUMN Department.staff_number IS 'The staffID of the department manager.';
COMMENT ON COLUMN Department.mgrStartDate IS 'The date the manager started working.';
COMMENT ON COLUMN Department.dept_phone IS 'Phone number of each department.';
COMMENT ON COLUMN Department.fax IS 'Fax number of each department.';
COMMENT ON COLUMN Department.location IS 'Where each department is physically located.';

-- Module Table
COMMENT ON TABLE Module IS 'All information about each module the university offers.';
COMMENT ON COLUMN Module.module_code IS 'Unique number to identify each module.';
COMMENT ON COLUMN Module.course_code IS 'The course to which this module belongs.';
COMMENT ON COLUMN Module.staff_number IS 'The staff number of the module coordinator.';
COMMENT ON COLUMN Module.module_title IS 'The name of each module.';
COMMENT ON COLUMN Module.mod_start IS 'The start date of each module.';
COMMENT ON COLUMN Module.mod_end IS 'The end date of each module.';
COMMENT ON COLUMN Module.textbooks IS 'Any required textbooks for the module.';

-- Student Table
COMMENT ON TABLE Student IS 'Information about all students in the database.';
COMMENT ON COLUMN Student.matricNo IS 'Unique number to identify each student.';
COMMENT ON COLUMN Student.course_code IS 'The course the student is currently enrolled.';
COMMENT ON COLUMN Student.fName IS 'First name of the student.';
COMMENT ON COLUMN Student.lName IS 'Last name of the student.';
COMMENT ON COLUMN Student.sex IS 'Gender of the student.';
COMMENT ON COLUMN Student.street IS 'The street address of each student.';
COMMENT ON COLUMN Student.town IS 'The town or city in which the student lives.';
COMMENT ON COLUMN Student.postal_code IS 'Postal/zip code of the student.';
COMMENT ON COLUMN Student.financial_loan IS 'Information about the financial aid loan of the student.';

-- NextKin Table
COMMENT ON TABLE NextKin IS 'Information about each next-of-kin/emergency contact.';
COMMENT ON COLUMN NextKin.matricNo IS 'The matriculation number of the student associated with this contact.';
COMMENT ON COLUMN NextKin.NOKname IS 'Name of the next-of-kin for each student.';
COMMENT ON COLUMN NextKin.NOKaddress IS 'Address of next-of-kin for each student.';
COMMENT ON COLUMN NextKin.NOKphone IS 'Phone number of next-of-kin for each student.';
COMMENT ON COLUMN NextKin.relationship IS 'Relationship each next-of-kin has to the student.';

-- Performance Table
COMMENT ON TABLE Performance IS 'Information about the grades each student earns in each module.';
COMMENT ON COLUMN Performance.matricNo IS 'Lists the matriculation number associated with the student.';
COMMENT ON COLUMN Performance.module_code IS 'Lists the module the student is undertaking.';
COMMENT ON COLUMN Performance.grade IS 'Lists the grade the student earned in the specified module.';

-- Teaching Table
COMMENT ON TABLE Teaching IS 'Displays information about the module and hours a staff member worked.';
COMMENT ON COLUMN Teaching.staff_number IS 'The associated staff number of the teaching staff member.';
COMMENT ON COLUMN Teaching.module_code IS 'The module the staff member is teaching.';
COMMENT ON COLUMN Teaching.hours IS 'The number of hours per week the staff member worked/taught.';