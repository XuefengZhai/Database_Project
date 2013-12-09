DROP ROLE sales_agent;
CREATE ROLE sales_agent;
GRANT select, update, insert, delete on customer to sales_agent;
GRANT select, update, insert, delete on house to sales_agent;
GRANT select, update, insert, delete on contract to sales_agent;
GRANT select, update, insert, delete on sale to sales_agent;
GRANT select, update, insert, delete on house_sales_agent to sales_agent;
GRANT select, update, insert, delete on disclosure_form to sales_agent;
GRANT select, update, insert, delete on subdivision_agreement to sales_agent;
GRANT select, update, insert, delete on floor to sales_agent;
GRANT select, update, insert, delete on room_on_a_floor to sales_agent;
GRANT select, update, insert, delete on room to sales_agent;
GRANT select, update, insert, delete on selected_stage_option to sales_agent;
GRANT select on view_emptylot to sales_agent;
GRANT select on house_layout to sales_agent;
GRANT select on construction_project to sales_agent;
GRANT select on option_choice to sales_agent;
GRANT select on stage to sales_agent;
GRANT select on subdivision to sales_agent;
GRANT select on school_district to sales_agent;
GRANT select on school to sales_agent;
GRANT select on subdivision_allowable_style to sales_agent;
GRANT select on style to sales_agent;
GRANT select on style_elevation to sales_agent;
GRANT select on elevation to sales_agent;

DROP ROLE project_manager;
CREATE ROLE project_manager;
GRANT select, update, insert, delete on house to project_manager;
GRANT select, update, insert, delete on construction_project to project_manager;
GRANT select, update, insert, delete on construction_project_stage to project_manager;
GRANT select, update, insert, delete on task to project_manager;
GRANT select, update, insert, delete on task_update to project_manager;
GRANT select, update, insert, delete on construction_worker_crew to project_manager;
GRANT select, update, insert, delete on crew to project_manager;
GRANT select, update, insert, delete on construction_worker to project_manager;
GRANT select, update, insert, delete on lot to project_manager;
GRANT select on view_unfinished_houses to project_manager;
GRANT select on house_layout to project_manager;
GRANT select on stage to project_manager;
GRANT select on selected_stage_option to project_manager;
GRANT select on option_choice to project_manager;
GRANT select on floor to project_manager;
GRANT select on room_on_a_floor to project_manager;
GRANT select on room to project_manager;

DROP USER sa_example;
CREATE USER sa_example IDENTIFIED BY sa_example_pw
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;
GRANT CREATE SESSION, RESOURCE to sa_example;
GRANT sales_agent TO sa_example;

DROP USER pm_example;
CREATE USER pm_example IDENTIFIED BY pm_example_pw
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;
GRANT CREATE SESSION, RESOURCE to pm_example;
GRANT project_manager TO pm_example;


