-- Project Option: University Database
-- Purpose: Table Contents - insert data in all the tables
-- Author: Nathan Cottrell, SID: 006765987

SET CONSTRAINTS ALL DEFERRED;

INSERT INTO Staff VALUES ('S0000','NU000','Chuck','Norris','53 Main St, Fontana, 95671','9095557263','M');
INSERT INTO Staff VALUES ('S1001','NU100','Elaine','Willis','139 Vivaldi Ave, Fontana, 93762','9095553878','F');
INSERT INTO Staff VALUES ('S1003','NU101','Jordan','Ogadikwe','365 Franklin Blvd, Upland, 91650','9095551248','M');
INSERT INTO Staff VALUES ('S1005','NU103','Katherine','Dierst','325 Michael Rd, San Bernardino, 95176','9095555876','F');
INSERT INTO Staff VALUES ('S1007','NU105','Roger','Yang','29 Filrow Way, Upland, 93125','9095556971','M');
INSERT INTO Staff VALUES ('S1009','NU107','Chrissie','Bjord','119 Trevor Place, Fontana, 97653','9095558892','F');
INSERT INTO Staff VALUES ('S1011','NU109','Matt','Halford','76 Vault Rd, Apalachia, 97621','9095550976','M');
INSERT INTO Staff VALUES ('S1013','NU111','Kylie','Jordan','37 Redemption Way, Fontana, 96371','9095556050','F');
INSERT INTO Staff VALUES ('S1015','NU113','Geoff','Sonrimor','517 Terrace St, Riverside, 93899','9095550132','M');
INSERT INTO Staff VALUES ('S1017','NU115','Janice','Smith','28 Filrow Way, Upland, 93125','9095554790','F');
INSERT INTO Staff VALUES ('S1019','NU117','Terry','Fontaine','38 Vilford Way, Riverside, 97654','9095556253','M');
INSERT INTO Staff VALUES ('S1021','NU119','Tilly','Arnold','953 Buford Rd, San Bernardino, 91587','9095553021','F');
INSERT INTO Staff VALUES ('S1023','NU121','Trevor','Flately','603 Toledo Bay, Fontana, 93645','9095550662','M');
INSERT INTO Staff VALUES ('S1025','NU123','Phyllis','Claymore','216 Vespucci Beach, Upland, 97321','9095551829','F');
INSERT INTO Staff VALUES ('S1027','NU125','Adam','Reynolds','111 Fiddleridge, Fontana, 93346','9095553459','M');
INSERT INTO Staff VALUES ('S1029','NU127','Wendy','Robins','65 Wellback Row, Upland, 96837','9095550152','F');
INSERT INTO Staff VALUES ('S1031','NU129','Roger','Wellington','762 Pillbox Ln, San Bernardino, 95341','9095557800','M');
INSERT INTO Staff VALUES ('S1033','NU131','Margerie','Wilson','98 Vexford Ave, Riverside, 91873','9095551450','F');

INSERT INTO Department VALUES ('ADMIN','Administration','S0000','07-JUN-00','9095556673','9095556698','A Block');
INSERT INTO Department VALUES ('BSCIS','Computer Information Systems','S1001','23-MAY-07','9095556670','9095556639','E Block');
INSERT INTO Department VALUES ('BSNRS','Nursing','S1003','07-NOV-15','9095553315','9095553310','E Block');
INSERT INTO Department VALUES ('CTMRK','Marketing','S1005','30-MAR-19','9095554565','9095554509','C Block');
INSERT INTO Department VALUES ('ACTFN','Accounting and Finance','S1007','16-JUL-08','9095552999','9095552983','C Block');
INSERT INTO Department VALUES ('CMMUN','Communication','S1009','23-FEB-03','9095553071','9095553000','B Block');
INSERT INTO Department VALUES ('ARTDS','Arts and Design','S1011','13-SEP-18','9095551092','9095551076','B Block');

