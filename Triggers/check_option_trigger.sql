set serveroutput on;
CREATE OR REPLACE TRIGGER SELECTED_STAGE_OPTION_check
BEFORE INSERT OR UPDATE ON SELECTED_STAGE_OPTION
FOR EACH ROW
DECLARE
	housestage CONSTRUCTION_PROJECT_STAGE.stage_id%TYPE;
	optionstage STAGE_SELECTED_OPTION.option_id%TYPE;
	e_optionstage_beyond_threshold EXCEPTION;
	CURSOR stageCursor IS
		SELECT MAX(stage_id) FROM CONSTRUCTION_PROJECT_STAGE
		WHERE construction_project_id = :new.construction_project_id;
	CURSOR optionCursor IS
		SELECT stage_id from STAGE_SELECTED_OPTION 
		WHERE STAGE_SELECTED_OPTION_id = :new.STAGE_SELECTED_OPTION_id;
BEGIN
	OPEN stageCursor;
	FETCH stageCursor INTO housestage;
	OPEN optionCursor;
	FETCH optionCursor INTO optionstage;
	IF (optionstage - 2) != housestage THEN
		RAISE e_optionstage_beyond_threshold;
	ELSE
		NULL;
	END IF;
EXCEPTION
	WHEN e_optionstage_beyond_threshold THEN
		DBMS_OUTPUT.PUT_LINE('The stage for this option is beyond the stage threshold
			for this house. The selected option has not been added.');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No house exists for this selection.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('The PLSQL procedure executed by ' || USER || ' returned an unhandled exception on ' 
		|| SYSDATE || '.');
		DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM || '.');
END;
/