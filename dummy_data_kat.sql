insert into School_district(name) values ('Pittsburgh');
insert into School_district(name) values ('Cranberry');
insert into School_district(name) values ('Harrisburg');
insert into School_district(name) values ('Milwaukee');
insert into School_district(name) values ('Waukesha');

delete from school;
insert into School(school_district_id, name) values (1, 'Rufus King High School');
insert into School(school_district_id, name) values (5, 'Congress Elementary');
insert into School(school_district_id, name) values (2, 'Lincoln High School');
insert into School(school_district_id, name) values (2, 'Washington West Middle School');
insert into School(school_district_id, name) values (3, 'Rufus King High School');
insert into School(school_district_id, name) values (4, 'Lincoln Elementary School');
insert into School(school_district_id, name) values (5, 'Obama Middle School');
insert into School(school_district_id, name) values (3, 'St. John Upper School');

delete from subdivision;
insert into subdivision(school_district_id, name, city, state, zipcode) values (1, 'The Bluffs', 'Pittsburgh', 'PA', '15217');
insert into subdivision(school_district_id, name, city, state, zipcode) values (2, 'Riverview', 'Cranberry', 'PA', '17897');
insert into subdivision(school_district_id, name, city, state, zipcode) values (4, 'The Lofts', 'Milwaukee', 'WI', '53208');
insert into subdivision(school_district_id, name, city, state, zipcode) values (5, 'Harrington', 'Waukesha', 'WI', '53222');
insert into subdivision(school_district_id, name, city, state, zipcode) values (1, 'Cork Factory', 'Pittsburgh', 'PA', '15222');

delete from elevation_code_table;
insert into elevation_code_table(name, description, additional_cost) values ('A', 'Standard elevation.', 0);
insert into elevation_code_table(name, description, additional_cost) values ('B', 'Silver elevation with upgrade from siding to stone.', 6735.50);
insert into elevation_code_table(name, description, additional_cost) values ('C', 'Gold elevation with upgrade from siding to store with premium windows and finishes.', 12056.00);

insert into employee(first_name, last_name, home_phone_number, street_address, city, state, zip_code, start_date) 
	values ('Katarina', 'Shaw', '414-324-3815', '5626 Wilkins Avenue', 'Pittsburgh', 'PA', '15217', sysdate);

