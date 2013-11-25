CREATE ROLE sales_manager;
GRANT select, update, insert, delete on customer to sales_manager;
GRANT select, update, insert, delete on house to sales_manager;
GRANT select, update, insert, delete on house_style to sales_manager;
GRANT select, update, insert, delete on contract to sales_manager;
GRANT select, update, insert, delete on disclosure_form_assignment to sales_manager;
GRANT select, update, insert, delete on disclosure_form to sales_manager;
GRANT select, update, insert, delete on subdivision_agreement_assignment to sales_manager;
GRANT select, update, insert, delete on subdivision_agreement to sales_manager;
GRANT select, update, insert, delete on room to sales_manager;
GRANT select, update, insert, delete on room_assignment to sales_manager;
GRANT select, update, insert, delete on stage_selected_option to sales_manager;
GRANT select on construction_project to sales_manager;
GRANT select on option_for_stage to sales_manager;
GRANT select on option_code_table to sales_manager;
GRANT select on stage_code_table to sales_manager;
GRANT select on subdivision to sales_manager;
GRANT select on school_district to sales_manager;
GRANT select on school to sales_manager;
GRANT select on subdivision_style_option to sales_manager;
GRANT select on style_code_table to sales_manager;
GRANT select on style_elevation to sales_manager;
GRANT select on elevation_code_table to sales_manager;

CREATE ROLE construction_manager;
GRANT select, update, insert, delete on house to construction_manager;
GRANT select, update, insert, delete on construction_project to construction_manager;
GRANT select, update, insert, delete on stage_assignment to construction_manager;
GRANT select, update, insert, delete on task to construction_manager;
GRANT select, update, insert, delete on task_update to construction_manager;
GRANT select, update, insert, delete on crew_project_assignment to construction_manager;
GRANT select, update, insert, delete on crew to construction_manager;
GRANT select, update, insert, delete on contr_worker_crew_assign to construction_manager;
GRANT select, update, insert, delete on construction_worker to construction_manager;
GRANT select on house_style to construction_manager;
GRANT select on stage_code_table to construction_manager;
GRANT select on stage_selected_option to construction_manager;
GRANT select on option_for_stage to construction_manager;
GRANT select on option_code_table to construction_manager;
GRANT select on room_assignment to construction_manager;
GRANT select on room to construction_manager;

CREATE USER sm_example IDENTIFIED BY sm_example_pw;
GRANT sales_manager TO sm_example;

CREATE USER cm_example IDENTIFIED BY cm_example_pw;
GRANT construction_manager TO cm_example;


