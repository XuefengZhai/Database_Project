CREATE OR REPLACE TRIGGER stage_selected_option_markup
BEFORE INSERT OR UPDATE ON stage_selected_option
FOR EACH ROW
DECLARE
	constructionstage construction_project_stage.stage_id%TYPE;
	lastallowed option_choice.last_allowed_stage_id%TYPE;
	optionprice option_choice.price%TYPE;
	e_optionstage_beyond_threshold EXCEPTION;
BEGIN
	SELECT stage_id INTO constructionstage FROM construction_project_stage
		WHERE construction_project_stage_id = :NEW.construction_project_stage_id;

	SELECT last_allowed_stage_id INTO lastallowed FROM option_choice
		WHERE option_choice_id = :NEW.option_choice_id;
		
	SELECT price INTO optionprice FROM option_choice
		WHERE option_choice_id = :NEW.option_choice_id;

	IF (constructionstage - 1) = lastallowed THEN
		:NEW.customer_price = optionprice + (optionprice * 0.15);
	ELSE
		:NEW.customer_price = optionprice;	
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