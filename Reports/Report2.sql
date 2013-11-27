--Reports
--2.Status of all employees (Where are they assigned)

CREATE OR REPLACE PROCEDURE emplyees_status
AS
EM Emplyee%ROWTYPE
HID	House.house_id%TYPE

CURSOR c1 is
	SELECT * FROM Emplyee;

BEGIN
	OPEN c1;
	LOOP
		FETCH c1 INTO EM;
		EXIT WHEN c1%NOTFOUND;
		
		SELECT house_id
		INTO HID
		FROM Construction_project con
		WHERE con.construction_project_id = EM.construction_project_id;
		
		DBMS_OUTPUT.PUT('The employee No.'||EM.emplyee_id||
										' Name:'||EM.first_name||' '||EM.last_name
										' is working on project '||EM.construction_project_id||
										' of the house '||HID||'.');
		DBMS_OUTPUT.NEW_LINE;
	END LOOP;
	Close c1;

EXCEPTION
	WHEN INVALID_CURSOR THEN
		DBMS_OUTPUT.PUT_LINE ('The cursor is invalid.');
	WHEN CURSOR_ALREADY_OPEN THEN
		DBMS_OUTPUT.PUT_LINE ('The cursor is already opened.');
	WHEN OTHERS THEN
		 DBMS_OUTPUT.PUT_LINE ('The PLSQL procedure executed by '||USER||
		 	' returned and unhandled exception on '||SYSDATE||'.');