INSERT INTO StaffWorkInfo VALUES ('S0000','ADMIN','AB051','12000','President','PhD Administration');
INSERT INTO StaffWorkInfo VALUES ('S1001','BSCIS','EB001','7000','Dept. Manager, Lecturer','MS CIS');
INSERT INTO StaffWorkInfo VALUES ('S1003','BSNRS','EB002','6800','Dept. Manager, Lecturer','BSN Nursing');
INSERT INTO StaffWorkInfo VALUES ('S1005','CTMRK','CB001','4500','Dept. Manager, Lecturer','MS Marketing');
INSERT INTO StaffWorkInfo VALUES ('S1007','ACTFN','CB002','8000','Dept. Manager, Lecturer','CPA');
INSERT INTO StaffWorkInfo VALUES ('S1009','CMMUN','BB001','7500','Dept. Manager, Lecturer','PhD Communication');
INSERT INTO StaffWorkInfo VALUES ('S1011','ARTDS','BB002','4876','Dept. Manager, Lecturer','MA Arts and Design');
INSERT INTO StaffWorkInfo VALUES ('S1013','ARTDS','BB003','5800','Lecturer','PhD Arts and Design');
INSERT INTO StaffWorkInfo VALUES ('S1015','ARTDS','BB004','4500','Lecturer','MA Design');
INSERT INTO StaffWorkInfo VALUES ('S1017','CMMUN','BB005','3800','Lecturer','MA Communication');
INSERT INTO StaffWorkInfo VALUES ('S1019','ACTFN','CB003','4500','Lecturer','MS Accounting');
INSERT INTO StaffWorkInfo VALUES ('S1021','ACTFN','CB004','4500','Lecturer','MS Accounting');
INSERT INTO StaffWorkInfo VALUES ('S1023','CTMRK','CB005','7800','Lecturer','PhD Marketing');
INSERT INTO StaffWorkInfo VALUES ('S1025','CTMRK','CB006','4900','Lecturer','Certificate Hospit Managmnt');
INSERT INTO StaffWorkInfo VALUES ('S1027','BSNRS','EB003','6300','Lecturer','BSN Nursing');
INSERT INTO StaffWorkInfo VALUES ('S1029','BSNRS','EB004','6500','Lecturer','BSN Nursing');
INSERT INTO StaffWorkInfo VALUES ('S1031','BSCIS','EB005','6400','Lecturer','MS Computer Science');
INSERT INTO StaffWorkInfo VALUES ('S1033','BSCIS','EB006','9000','Lecturer','PhD Computer Science');

INSERT INTO Course VALUES ('PgDIT','ARTDS','Design Studies','S1013','48');
INSERT INTO Course VALUES ('FADES','ARTDS','Design','S1015','48');
INSERT INTO Course VALUES ('COMMN','CMMUN','Communication','S1017','48');
INSERT INTO Course VALUES ('ACCNT','ACTFN','Accounting and Finance','S1019','48');
INSERT INTO Course VALUES ('FINNC','ACTFN','Finance','S1021','36');
INSERT INTO Course VALUES ('MnMRK','CTMRK','Marketing','S1023','24');
INSERT INTO Course VALUES ('CrtHM','CTMRK','Hospitality Management','S1025','12');
INSERT INTO Course VALUES ('NURSG','BSNRS','Nursing','S1027','48');
INSERT INTO Course VALUES ('RNBSN','BSNRS','RN to BSN','S1029','48');
INSERT INTO Course VALUES ('CmpSc','BSCIS','Computer Science','S1031','48');
INSERT INTO Course VALUES ('BIOIN','BSCIS','Bioinformatics','S1033','48');

