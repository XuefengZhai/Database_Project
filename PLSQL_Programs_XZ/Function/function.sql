--The number of employees work for Eggshell

DECLARE
	employee_no NUMBER;
BEGIN
	employee_no := cal_employee_no();
	DBMS_OUTPUT.PUT_LINE('The number of the employee work for eggshell is: '||employee_no
											 '.');
END;
/

CREATE OR REPLACE FUNCTION cal_employee_no
RETURN NUMBER
AS
	EM employee.employee_id%TYPE;
	employee_no NUMBER;
	
	CURSOR c1 is
	SELECT employee_id FROM employee;
BEGIN
	employee_no := 0;
	
	Open c1;
	LOOP
		FETCH c1 INTO EM;
		EXIT WHEN c1%NOTFOUND;
		employee_no := employee_no + 1;
	END LOOP;
	Close c1;
	RETURN employee_no;

EXCEPTION
	WHEN INVALID_CURSOR THEN
		DBMS_OUTPUT.PUT_LINE ('The cursor is invalid.');
	WHEN CURSOR_ALREADY_OPEN THEN
		DBMS_OUTPUT.PUT_LINE ('The cursor is already opened.');
	WHEN OTHERS THEN
		 DBMS_OUTPUT.PUT_LINE ('The PLSQL function executed by '||USER||
		 	' returned and unhandled exception on '||SYSDATE||'.');


END;
/

	

	
	
	