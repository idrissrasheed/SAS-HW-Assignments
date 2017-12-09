/* 1 */
LIBNAME ia 'C:\Users\SSMS1302-20\Desktop\SAS';
DATA usarea;
SET ia.states;
		TotArea+Size;
		NumStates+1;
RUN;
PROC PRINT data=usarea;
RUN;

/* 2 */

data _null_;
SET ia.visits end=IsLast;
	FILE 'visits.dat' dlm=',';
	IF _N_ eq 1 THEN 
		put 'ID,Date,Fee';
	PUT ID
		Date : mmddyy10.
		Fee;
	IF IsLast=1 then
		PUT 'Data: PROG2.VISITS';
RUN;
PROC FSLIST fileref='visits.dat';
RUN;
