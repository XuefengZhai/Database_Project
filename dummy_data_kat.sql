delete from School_district;
insert into School_district(name) values ('Pittsburgh');
insert into School_district(name) values ('Cranberry');
insert into School_district(name) values ('Harrisburg');
insert into School_district(name) values ('Milwaukee');
insert into School_district(name) values ('Waukesha');

delete from school;
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Pittsburgh'), 'Rufus King High School');
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Milwaukee'), 'Congress Elementary');
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Harrisburg'), 'Lincoln High School');
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Pittsburgh'), 'Washington West Middle School');
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Harrisburg'), 'Rufus King High School');
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Waukesha'), 'Lincoln Elementary School');
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Pittsburgh'), 'Obama Middle School');
insert into School(school_district_id, name) values ((select school_district_id from School_district where name like 'Pittsburgh'), 'St. John Upper School');

delete from subdivision;
insert into subdivision(school_district_id, name, city, state, zipcode) values ((select school_district_id from School_district where name like 'Pittsburgh'), 'The Bluffs', 'Pittsburgh', 'PA', '15217');
insert into subdivision(school_district_id, name, city, state, zipcode) values ((select school_district_id from School_district where name like 'Cranberry'), 'Riverview', 'Cranberry', 'PA', '17897');
insert into subdivision(school_district_id, name, city, state, zipcode) values ((select school_district_id from School_district where name like 'Milwaukee'), 'The Lofts', 'Milwaukee', 'WI', '53208');
insert into subdivision(school_district_id, name, city, state, zipcode) values ((select school_district_id from School_district where name like 'Waukesha'), 'Harrington', 'Waukesha', 'WI', '53222');
insert into subdivision(school_district_id, name, city, state, zipcode) values ((select school_district_id from School_district where name like 'Milwaukee'), 'Cork Factory', 'Pittsburgh', 'PA', '15222');

delete from elevation;
insert into elevation(type, description, additional_cost) values ('A', 'Standard elevation.', 0);
insert into elevation(type, description, additional_cost) values ('B', 'Silver elevation with upgrade from siding to stone.', 6735.50);
insert into elevation(type, description, additional_cost) values ('C', 'Gold elevation with upgrade from siding to store with premium windows and finishes.', 12056.00);

insert into employee(first_name, last_name, home_phone_number, street_address, city, state, zip_code, start_date) 
	values ('Katarina', 'Shaw', '414-324-3815', '5626 Wilkins Avenue', 'Pittsburgh', 'PA', '15217', sysdate);

