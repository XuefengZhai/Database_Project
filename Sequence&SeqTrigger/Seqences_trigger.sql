--Triggers to populate surrogate keys when inserting into tables

CREATE OR REPLACE TRIGGER seq_t1 
BEFORE INSERT ON Constryction_worker
FOR EACH ROW
WHEN (NEW.construction_worker_id IS NULL) 
BEGIN
  :NEW.construction_worker_id := Construction_worker_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t2 
BEFORE INSERT ON Emplyee
FOR EACH ROW
WHEN (NEW.emplyee_id IS NULL) 
BEGIN
  :NEW.emplyee_id := Emloyee_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t3 
BEFORE INSERT ON Sales_agent
FOR EACH ROW
WHEN (NEW.sales_agent_id IS NULL) 
BEGIN
  :NEW.sales_agent_id := Sales_agent_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t4 
BEFORE INSERT ON Construction_worker_crew_assignment
FOR EACH ROW
WHEN (NEW.Construction_worker_crew_assignment_id IS NULL) 
BEGIN
  :NEW.Construction_worker_crew_assignment_id := Construction_worker_crew_assignment_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t5 
BEFORE INSERT ON User
FOR EACH ROW
WHEN (NEW.user_id IS NULL) 
BEGIN
  :NEW.user_id := User_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t6 
BEFORE INSERT ON Task
FOR EACH ROW
WHEN (NEW.task_id IS NULL) 
BEGIN
  :NEW.task_id := Task_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t7 
BEFORE INSERT ON Stage_selected_option
FOR EACH ROW
WHEN (NEW.Stage_selected_option IS NULL) 
BEGIN
  :NEW.Stage_selected_option := Stage_selected_option_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t8 
BEFORE INSERT ON Disclosure_form
FOR EACH ROW
WHEN (NEW.disclosure_form_id IS NULL) 
BEGIN
  :NEW.disclosure_form_id := Disclosure_form_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t9 
BEFORE INSERT ON Crew
FOR EACH ROW
WHEN (NEW.crew_id IS NULL) 
BEGIN
  :NEW.crew_id := Crew_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t10 
BEFORE INSERT ON Crew_project_assighment
FOR EACH ROW
WHEN (NEW.crew_project_assighment_id IS NULL) 
BEGIN
  :NEW.crew_project_assighment_id := Crew_project_assighment_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t11 
BEFORE INSERT ON Update
FOR EACH ROW
WHEN (NEW.update_id IS NULL) 
BEGIN
  :NEW.update_id := Update_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t12 
BEFORE INSERT ON Stage_code_table
FOR EACH ROW
WHEN (NEW.stage_id IS NULL) 
BEGIN
  :NEW.stage_id := Stage_code_table_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t13 
BEFORE INSERT ON Option_for_stage
FOR EACH ROW
WHEN (NEW.option_for_stage_id IS NULL) 
BEGIN
  :NEW.option_for_stage_id := Option_for_stage_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t14 
BEFORE INSERT ON Disclosure_form_assignment
FOR EACH ROW
WHEN (NEW.disclosure_form_assignment_id IS NULL) 
BEGIN
  :NEW.disclosure_form_assignment_id := Disclosure_form_assignment_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t15 
BEFORE INSERT ON Contract
FOR EACH ROW
WHEN (NEW.contract_id IS NULL) 
BEGIN
  :NEW.contract_id := Contract_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t16
BEFORE INSERT ON Customer
FOR EACH ROW
WHEN (NEW.customer_id IS NULL) 
BEGIN
  :NEW.customer_id := Customer_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t17
BEFORE INSERT ON Construction_project
FOR EACH ROW
WHEN (NEW.construction_project_id IS NULL) 
BEGIN
  :NEW.construction_project_id := Construction_project_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t18
BEFORE INSERT ON Stage_assignment
FOR EACH ROW
WHEN (NEW.stage_assignment_id IS NULL) 
BEGIN
  :NEW.stage_assignment_id := Stage_assignment_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t19
BEFORE INSERT ON Option_code_table
FOR EACH ROW
WHEN (NEW.option_code_table_id IS NULL) 
BEGIN
  :NEW.option_code_table_id := Option_code_table_seq.NEXTVAL;
END;
/


CREATE OR REPLACE TRIGGER seq_t20
BEFORE INSERT ON Lot
FOR EACH ROW
WHEN (NEW.lot_id IS NULL) 
BEGIN
  :NEW.lot_id := Lot_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t21
BEFORE INSERT ON House
FOR EACH ROW
WHEN (NEW.house_id IS NULL) 
BEGIN
  :NEW.house_id := House_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t22
BEFORE INSERT ON House_style
FOR EACH ROW
WHEN (NEW.house_style_id IS NULL) 
BEGIN
  :NEW.house_style_id := House_style_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t23
BEFORE INSERT ON Subdivision_agreement_assghment
FOR EACH ROW
WHEN (NEW.subdivision_agreement_assghment_id IS NULL) 
BEGIN
  :NEW.subdivision_agreement_assghment_id := Subdivision_agreement_assghment_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t24
BEFORE INSERT ON Subdivision_agreement
FOR EACH ROW
WHEN (NEW.subdivision_agreement_id IS NULL) 
BEGIN
  :NEW.subdivision_agreement_id := Subdivision_agreement_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t25
BEFORE INSERT ON Subdivision
FOR EACH ROW
WHEN (NEW.subdivision_id IS NULL) 
BEGIN
  :NEW.subdivision_id := Subdivision_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t26
BEFORE INSERT ON Room_assignment
FOR EACH ROW
WHEN (NEW.room_assignment_id IS NULL) 
BEGIN
  :NEW.room_assignment_id := Room_assignment_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t27
BEFORE INSERT ON Sales_agent_assignment
FOR EACH ROW
WHEN (NEW.sales_agent_assignment_id IS NULL) 
BEGIN
  :NEW.sales_agent_assignment_id := Sales_agent_assignment_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t28
BEFORE INSERT ON Subdivision_style_option
FOR EACH ROW
WHEN (NEW.subdivision_style_option_id IS NULL) 
BEGIN
  :NEW.subdivision_style_option_id := Subdivision_style_option_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t29
BEFORE INSERT ON School_district
FOR EACH ROW
WHEN (NEW.school_district_option_id IS NULL) 
BEGIN
  :NEW.school_district_option_id := School_district_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t30
BEFORE INSERT ON Room
FOR EACH ROW
WHEN (NEW.room_id IS NULL) 
BEGIN
  :NEW.room_id := Room_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t31
BEFORE INSERT ON Style_code_table
FOR EACH ROW
WHEN (NEW.style_id IS NULL) 
BEGIN
  :NEW.style_id := Style_code_tabl_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t32
BEFORE INSERT ON School
FOR EACH ROW
WHEN (NEW.school_id IS NULL) 
BEGIN
  :NEW.school_id := School_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t33
BEFORE INSERT ON Style_elevation
FOR EACH ROW
WHEN (NEW.style_elevation_id IS NULL) 
BEGIN
  :NEW.style_elevation_id := Style_elevation_seq.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER seq_t34
BEFORE INSERT ON Elevation_code_table
FOR EACH ROW
WHEN (NEW.elevation_id IS NULL) 
BEGIN
  :NEW.elevation_id := Elevation_code_table_seq.NEXTVAL;
END;
/



















