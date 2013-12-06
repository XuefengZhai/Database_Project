--Reports
--2.Which project manager works on which construction project. (Assignment)


--question: why construction_project has a P_M_E_id as well as a employee_id???

CREATE OR REPLACE PROCEDURE PM_Assignment
AS
CP construction_project%ROWTYPE
FN employee.first_name%TYPE
LN employee.last_name%TYPE

CURSOR c1 is
	SELECT * FROM CONSTRUCTION_PROJECT;

BEGIN
	OPEN c1;
	LOOP
		FETCH c1 INTO CP;
		EXIT WHEN c1%NOTFOUND;
		
		SELECT employee.first_name, employee.last_name
		INTO FN,LN
		FROM employee e
		WHERE e.employee_id = CP.employee_id;
		
		DBMS_OUTPUT.PUT_LINE('The employee No.'||CP.emplyee_id||
										' Name:'||FN||' '||LN
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