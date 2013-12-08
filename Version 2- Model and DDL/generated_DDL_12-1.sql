-- Generated by Oracle SQL Developer Data Modeler 3.1.0.700
--   at:        2013-12-07 16:04:58 EST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



DROP TABLE APPLICATION_USER CASCADE CONSTRAINTS 
;
DROP TABLE CONSTRUCTION_PROJECT CASCADE CONSTRAINTS 
;
DROP TABLE CONSTRUCTION_PROJECT_STAGE CASCADE CONSTRAINTS 
;
DROP TABLE CONSTRUCTION_WORKER CASCADE CONSTRAINTS 
;
DROP TABLE CONSTRUCTION_WORKER_CREW CASCADE CONSTRAINTS 
;
DROP TABLE CONTRACT CASCADE CONSTRAINTS 
;
DROP TABLE CREW CASCADE CONSTRAINTS 
;
DROP TABLE CREW_MANAGER CASCADE CONSTRAINTS 
;
DROP TABLE CUSTOMER CASCADE CONSTRAINTS 
;
DROP TABLE CUSTOMER_CONTRACT CASCADE CONSTRAINTS 
;
DROP TABLE DISCLOSURE_FORM CASCADE CONSTRAINTS 
;
DROP TABLE ELEVATION CASCADE CONSTRAINTS 
;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS 
;
DROP TABLE FLOOR CASCADE CONSTRAINTS 
;
DROP TABLE HOUSE CASCADE CONSTRAINTS 
;
DROP TABLE HOUSE_LAYOUT CASCADE CONSTRAINTS 
;
DROP TABLE HOUSE_SALES_AGENT CASCADE CONSTRAINTS 
;
DROP TABLE LOT CASCADE CONSTRAINTS 
;
DROP TABLE OPTION_CHOICE CASCADE CONSTRAINTS 
;
DROP TABLE PROJECT_MANAGER CASCADE CONSTRAINTS 
;
DROP TABLE ROOM CASCADE CONSTRAINTS 
;
DROP TABLE ROOM_ON_A_FLOOR CASCADE CONSTRAINTS 
;
DROP TABLE SALE CASCADE CONSTRAINTS 
;
DROP TABLE SALES_AGENT CASCADE CONSTRAINTS 
;
DROP TABLE SCHOOL CASCADE CONSTRAINTS 
;
DROP TABLE SCHOOL_DISTRICT CASCADE CONSTRAINTS 
;
DROP TABLE SELECTED_STAGE_OPTION CASCADE CONSTRAINTS 
;
DROP TABLE STAGE CASCADE CONSTRAINTS 
;
DROP TABLE STYLE CASCADE CONSTRAINTS 
;
DROP TABLE STYLE_ELEVATION CASCADE CONSTRAINTS 
;
DROP TABLE SUBDIVISION CASCADE CONSTRAINTS 
;
DROP TABLE SUBDIVISION_AGREEMENT CASCADE CONSTRAINTS 
;
DROP TABLE SUBDIVISION_ALLOWABLE_STYLE CASCADE CONSTRAINTS 
;
DROP TABLE TASK CASCADE CONSTRAINTS 
;
DROP TABLE TASK_UPDATE CASCADE CONSTRAINTS 
;
DROP TABLE CONSTRUCTION_END_TODAY
;

CREATE TABLE APPLICATION_USER 
    ( 
     app_user_id NUMBER  NOT NULL , 
     username VARCHAR2 (50)  NOT NULL , 
     password VARCHAR2 (16)  NOT NULL , 
     password_recovery_question VARCHAR2 (50)  NOT NULL , 
     password_recovery_answer VARCHAR2 (50)  NOT NULL , 
     email VARCHAR2 (25)  NOT NULL CHECK ( email LIKE '%@%') , 
     is_active CHAR (1) DEFAULT 'Y'  NOT NULL CHECK ( is_active IN ('N', 'Y')) 
    ) 
;



ALTER TABLE APPLICATION_USER 
    ADD CONSTRAINT Application_User_PK PRIMARY KEY ( app_user_id ) ;



