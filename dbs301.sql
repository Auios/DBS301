--  NAME: dbs301.sql 
--  USAGE Assuming you have saved this file as c:\dbs301.sql
--       SQL> START C:\dbs301.sql
--


PROMPT Building DBS301 lab tables.  Please wait.

DROP TABLE department CASCADE CONSTRAINT;
DROP TABLE employee CASCADE CONSTRAINT;
DROP TABLE project CASCADE CONSTRAINT;
DROP TABLE project_hour CASCADE CONSTRAINT;

CREATE TABLE department (
	dept_no SMALLINT  PRIMARY KEY,
	dept_name VARCHAR2(15) NOT NULL,
	locn VARCHAR2(15) NOT NULL);

INSERT INTO department VALUES (
	10,
	'Accounting',
	'TORONTO');
INSERT INTO department VALUES (
	20,
	'Research',
	'OTTAWA');
INSERT INTO department VALUES (
	30,
	'Sales',
	'Toronto');
INSERT INTO department VALUES (
	40,
	'Operations',
	'Markham');
INSERT INTO department VALUES (
	60,
	'Service',
	'Toronto');

CREATE TABLE employee (
	emp_no SMALLINT PRIMARY KEY,
	ename VARCHAR2(20) NOT NULL,
	fname VARCHAR2(20) NOT NULL,
	job VARCHAR2(15) NOT NULL,
	mgr SMALLINT,
	hiredate DATE NOT NULL,
	sal NUMBER(7, 2) NOT NULL,
	comm NUMBER(7, 2),
	dept_no SMALLINT NOT NULL,
	CONSTRAINT employee_deptno_fk FOREIGN KEY ( dept_no )
		REFERENCES department (dept_no),
	CONSTRAINT employee_mgr_fk FOREIGN KEY ( mgr )
		REFERENCES employee (emp_no));



