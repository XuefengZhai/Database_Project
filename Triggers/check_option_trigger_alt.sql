CREATE OR REPLACE TRIGGER selected_stage_option_check
BEFORE INSERT OR UPDATE ON selected_stage_option
FOR EACH ROW
DECLARE
	constructionstage construction_project_stage.stage_id%TYPE;
	lastallowed option_choice.last_allowed_stage_id%TYPE;
	e_optionstage_above_threshold EXCEPTION;
	e_optionstage_below_threshold EXCEPTION;
BEGIN
	SELECT stage_id INTO constructionstage FROM construction_project_stage
		WHERE construction_project_stage_id = :NEW.construction_project_stage_id;

	SELECT last_allowed_stage_id INTO lastallowed FROM option_choice
		WHERE option_choice_id = :NEW.option_choice_id;

	IF (constructionstage = lastallowed) THEN NULL; --Valid. Ignore. 
	ELSIF (constructionstage < lastallowed) THEN	
		RAISE e_optionstage_above_threshold;
	ELSIF (constructionstage - 1) = lastallowed THEN NULL; -- Valid. Ignore. 
	ELSIF (constructionstage - 1) > lastallowed THEN
		RAISE e_optionstage_below_threshold;
	ELSE
		NULL;
	END IF;
EXCEPTION
	WHEN e_optionstage_above_threshold THEN
		raise_application_error(-20000, 'Option is beyond current construction project stage.');
	WHEN e_optionstage_below_threshold THEN
		raise_application_error(-20000, 'Option is too far below current construction project stage.');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No house exists for this selection.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('The PLSQL procedure executed by ' || USER || ' returned an unhandled exception on ' 
		|| SYSDATE || '.');
		DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM || '.');
END;
/