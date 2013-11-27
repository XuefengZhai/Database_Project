--Views

--1. Status of all unfinishing homes


--set the format!!
--Assume that if the construction is not finished, the end_date is NULL.
CREATE OR REPLACE VIEW view_unfinishing AS
	SELECT h.house_id, h.lot_id, con.contract_id, con.customer_id, 
				 c.first_name AS FN, c.last_name AS LN, c.phone_number AS PhoneNo
	FROM House h
	LEFT JOIN Construction_project cp on h.construction_project_id = cp.construction_project_id
	LEFT JOIN Contract con on h.contract_id = con.contraci_id
	LEFT JOIN Customer c on con.customer_id = c.customer_id
	WHERE cp.end_date = NULL;
				 