INSERT INTO Module VALUES ('FNDDS','PgDIT','S1011','Fundamental Design','07-SEP-20','16-NOV-20','');
INSERT INTO Module VALUES ('STRBD','PgDIT','S1015','Storyboarding','07-SEP-20','16-NOV-20',
'Proper Storytelling');
INSERT INTO Module VALUES ('CHRDS','PgDIT','S1015','Character Design','07-SEP-20','16-NOV-20','');
INSERT INTO Module VALUES ('MULTM','FADES','S1011','Multi Media','07-SEP-20','16-NOV-20','Multi Media 101');
INSERT INTO Module VALUES ('3DGPH','FADES','S1013','3D Graphics','07-SEP-20','16-NOV-20','Meshes and Models');
INSERT INTO Module VALUES ('TOPGR','FADES','S1013','Topography','07-SEP-20','16-NOV-20','Book of Topography');
INSERT INTO Module VALUES ('INCMN','COMMN','S1009','Intro to Communication','07-SEP-20','9-NOV-20',
'Effective Communications');
INSERT INTO Module VALUES ('MDSOC','COMMN','S1017','Media and Society','07-SEP-20','9-NOV-20','Social Media');
INSERT INTO Module VALUES ('INTRN','COMMN','S1017','Internship','07-SEP-20','2-NOV-20','');
INSERT INTO Module VALUES ('ACNTG','ACCNT','S1007','Accounting','07-SEP-20','16-NOV-20','All About Accounting');
INSERT INTO Module VALUES ('ACTTX','ACCNT','S1019','Taxation','07-SEP-20','16-NOV-20','Death and Taxes');
INSERT INTO Module VALUES ('AUDIT','ACCNT','S1019','Auditing','07-SEP-20','16-NOV-20','IRS Audits');
INSERT INTO Module VALUES ('MRKEN','FINNC','S1007','Market and Environment','07-SEP-20','16-NOV-20',
'The Global Market');
INSERT INTO Module VALUES ('FNANL','FINNC','S1021','Financial Analysis','07-SEP-20','16-NOV-20',
'Financial Algorithms');
INSERT INTO Module VALUES ('CRPFN','FINNC','S1021','Corporate Finance','07-SEP-20','16-NOV-20','');
INSERT INTO Module VALUES ('RSMTH','MnMRK','S1005','Research Methods','07-SEP-20','16-NOV-20',
'Marketing Research');
INSERT INTO Module VALUES ('CNSMA','MnMRK','S1023','Consumer Analysis','07-SEP-20','16-NOV-20',
'Marketing to the Consumer');
INSERT INTO Module VALUES ('DATAN','MnMRK','S1023','Data Analytics','07-SEP-20','16-NOV-20','');
INSERT INTO Module VALUES ('HOTOP','CrtHM','S1005','Hotel Operations','07-SEP-20','16-NOV-20',
'Hospitality of Hotels');
INSERT INTO Module VALUES ('ENTMN','CrtHM','S1025','Entertainment Management','07-SEP-20','16-NOV-20',
'Managing the Entertainment Industry');
INSERT INTO Module VALUES ('HUMRS','CrtHM','S1025','Human Resources','07-SEP-20','16-NOV-20',
'Managing People');
INSERT INTO Module VALUES ('MCRBI','NURSG','S1003','Microbiology','07-SEP-20','16-NOV-20',
'Microbiology 101');
INSERT INTO Module VALUES ('HUMAN','NURSG','S1027','Human Anatomy','07-SEP-20','16-NOV-20',
'Discovering the Human Body');
INSERT INTO Module VALUES ('NRSCR','NURSG','S1027','Nursing Care','07-SEP-20','16-NOV-20',
'Nursing Fundamentals');
INSERT INTO Module VALUES ('HLTAS','RNBSN','S1003','Health Assessment','07-SEP-20','16-NOV-20',
'Assessing Individuals');
INSERT INTO Module VALUES ('PTHPH','RNBSN','S1029','Pathophysiology','07-SEP-20','16-NOV-20',
'Illness and Disease');
INSERT INTO Module VALUES ('PHARM','RNBSN','S1029','Pharmacology','07-SEP-20','16-NOV-20',
'Prescription RX');
INSERT INTO Module VALUES ('MACHN','CmpSc','S1001','Machine Organization','07-SEP-20','16-NOV-20',
'Binary Structure');
INSERT INTO Module VALUES ('DATST','CmpSc','S1031','Data Structures','07-SEP-20','16-NOV-20',
'The C++ Language');
INSERT INTO Module VALUES ('DTBAS','CmpSc','S1031','Database Systems','07-SEP-20','16-NOV-20',
'Database Systems Manual');
INSERT INTO Module VALUES ('PRNCB','BIOIN','S1001','Principles of Biology','07-SEP-20','16-NOV-20',
'Biology 101');
INSERT INTO Module VALUES ('CMPSC','BIOIN','S1033','Computer Science','07-SEP-20','16-NOV-20',
'Intro to Computer Science');
INSERT INTO Module VALUES ('SEQAN','BIOIN','S1033','Sequence Analysis','07-SEP-20','16-NOV-20',
'Sequence Analysis');

