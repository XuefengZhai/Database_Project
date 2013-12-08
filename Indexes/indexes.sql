DROP INDEX ind_contract_cust_id;
CREATE INDEX ind_contract_cust_id on CUSTOMER_CONTRACT (customer_id); 

DROP INDEX ind_contract_cntrct_id;
CREATE INDEX ind_contract_cntrct_id on CUSTOMER_CONTRACT (contract_id); 

DROP INDEX ind_prj_house_id;
CREATE INDEX ind_prj_house_id on CONSTRUCTION_PROJECT (house_id); 

DROP INDEX ind_prj_pm_id;
CREATE INDEX ind_prj_pm_id on CONSTRUCTION_PROJECT (project_manager_employee_id); 