/* 1 */
LIBNAME ia 'C:\Users\SSMS1302-20\Desktop\SAS';
TITLE 'Employee Salary Data by Division / City'; 
PROC REPORT data=ia.employees nowd;
	COLUMN Division City Salary;
	DEFINE Division / group width=20 'Division Name';
	DEFINE City / group width=13 'City Based';
	DEFINE Salary / format=dollar14.;
run;

/* Problem 2 */
/* Each data set contains observations in the amounts shown below:
Ia.aprtarget  120
 
Ia.maytarget 67

Ia.juntarget 120

 The variable names in each data set are as follows:

Ia.aprtarget Flight, Destination, Date, FClassTar, EClassTar, FRev, ERev
 
Ia.maytarget FlightID, Destination, Date, FTarget, ETarget, FRev, ERev
 
Ia.juntarget FlightID, Destination, Date, FTarget, ETarget, FRev, ERev */



/* Problem 3 */
PROC GPLOT data=ia.delay; 
WHERE Dest='CPH'; 
PLOT Delay*Date / vaxis = -15 to 30 by 15;
TITLE c=red 'Flights to Copenhagen';
SYMBOL i=needle c=red v=square;
RUN;
QUIT;
ods html close;
