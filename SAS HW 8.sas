LIBNAME ia 'C:\Users\SSMS1302-20\Desktop\SAS';
DATA separate(drop=FMnames);
LENGTH FMnames First MI Last $ 30;
SET ia.people;
	First=scan(FMnames,1,' ');
	MI=left(scan(FMnames,2,' '));
	Last=left(scan(Name,1,','));
RUN;
PROC PRINT data=separate;
VAR Name CityState First MI Last;
RUN;
