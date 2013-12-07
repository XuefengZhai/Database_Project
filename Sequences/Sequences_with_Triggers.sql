--Drop the Sequences
drop SEQUENCE APPLICATION_USER_seq;
drop SEQUENCE CONSTRUCTION_PROJECT_STAGE_seq;
drop SEQUENCE CONSTRUCTION_WORKER_CREW_seq;
drop SEQUENCE CONTRACT_seq;
drop SEQUENCE CONSTRUCTION_PROJECT_seq;
drop SEQUENCE CREW_seq;
drop SEQUENCE CUSTOMER_seq;
drop SEQUENCE CUSTOMER_CONTRACT_seq;
drop SEQUENCE DISCLOSURE_FORM_seq;
drop SEQUENCE ELEVATION_seq;
drop SEQUENCE EMPLOYEE_seq;
drop SEQUENCE FLOOR_seq;
drop SEQUENCE HOUSE_seq;
drop SEQUENCE HOUSE_LAYOUT_seq;
drop SEQUENCE HOUSE_SALES_AGENT_seq;
drop SEQUENCE LOT_seq;
drop SEQUENCE OPTION_CHOICE_seq;
drop SEQUENCE ROOM_seq;
drop SEQUENCE ROOM_ON_A_FLOOR_seq;
drop SEQUENCE SALE_seq;
drop SEQUENCE SCHOOL_seq;
drop SEQUENCE SCHOOL_DISTRICT_seq;
drop SEQUENCE SELECTED_STAGE_OPTION_seq;
drop SEQUENCE STAGE_seq;
drop SEQUENCE STYLE_seq;
drop SEQUENCE STYLE_ELEVATION_seq;
drop SEQUENCE SUBDIVISION_seq;
drop SEQUENCE SUBDIVISION_AGREEMENT_seq;
drop SEQUENCE SUBDIV_ALLOWABLE_STYLE_seq;
drop SEQUENCE TASK_UPDATE_seq;
drop SEQUENCE TASK_seq;

--Create the Sequences
CREATE SEQUENCE APPLICATION_USER_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t1 
BEFORE INSERT ON APPLICATION_USER
FOR EACH ROW
WHEN (NEW.APP_USER_id IS NULL) 
BEGIN
  :NEW.APP_USER_id := APPLICATION_USER_seq.NEXTVAL;
END;
/



CREATE SEQUENCE CONSTRUCTION_PROJECT_STAGE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t2
BEFORE INSERT ON CONSTRUCTION_PROJECT_STAGE
FOR EACH ROW
WHEN (NEW.CONSTRUCTION_PROJECT_STAGE_id IS NULL) 
BEGIN
  :NEW.CONSTRUCTION_PROJECT_STAGE_id := CONSTRUCTION_PROJECT_STAGE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE CONSTRUCTION_WORKER_CREW_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t3
BEFORE INSERT ON CONSTRUCTION_WORKER_CREW
FOR EACH ROW
WHEN (NEW.CONSTRUCTION_WORKER_CREW_id IS NULL) 
BEGIN
  :NEW.CONSTRUCTION_WORKER_CREW_id := CONSTRUCTION_WORKER_CREW_seq.NEXTVAL;
END;
/



CREATE SEQUENCE CONTRACT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t4
BEFORE INSERT ON CONTRACT
FOR EACH ROW
WHEN (NEW.CONTRACT_id IS NULL) 
BEGIN
  :NEW.CONTRACT_id := CONTRACT_seq.NEXTVAL;
END;
/



CREATE SEQUENCE CONSTRUCTION_PROJECT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t5
BEFORE INSERT ON CONSTRUCTION_PROJECT
FOR EACH ROW
WHEN (NEW.CONSTRUCTION_PROJECT_id IS NULL) 
BEGIN
  :NEW.CONSTRUCTION_PROJECT_id := CONSTRUCTION_PROJECT_seq.NEXTVAL;
END;
/



CREATE SEQUENCE CREW_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t6
BEFORE INSERT ON CREW
FOR EACH ROW
WHEN (NEW.CREW_id IS NULL) 
BEGIN
  :NEW.CREW_id := CREW_seq.NEXTVAL;