CREATE TABLE CONSTRUCTION_PROJECT 
    ( 
     construction_project_id NUMBER  NOT NULL , 
     start_date DATE  NOT NULL , 
     estimated_end_date DATE  NOT NULL , 
     end_date DATE , 
     project_manager_employee_id NUMBER  NOT NULL , 
     crew_id NUMBER , 
     house_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CONSTRUCTION_PROJECT 
    ADD CONSTRAINT Construction_Project_PK PRIMARY KEY ( construction_project_id ) ;



CREATE TABLE CONSTRUCTION_PROJECT_STAGE 
    ( 
     construction_project_stage_id NUMBER  NOT NULL , 
     start_date DATE  NOT NULL , 
     estimated_end_date DATE  NOT NULL , 
     end_date DATE , 
     construction_project_id NUMBER  NOT NULL , 
     stage_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CONSTRUCTION_PROJECT_STAGE 
    ADD CONSTRAINT Construction_Project_Stage_PK PRIMARY KEY ( construction_project_stage_id ) ;



CREATE TABLE CONSTRUCTION_WORKER 
    ( 
     skill_one VARCHAR2 (25)  NOT NULL , 
     skill_two VARCHAR2 (25) , 
     skill_three VARCHAR2 (25) , 
     employee_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CONSTRUCTION_WORKER 
    ADD CONSTRAINT CONSTRUCTION_WORKER_PK PRIMARY KEY ( employee_id ) ;



CREATE TABLE CONSTRUCTION_WORKER_CREW 
    ( 
     construction_worker_crew_id NUMBER  NOT NULL , 
     start_date DATE  NOT NULL , 
     end_date DATE , 
     crew_id NUMBER  NOT NULL , 
     constr_worker_employee_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CONSTRUCTION_WORKER_CREW 
    ADD CONSTRAINT Construction_Worker_Crew_PK PRIMARY KEY ( construction_worker_crew_id ) ;



CREATE TABLE CONTRACT 
    ( 
     contract_id NUMBER  NOT NULL , 
     submitted_date DATE , 
     time_limit_date DATE , 
     scanned_image BLOB , 
     is_terminated CHAR (1) DEFAULT 'N' CHECK ( is_terminated IN ('N', 'Y')) , 
     disclosure_form_id NUMBER  NOT NULL , 
     subdivision_agreement_id NUMBER  NOT NULL , 
     house_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CONTRACT 
    ADD CONSTRAINT Contract_PK PRIMARY KEY ( contract_id ) ;



CREATE TABLE CREW 
    ( 
     crew_id NUMBER  NOT NULL , 
     crew_manager_employee_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CREW 
    ADD CONSTRAINT Crew_PK PRIMARY KEY ( crew_id ) ;



CREATE TABLE CREW_MANAGER 
    ( 
     start_date DATE  NOT NULL , 
     end_date DATE , 
     employee_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CREW_MANAGER 
    ADD CONSTRAINT CREW_MANAGER_PK PRIMARY KEY ( employee_id ) ;



CREATE TABLE CUSTOMER 
    ( 
     customer_id NUMBER  NOT NULL , 
     first_name VARCHAR2 (50)  NOT NULL , 
     last_name VARCHAR2 (50)  NOT NULL , 
     phone_number VARCHAR2 (14) , 
     mortgage_info VARCHAR2 (250) , 
     app_user_id NUMBER 
    ) 
;



ALTER TABLE CUSTOMER 
    ADD CONSTRAINT Customer_PK PRIMARY KEY ( customer_id ) ;



CREATE TABLE CUSTOMER_CONTRACT 
    ( 
     customer_contract_id NUMBER  NOT NULL , 
     customer_id NUMBER  NOT NULL , 
     contract_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE CUSTOMER_CONTRACT 
    ADD CONSTRAINT Customer_Contract_PK PRIMARY KEY ( customer_contract_id ) ;



CREATE TABLE DISCLOSURE_FORM 
    ( 
     disclosure_form_id NUMBER  NOT NULL , 
     start_date DATE  NOT NULL , 
     end_date DATE , 
     description VARCHAR2 (250)  NOT NULL 
    ) 
;



ALTER TABLE DISCLOSURE_FORM 
    ADD CONSTRAINT Disclosure_form_PK PRIMARY KEY ( disclosure_form_id ) ;



CREATE TABLE ELEVATION 
    ( 
     elevation_id NUMBER  NOT NULL , 
     type VARCHAR2 (1)  NOT NULL CHECK ( type IN ('A', 'B', 'C')) , 
     description VARCHAR2 (250) , 
     additional_cost NUMBER (9,2) 
    ) 
;



ALTER TABLE ELEVATION 
    ADD CONSTRAINT Elevation_PK PRIMARY KEY ( elevation_id ) ;


ALTER TABLE ELEVATION 
    ADD CONSTRAINT ELEVATION_type_UN UNIQUE ( type ) ;



CREATE TABLE EMPLOYEE 
    ( 
     employee_id NUMBER  NOT NULL , 
     first_name VARCHAR2 (50)  NOT NULL , 
     last_name VARCHAR2 (50)  NOT NULL , 
     street VARCHAR2 (40)  NOT NULL , 
     city VARCHAR2 (25)  NOT NULL , 
     state VARCHAR2 (2)  NOT NULL CHECK ( state IN ('AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY')) , 
     zipcode VARCHAR2 (10)  NOT NULL , 
     home_phone VARCHAR2 (14)  NOT NULL , 
     work_phone VARCHAR2 (14) , 
     cell_phone VARCHAR2 (14) , 
     start_date DATE  NOT NULL , 
     end_date DATE , 
     app_user_id NUMBER 
    ) 
;



ALTER TABLE EMPLOYEE 
    ADD CONSTRAINT Employee_PK PRIMARY KEY ( employee_id ) ;



CREATE TABLE FLOOR 
    ( 
     floor_id NUMBER  NOT NULL , 
     description VARCHAR2 (250)  NOT NULL , 
     house_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE FLOOR 
    ADD CONSTRAINT Floor_PK PRIMARY KEY ( floor_id ) ;



CREATE TABLE HOUSE 
    ( 
     house_id NUMBER  NOT NULL , 
     escrow_amount NUMBER (9,2) , 
     is_reversed CHAR (1) DEFAULT 'N' CHECK ( is_reversed IN ('N', 'Y')) , 
     financing_info VARCHAR2 (250) , 
     house_layout_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE HOUSE 
    ADD CONSTRAINT House_PK PRIMARY KEY ( house_id ) ;



CREATE TABLE HOUSE_LAYOUT 
    ( 
     house_layout_id NUMBER  NOT NULL , 
     house_reverse_layout_id NUMBER , 
     name VARCHAR2 (50)  NOT NULL , 
     description VARCHAR2 (250)  NOT NULL 
    ) 
;



ALTER TABLE HOUSE_LAYOUT 
    ADD CONSTRAINT HOUSE_LAYOUT_PK PRIMARY KEY ( house_layout_id ) ;



CREATE TABLE HOUSE_SALES_AGENT 
    ( 
     house_sales_agent_id NUMBER  NOT NULL , 
     start_date DATE  NOT NULL , 
     end_date DATE , 
     is_main_sales_agent CHAR (1) DEFAULT 'N'  NOT NULL CHECK ( is_main_sales_agent IN ('N', 'Y')) , 
     sales_agent_employee_id NUMBER  NOT NULL , 
     house_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE HOUSE_SALES_AGENT 
    ADD CONSTRAINT House_Sales_Agent_PK PRIMARY KEY ( house_sales_agent_id ) ;



CREATE TABLE LOT 
    ( 
     lot_id NUMBER  NOT NULL , 
     lot_size VARCHAR2 (250) , 
     premium NUMBER (9,2)  NOT NULL , 
     street VARCHAR2 (40)  NOT NULL , 
     latitude NUMBER , 
     longitude NUMBER , 
     style_elevation_id NUMBER , 
     subdivision_id NUMBER  NOT NULL , 
     house_id NUMBER 
    ) 
;



ALTER TABLE LOT 
    ADD CONSTRAINT Lot_PK PRIMARY KEY ( lot_id ) ;



CREATE TABLE OPTION_CHOICE 
    ( 
     option_choice_id NUMBER  NOT NULL , 
     option_category VARCHAR2 (25)  NOT NULL CHECK ( option_category IN ('Decoration', 'Electrical', 'Exterior', 'Fixture', 'Flooring', 'Interior', 'Plumbing', 'Wall Texture')) , 
     description VARCHAR2 (250)  NOT NULL , 
     price NUMBER (9,2)  NOT NULL , 
     last_allowed_stage_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE OPTION_CHOICE 
    ADD CONSTRAINT Option_Choice_PK PRIMARY KEY ( option_choice_id ) ;



CREATE TABLE PROJECT_MANAGER 
    ( 
     start_date DATE  NOT NULL , 
     end_date DATE , 
     employee_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE PROJECT_MANAGER 
    ADD CONSTRAINT PROJECT_MANAGER_PK PRIMARY KEY ( employee_id ) ;



CREATE TABLE ROOM 
    ( 
     room_id NUMBER  NOT NULL , 
     room_type VARCHAR2 (25)  NOT NULL CHECK ( room_type IN ('Attic', 'Basement', 'Bathroom', 'Bedroom', 'Den', 'Dining Room', 'Foyer', 'Garage', 'Hall', 'Kitchen', 'Laundry Room', 'Living Room', 'Mud Room', 'Office', 'Study', 'Work Room')) , 
     ceiling_type VARCHAR2 (15) DEFAULT 'standard' CHECK ( ceiling_type IN ('standard', 'tall cathedral', 'vaulted')) , 
     description VARCHAR2 (250) 
    ) 
;



ALTER TABLE ROOM 
    ADD CONSTRAINT Room_PK PRIMARY KEY ( room_id ) ;



CREATE TABLE ROOM_ON_A_FLOOR 
    ( 
     room_on_a_floor_id NUMBER  NOT NULL , 
     room_size VARCHAR2 (250) , 
     num_windows NUMBER (2) CHECK ( num_windows BETWEEN 0 AND 99) , 
     floor_id NUMBER  NOT NULL , 
     room_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE ROOM_ON_A_FLOOR 
    ADD CONSTRAINT Room_On_A_Floor_PK PRIMARY KEY ( room_on_a_floor_id ) ;



CREATE TABLE SALE 
    ( 
     sale_id NUMBER  NOT NULL , 
     escrow_paid CHAR (1) DEFAULT 'N' CHECK ( escrow_paid IN ('N', 'Y')) , 
     financing_option VARCHAR2 (15) CHECK ( financing_option IN ('cash', 'mortgage', 'unknown')) , 
     house_id NUMBER  NOT NULL , 
     employee_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE SALE 
    ADD CONSTRAINT Sale_PK PRIMARY KEY ( sale_id ) ;



CREATE TABLE SALES_AGENT 
    ( 
     title VARCHAR2 (250)  NOT NULL , 
     license_number VARCHAR2 (15)  NOT NULL , 
     employee_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE SALES_AGENT 
    ADD CONSTRAINT SALES_AGENT_PK PRIMARY KEY ( employee_id ) ;



CREATE TABLE SCHOOL 
    ( 
     school_id NUMBER  NOT NULL , 
     name VARCHAR2 (50)  NOT NULL , 
     school_district_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE SCHOOL 
    ADD CONSTRAINT School_PK PRIMARY KEY ( school_id ) ;



CREATE TABLE SCHOOL_DISTRICT 
    ( 
     school_district_id NUMBER  NOT NULL , 
     name VARCHAR2 (50)  NOT NULL 
    ) 
;



ALTER TABLE SCHOOL_DISTRICT 
    ADD CONSTRAINT School_District_PK PRIMARY KEY ( school_district_id ) ;


ALTER TABLE SCHOOL_DISTRICT 
    ADD CONSTRAINT SCHOOL_DISTRICT_name_UN UNIQUE ( name ) ;



CREATE TABLE SELECTED_STAGE_OPTION 
    ( 
     selected_stage_option_id NUMBER  NOT NULL , 
     selected_date DATE  NOT NULL , 
     option_choice_id NUMBER  NOT NULL , 
     construction_project_stage_id NUMBER  NOT NULL , 
     customer_price NUMBER (9,2)  NOT NULL 
    ) 
;



ALTER TABLE SELECTED_STAGE_OPTION 
    ADD CONSTRAINT Selected_Stage_Option PRIMARY KEY ( selected_stage_option_id ) ;



CREATE TABLE STAGE 
    ( 
     stage_id NUMBER  NOT NULL , 
     stage_number NUMBER  NOT NULL CHECK ( stage_number <= 7) , 
     description VARCHAR2 (250) 
    ) 
;



ALTER TABLE STAGE 
    ADD CONSTRAINT Stage_PK PRIMARY KEY ( stage_id ) ;



CREATE TABLE STYLE 
    ( 
     style_id NUMBER  NOT NULL , 
     name VARCHAR2 (50)  NOT NULL , 
     description VARCHAR2 (250) , 
     base_price NUMBER (9,2)  NOT NULL , 
     floorplan_link_one VARCHAR2 (250) , 
     floorplan_link_two VARCHAR2 (250) , 
     floorplan_link_three VARCHAR2 (250) 
    ) 
;



ALTER TABLE STYLE 
    ADD CONSTRAINT Style_PK PRIMARY KEY ( style_id ) ;


ALTER TABLE STYLE 
    ADD CONSTRAINT STYLE_name_UN UNIQUE ( name ) ;



CREATE TABLE STYLE_ELEVATION 
    ( 
     style_elevation_id NUMBER  NOT NULL , 
     style_id NUMBER  NOT NULL , 
     elevation_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE STYLE_ELEVATION 
    ADD CONSTRAINT STYLE_ELEVATION_PK PRIMARY KEY ( style_elevation_id ) ;



CREATE TABLE SUBDIVISION 
    ( 
     subdivision_id NUMBER  NOT NULL , 
     name VARCHAR2 (50)  NOT NULL , 
     city VARCHAR2 (25)  NOT NULL , 
     state VARCHAR2 (2)  NOT NULL CHECK ( state IN ('AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY')) , 
     zipcode VARCHAR2 (10)  NOT NULL , 
     map BLOB , 
     school_district_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE SUBDIVISION 
    ADD CONSTRAINT Subdivision_PK PRIMARY KEY ( subdivision_id ) ;



CREATE TABLE SUBDIVISION_AGREEMENT 
    ( 
     subdivision_agreement_id NUMBER  NOT NULL , 
     description VARCHAR2 (250) , 
     start_date DATE  NOT NULL , 
     end_date DATE , 
     subdivision_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE SUBDIVISION_AGREEMENT 
    ADD CONSTRAINT Subdivision_Agreement_PK PRIMARY KEY ( subdivision_agreement_id ) ;



CREATE TABLE SUBDIVISION_ALLOWABLE_STYLE 
    ( 
     subdivision_allowable_style_id NUMBER  NOT NULL , 
     subdivision_id NUMBER  NOT NULL , 
     style_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE SUBDIVISION_ALLOWABLE_STYLE 
    ADD CONSTRAINT Subdivision_Allowable_Style PRIMARY KEY ( subdivision_allowable_style_id ) ;



CREATE TABLE TASK 
    ( 
     task_id NUMBER  NOT NULL , 
     name VARCHAR2 (50)  NOT NULL , 
     description VARCHAR2 (250) , 
     selected_stage_option_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE TASK 
    ADD CONSTRAINT Task_PK PRIMARY KEY ( task_id ) ;



CREATE TABLE TASK_UPDATE 
    ( 
     task_update_id NUMBER  NOT NULL , 
     update_date DATE  NOT NULL , 
     percent_complete NUMBER (5,2)  NOT NULL , 
     comments VARCHAR2 (250)  NOT NULL , 
     photo BLOB , 
     employee_id NUMBER  NOT NULL , 
     task_id NUMBER  NOT NULL 
    ) 
;



ALTER TABLE TASK_UPDATE 
    ADD CONSTRAINT Task_Update_PK PRIMARY KEY ( task_update_id ) ;




ALTER TABLE CUSTOMER_CONTRACT 
    ADD CONSTRAINT CC_contract_id_FK FOREIGN KEY 
    ( 
     contract_id
    ) 
    REFERENCES CONTRACT 
    ( 
     contract_id
    ) 
;


ALTER TABLE CUSTOMER_CONTRACT 
    ADD CONSTRAINT CC_customer_id_FK FOREIGN KEY 
    ( 
     customer_id
    ) 
    REFERENCES CUSTOMER 
    ( 
     customer_id
    ) 
;


ALTER TABLE CONTRACT 
    ADD CONSTRAINT CONTRACT_disclosure_form_id_FK FOREIGN KEY 
    ( 
     disclosure_form_id
    ) 
    REFERENCES DISCLOSURE_FORM 
    ( 
     disclosure_form_id
    ) 
;


ALTER TABLE CONTRACT 
    ADD CONSTRAINT CONTRACT_house_id_FK FOREIGN KEY 
    ( 
     house_id
    ) 
    REFERENCES HOUSE 
    ( 
     house_id
    ) 
;


ALTER TABLE CONSTRUCTION_PROJECT_STAGE 
    ADD CONSTRAINT CPS_construction_project_id_FK FOREIGN KEY 
    ( 
     construction_project_id
    ) 
    REFERENCES CONSTRUCTION_PROJECT 
    ( 
     construction_project_id
    ) 
;


ALTER TABLE CONSTRUCTION_PROJECT_STAGE 
    ADD CONSTRAINT CPS_stage_id_FK FOREIGN KEY 
    ( 
     stage_id
    ) 
    REFERENCES STAGE 
    ( 
     stage_id
    ) 
;


ALTER TABLE CONSTRUCTION_PROJECT 
    ADD CONSTRAINT CP_crew_id_FK FOREIGN KEY 
    ( 
     crew_id
    ) 
    REFERENCES CREW 
    ( 
     crew_id
    ) 
;


ALTER TABLE CONSTRUCTION_PROJECT 
    ADD CONSTRAINT CP_employee_id_FK FOREIGN KEY 
    ( 
     project_manager_employee_id
    ) 
    REFERENCES PROJECT_MANAGER 
    ( 
     employee_id
    ) 
;


ALTER TABLE CONSTRUCTION_PROJECT 
    ADD CONSTRAINT CP_house_id_FK FOREIGN KEY 
    ( 
     house_id
    ) 
    REFERENCES HOUSE 
    ( 
     house_id
    ) 
    ON DELETE CASCADE 
;


ALTER TABLE CREW 
    ADD CONSTRAINT CREW_employee_id_FK FOREIGN KEY 
    ( 
     crew_manager_employee_id
    ) 
    REFERENCES CREW_MANAGER 
    ( 
     employee_id
    ) 
;


ALTER TABLE CUSTOMER 
    ADD CONSTRAINT CUSTOMER_app_user_id_FK FOREIGN KEY 
    ( 
     app_user_id
    ) 
    REFERENCES APPLICATION_USER 
    ( 
     app_user_id
    ) 
;


ALTER TABLE CONSTRUCTION_WORKER_CREW 
    ADD CONSTRAINT CWC_crew_id_FK FOREIGN KEY 
    ( 
     crew_id
    ) 
    REFERENCES CREW 
    ( 
     crew_id
    ) 
;


ALTER TABLE CONSTRUCTION_WORKER_CREW 
    ADD CONSTRAINT CWC_employee_id_FK FOREIGN KEY 
    ( 
     constr_worker_employee_id
    ) 
    REFERENCES CONSTRUCTION_WORKER 
    ( 
     employee_id
    ) 
;


ALTER TABLE CONTRACT 
    ADD CONSTRAINT C_subdivision_agreement_id_FK FOREIGN KEY 
    ( 
     subdivision_agreement_id
    ) 
    REFERENCES SUBDIVISION_AGREEMENT 
    ( 
     subdivision_agreement_id
    ) 
;


ALTER TABLE EMPLOYEE 
    ADD CONSTRAINT EMPLOYEE_app_user_id_FK FOREIGN KEY 
    ( 
     app_user_id
    ) 
    REFERENCES APPLICATION_USER 
    ( 
     app_user_id
    ) 
;


ALTER TABLE PROJECT_MANAGER 
    ADD CONSTRAINT FK_ASS_309 FOREIGN KEY 
    ( 
     employee_id
    ) 
    REFERENCES EMPLOYEE 
    ( 
     employee_id
    ) 
;


ALTER TABLE CREW_MANAGER 
    ADD CONSTRAINT FK_ASS_310 FOREIGN KEY 
    ( 
     employee_id
    ) 
    REFERENCES EMPLOYEE 
    ( 
     employee_id
    ) 
;


ALTER TABLE CONSTRUCTION_WORKER 
    ADD CONSTRAINT FK_ASS_311 FOREIGN KEY 
    ( 
     employee_id
    ) 
    REFERENCES EMPLOYEE 
    ( 
     employee_id
    ) 
;


ALTER TABLE SALES_AGENT 
    ADD CONSTRAINT FK_ASS_312 FOREIGN KEY 
    ( 
     employee_id
    ) 
    REFERENCES EMPLOYEE 
    ( 
     employee_id
    ) 
;


ALTER TABLE FLOOR 
    ADD CONSTRAINT FLOOR_house_id_FK FOREIGN KEY 
    ( 
     house_id
    ) 
    REFERENCES HOUSE 
    ( 
     house_id
    ) 
;


ALTER TABLE HOUSE_LAYOUT 
    ADD CONSTRAINT HL_house_layout_id_FK FOREIGN KEY 
    ( 
     house_reverse_layout_id
    ) 
    REFERENCES HOUSE_LAYOUT 
    ( 
     house_layout_id
    ) 
;


ALTER TABLE HOUSE_SALES_AGENT 
    ADD CONSTRAINT HOUSE_SALES_AGENT_house_id_FK FOREIGN KEY 
    ( 
     house_id
    ) 
    REFERENCES HOUSE 
    ( 
     house_id
    ) 
;


ALTER TABLE HOUSE 
    ADD CONSTRAINT HOUSE_house_layout_id_FK FOREIGN KEY 
    ( 
     house_layout_id
    ) 
    REFERENCES HOUSE_LAYOUT 
    ( 
     house_layout_id
    ) 
;


ALTER TABLE HOUSE_SALES_AGENT 
    ADD CONSTRAINT HSA_employee_id_FK FOREIGN KEY 
    ( 
     sales_agent_employee_id
    ) 
    REFERENCES SALES_AGENT 
    ( 
     employee_id
    ) 
;


ALTER TABLE LOT 
    ADD CONSTRAINT LOT_house_id_FK FOREIGN KEY 
    ( 
     house_id
    ) 
    REFERENCES HOUSE 
    ( 
     house_id
    ) 
;


ALTER TABLE LOT 
    ADD CONSTRAINT LOT_style_elevation_id_FK FOREIGN KEY 
    ( 
     style_elevation_id
    ) 
    REFERENCES STYLE_ELEVATION 
    ( 
     style_elevation_id
    ) 
;


ALTER TABLE LOT 
    ADD CONSTRAINT LOT_subdivision_id_FK FOREIGN KEY 
    ( 
     subdivision_id
    ) 
    REFERENCES SUBDIVISION 
    ( 
     subdivision_id
    ) 
;


ALTER TABLE OPTION_CHOICE 
    ADD CONSTRAINT OPTION_CHOICE_stage_id_FK FOREIGN KEY 
    ( 
     last_allowed_stage_id
    ) 
    REFERENCES STAGE 
    ( 
     stage_id
    ) 
;


ALTER TABLE ROOM_ON_A_FLOOR 
    ADD CONSTRAINT ROOM_ON_A_FLOOR_floor_id_FK FOREIGN KEY 
    ( 
     floor_id
    ) 
    REFERENCES FLOOR 
    ( 
     floor_id
    ) 
;


ALTER TABLE ROOM_ON_A_FLOOR 
    ADD CONSTRAINT ROOM_ON_A_FLOOR_room_id_FK FOREIGN KEY 
    ( 
     room_id
    ) 
    REFERENCES ROOM 
    ( 
     room_id
    ) 
;


ALTER TABLE SALE 
    ADD CONSTRAINT SALE_employee_id_FK FOREIGN KEY 
    ( 
     employee_id
    ) 
    REFERENCES SALES_AGENT 
    ( 
     employee_id
    ) 
;


ALTER TABLE SALE 
    ADD CONSTRAINT SALE_house_id_FK FOREIGN KEY 
    ( 
     house_id
    ) 
    REFERENCES HOUSE 
    ( 
     house_id
    ) 
;


ALTER TABLE SUBDIVISION_ALLOWABLE_STYLE 
    ADD CONSTRAINT SAS_style_id_FK FOREIGN KEY 
    ( 
     style_id
    ) 
    REFERENCES STYLE 
    ( 
     style_id
    ) 
;


ALTER TABLE SUBDIVISION_ALLOWABLE_STYLE 
    ADD CONSTRAINT SAS_subdivision_id_FK FOREIGN KEY 
    ( 
     subdivision_id
    ) 
    REFERENCES SUBDIVISION 
    ( 
     subdivision_id
    ) 
;


ALTER TABLE SUBDIVISION_AGREEMENT 
    ADD CONSTRAINT SA_subdivision_id_FK FOREIGN KEY 
    ( 
     subdivision_id
    ) 
    REFERENCES SUBDIVISION 
    ( 
     subdivision_id
    ) 
;


ALTER TABLE SCHOOL 
    ADD CONSTRAINT SCHOOL_school_district_id_FK FOREIGN KEY 
    ( 
     school_district_id
    ) 
    REFERENCES SCHOOL_DISTRICT 
    ( 
     school_district_id
    ) 
;


ALTER TABLE STYLE_ELEVATION 
    ADD CONSTRAINT SE_elevation_id_FK FOREIGN KEY 
    ( 
     elevation_id
    ) 
    REFERENCES ELEVATION 
    ( 
     elevation_id
    ) 
;


ALTER TABLE SELECTED_STAGE_OPTION 
    ADD CONSTRAINT SSO_cnstr_project_stage_id_FK FOREIGN KEY 
    ( 
     construction_project_stage_id
    ) 
    REFERENCES CONSTRUCTION_PROJECT_STAGE 
    ( 
     construction_project_stage_id
    ) 
;


ALTER TABLE SELECTED_STAGE_OPTION 
    ADD CONSTRAINT SSO_option_choice_id_FK FOREIGN KEY 
    ( 
     option_choice_id
    ) 
    REFERENCES OPTION_CHOICE 
    ( 
     option_choice_id
    ) 
;


ALTER TABLE STYLE_ELEVATION 
    ADD CONSTRAINT STYLE_ELEVATION_style_id_FK FOREIGN KEY 
    ( 
     style_id
    ) 
    REFERENCES STYLE 
    ( 
     style_id
    ) 
;


ALTER TABLE SUBDIVISION 
    ADD CONSTRAINT S_school_district_id_FK FOREIGN KEY 
    ( 
     school_district_id
    ) 
    REFERENCES SCHOOL_DISTRICT 
    ( 
     school_district_id
    ) 
;


ALTER TABLE TASK_UPDATE 
    ADD CONSTRAINT TASK_UPDATE_employee_id_FK FOREIGN KEY 
    ( 
     employee_id
    ) 
    REFERENCES PROJECT_MANAGER 
    ( 
     employee_id
    ) 
;


ALTER TABLE TASK_UPDATE 
    ADD CONSTRAINT TASK_UPDATE_task_id_FK FOREIGN KEY 
    ( 
     task_id
    ) 
    REFERENCES TASK 
    ( 
     task_id
    ) 
;


ALTER TABLE TASK 
    ADD CONSTRAINT T_selected_stage_option_id_FK FOREIGN KEY 
    ( 
     selected_stage_option_id
    ) 
    REFERENCES SELECTED_STAGE_OPTION 
    ( 
     selected_stage_option_id
    ) 
;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            35
-- CREATE INDEX                             0
-- ALTER TABLE                             82
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

/*Table created for JOB*/
CREATE TABLE CONSTRUCTION_END_TODAY 
( 
  construction_project_id NUMBER  NOT NULL , 
  start_date DATE  NOT NULL , 
  end_date DATE , 
  project_manager_employee_id NUMBER  NOT NULL , 
  crew_id NUMBER , 
  house_id NUMBER  NOT NULL 
);

