--Reports

--1.Construction status of a given house

CREATE OR REPLACE PROCEDURE display_home_status
	( house_no IN house.house_id%TYPE
	)
AS

FN Customer.first_name%TYPE;
LN Customer.last_name%TYPE;
HN Contract.house_id%TYPE;
SD Construction_project.start_date%TYPE;
ED Construction_project.end_date%TYPE;
EsD Construction_project.estimated_end_date%TYPE;

BEGIN
	SELECT Customer.first_name, Customer.last_name, Contract.house_id, 
				 Construction_project.start_date, Construction_project.end_date,
				 Construction_project.estimated_end_date
  	INTO FN, LN, HN, SD, ED, EsD
	FROM Customer LEFT JOIN
	Customer_contract on Customer.customer_id = Customer_contract.customer_id LEFT JOIN
	Contract on Customer_contract.contract_id = Contract.contract_id LEFT JOIN
	House on Contract.house_id = House.house_id LEFT JOIN
	Construction_project on House.house_id =
											Construction_project.house_id
	WHERE House.house_id = house_no;
	
	IF ED is NULL THEN
		 DBMS_OUTPUT.PUT_LINE('The construction project of customer: '||FN||' '||LN|| 
		 											  ' for house No.'||HN||' has not finished yet. '
		 											  ||'It started on '||SD||
		 										    '. The estimated finish date is: '||EsD||'.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('The construction project of customer: '||FN||' '||LN|| 
		 											  ' for house No.'||HN||' has finished! '
		 											  ||'It started on '||SD|| 
		 											  '. It finished on '||ED||'.');
	
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE ('No such house.');
	WHEN OTHERS THEN
		 DBMS_OUTPUT.PUT_LINE ('The PLSQL procedure executed by '||USER||
		 	' returned and unhandled exception on '||SYSDATE||'.');

END;
/