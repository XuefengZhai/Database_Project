-- This job refresh the consturction_end_today table everyday
--	to see which construction project should end today.
-- Need to create a new table - CONSTRUCTION_END_TODAY 

DECLARE
Frequency NUMBER;
BEGIN
Frequency := $Frequency_in_seconds;

DBMS_SCHEDULER.CREATE_JOB
(
	job_name 						=> 'find_construction_end_today'
	job_type          	=> 'PLSQL_BLOCK'
	job_action					=> '
													Begin
														DROP TABLE CONSTRUCTION_END_TODAY CASCADE CONSTRAINTS;
 														CREATE TABLE CONSTRUCTION_END_TODAY 
    												( 
     														     construction_project_id NUMBER  NOT NULL , 
     																 state_date DATE  NOT NULL , 
     																 end_date DATE , 
     																 project_manager_employee_id NUMBER  NOT NULL , 
																     crew_id NUMBER , 
																     house_id NUMBER  NOT NULL 
 
    												);
    												
												
														INSERT INTO CONSTRUCTION_END_TODAY
														(construction_project_id, state_date, end_date,
														project_manager_employee_id, crew_id,house_id)
															SELECT CONSTRUCTION_PROJECT.construction_project_id,
																		 CONSTRUCTION_PROJECT.state_date,
																		 CONSTRUCTION_PROJECT.project_manager_employee_id,
																		 CONSTRUCTION_PROJECT.crew_id,
																		 CONSTRUCTION_PROJECT.house_id
															 FROM CONSTRUCTION_PROJECT
															 WHERE TO_CHAR(end_date,'MM-DD-YYYY') = 
															 			 TO_CHAR(SYSDATE, 'MM-DD-YYYY' );
													 COMMIT;
													 END; '
														
	repeat_interval 		=> 'SYSTIMESTAMP + INTERVAL ''' || Frequency || ''' SECOND',
	comments 						=> ''
)
END;
/



