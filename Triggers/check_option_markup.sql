CREATE OR REPLACE TRIGGER stage_selected_option_markup
AFTER INSERT OR UPDATE ON stage_selected_option
FOR EACH ROW
DECLARE
	housestage stage_assignment.stage_id%TYPE;
	optionstage option_for_stage.option_id%TYPE;
	CURSOR stageCursor IS
		SELECT MAX(stage_id) FROM stage_assignment
		WHERE construction_project_id = :new.construction_project_id;
	CURSON optionCursor IS
		SELECT stage_id from option_for_stage 
		WHERE option_for_stage_id = :new.option_for_stage_id;
BEGIN
	OPEN stageCursor;
	FETCH stageCursor INTO housestage;
	OPEN optionCursor;
	FETCH optionCursor INTO optionstage;
	IF (housestage - 1) = optionstage THEN
		UPDATE stage_selected_option
		SET stage_selected_option.price = :NEW.price + (:NEW.price * 0.15)
		WHERE stage_selected_option.stage_selected_option = :NEW.stage_selected_option_id;
	ELSE
		NULL;
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No house exists for this selection.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('The PLSQL procedure executed by ' || USER || ' returned an unhandled exception on ' 
		|| SYSDATE || '.');
		DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM || '.');
END;
/