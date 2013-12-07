CREATE ROLE sales_manager;
GRANT select, update, insert, delete on customer to sales_manager;
GRANT select, update, insert, delete on house to sales_manager;
GRANT select, update, insert, delete on floor to sales_manager;
GRANT select, update, insert, delete on room to sales_manager;
GRANT select, update, insert, delete on house_on_a_floor to sales_manager;
GRANT select, update, insert, delete on sale to sales_manager;
GRANT select, update, insert, delete on contract to sales_manager;
GRANT select, update, insert, delete on disclosure_form to sales_manager;
GRANT select, update, insert, delete on subdivision_agreement to sales_manager;
GRANT select, update, insert, delete on selected_stage_option to sales_manager;
GRANT select on house_layout to sales_manager;
GRANT select on construction_project to sales_manager;
GRANT select on option_choice to sales_manager;
GRANT select on stage to sales_manager;
GRANT select on subdivision to sales_manager;
GRANT select on school_district to sales_manager;
GRANT select on school to sales_manager;
GRANT select on subdivision_allowable_style to sales_manager;
GRANT select on style to sales_manager;
GRANT select on style_elevation to sales_manager;
GRANT select on elevation to sales_manager;
GRANT select on lot to sales_manager;

CREATE ROLE construction_manager;
GRANT select, update, insert, delete on house to construction_manager;
GRANT select, update, insert, delete on construction_project to construction_manager;
GRANT select, update, insert, delete on construction_project_stage to construction_manager;
GRANT select, update, insert, delete on task to construction_manager;
GRANT select, update, insert, delete on task_update to construction_manager;
GRANT select, update, insert, delete on construction_worker_crew to construction_manager;
GRANT select, update, insert, delete on construction_worker;
GRANT select on option_choice to construction_manager;
GRANT select on house_layout to construction_manager;
GRANT select on stage to construction_manager;
GRANT select on selected_stage_option to construction_manager;
GRANT select on floor to constuction_manager;
GRANT select on room_on_a_floor to construction_manager;
GRANT select on room to construction_manager;
GRANT select on lot to construction_manager;

CREATE USER sm_example IDENTIFIED BY sm_example_pw;
GRANT sales_manager TO sm_example;

CREATE USER cm_example IDENTIFIED BY cm_example_pw;
GRANT construction_manager TO cm_example;