INSERT INTO Student VALUES ('00101','FADES','George','Ruiz','M','111 Hampton Way','Upland','92568',
'BOG Waiver, CA Grant');
INSERT INTO Student VALUES ('00103','FADES','Melissa','Rogers','F','113 Helion Ave','Fontana','91736',
'CA Grant, Fed Pell Grant');
INSERT INTO Student VALUES ('00105','FADES','Kenny','Yu','M','82 Parcel Pl','Riverside','96813',
'Standard Unsubsidized');
INSERT INTO Student VALUES ('00107','FADES','Kathy','Bates','F','19 Rowena Rd','San Bernardino',
'92568','BOG Waiver');
INSERT INTO Student VALUES ('00109','FADES','Ryan','Malone','M','239 Huntmaster','Fontana','93662',
'Standard Subsidized');
INSERT INTO Student VALUES ('00111','FADES','Milly','Caspene','F','28 Elm St','Riverside','95668',
'Fed Pell Grant, Standard Subsidized');
INSERT INTO Student VALUES ('00113','FADES','Hank','Aaron','M','32 Calibre Way','San Bernardino',
'92568','BOG Waiver, Standard Unsubsidized');
INSERT INTO Student VALUES ('00115','FADES','Emma','Stone','F','189 Hampton Way','Upland','92568',
'CA Grant, Standard Subsidized');
INSERT INTO Student VALUES ('00117','FADES','Matthew','Rodriguez','M','5834 Foxtail','Fontana','92551',
'Standard Subsidized and Unsubsidized');
INSERT INTO Student VALUES ('00119','FADES','Mary','Sampsonite','F','52 Dumber Way','Fontana','98711',
'Standard Unsubsidized');
INSERT INTO Student VALUES ('00121','FADES','Lloyd','Flarson','M','19 Climber Path','San Bernardino',
'97762','BOG Waiver');
INSERT INTO Student VALUES ('00123','CmpSc','Nate','Fakename','M','738 Ridgeback','Upland','99932',
'Standard Subsidized, Fed Pell Grant');
INSERT INTO Student VALUES ('00125','CmpSc','Cesar','Notrealname','M','24 Diamondback Ridge',
'Riverside','95701','CA Grant, Fed Pell Grant');
INSERT INTO Student VALUES ('00127','PgDIT','Sarah','Wilson','F','328 Greenleaf Ave','Orange','95690',
'BOG Waiver, Fed Pell Grant');
INSERT INTO Student VALUES ('00129','COMMN','Harry','Roosevelt','M','10 Lincoln Rd','Anaheim','91766',
'Standard Subsidized, CA Grant');
INSERT INTO Student VALUES ('00131','ACCNT','Logan','Smith','M','576 Robco Path','Palm Springs',
'98362','Standard Unsubsidized');
INSERT INTO Student VALUES ('00133','FINNC','Jane','Seymour','F','890 Beverly Hills','Los Angeles',
'90210','Standard Unsubsidized');
INSERT INTO Student VALUES ('00135','MnMRK','John','Zipsky','M','25 Hillshire Way','Fontana','95622',
'Fed Pell Grant, BOG Waiver');
INSERT INTO Student VALUES ('00137','CrtHM','Cal','Ripken','M','918 Farmflair Pl','Upland','93325',
'Standard Unsubsidized, BOG Waiver');
INSERT INTO Student VALUES ('00139','NURSG','Jenna','Zalinski','F','13 Fairview Rd','San Bernardino',
'95036','Standard Subsidized, CA Grant');
INSERT INTO Student VALUES ('00141','RNBSN','Talia','Hodgkins','F','2931 Hipster Place','Anaheim',
'91557','Fed Pell Grant, CA Grant');

INSERT INTO NextKin VALUES ('00101','Harold','111 Hampton Way, Upland, 92568','9095553102','Parent');
INSERT INTO NextKin VALUES ('00103','Sally','113 Helion Ave, Fontana, 91736','9095552862','Parent');
INSERT INTO NextKin VALUES ('00105','Wilma','82 Parcel Pl, Riverside, 96813','9095550193','Sister');
INSERT INTO NextKin VALUES ('00107','Fred','19 Rowena Rd, San Bernardino, 92568','9095553297','Parent');
INSERT INTO NextKin VALUES ('00109','Jake','239 Huntmaster, Fontana, 93662','9095551004','Brother');
INSERT INTO NextKin VALUES ('00111','Teddy','28 Elm St, Riverside, 95668','9095556890','Brother');
INSERT INTO NextKin VALUES ('00113','Gabriel','32 Calibre Way, San Bernardino, 92568','9095550186','Sister');
INSERT INTO NextKin VALUES ('00115','Gina','189 Hampton Way, Upland, 92568','9095553492','Sister');
INSERT INTO NextKin VALUES ('00117','Alexis','5834 Foxtail, Fontana, 92551','9095553196','Sister');
INSERT INTO NextKin VALUES ('00119','Hank','52 Dumber Way, Fontana, 98711','9095555169','Parent');
INSERT INTO NextKin VALUES ('00121','Lupe','19 Climber Path, San Bernardino, 97762','9095556179','Grandparent');
INSERT INTO NextKin VALUES ('00123','Robert','738 Ridgeback, Upland, 99932','9095552684','Parent');
INSERT INTO NextKin VALUES ('00125','Ron','24 Diamondback Ridge, Riverside, 95701','9095551671','Grandparent');
INSERT INTO NextKin VALUES ('00127','Terrance','328 Greenleaf Ave, Orange, 95690','9095552151','Brother');
INSERT INTO NextKin VALUES ('00129','John','10 Lincoln Rd, Anaheim, 91766','9095552121','Uncle');
INSERT INTO NextKin VALUES ('00131','Maud','576 Robco Path, Palm Springs','9095553817','Aunt');
INSERT INTO NextKin VALUES ('00133','Tim','890 Beverly Hills, Los Angeles , 90210','9095550103','Son');
INSERT INTO NextKin VALUES ('00135','Greg','25 Hillshire Way, Fontana, 95622','9095552180','Uncle');
INSERT INTO NextKin VALUES ('00137','David','918 Farmflair Pl, Upland, 93325','9095552453','Grandparent');
INSERT INTO NextKin VALUES ('00139','Angelina','13 Fairview Rd, San Bernardino, 95036','9095552015','Parent');
INSERT INTO NextKin VALUES ('00141','Sheba','2931 Hipster Place, Anaheim, 91557','9095551488','Aunt');

