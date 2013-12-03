--List all the sales of a sales agent

-- Create the package header 
create or replace package list_sales 
AS 
  procedure sales (em_id IN employee.employee_id%TYPE);
END list_sales;
/


-- Create the package bodies
create or replace package body list_sales 
AS

  procedure sales (em_id IN employee.employee_id%TYPE)
  IS
  	FN employee.first_name%TYPE;
  	LN employee.last_name%TYPE;
  	SR sale%ROWTYPE;
  	
  	CURSOR c1 is
	  SELECT * FROM sale
	  where sale.employee_id = em_id;

  BEGIN
  	select employee.first_name, employee.last_name
  	into FN, LN
  	from emloyee
  	where employee.employee_id = em_id;
  	DBMS_OUTPUT.PUT_LINE('The employee No.' ||em_id||' '||FN||' '||LN||
  										 'has the following sales:' );
  	DBMS_OUTPUT.NEW_LINE;
  	
		OPEN c1;
		LOOP
			FETCH c1 INTO SR;
			EXIT WHEN c1%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('The sale No.'||SR.sale_id||' of house No.'||SR.house_id||'. ');
			DBMS_OUTPUT.NEW_LINE;
		END LOOP;
		Close c1;

	EXCEPTION
	
	WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('No such employee.');
		WHEN INVALID_CURSOR THEN
			DBMS_OUTPUT.PUT_LINE ('The employee has no sales.');
		WHEN CURSOR_ALREADY_OPEN THEN
			DBMS_OUTPUT.PUT_LINE ('The cursor is already opened.');
		WHEN OTHERS THEN
		 	DBMS_OUTPUT.PUT_LINE ('The PLSQL procedure executed by '||USER||
		 	' returned and unhandled exception on '||SYSDATE||'.');
	END;
	
END list_sales;
/ 