INSERT INTO employee VALUES (
	109,
	'King',
	'James',
	'President',
	NULL,
	TO_DATE('17-11-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	10000,
	NULL,
	10);
INSERT INTO employee VALUES (
	107,
	'Clark',
	'Anna',
	'Manager',
	109,
	TO_DATE('09-06-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	4900,
	NULL,
	10);
INSERT INTO employee VALUES (
	104,
	'Smith',
	'Joanne',
	'Manager',
	109,
	TO_DATE('02-04-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5950,
	NULL,
	20);
INSERT INTO employee VALUES (
	110,
	'Mohammed',
	'Ahmed',
	'Developer',
	104,
	TO_DATE('08-09-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3000,
	0,
	30);
INSERT INTO employee VALUES (
	105,
	'Martin',
	'Sandy',
	'Developer',
	104,
	TO_DATE('28-09-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	2500,
	0,
	30);
INSERT INTO employee VALUES (
	102,
	'Huang',
	'Li',
	'Developer',
	104,
	TO_DATE('22-02-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	2500,
	0,
	30);
INSERT INTO employee VALUES (
	101,
	'Cohen',
	'Michael',
	'Developer',
	104,
	TO_DATE('20-02-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3200,
	0,
	30);
INSERT INTO employee VALUES (
	111,
	'Jablonski',
	'Victor',
	'Manager',
	109,
	TO_DATE('01-05-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5700,
	NULL,
	30);
INSERT INTO employee VALUES (
	106,
	'Ramirez',
	'Maria',
	'Developer',
	107,
	TO_DATE('12-01-1983 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	2200,
	NULL,
	20);
INSERT INTO employee VALUES (
	108,
	'Scott',
	'Peter',
	'Analyst',
	107,
	TO_DATE('09-12-1982 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	45000,
	500,
	20);
INSERT INTO employee VALUES (
	113,
	'Ford',
	'James',
	'Analyst',
	107,
	TO_DATE('03-12-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	46000,
	750,
	20);
INSERT INTO employee VALUES (
	112,
	'James',
	'Peter',
	'Analyst',
	106,
	TO_DATE('03-12-1981 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	964.32,
	450,
	30);
INSERT INTO employee VALUES (
	114,
	'Miller',
	'Scott',
	'Clerk',
	106,
	TO_DATE('23-01-1982 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	2600,
	NULL,
	10);
INSERT INTO employee VALUES (
	103,
	'Smith',
	'Joanne',
	'Clerk',
	106,
	TO_DATE('17-12-1980 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	812.06,
	NULL,
	20);

CREATE TABLE project (
	project_no FLOAT    PRIMARY KEY,
	pname VARCHAR2(30) NOT NULL,
	pbudget FLOAT);
INSERT INTO project VALUES (
	1001,
	'Web Site Development',
	1912000);
INSERT INTO project VALUES (
	1002,
	'Inventory Enhancements',
	999998000);
INSERT INTO project VALUES (
	1003,
	'Accounting Implementation',
	897000);
INSERT INTO project VALUES (
	1004,
	'Data Warehouse Maintenance',
	294000);
INSERT INTO project VALUES (
	1006,
	'Network Improvements',
	415000);
INSERT INTO project VALUES (
	1007,
	'Payroll System',
	415000);
	
CREATE TABLE project_hour (
	project_no FLOAT,
	emp_no SMALLINT,
	time_log_date DATE NOT NULL,
	hours_logged FLOAT NOT NULL,
	dollars_charged FLOAT NOT NULL,
	CONSTRAINT project_hour_NoTime_pk PRIMARY KEY (project_no, emp_no, time_log_date),
	CONSTRAINT project_hour_empNo_fk FOREIGN KEY (emp_no) 
		REFERENCES employee(emp_no),
	CONSTRAINT project_hour_prjNo_fk FOREIGN KEY (project_no) 
		REFERENCES project(project_no));

INSERT INTO project_hour VALUES (
	1001,
	101,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1003,
	101,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1006,
	101,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	845);
INSERT INTO project_hour VALUES (
	1002,
	101,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1183);
INSERT INTO project_hour VALUES (
	1004,
	101,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1001,
	101,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1003,
	101,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	845);
INSERT INTO project_hour VALUES (
	1006,
	101,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1183);
INSERT INTO project_hour VALUES (
	1002,
	101,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1004,
	101,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1001,
	101,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	845);
INSERT INTO project_hour VALUES (
	1003,
	101,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1183);
INSERT INTO project_hour VALUES (
	1006,
	101,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1002,
	101,
	TO_DATE('01-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1004,
	101,
	TO_DATE('01-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	845);
INSERT INTO project_hour VALUES (
	1001,
	101,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1183);
INSERT INTO project_hour VALUES (
	1003,
	101,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1006,
	101,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1002,
	101,
	TO_DATE('01-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	845);
INSERT INTO project_hour VALUES (
	1004,
	101,
	TO_DATE('01-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1183);
INSERT INTO project_hour VALUES (
	1001,
	101,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1003,
	101,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1006,
	101,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	845);
INSERT INTO project_hour VALUES (
	1002,
	101,
	TO_DATE('01-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1183);
INSERT INTO project_hour VALUES (
	1004,
	101,
	TO_DATE('01-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1001,
	101,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1003,
	101,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	845);
INSERT INTO project_hour VALUES (
	1006,
	101,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1183);
INSERT INTO project_hour VALUES (
	1002,
	101,
	TO_DATE('01-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	169);
INSERT INTO project_hour VALUES (
	1004,
	101,
	TO_DATE('01-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	507);
INSERT INTO project_hour VALUES (
	1001,
	102,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	135);
INSERT INTO project_hour VALUES (
	1003,
	102,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	405);
INSERT INTO project_hour VALUES (
	1006,
	102,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	675);
INSERT INTO project_hour VALUES (
	1002,
	102,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	945);
INSERT INTO project_hour VALUES (
	1004,
	102,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	135);
INSERT INTO project_hour VALUES (
	1001,
	102,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	405);
INSERT INTO project_hour VALUES (
	1003,
	102,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	675);
INSERT INTO project_hour VALUES (
	1006,
	102,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	945);
INSERT INTO project_hour VALUES (
	1002,
	102,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	135);
INSERT INTO project_hour VALUES (
	1004,
	102,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	405);
INSERT INTO project_hour VALUES (
	1001,
	102,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	675);
INSERT INTO project_hour VALUES (
	1003,
	102,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	945);
INSERT INTO project_hour VALUES (
	1006,
	102,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	135);
INSERT INTO project_hour VALUES (
	1001,
	104,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	99);
INSERT INTO project_hour VALUES (
	1003,
	104,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	297);
INSERT INTO project_hour VALUES (
	1006,
	104,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	495);
INSERT INTO project_hour VALUES (
	1002,
	104,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	693);
INSERT INTO project_hour VALUES (
	1004,
	104,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	99);
INSERT INTO project_hour VALUES (
	1001,
	104,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	297);
INSERT INTO project_hour VALUES (
	1003,
	104,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	495);
INSERT INTO project_hour VALUES (
	1006,
	104,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	693);
INSERT INTO project_hour VALUES (
	1002,
	104,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	99);
INSERT INTO project_hour VALUES (
	1004,
	104,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	297);
INSERT INTO project_hour VALUES (
	1001,
	105,
	TO_DATE('15-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	121);
INSERT INTO project_hour VALUES (
	1003,
	105,
	TO_DATE('15-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	363);
INSERT INTO project_hour VALUES (
	1006,
	105,
	TO_DATE('15-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	605);
INSERT INTO project_hour VALUES (
	1002,
	105,
	TO_DATE('15-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	847);
INSERT INTO project_hour VALUES (
	1004,
	105,
	TO_DATE('15-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	121);
INSERT INTO project_hour VALUES (
	1001,
	105,
	TO_DATE('15-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	363);
INSERT INTO project_hour VALUES (
	1003,
	105,
	TO_DATE('15-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	605);
INSERT INTO project_hour VALUES (
	1006,
	105,
	TO_DATE('15-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	847);
INSERT INTO project_hour VALUES (
	1002,
	105,
	TO_DATE('15-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	121);
INSERT INTO project_hour VALUES (
	1004,
	105,
	TO_DATE('15-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	363);
INSERT INTO project_hour VALUES (
	1001,
	105,
	TO_DATE('15-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	605);
INSERT INTO project_hour VALUES (
	1003,
	105,
	TO_DATE('15-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	847);
INSERT INTO project_hour VALUES (
	1006,
	105,
	TO_DATE('15-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	121);
INSERT INTO project_hour VALUES (
	1002,
	105,
	TO_DATE('15-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	363);
INSERT INTO project_hour VALUES (
	1004,
	105,
	TO_DATE('15-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	605);
INSERT INTO project_hour VALUES (
	1001,
	105,
	TO_DATE('15-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	847);
INSERT INTO project_hour VALUES (
	1003,
	105,
	TO_DATE('15-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	121);
INSERT INTO project_hour VALUES (
	1006,
	105,
	TO_DATE('15-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	363);
INSERT INTO project_hour VALUES (
	1001,
	107,
	TO_DATE('2-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1003,
	107,
	TO_DATE('2-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1006,
	107,
	TO_DATE('2-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	225);
INSERT INTO project_hour VALUES (
	1002,
	107,
	TO_DATE('2-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	315);
INSERT INTO project_hour VALUES (
	1004,
	107,
	TO_DATE('2-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1001,
	107,
	TO_DATE('2-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1003,
	107,
	TO_DATE('2-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	225);
INSERT INTO project_hour VALUES (
	1006,
	107,
	TO_DATE('2-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	315);
INSERT INTO project_hour VALUES (
	1002,
	107,
	TO_DATE('2-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1004,
	107,
	TO_DATE('2-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1001,
	107,
	TO_DATE('2-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	225);
INSERT INTO project_hour VALUES (
	1003,
	107,
	TO_DATE('2-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	315);
INSERT INTO project_hour VALUES (
	1006,
	107,
	TO_DATE('2-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1002,
	107,
	TO_DATE('2-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1004,
	107,
	TO_DATE('2-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	225);
INSERT INTO project_hour VALUES (
	1001,
	107,
	TO_DATE('2-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	315);
INSERT INTO project_hour VALUES (
	1003,
	107,
	TO_DATE('2-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1006,
	107,
	TO_DATE('2-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1002,
	107,
	TO_DATE('2-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	225);
INSERT INTO project_hour VALUES (
	1004,
	107,
	TO_DATE('2-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	315);
INSERT INTO project_hour VALUES (
	1001,
	107,
	TO_DATE('2-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1003,
	107,
	TO_DATE('2-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1006,
	107,
	TO_DATE('2-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	225);
INSERT INTO project_hour VALUES (
	1002,
	107,
	TO_DATE('2-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	315);
INSERT INTO project_hour VALUES (
	1004,
	107,
	TO_DATE('2-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1001,
	107,
	TO_DATE('2-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1003,
	107,
	TO_DATE('2-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	225);
INSERT INTO project_hour VALUES (
	1006,
	107,
	TO_DATE('2-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	315);
INSERT INTO project_hour VALUES (
	1002,
	107,
	TO_DATE('2-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	45);
INSERT INTO project_hour VALUES (
	1004,
	107,
	TO_DATE('2-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	135);
INSERT INTO project_hour VALUES (
	1001,
	108,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	220);
INSERT INTO project_hour VALUES (
	1003,
	108,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	660);
INSERT INTO project_hour VALUES (
	1006,
	108,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1100);
INSERT INTO project_hour VALUES (
	1002,
	108,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1540);
INSERT INTO project_hour VALUES (
	1004,
	108,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	220);
INSERT INTO project_hour VALUES (
	1001,
	108,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	660);
INSERT INTO project_hour VALUES (
	1003,
	108,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1100);
INSERT INTO project_hour VALUES (
	1006,
	108,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1540);
INSERT INTO project_hour VALUES (
	1002,
	108,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	220);
INSERT INTO project_hour VALUES (
	1004,
	108,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	660);
INSERT INTO project_hour VALUES (
	1001,
	108,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1100);
INSERT INTO project_hour VALUES (
	1003,
	108,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1540);
INSERT INTO project_hour VALUES (
	1006,
	108,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	220);
INSERT INTO project_hour VALUES (
	1002,
	108,
	TO_DATE('01-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	660);
INSERT INTO project_hour VALUES (
	1004,
	108,
	TO_DATE('01-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1100);
INSERT INTO project_hour VALUES (
	1001,
	108,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1540);
INSERT INTO project_hour VALUES (
	1003,
	108,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	220);
INSERT INTO project_hour VALUES (
	1006,
	108,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	660);
INSERT INTO project_hour VALUES (
	1002,
	108,
	TO_DATE('01-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1100);
INSERT INTO project_hour VALUES (
	1004,
	108,
	TO_DATE('01-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1540);
INSERT INTO project_hour VALUES (
	1001,
	108,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	220);
INSERT INTO project_hour VALUES (
	1003,
	108,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	660);
INSERT INTO project_hour VALUES (
	1006,
	108,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1100);
INSERT INTO project_hour VALUES (
	1002,
	108,
	TO_DATE('01-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1540);
INSERT INTO project_hour VALUES (
	1004,
	108,
	TO_DATE('01-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	220);
INSERT INTO project_hour VALUES (
	1001,
	108,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	660);
INSERT INTO project_hour VALUES (
	1003,
	108,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1100);
INSERT INTO project_hour VALUES (
	1006,
	108,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	1540);
INSERT INTO project_hour VALUES (
	1001,
	110,
	TO_DATE('4-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	84);
INSERT INTO project_hour VALUES (
	1003,
	110,
	TO_DATE('4-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	252);
INSERT INTO project_hour VALUES (
	1006,
	110,
	TO_DATE('4-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	420);
INSERT INTO project_hour VALUES (
	1002,
	110,
	TO_DATE('4-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	588);
INSERT INTO project_hour VALUES (
	1004,
	110,
	TO_DATE('4-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	84);
INSERT INTO project_hour VALUES (
	1001,
	110,
	TO_DATE('4-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	252);
INSERT INTO project_hour VALUES (
	1003,
	110,
	TO_DATE('4-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	420);
INSERT INTO project_hour VALUES (
	1006,
	110,
	TO_DATE('4-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	588);
INSERT INTO project_hour VALUES (
	1002,
	110,
	TO_DATE('4-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	84);
INSERT INTO project_hour VALUES (
	1004,
	110,
	TO_DATE('4-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	252);
INSERT INTO project_hour VALUES (
	1001,
	110,
	TO_DATE('4-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	420);
INSERT INTO project_hour VALUES (
	1003,
	110,
	TO_DATE('4-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	588);
INSERT INTO project_hour VALUES (
	1006,
	110,
	TO_DATE('4-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	84);
INSERT INTO project_hour VALUES (
	1002,
	110,
	TO_DATE('4-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	252);
INSERT INTO project_hour VALUES (
	1004,
	110,
	TO_DATE('4-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	420);
INSERT INTO project_hour VALUES (
	1001,
	111,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1003,
	111,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1006,
	111,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	500);
INSERT INTO project_hour VALUES (
	1002,
	111,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	700);
INSERT INTO project_hour VALUES (
	1004,
	111,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1001,
	111,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1003,
	111,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	500);
INSERT INTO project_hour VALUES (
	1006,
	111,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	700);
INSERT INTO project_hour VALUES (
	1002,
	111,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1004,
	111,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1001,
	111,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	500);
INSERT INTO project_hour VALUES (
	1003,
	111,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	700);
INSERT INTO project_hour VALUES (
	1006,
	111,
	TO_DATE('01-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1002,
	111,
	TO_DATE('01-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1004,
	111,
	TO_DATE('01-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	500);
INSERT INTO project_hour VALUES (
	1001,
	111,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	700);
INSERT INTO project_hour VALUES (
	1003,
	111,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1006,
	111,
	TO_DATE('01-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1002,
	111,
	TO_DATE('01-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	500);
INSERT INTO project_hour VALUES (
	1004,
	111,
	TO_DATE('01-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	700);
INSERT INTO project_hour VALUES (
	1001,
	111,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1003,
	111,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1006,
	111,
	TO_DATE('01-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	500);
INSERT INTO project_hour VALUES (
	1002,
	111,
	TO_DATE('01-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	700);
INSERT INTO project_hour VALUES (
	1004,
	111,
	TO_DATE('01-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1001,
	111,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1003,
	111,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	500);
INSERT INTO project_hour VALUES (
	1006,
	111,
	TO_DATE('01-11-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	700);
INSERT INTO project_hour VALUES (
	1002,
	111,
	TO_DATE('01-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	100);
INSERT INTO project_hour VALUES (
	1004,
	111,
	TO_DATE('01-12-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	300);
INSERT INTO project_hour VALUES (
	1001,
	112,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	70);
INSERT INTO project_hour VALUES (
	1003,
	112,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	210);
INSERT INTO project_hour VALUES (
	1006,
	112,
	TO_DATE('01-01-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	350);
INSERT INTO project_hour VALUES (
	1002,
	112,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	490);
INSERT INTO project_hour VALUES (
	1004,
	112,
	TO_DATE('01-02-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	70);
INSERT INTO project_hour VALUES (
	1001,
	112,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	210);
INSERT INTO project_hour VALUES (
	1003,
	112,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	350);
INSERT INTO project_hour VALUES (
	1006,
	112,
	TO_DATE('01-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	490);
INSERT INTO project_hour VALUES (
	1002,
	112,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	70);
INSERT INTO project_hour VALUES (
	1004,
	112,
	TO_DATE('01-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	210);
INSERT INTO project_hour VALUES (
	1001,
	113,
	TO_DATE('3-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	300);
INSERT INTO project_hour VALUES (
	1003,
	113,
	TO_DATE('3-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	900);
INSERT INTO project_hour VALUES (
	1006,
	113,
	TO_DATE('3-03-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1500);
INSERT INTO project_hour VALUES (
	1002,
	113,
	TO_DATE('3-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	2100);
INSERT INTO project_hour VALUES (
	1004,
	113,
	TO_DATE('3-04-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	300);
INSERT INTO project_hour VALUES (
	1001,
	113,
	TO_DATE('3-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	900);
INSERT INTO project_hour VALUES (
	1003,
	113,
	TO_DATE('3-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1500);
INSERT INTO project_hour VALUES (
	1006,
	113,
	TO_DATE('3-05-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	2100);
INSERT INTO project_hour VALUES (
	1002,
	113,
	TO_DATE('3-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	300);
INSERT INTO project_hour VALUES (
	1004,
	113,
	TO_DATE('3-06-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	900);
INSERT INTO project_hour VALUES (
	1001,
	113,
	TO_DATE('3-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1500);
INSERT INTO project_hour VALUES (
	1003,
	113,
	TO_DATE('3-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	2100);
INSERT INTO project_hour VALUES (
	1006,
	113,
	TO_DATE('3-07-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	300);
INSERT INTO project_hour VALUES (
	1002,
	113,
	TO_DATE('3-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	900);
INSERT INTO project_hour VALUES (
	1004,
	113,
	TO_DATE('3-08-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1500);
INSERT INTO project_hour VALUES (
	1001,
	113,
	TO_DATE('3-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	2100);
INSERT INTO project_hour VALUES (
	1003,
	113,
	TO_DATE('3-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	1,
	300);
INSERT INTO project_hour VALUES (
	1006,
	113,
	TO_DATE('3-09-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	3,
	900);
INSERT INTO project_hour VALUES (
	1002,
	113,
	TO_DATE('3-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	5,
	1500);
INSERT INTO project_hour VALUES (
	1004,
	113,
	TO_DATE('3-10-1998 00:00:00','DD-MM-YYYY HH24:MI:SS'),
	7,
	2100);

COMMIT;


PROMPT Verify that the tables for the DBS301 labs have been created and populated 
PROMPT correctly by performing SELECT * FROM tab


