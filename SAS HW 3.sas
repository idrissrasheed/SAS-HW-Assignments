
/* Problem 1 */

LIBNAME custfm 'C:\Users\SSMS1302-20\Desktop\custfm.xls';
PROC CONTENTS data=custfm._all_;
RUN;

DATA work.males;
	SET custfm.'Males$'n;
	KEEP First_Name Last_Name Birth_Date;
	FORMAT Birth_Date YEAR4.;
	LABEL Birth_Date='Birth Year';
RUN;

PROC PRINT data=work.males (firstobs = 1 obs=5);
RUN;

/* Problem 2*/
LIBNAME prod 'C:\Users\SSMS1302-20\Desktop\products.xls';

PROC CONTENTS data=prod._all_;
RUN;

DATA work.golf;
	SET prod.'Sports$'n;
	WHERE Category = 'Golf';
	Drop Category;
	LABEL Name=Golf Products';
RUN;

LIBNAME prod clear;
PROC PRINT data = work.golf (firstobs = 1 obs=10);
RUN;
