CREATE OR REPLACE PROCEDURE Update_Construction_End_Today


AS
CP CONSTRUCTION_END_TODAY%ROWTYPE;

CURSOR c1 is
	SELECT 
	construction_project_id,
	start_date,
	end_date,
	project_manager_employee_id,
	crew_id,
	house_id 
	FROM CONSTRUCTION_PROJECT
	WHERE TO_CHAR(CONSTRUCTION_PROJECT.end_date,'DD-MM-YY') = TO_CHAR(SYSDATE,'DD-MM-YY');

BEGIN
	OPEN c1;
	LOOP
		FETCH c1 INTO CP;
		EXIT WHEN c1%NOTFOUND;
		
		INSERT INTO CONSTRUCTION_END_TODAY(construction_project_id, start_date, end_date, project_manager_employee_id,
			crew_id, house_id)
		Values(CP.construction_project_id,
			   CP.start_date,
			   CP.end_date,
			   CP.project_manager_employee_id,
			   CP.crew_id,
			   CP.house_id);

	END LOOP;
	Close c1;
	COMMIT;

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