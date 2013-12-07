CREATE OR REPLACE PROCEDURE Update_Construction_End_Today
AS
BEGIN

INSERT INTO CONSTRUCTION_END_TODAY
(construction_project_id, state_date, end_date,
project_manager_employee_id, crew_id,house_id)
		SELECT CONSTRUCTION_PROJECT.construction_project_id,
						CONSTRUCTION_PROJECT.state_date,
						CONSTRUCTION_PROJECT.project_manager_employee_id,
						CONSTRUCTION_PROJECT.crew_id,
						CONSTRUCTION_PROJECT.house_id
		FROM CONSTRUCTION_PROJECT
		WHERE end_date = SYSDATE;
END;
/