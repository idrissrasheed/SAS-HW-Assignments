/* 1 */
LIBNAME ia 'C:\Users\SSMS1302-20\Desktop\PSTAT 130 M17\airlines one\';
PROC PRINT data = ia.employees noobs N;
	VAR  EmpId
		 Country
		 Division
		 JobCode
		 Salary;
	WHERE Country ? "CANADA";
	SUM	Salary;
RUN;

/* 2 */
PROC PRINT data = ia.passngrs;
RUN;
PROC SORT data = ia.passngrs out=ia.passngrss;
	BY Dest;
RUN;

PROC PRINT data = ia.passngrss NOOBS;
	BY Dest; 
	VAR Depart FClass BClass EClass;
RUN;

/* 3 */

PROC PRINT data = ia.delay;
RUN;
PROC SORT data = ia.delay out=ia.delays NODUPKEY;
	BY Dest descending Mail;
RUN;

PROC PRINT data = ia.delays NOOBS;
	BY Dest;
	VAR Flight Date Dest Mail;
	SUM Mail;
RUN; 

/* 4 */
PROC PRINT data = ia.personl;
	VAR LName FName;
	WHERE LName ? "BR";
RUN:

/* 5 */
PROC SORT data = ia.passngrs out = passngrss;
	BY Dest;
RUN;

PROC PRINT data = ia.passngrss;
	OPTIONS nodate pageno = 1 ls = 64;
	BY Dest;
	VAR Depart FClass BClass ECLASS;
	SUM Depart FClass BClass ECLASS;
	TITLE1 'San Francisco Passenger Data';
	FORMAT depart DATE9.;
	FORMAT FClass BClass EClass comma3.0;
	LABEL Dest = 'Destination'
		  Depart = 'Departure Date'
		  FClass = 'First Class'
		  BClass = 'Business Class'
		  EClass = 'Economy Class';
RUN;

/* 6 */
PROC PRINT data = ia.fltat;
RUN;

PROC SORT data = ia.fltat, out = ia.fltatn;
	BY HireDate;
RUN;

PROC PRINT data = ia.fltatn NOOBS;
	OPTIONS nodate;
	BY HireDate;
	VAR HireDate EmpID Location JobCode Salary;
	FORMAT HireDate YEAR4.;
RUN;

/* 9 */
DATA sanfran;
PROC PRINT data = work.sanfran;
	OPTIONS nodate nonumber ls = 72;
	VAR   FlightId 
		  RouteID
		  Destination 
          Model 
          DepartDay 
          TotPassCap;
RUN;

PROC CONTENTS data = work.sanfran;
RUN;

/* 10 */
LIBNAME ia 'C:\Users\SSMS1302-20\Desktop\SAS':
PROC PRINT data = ia.emplist;
RUN;
DATA ia.emplist;
	INFILE 'emplist';
	INPUT LastName	$ 1-20
		  FirstName	$ 21-30
		  EmpId		$ 31-36
		  JobCode	$36-43
		  Salary 44-49;
	BY	  EmpId;
RUN:
