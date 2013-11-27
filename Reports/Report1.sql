--Reports

--1.Status of a given customer's home

CREATE OR REPLACE PROCEDURE display_home_status
	( customer_no IN customer.customer_id%TYPE
	)
AS
FN Customer.first_name%TYPE
LN Customer.last_name%TYPE
HN Contract.house_id%TYPE
SD Construction_project.state_date%TYPE
ED Construction_project.end_date%TYPE
EsD Construction_project.estimated_completion_date%TYPE

BEGIN
	SELECT Customer.first_name, Customer.last_name, Contract.house_id, 
				 Construction_project.state_date, Construction_project.end_date,
				 Construction_project.estimated_completion_date
  INTO FN, LN, HN, SD, ED, EsD
	FROM Customer LEFT JOIN
	Contract on Customer.customer_id = Contract.contract_id LEFT JOIN
	House on Contract.house_id = House.house_id LEFT JOIN
	Construction_project on House.construction_project_id =
													Construction_project.construction_project_id
	WHERE Customer.customer_id = customer_no;
	
	IF ED = NULL THEN
		 DBMS_OUTPUT.PUT('The building project of customer: '||FN||' '||LN|| 
		 											  'for house No.'||HN||' has not finished yet. '
		 											  'It started on '||SD||'.'
		 										    'The estimated finish date is: '||EsD||'.');
	ELSE
		DBMS_OUTPUT.PUT('The building project of customer: '||FN||' '||LN|| 
		 											  'for house No.'||HN||' has finished! '
		 											  'It started on '||SD||'.'
		 											  'It finished on '||ED||'.');
	
	END IF;
EXCEPTION
--Need more exception
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('There are some errors, please run the reports again.');

END;
/