set serveroutput on;
CREATE OR REPLACE TRIGGER selected_stage_option_check
BEFORE INSERT OR UPDATE ON SELECTED_STAGE_OPTION
FOR EACH ROW
DECLARE
	constructionstage construction_project_stage.stage_id%TYPE;
	lastallowed option_choice.last_allowed_stage_id%TYPE;
	e_optionstage_beyond_threshold EXCEPTION;
BEGIN
	SELECT stage_id INTO constructionstage FROM construction_project_stage
		WHERE construction_project_stage_id = :NEW.construction_project_stage_id;

	SELECT last_allowed_stage_id INTO lastallowed FROM option_choice
		WHERE option_choice_id = :NEW.option_choice_id;

	IF (constructionstage = lastallowed) THEN NULL; --Valid. Ignore. 
	ELSIF (constructionstage < lastallowed) THEN	
		RAISE e_optionstage_beyond_threshold;
	ELSIF (constructionstage - 1) = lastallowed THEN NULL; -- Valid. Ignore. 
	ELSIF (constructionstage - 1) > lastallowed THEN
		RAISE e_optionstage_beyond_threshold;
	ELSE
		NULL;
	END IF;
EXCEPTION
	WHEN e_optionstage_beyond_threshold THEN
		DBMS_OUTPUT.PUT_LINE('The stage for this option is beyond the stage threshold for this house. The selected option has not been added.');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No house exists for this selection.');
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('The PLSQL procedure executed by ' || USER || ' returned an unhandled exception on ' 
		|| SYSDATE || '.');
		DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM || '.');
END;
/