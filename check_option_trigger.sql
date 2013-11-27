set serveroutput on;
CREATE OR REPLACE TRIGGER stage_selected_option_check
BEFORE INSERT OR UPDATE ON stage_selected_option
FOR EACH ROW
DECLARE
	housestage stage_assignment.stage_id%TYPE;
	optionstage option_for_stage.option_id%TYPE;
	e_optionstage_beyond_threshold EXCEPTION;
	CURSOR stageCursor IS
		SELECT MAX(stage_id) FROM stage_assignment
		WHERE construction_project_id = :new.construction_project_id;
	CURSOR optionCursor IS
		SELECT stage_id from option_for_stage 
		WHERE option_for_stage_id = :new.option_for_stage_id;
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