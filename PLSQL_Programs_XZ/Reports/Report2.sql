--Reports
--2.Which project manager works on which construction project. (Assignment)



CREATE OR REPLACE PROCEDURE PM_Assignment
AS
CP construction_project%ROWTYPE;
FN employee.first_name%TYPE;
LN employee.last_name%TYPE;

CURSOR c1 is
	SELECT * FROM CONSTRUCTION_PROJECT;

BEGIN
	OPEN c1;
	LOOP
		FETCH c1 INTO CP;
		EXIT WHEN c1%NOTFOUND;
		
		SELECT e.first_name, e.last_name
		INTO FN,LN
		FROM employee e
		WHERE e.employee_id = CP.project_manager_employee_id;
		
		DBMS_OUTPUT.PUT_LINE('The employee No.'||CP.project_manager_employee_id||
										' Name:'||FN||' '||LN||
										' is working on project No.'||CP.construction_project_id||
										'.');
		DBMS_OUTPUT.NEW_LINE;
	END LOOP;
	Close c1;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('No such employee.');
	WHEN INVALID_CURSOR THEN
		DBMS_OUTPUT.PUT_LINE ('The cursor is invalid.');
	WHEN CURSOR_ALREADY_OPEN THEN
		DBMS_OUTPUT.PUT_LINE ('The cursor is already opened.');
	WHEN OTHERS THEN
		 DBMS_OUTPUT.PUT_LINE ('The PLSQL procedure executed by '||USER||
		 	' returned and unhandled exception on '||SYSDATE||'.');


END;
/