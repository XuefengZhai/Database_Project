--Views

--1. Customer information of all the unfinished houses


--set the format??
--Assume that if the construction is not finished, the end_date is NULL.
CREATE OR REPLACE VIEW view_unfinished_houses AS
	SELECT h.house_id, con.contract_id, c.customer_id, 
				 c.first_name AS FN, c.last_name AS LN, c.phone_number AS PhoneNo,
				 cp.estimated_end_date AS Estimated_End_Date
	FROM construction_project cp
	LEFT JOIN house h on h.house_id = cp.house_id
	LEFT JOIN contract con on cp.house_id = con.house_id
	LEFT JOIN customer_contract cc on con.contract_id = cc.contract_id
	LEFT JOIN Customer c on cc.customer_id = c.customer_id
	WHERE cp.end_date is NULL
	AND con.is_terminated like 'N';
				 
