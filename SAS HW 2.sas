/* 1 */
LIBNAME ia "C:\Users\SSMS1302-20\Desktop\PSTAT 130 M17\airlines one";
PROC PRINT data = ia.personl;

PROC SORT data = ia.personl out=ia.personsl;
	BY Gender LName;
RUN;

PROC PRINT dat = ia.personsl noobs;
	BY Gender;
	WHERE JobCode  ? "FA" and State ="NY";
	VAR LName FName Gender Salary;
RUN;

/* 2 */
PROC PRINT data=ia.personsl;
   VAR LName FName;
   WHERE LName ? "BR";
RUN;

/* 3 */
PROC PRINT data = ia.passngrs;
RUN;


PROC PRINT data = ia.passngrs;
	OPTIONS nodate pageno = 1 ls = 64;
	BY Dest;
RUN;

/* 3 */
PROC PRINT data = ia.passngrs;
	VAR Depart FClass BClass EClass;
	SUM Depart FClass BClass EClass;
RUN;

PROC PRINT data = ia.passngrs;
	TITLE "San Francisco Passenger Data";
	FORMAT Depart DATE9;
	FORMAT FClass BClass EClass COMMA3.0;
RUN;

PROC PRINT data = ia.passngrs LABEL;
	LABEL Dest = 'Destination'
		  Depart = 'Departure Date'
		  FClass = 'First Class'
		  BClass = 'Business Class'
		  EClass = 'Economy Class';
RUN; 

/* 4 and 5*/
PROC PRINT data=ia.passngrs split=' ' noobs;
	LABEL Dest='Destination' 
		Depart='Departure Date' 
		FClass='First Class' 
		BClass='Business Class' 
		EClass='Economy Class';
	VAR Dest Depart FClass BClass EClass;
	SUM FClass BClass EClass;
	TITLE1 'San Francisco Passenger Data';
	FORMAT depart DATE9.;
	FORMAT FClass BClass EClass comma3.0;
	FORMAT Dest $des.;
PROC FORMAT;
VALUE $Des 'ANC'='Anchorage'
	 	   'HNL'='Honolulu'
	       'SEA'='Seattle';
RUN;

/* 6 */

DATA ia.SF;
	INFILE 'C:\Users\SSMS1302-20\Desktop\PSTAT 130 M17\airlines one\sfosch.dat';
	INPUT FlightID $ 1-7 
		  RouteID $ 8-14 
          Destination $ 18-20
		  Model $21-40
		  DepartDay 51
		  TotPassCap 65-67;
RUN;

PROC PRINT data = ia.SF;
RUN;
