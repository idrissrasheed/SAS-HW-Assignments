/* exercise 1 */
/* set library location */
LIBNAME "C:\Users\SSMS1301-14\Desktop\PSTAT 130 M17"
/* reads airport data with three variables*/ 
data work.airports;
   infile 'airports.dat';
   input @ 1 Code $3.
         @ 4 City $50.
         @54 Country $15.;
run;

/* outputs the processed airport data */
proc print data=work.airports;
run;

/* exercise 2 */
/*reads data */
DATA exercise2;
/* Build dataframe for variables */ 
INPUT x y z;
/* Build dataframe for variables */ 
CARDS;
17 129 43
42 134 98
26 185 54
22 165 65
;
RUN;

PROC PRINT data=exercise2;
RUN;

/* Exercise 3 */
DATA exercise3;
/*Make x, y, and z variables*/
INPUT x y z;
/* Build dataframe for variables */ 
DATALINES;
17 129 43
42 134 98
26 185 54
22 165 65
;
RUN;

PROC PRINT data=exercise3;
RUN;
