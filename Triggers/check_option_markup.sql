CREATE OR REPLACE TRIGGER stage_selected_option_markup
AFTER INSERT OR UPDATE ON selected_stage_option
FOR EACH ROW
DECLARE
	housestage construction_project_stage.stage_id%TYPE;
	optionstage option_choice.last_allowed_stage_id%TYPE;
	CURSOR stageCursor IS
		SELECT MAX(stage_number) FROM construction_project_stage
		JOIN stage USING (stage_id)
		WHERE construction_project_id = :new.construction_project_id;
	CURSON optionCursor IS
		SELECT last_allowed_stage_id FROM selected_stage_option
		JOIN option_choice USING (option_choice_id)
		WHERE selected_stage_option_id = :new.selected_stage_option_id;
BEGIN
	OPEN stageCursor;
	FETCH stageCursor INTO housestage;
	OPEN optionCursor;
	FETCH optionCursor INTO optionstage;
	IF (housestage - 1) = optionstage THEN
		UPDATE selected_stage_option
		SET selected_stage_option.customer_price = :NEW.customer_price + (:NEW.customer_price * 0.15)
		WHERE selected_stage_option.selected_stage_option_id = :NEW.selected_stage_option_id;
	ELSE
		SET selected_stage_option.customer_price = :NEW.customer_price;
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