END;
/



CREATE SEQUENCE CUSTOMER_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t8
BEFORE INSERT ON CUSTOMER
FOR EACH ROW
WHEN (NEW.CUSTOMER_id IS NULL) 
BEGIN
  :NEW.CUSTOMER_id := CUSTOMER_seq.NEXTVAL;
END;
/



CREATE SEQUENCE CUSTOMER_CONTRACT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t9
BEFORE INSERT ON CUSTOMER_CONTRACT
FOR EACH ROW
WHEN (NEW.CUSTOMER_CONTRACT_id IS NULL) 
BEGIN
  :NEW.CUSTOMER_CONTRACT_id := CUSTOMER_CONTRACT_seq.NEXTVAL;
END;
/



CREATE SEQUENCE DISCLOSURE_FORM_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t10
BEFORE INSERT ON DISCLOSURE_FORM
FOR EACH ROW
WHEN (NEW.DISCLOSURE_FORM_id IS NULL) 
BEGIN
  :NEW.DISCLOSURE_FORM_id := DISCLOSURE_FORM_seq.NEXTVAL;
END;
/



CREATE SEQUENCE ELEVATION_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t11
BEFORE INSERT ON ELEVATION
FOR EACH ROW
WHEN (NEW.ELEVATION_id IS NULL) 
BEGIN
  :NEW.ELEVATION_id := ELEVATION_seq.NEXTVAL;
END;
/



CREATE SEQUENCE EMPLOYEE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t12
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
WHEN (NEW.EMPLOYEE_id IS NULL) 
BEGIN
  :NEW.EMPLOYEE_id := EMPLOYEE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE FLOOR_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t13
BEFORE INSERT ON FLOOR
FOR EACH ROW
WHEN (NEW.FLOOR_id IS NULL) 
BEGIN
  :NEW.FLOOR_id := FLOOR_seq.NEXTVAL;
END;
/



CREATE SEQUENCE HOUSE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t14
BEFORE INSERT ON HOUSE
FOR EACH ROW
WHEN (NEW.HOUSE_id IS NULL) 
BEGIN
  :NEW.HOUSE_id := HOUSE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE HOUSE_LAYOUT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t15
BEFORE INSERT ON HOUSE_LAYOUT
FOR EACH ROW
WHEN (NEW.HOUSE_LAYOUT_id IS NULL) 
BEGIN
  :NEW.HOUSE_LAYOUT_id := HOUSE_LAYOUT_seq.NEXTVAL;
END;
/




CREATE SEQUENCE HOUSE_SALES_AGENT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t16
BEFORE INSERT ON HOUSE_SALES_AGENT
FOR EACH ROW
WHEN (NEW.HOUSE_SALES_AGENT_id IS NULL) 
BEGIN
  :NEW.HOUSE_SALES_AGENT_id := HOUSE_SALES_AGENT_seq.NEXTVAL;
END;
/



CREATE SEQUENCE LOT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t17
BEFORE INSERT ON LOT
FOR EACH ROW
WHEN (NEW.LOT_id IS NULL) 
BEGIN
  :NEW.LOT_id := LOT_seq.NEXTVAL;
END;
/



CREATE SEQUENCE OPTION_CHOICE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t18
BEFORE INSERT ON OPTION_CHOICE
FOR EACH ROW
WHEN (NEW.OPTION_CHOICE_id IS NULL) 
BEGIN
  :NEW.OPTION_CHOICE_id := OPTION_CHOICE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE ROOM_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t20
BEFORE INSERT ON ROOM
FOR EACH ROW
WHEN (NEW.ROOM_id IS NULL) 
BEGIN
  :NEW.ROOM_id := ROOM_seq.NEXTVAL;
END;
/



CREATE SEQUENCE ROOM_ON_A_FLOOR_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t21
BEFORE INSERT ON ROOM_ON_A_FLOOR
FOR EACH ROW
WHEN (NEW.ROOM_ON_A_FLOOR_id IS NULL) 
BEGIN
  :NEW.ROOM_ON_A_FLOOR_id := ROOM_ON_A_FLOOR_seq.NEXTVAL;
