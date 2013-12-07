CREATE OR REPLACE TRIGGER stage_selected_option_markup
AFTER INSERT OR UPDATE ON stage_selected_option
FOR EACH ROW
DECLARE
	constructionstage construction_project_stage.stage_id%TYPE;
	lastallowed option_choice.last_allowed_stage_id%TYPE;
	optionprice option_choice.price%TYPE;
	construction_project_stage_num:= :NEW.construction_project_stage_id;
	selected_option_num:= :NEW.option_choice_id;
	e_optionstage_beyond_threshold EXCEPTION;
BEGIN
	constructionstage:= SELECT stage_id FROM construction_project_stage
		WHERE construction_project_stage_id = construction_project_stage_num;

	optionstage:= SELECT last_allowed_stage_id FROM option_choice
		WHERE option_choice_id = selected_option_num;
		
	optinoprice

	IF (constructionstage - 1) = lastallowed THEN
		customer_price:= 
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