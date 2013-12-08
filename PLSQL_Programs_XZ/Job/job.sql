-- This job refresh the consturction_end_today table everyday
--	to see which construction project should end today.
-- Need to create a new table - CONSTRUCTION_END_TODAY 

BEGIN
DBMS_SCHEDULER.CREATE_JOB
(
	job_name 			=> 'find_construction_end_today',
	job_type			=> 'STORED_PROCEDURE',
	job_action 			=> 'Update_Construction_End_Today',
	repeat_interval 	=> 'FREQ=SECONDLY; INTERVAL=30',
	comments 			=> 'Update Construction_End_Today table'
);

END;
/





