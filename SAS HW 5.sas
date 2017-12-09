/*Excercise 5 */
/* 1 */
DATA work.sanfran;
INFILE 'C:\Users\SSMS1302-20\Desktop\sfosch.dat';
INPUT     @1 FlightID $7. @8 RouteID $7.
      	@18 Destination $3. @21 Model $20.
      	@41 Date date9. @65 TotPassCap 3.;
RUN;
 
PROC PRINT data=work.sanfran label;
	FORMAT 	Date mmddyy10.;
	LABEL	FlightID='Flight ID'
  	 		RouteID='Route ID' 
  	 		Model='Aircraft Model'
  	 		Date='Departure Date'
  	 		TotPassCap='Total Passenger Capacity';
RUN;
PROC CONTENTS data=work.sanfran;
RUN;

 
/* 2 */
 
PROC IMPORT DATAFILE = 'C:\Users\SSMS1302-20\Desktop\sfosch.csv'
	OUT= WORK.sfocsv
 	DBMS=csv REPLACE; 
	getname=no;
RUN;
 
OPTIONS ls=72 nodate nonumber;
PROC PRINT data=work.sfocsv;
RUN;
 
/*3 */
LIBNAME ia 'C:\Users\SSMS1302-20\Desktop\SAS';
DATA raises;
	SET ia.fltattnd;
		KEEP EmpID Salary Increase NewSal;
		IF JobCode='FLTAT1' THEN Increase=.10*Salary;
		ELSE IF JobCode='FLTAT2' THEN Increase=.08*Salary;
		ELSE IF JobCode='FLTAT3' THEN Increase=.06*Salary; 
	NewSal=sum(Salary,Increase);
RUN;
PROC PRINT data=raises; format Salary Increase NewSal dollar8.0; 
RUN;
