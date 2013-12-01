drop SEQUENCE App_user_seq;
drop SEQUENCE Constr_worker_crew_assign_seq;
drop SEQUENCE Construction_project_seq;
drop SEQUENCE Construction_worker_seq;
drop SEQUENCE Contract_seq;
drop SEQUENCE Crew_seq;
drop SEQUENCE Crew_project_assignment_seq;
drop SEQUENCE Customer_seq;
drop SEQUENCE Customer_contract_assign_seq;
drop SEQUENCE Disclosure_form_seq;
drop SEQUENCE Elevation_code_table_seq;
drop SEQUENCE Employee_seq;
drop SEQUENCE Floor_seq;
drop SEQUENCE House_seq;
drop SEQUENCE House_style_seq;
drop SEQUENCE Lot_seq;
drop SEQUENCE Option_code_table_seq;
drop SEQUENCE Option_for_stage_seq;
drop SEQUENCE Room_seq;
drop SEQUENCE Room_assignment_seq;
drop SEQUENCE Sale_seq;
drop SEQUENCE Sales_agent_seq;
drop SEQUENCE Sales_agent_assignment_seq;
drop SEQUENCE School_seq;
drop SEQUENCE School_district_seq;
drop SEQUENCE Stage_assignment_seq;
drop SEQUENCE Stage_code_table_seq;
drop SEQUENCE Stage_selected_opt_seq;
drop SEQUENCE Style_code_table_seq;
drop SEQUENCE Style_elevation_seq;
drop SEQUENCE Subdivision_seq;
drop SEQUENCE Subdivision_agreement_seq;
drop SEQUENCE Subdivision_style_option_seq;
drop SEQUENCE Task_seq;
drop SEQUENCE Task_update_seq;

--Sequences for surrogate keys.

CREATE SEQUENCE App_user_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Constr_worker_crew_assign_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Construction_project_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Construction_worker_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Contract_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Crew_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Crew_project_assignment_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Customer_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Customer_contract_assign_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Disclosure_form_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Elevation_code_table_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Employee_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Floor_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE House_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE House_style_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Lot_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Option_code_table_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Option_for_stage_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Room_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Room_assignment_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Sale_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Sales_agent_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Sales_agent_assignment_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE School_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE School_district_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Stage_assignment_seq INCREMENT BY 1
START WITH 1;

--Do we need surrogate key for stage???????
CREATE SEQUENCE Stage_code_table_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Stage_selected_opt_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Style_code_table_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Style_elevation_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Subdivision_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Subdivision_agreement_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Subdivision_style_option_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Task_seq INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE Task_update_seq INCREMENT BY 1
START WITH 1;
