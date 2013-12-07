set serveroutput on;
CREATE OR REPLACE TRIGGER selected_stage_option_check
BEFORE INSERT OR UPDATE ON SELECTED_STAGE_OPTION
FOR EACH ROW
DECLARE
	housestage construction_project_stage.stage_id%TYPE;
	optionstage option_choice.last_allowed_stage_id%TYPE;
	e_optionstage_beyond_threshold EXCEPTION;
	CURSOR stageCursor IS
		SELECT MAX(stage_number) FROM construction_project_stage
		JOIN stage USING (stage_id)
		WHERE construction_project_id = :new.construction_project_id;
	CURSON optionCursor IS
		SELECT last_allowed_stage_id FROM selected_stage_option
		JOIN option_choice USING (option_choice_id)
		WHERE selected_stage_option_id = :new.selected_stage_option_id;
BEGIN
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