INSERT INTO Performance VALUES ('00101','MULTM','A');
INSERT INTO Performance VALUES ('00103','MULTM','B');
INSERT INTO Performance VALUES ('00105','MULTM','C');
INSERT INTO Performance VALUES ('00107','MULTM','F');
INSERT INTO Performance VALUES ('00109','MULTM','F');
INSERT INTO Performance VALUES ('00111','MULTM','A');
INSERT INTO Performance VALUES ('00113','MULTM','C');
INSERT INTO Performance VALUES ('00115','MULTM','B');
INSERT INTO Performance VALUES ('00117','MULTM','B');
INSERT INTO Performance VALUES ('00119','MULTM','C');
INSERT INTO Performance VALUES ('00121','MULTM','A');
INSERT INTO Performance VALUES ('00123','DTBAS','A');
INSERT INTO Performance VALUES ('00125','MACHN','B');
INSERT INTO Performance VALUES ('00127','FNDDS','B');
INSERT INTO Performance VALUES ('00129','MDSOC','A');
INSERT INTO Performance VALUES ('00131','AUDIT','C');
INSERT INTO Performance VALUES ('00133','CRPFN','F');
INSERT INTO Performance VALUES ('00135','DATAN','B');
INSERT INTO Performance VALUES ('00137','HUMRS','F');
INSERT INTO Performance VALUES ('00139','MCRBI','C');
INSERT INTO Performance VALUES ('00141','PHARM','A');

INSERT INTO Teaching VALUES ('S1011','FNDDS','4');
INSERT INTO Teaching VALUES ('S1015','STRBD','3');
INSERT INTO Teaching VALUES ('S1015','CHRDS','8');
INSERT INTO Teaching VALUES ('S1011','MULTM','6');
INSERT INTO Teaching VALUES ('S1013','3DGPH','2');
INSERT INTO Teaching VALUES ('S1013','TOPGR','3');
INSERT INTO Teaching VALUES ('S1009','INCMN','1');
INSERT INTO Teaching VALUES ('S1017','MDSOC','1');
INSERT INTO Teaching VALUES ('S1017','INTRN','6');
INSERT INTO Teaching VALUES ('S1007','ACNTG','4');
INSERT INTO Teaching VALUES ('S1019','ACTTX','8');
INSERT INTO Teaching VALUES ('S1019','AUDIT','10');
INSERT INTO Teaching VALUES ('S1007','MRKEN','10');
INSERT INTO Teaching VALUES ('S1021','FNANL','4');
INSERT INTO Teaching VALUES ('S1021','CRPFN','4');
INSERT INTO Teaching VALUES ('S1005','RSMTH','2');
INSERT INTO Teaching VALUES ('S1023','CNSMA','6');
INSERT INTO Teaching VALUES ('S1023','DATAN','2');
INSERT INTO Teaching VALUES ('S1005','HOTOP','2');
INSERT INTO Teaching VALUES ('S1025','ENTMN','6');
INSERT INTO Teaching VALUES ('S1025','HUMRS','4');
INSERT INTO Teaching VALUES ('S1003','MCRBI','2');
INSERT INTO Teaching VALUES ('S1027','HUMAN','1');
INSERT INTO Teaching VALUES ('S1027','NRSCR','1');
INSERT INTO Teaching VALUES ('S1003','HLTAS','2');
INSERT INTO Teaching VALUES ('S1029','PTHPH','3');
INSERT INTO Teaching VALUES ('S1029','PHARM','4');
INSERT INTO Teaching VALUES ('S1001','MACHN','4');
INSERT INTO Teaching VALUES ('S1031','DATST','3');
INSERT INTO Teaching VALUES ('S1031','DTBAS','2');
INSERT INTO Teaching VALUES ('S1001','PRNCB','6');
INSERT INTO Teaching VALUES ('S1033','CMPSC','8');
INSERT INTO Teaching VALUES ('S1033','SEQAN','6');

SET CONSTRAINTS ALL IMMEDIATE;