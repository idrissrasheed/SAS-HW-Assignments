DATA work.salaries;
	LENGTH ID $ 6 FName $ 8 LName $ 8 SalYear 4 Salary 5;
	INFILE 'C:\Users\SSMS1302-20\Desktop\SAS\salaries.dat';
	INPUT Type $ @;
		IF Type='E' THEN
	INPUT ID $ FName $ LName $;
	ELSE DO;
		INPUT SalYear Salary;
		OUTPUT;
	END;
RUN;