END;
/




CREATE SEQUENCE SALE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t22
BEFORE INSERT ON SALE
FOR EACH ROW
WHEN (NEW.SALE_id IS NULL) 
BEGIN
  :NEW.SALE_id := SALE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE SCHOOL_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t24
BEFORE INSERT ON SCHOOL
FOR EACH ROW
WHEN (NEW.SCHOOL_id IS NULL) 
BEGIN
  :NEW.SCHOOL_id := SCHOOL_seq.NEXTVAL;
END;
/



CREATE SEQUENCE SCHOOL_DISTRICT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t25
BEFORE INSERT ON SCHOOL_DISTRICT
FOR EACH ROW
WHEN (NEW.SCHOOL_DISTRICT_id IS NULL) 
BEGIN
  :NEW.SCHOOL_DISTRICT_id := SCHOOL_DISTRICT_seq.NEXTVAL;
END;
/




CREATE SEQUENCE SELECTED_STAGE_OPTION_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t26
BEFORE INSERT ON SELECTED_STAGE_OPTION
FOR EACH ROW
WHEN (NEW.SELECTED_STAGE_OPTION_id IS NULL) 
BEGIN
  :NEW.SELECTED_STAGE_OPTION_id := SELECTED_STAGE_OPTION_seq.NEXTVAL;
END;
/



CREATE SEQUENCE STAGE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t27
BEFORE INSERT ON STAGE
FOR EACH ROW
WHEN (NEW.STAGE_id IS NULL) 
BEGIN
  :NEW.STAGE_id := STAGE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE STYLE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t28
BEFORE INSERT ON STYLE
FOR EACH ROW
WHEN (NEW.STYLE_id IS NULL) 
BEGIN
  :NEW.STYLE_id := STYLE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE STYLE_ELEVATION_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t29
BEFORE INSERT ON STYLE_ELEVATION
FOR EACH ROW
WHEN (NEW.STYLE_ELEVATION_id IS NULL) 
BEGIN
  :NEW.STYLE_ELEVATION_id := STYLE_ELEVATION_seq.NEXTVAL;
END;
/



CREATE SEQUENCE SUBDIVISION_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t30
BEFORE INSERT ON SUBDIVISION
FOR EACH ROW
WHEN (NEW.SUBDIVISION_id IS NULL) 
BEGIN
  :NEW.SUBDIVISION_id := SUBDIVISION_seq.NEXTVAL;
END;
/




CREATE SEQUENCE SUBDIVISION_AGREEMENT_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t31
BEFORE INSERT ON SUBDIVISION_AGREEMENT
FOR EACH ROW
WHEN (NEW.SUBDIVISION_AGREEMENT_id IS NULL) 
BEGIN
  :NEW.SUBDIVISION_AGREEMENT_id := SUBDIVISION_AGREEMENT_seq.NEXTVAL;
END;
/



CREATE SEQUENCE SUBDIV_ALLOWABLE_STYLE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t32
BEFORE INSERT ON SUBDIVISION_ALLOWABLE_STYLE
FOR EACH ROW
WHEN (NEW.SUBDIVISION_ALLOWABLE_STYLE_id IS NULL) 
BEGIN
  :NEW.SUBDIVISION_ALLOWABLE_STYLE_id := SUBDIV_ALLOWABLE_STYLE_seq.NEXTVAL;
END;
/



CREATE SEQUENCE TASK_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t33
BEFORE INSERT ON TASK
FOR EACH ROW
WHEN (NEW.TASK_id IS NULL) 
BEGIN
  :NEW.TASK_id := TASK_seq.NEXTVAL;
END;
/



CREATE SEQUENCE TASK_UPDATE_seq INCREMENT BY 1
START WITH 1;

CREATE OR REPLACE TRIGGER seq_t34
BEFORE INSERT ON TASK_UPDATE
FOR EACH ROW
WHEN (NEW.TASK_UPDATE_id IS NULL) 
BEGIN
  :NEW.TASK_UPDATE_id := TASK_UPDATE_seq.NEXTVAL;
END;
/