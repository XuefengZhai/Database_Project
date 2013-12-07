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

delete from application_user;
insert into application_user(username, password, password_recovery_question, password_recovery_answer, email)
	values ('Katarina Shaw', 'password123', 'What is the name of your pet?', 'Charlie', 'katarina@email.com');
insert into application_user(username, password, password_recovery_question, password_recovery_answer, email)
	values ('Lyz Knight', 'Sparkles!?!', 'What is your best friends name from high school?', 'Betsey', 'lyz@email.com');
insert into application_user(username, password, password_recovery_question, password_recovery_answer, email)
	values ('Larry Parker', '00muscles!&', 'What city were you born in?', 'Kansas City', 'larry@email.com');
insert into application_user(username, password, password_recovery_question, password_recovery_answer, email)
	values ('John Thompson', 'trtetegr', 'What city were you born in?', 'Milwaukee', 'john@email.com');
insert into application_user(username, password, password_recovery_question, password_recovery_answer, email)
	values ('Lea Ligon', 'fyf76vjhh', 'What is the name of your pet?', 'Jingles', 'lea@email.com');
insert into application_user(username, password, password_recovery_question, password_recovery_answer, email)
	values ('Elisa Applegate', 'kljlj865', 'What city were you born in?', 'Houston', 'elisa@email.com');
insert into application_user(username, password, password_recovery_question, password_recovery_answer, email)
	values ('Molly North', 'fedsgds', 'What city were you born in?', 'Portland', 'molly@email.com');

delete from employee;
insert into employee(first_name, last_name, home_phone, street, city, state, zipcode, start_date)
	values ('Carson', 'Peterson', '414-344-6873', '768 Highland Avenue', 'Pittsburgh', 'PA', '15210', TO_DATE('27-OCT-13'));
insert into employee(first_name, last_name, home_phone, street, city, state, zipcode, start_date, app_user_id) 
	values ('Katarina', 'Shaw', '414-324-3815', '5626 Wilkins Avenue', 'Pittsburgh', 'PA', '15217', TO_DATE('27-OCT-00'), (select app_user_id from application_user where username like 'Katarina Shaw'));
insert into employee(first_name, last_name, home_phone, cell_phone, street, city, state, zipcode, start_date, app_user_id) 
	values ('Lyz', 'Knight', '412-545-5443', '412-875-3213', '123 Park Avenue', 'Cranberry', 'PA', '15214', TO_DATE('06-JAN-01'), (select app_user_id from application_user where username like 'Lyz Knight'));
insert into employee(first_name, last_name, home_phone, work_phone, street, city, state, zipcode, start_date, end_date, app_user_id) 
	values ('Larry', 'Parker', '412-875-4323', '412-753-2332', '4562 Hempstead Road', 'Pittsburgh', 'PA', '15214', TO_DATE('12-NOV-12'), TO_DATE('13-FEB-13'), (select app_user_id from application_user where username like 'Larry Parker'));
insert into employee(first_name, last_name, home_phone, cell_phone, street, city, state, zipcode, start_date) 
	values ('Tom', 'Patterson', '412-345-2222', '412-345-1234', '445 Capitol Dr.', 'Cranberry', 'PA', '15214', TO_DATE('06-MAR-11'));
insert into employee(first_name, last_name, home_phone, cell_phone, street, city, state, zipcode, start_date) 
	values ('James', 'Smiley', '412-345-6572', '412-243-3664', '402 Lincoln Dr.', 'Pittsburgh', 'PA', '15214', TO_DATE('14-OCT-03'));
insert into employee(first_name, last_name, home_phone, cell_phone, street, city, state, zipcode, start_date) 
	values ('Elliot', 'Vinn', '412-450-4325', '412-375-6544', '2400 Main St.', 'Pittsburgh', 'PA', '15214', TO_DATE('06-JUN-10'));
insert into employee(first_name, last_name, home_phone, cell_phone, street, city, state, zipcode, start_date, app_user_id) 
	values ('John', 'Thompson', '413-233-5362', '412-341-5434', '600 Capitol Dr.', 'Cranberry', 'PA', '15214', TO_DATE('06-JAN-11'), (select app_user_id from application_user where username like 'John Thompson'));
insert into employee(first_name, last_name, home_phone, cell_phone, street, city, state, zipcode, start_date) 
	values ('Jim', 'Roberts', '412-452-4335', '412-575-6524', '420 Jameston Dr.', 'Milwaukee', 'WI', '15214', TO_DATE('06-JUN-10'));

delete from sales_agent;
insert into sales_agent(title, license_number, employee_id)
	values ('Senior Sales Consultant','897859', (select employee_id from employee where first_name like 'Katarina' and last_name like 'Shaw'));
insert into sales_agent(title, license_number, employee_id)
	values ('Partner Sales Consultant','545354', (select employee_id from employee where first_name like 'Lyz' and last_name like 'Knight'));

delete from construction_worker;
insert into construction_worker(employee_id, skill_one, skill_two)
	values ((select employee_id from employee where first_name like 'Carson' and last_name like 'Peterson'), 'Plumbing', 'Electricity');
insert into construction_worker(employee_id, skill_one, skill_two)
	values ((select employee_id from employee where first_name like 'Larry' and last_name like 'Parker'), 'Masonry', 'Plumbing');
insert into construction_worker(employee_id, skill_one)
	values ((select employee_id from employee where first_name like 'Tom' and last_name like 'Patterson'), 'Masonry');
insert into construction_worker(employee_id, skill_one)
	values ((select employee_id from employee where first_name like 'James' and last_name like 'Smiley'), 'Masonry');
insert into construction_worker(employee_id, skill_one, skill_two, skill_three)
	values ((select employee_id from employee where first_name like 'Eliot' and last_name like 'Vinn'), 'Plumbing', 'Electricity', 'Masonry');
insert into construction_worker(employee_id, skill_one)
	values ((select employee_id from employee where first_name like 'John' and last_name like 'Thompson'), 'Masonry');
insert into construction_worker(employee_id, skill_one)
	values ((select employee_id from employee where first_name like 'Jim' and last_name like 'Roberts'), 'Plumbing');

delete from crew_manager;
insert into crew_manager(start_date, employee_id)
	values (TO_DATE('14-OCT-03'), (select employee_id from employee where first_name like 'James' and last_name like 'Smiley'));
insert into crew_manager(start_date, employee_id)
	values (TO_DATE('06-JUN-10'), (select employee_id from employee where first_name like 'Jim' and last_name like 'Roberts'));

delete from crew;
insert into crew(crew_manager_employee_id)
	values ((select employee_id from employee where first_name like 'James' and last_name like 'Smiley'));
insert into crew(crew_manager_employee_id)
	values ((select employee_id from employee where first_name like 'Jim' and last_name like 'Roberts'));

delete from construction_worker_crew;
insert into construction_worker_crew(start_date, crew_id, constr_worker_employee_id)
	values (TO_DATE('27-OCT-13'), (select c.crew_id from crew c, construction_worker cw, employee e where c.crew_manager_employee_id = cw.employee_id and cw.employee_id = e.employee_id and e.first_name like 'Jim' and e.last_name like 'Roberts'),
	(select e.employee_id from employee e where e.first_name like 'Carson' and e.last_name like 'Peterson' ));
insert into construction_worker_crew(start_date, crew_id, constr_worker_employee_id)
	values (TO_DATE('02-JAN-13'), (select c.crew_id from crew c, construction_worker cw, employee e where c.crew_manager_employee_id = cw.employee_id and cw.employee_id = e.employee_id and e.first_name like 'Jim' and e.last_name like 'Roberts'),
	(select e.employee_id from employee e where e.first_name like 'Jim' and e.last_name like 'Roberts' ));
insert into construction_worker_crew(start_date, crew_id, constr_worker_employee_id)
	values (TO_DATE('12-NOV-12'), (select c.crew_id from crew c, construction_worker cw, employee e where c.crew_manager_employee_id = cw.employee_id and cw.employee_id = e.employee_id and e.first_name like 'James' and e.last_name like 'Smiley'),
	(select e.employee_id from employee e where e.first_name like 'Larry' and e.last_name like 'Parker' ));
insert into construction_worker_crew(start_date, crew_id, constr_worker_employee_id)
	values (TO_DATE('12-NOV-12'), (select c.crew_id from crew c, construction_worker cw, employee e where c.crew_manager_employee_id = cw.employee_id and cw.employee_id = e.employee_id and e.first_name like 'James' and e.last_name like 'Smiley'),
	(select e.employee_id from employee e where e.first_name like 'Tom' and e.last_name like 'Patterson' ));
insert into construction_worker_crew(start_date, crew_id, constr_worker_employee_id)
	values (TO_DATE('12-NOV-12'), (select c.crew_id from crew c, construction_worker cw, employee e where c.crew_manager_employee_id = cw.employee_id and cw.employee_id = e.employee_id and e.first_name like 'James' and e.last_name like 'Smiley'),
	(select e.employee_id from employee e where e.first_name like 'James' and e.last_name like 'Smiley' ));
insert into construction_worker_crew(start_date, crew_id, constr_worker_employee_id)
	values (TO_DATE('12-NOV-12'), (select c.crew_id from crew c, construction_worker cw, employee e where c.crew_manager_employee_id = cw.employee_id and cw.employee_id = e.employee_id and e.first_name like 'James' and e.last_name like 'Smiley'),
	(select e.employee_id from employee e where e.first_name like 'Elliot' and e.last_name like 'Vinn' ));
insert into construction_worker_crew(start_date, crew_id, constr_worker_employee_id)
	values (TO_DATE('12-NOV-12'), (select c.crew_id from crew c, construction_worker cw, employee e where c.crew_manager_employee_id = cw.employee_id and cw.employee_id = e.employee_id and e.first_name like 'James' and e.last_name like 'Smiley'),
	(select e.employee_id from employee e where e.first_name like 'John' and e.last_name like 'Thompson' ));

delete from subdivision_agreement;
insert into subdivision_agreement(start_date, description, subdivision_id)
	values (TO_DATE('12-NOV-12'), 'Subdivision agreement last modified on November 12, 2012 for the Bluffs', (select subdivision_id from subdivision where name like 'The Bluffs') );
insert into subdivision_agreement(start_date, end_date, description, subdivision_id)
	values (TO_DATE('01-JUN-11'), TO_DATE('12-NOV-12'), 'Created June 1, 2011 for The Bluffs', (select subdivision_id from subdivision where name like 'The Bluffs') );
insert into subdivision_agreement(start_date, description, subdivision_id)
	values (TO_DATE('12-JUN-12'), 'Agreement for Riverview', (select subdivision_id from subdivision where name like 'Riverview') );
insert into subdivision_agreement(start_date, description, subdivision_id)
	values (TO_DATE('14-OCT-13'), 'Updated October 2013', (select subdivision_id from subdivision where name like 'The Lofts') );
insert into subdivision_agreement(start_date, subdivision_id)
	values (TO_DATE('10-NOV-13'), (select subdivision_id from subdivision where name like 'Harrington') );
insert into subdivision_agreement(start_date, description, subdivision_id)
	values (TO_DATE('09-JAN-11'), 'Subdivision agreement last modified on January', (select subdivision_id from subdivision where name like 'Cork Factory') );
insert into subdivision_agreement(start_date, subdivision_id)
	values (TO_DATE('19-AUG-12'), (select subdivision_id from subdivision where name like 'Cork Factory') );

delete from lot;
insert into lot(premium, street, subdivision_id)
	values (41356.78, '134 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (31356.00, '136 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (36466.78, '138 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (41356.78, '135 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (31356.00, '137 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (36466.78, '139 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));

insert into lot(premium, street, subdivision_id)
	values (41356.78, '134 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (31356.00, '136 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (36466.78, '138 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (41356.78, '135 Weston Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (31356.00, '137 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));
insert into lot(premium, street, subdivision_id)
	values (36466.78, '139 Walborn Street', (select subdivision_id from subdivision where name like 'Cork Factory'));

insert into lot(premium, street, subdivision_id)
	values (13000.00, '4556 Charleston Street', (select subdivision_id from subdivision where name like 'The Bluffs'));
insert into lot(premium, street, subdivision_id)
	values (12000.00, '4555 Charleston Street', (select subdivision_id from subdivision where name like 'The Bluffs'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '4554 Charleston Street', (select subdivision_id from subdivision where name like 'The Bluffs'));
insert into lot(premium, street, subdivision_id)
	values (12300.00, '4553 Charleston Street', (select subdivision_id from subdivision where name like 'The Bluffs'));
insert into lot(premium, street, subdivision_id)
	values (11500.00, '4552 Charleston Street', (select subdivision_id from subdivision where name like 'The Bluffs'));
insert into lot(premium, street, subdivision_id)
	values (12350.00, '4551 Charleston Street', (select subdivision_id from subdivision where name like 'The Bluffs'));

insert into lot(premium, street, subdivision_id)
	values (13000.00, '121 W. North Street', (select subdivision_id from subdivision where name like 'Riverview'));
insert into lot(premium, street, subdivision_id)
	values (12000.00, '122 W. North Street', (select subdivision_id from subdivision where name like 'Riverview'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '123 W. North Street', (select subdivision_id from subdivision where name like 'Riverview'));

insert into lot(premium, street, subdivision_id)
	values (13000.00, '134 Water Ave.', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (13000.00, '135 Water Ave.', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (13000.00, '136 Water Ave.', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (13000.00, '137 Water Ave.', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '235 Westminster Street', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '234 Westminster Street', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '236 Westminster Street', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '233 Westminster Street', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '232 Westminster Street', (select subdivision_id from subdivision where name like 'The Lofts'));
insert into lot(premium, street, subdivision_id)
	values (10000.00, '237 Westminster Street', (select subdivision_id from subdivision where name like 'The Lofts'));

delete from Style;
insert into style(name, base_price)
	values ('Craftsman', 89000.00);
insert into style(name, base_price)
	values ('Victorian', 100000.00);
insert into style(name, base_price)
	values ('Bungalow', 99000.00);
insert into style(name, base_price)
	values ('Queen Anne', 120000.00);
insert into style(name, base_price)
	values ('Split-level', 79000.00);

delete from elevation;
insert into elevation(type, description, additional_cost)
	values ('A', 'This is the standard.', 0.00);
insert into elevation(type, additional_cost)
	values ('B', 4000.00);
insert into elevation(type, description, additional_cost)
	values ('C', 'This is the platinum level with the best available materials.', 8000.00);

delete from style_elevation;
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Craftsman'),(select elevation_id from elevation where type like 'A'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Craftsman'),(select elevation_id from elevation where type like 'B'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Craftsman'),(select elevation_id from elevation where type like 'C'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Victorian'),(select elevation_id from elevation where type like 'A'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Victorian'),(select elevation_id from elevation where type like 'B'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Bungalow'),(select elevation_id from elevation where type like 'A'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Bungalow'),(select elevation_id from elevation where type like 'C'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Queen Anne'),(select elevation_id from elevation where type like 'A'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Queen Anne'),(select elevation_id from elevation where type like 'C'));
insert into style_elevation(style_id, elevation_id)
	values ((select style_id from style where name like 'Split-level'),(select elevation_id from elevation where type like 'A'));

delete from subdivision_allowable_style;
insert into subdivision_allowable_style(subdivision_id, style_id)
	values ((select subdivision_id from subdivision where name like 'The Bluffs'),(select style_id from style where name like 'Victorian'));
insert into subdivision_allowable_style(subdivision_id, style_id)
	values ((select subdivision_id from subdivision where name like 'Riverview'),(select style_id from style where name like 'Craftsman'));
insert into subdivision_allowable_style(subdivision_id, style_id)
	values ((select subdivision_id from subdivision where name like 'The Lofts'),(select style_id from style where name like 'Victorian'));
insert into subdivision_allowable_style(subdivision_id, style_id)
	values ((select subdivision_id from subdivision where name like 'Cork Factory'),(select style_id from style where name like 'Bungalow'));
insert into subdivision_allowable_style(subdivision_id, style_id)
	values ((select subdivision_id from subdivision where name like 'Harrington'),(select style_id from style where name like 'Queen Anne'));


delete from house_layout;
insert into house_layout(name, description)
	values ('Five bedroom, Garage', 'Five bedrooms with the master on the main floor. An attached garage.');
insert into house_layout(name, description)
	values ('Three bedroom upstairs', 'Three bedrooms with all bedrooms on the top floors.');

delete from house;
insert into house(escrow_amount, is_reversed, financing_info, house_layout_id)
	values (67885.60, 'N', 'Financing from US Bank', (select house_layout_id from house_layout where name like 'Five bedroom, Garage'));
insert into house(house_layout_id)
	values ((select house_layout_id from house_layout where name like 'Three bedroom upstairs'));

update lot
	set house_id = (select house_id from house where financing_info like 'Financing from US Bank')
	where street like '121 W. North Street';

delete from room;
insert into room(room_type, ceiling_type, description)
	values ('Foyer', 'tall cathedral', 'An option for a tall entranceway.'); 
insert into room(room_type, ceiling_type, description)
	values ('Living Room', 'vaulted', 'An option for a vaulted livingroom.'); 
insert into room(room_type, description)
	values ('Living Room', 'A standard livingroom.'); 
insert into room(room_type)
	values ('Kitchen');
insert into room(room_type)
	values ('Bathroom');
insert into room(room_type, ceiling_type)
	values ('Attic', 'vaulted');
insert into room(room_type)
	values ('Bedroom');
insert into room(room_type)
	values ('Laundry Room');

delete from customer;
insert into customer(first_name, last_name, phone_number, mortgage_info, app_user_id)
	values ('Elisa', 'Applegate', '412-657-9809', 'PNC Bank owns the mortgage', 
		(select app_user_id from application_user where username like 'Elisa Applegate'));
insert into customer(first_name, last_name, app_user_id)
	values ('Lea', 'Ligon', (select app_user_id from application_user where username like 'Lea Ligon'));

delete from disclosure_form;
insert into disclosure_form(start_date, end_date, description)
	values (TO_DATE('01-JAN-11'), TO_DATE('12-NOV-12'), 'Original Disclosure Form');
insert into disclosure_form(start_date, end_date, description)
	values (TO_DATE('12-NOV-12'), TO_DATE('15-JUN-13'), 'Disclosure form updated with parking information');
insert into disclosure_form(start_date, description)
	values (TO_DATE('15-JUN-13'), 'Disclosure form updated with construction liability');


delete from contract;
insert into contract(submitted_date, time_limit_date, is_terminated, disclosure_form_id, subdivision_agreement_id, house_id)
	values (TO_DATE('05-JUN-13'), TO_DATE('05-JUN-14'), 'N',
	(select disclosure_form_id from disclosure_form where start_date = TO_DATE('15-JUN-13')),
	(select subdivision_agreement_id from subdivision_agreement sa where sa.subdivision_id = (select subdivision_id from subdivision where name like 'Riverview') and end_date is null),
	(select house_id from lot where street like '121 W. North Street'));
insert into contract(submitted_date, time_limit_date, is_terminated, disclosure_form_id, subdivision_agreement_id, house_id)
	values (TO_DATE('05-FEB-11'), TO_DATE('05-FEB-12'), 'Y',
	(select disclosure_form_id from disclosure_form where start_date = TO_DATE('01-JAN-11')),
	(select subdivision_agreement_id from subdivision_agreement sa where sa.subdivision_id = (select subdivision_id from subdivision where name like 'Riverview') and end_date is null),
	(select house_id from lot where street like '121 W. North Street'));

delete from customer_contract;
insert into customer_contract(customer_id, contract_id)
	values ((select customer_id from customer where first_name like 'Elisa' and last_name like 'Applegate'),
	(select contract_id from contract where submitted_date = TO_DATE('05-JUN-13')));
insert into customer_contract(customer_id, contract_id)
	values ((select customer_id from customer where first_name like 'Lea' and last_name like 'Ligon'),
	(select contract_id from contract where submitted_date = TO_DATE('05-FEB-11')));

delete from floor;
insert into floor(description, house_id)
	values ('first floor', (select house_id from lot where street like '121 W. North Street'));
insert into floor(description, house_id)
	values ('basement', (select house_id from lot where street like '121 W. North Street'));
insert into floor(description, house_id)
	values ('second floor', (select house_id from lot where street like '121 W. North Street'));

delete from room_on_a_floor;
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '121 W. North Street') and description = 'first floor'), 
	(select room_id from room where room_type like 'Kitchen'), '20X14', 3);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '121 W. North Street') and description = 'first floor'), 
	(select room_id from room where room_type like 'Bathroom'), '20X14', 1);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '121 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '12X12', 2); 
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '121 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '14X12', 3);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '121 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '16X16', 5); 
insert into room_on_a_floor(floor_id, room_id)
	values ((select floor_id from floor where house_id = (select house_id from lot where street like '121 W. North Street') and description = 'second floor'),
	(select room_id from room where room_type like 'Bathroom'));


delete from house_sales_agent;
insert into house_sales_agent(start_date, end_date, is_main_sales_agent, sales_agent_employee_id, house_id)
	values (TO_DATE('01-JAN-11'), TO_DATE('05-MAR-11'), 'N', 
		(select employee_id from sales_agent where license_number like '897859'),
		(select house_id from lot where street like '121 W. North Street'));
insert into house_sales_agent(start_date, is_main_sales_agent, sales_agent_employee_id, house_id)
	values (TO_DATE('01-DEC-12'), 'Y', 
		(select employee_id from sales_agent where license_number like '545354'),
		(select house_id from lot where street like '121 W. North Street'));


delete from project_manager;
insert into project_manager(employee_id, start_date)
	values ((select employee_id from employee where first_name like 'Jim' and last_name like 'Roberts'), TO_DATE('10-NOV-10'));


delete from sale;
insert into sale(escrow_paid, financing_option, house_id, employee_id)
	values ('Y', 'mortgage', (select house_id from lot where street like '121 W. North Street'), 
		(select employee_id from sales_agent where license_number like '897859'));


delete from construction_project;
insert into construction_project(start_date, estimated_end_date, project_manager_employee_id, crew_id, house_id)
	values (TO_DATE('05-FEB-11'), TO_DATE('05-OCT-12'), 
		(select e.employee_id from project_manager pm, employee e where first_name like 'Jim' and last_name like 'Roberts'),
		(select crew_id from crew where crew_manager_employee_id = (select employee_id from employee where first_name like 'James' and last_name like 'Smiley')),
		(select house_id from lot where street like '121 W. North Street'));


delete from stage;
insert into stage(stage_number, description)
	values ('1', 'Permits, prepare land and pour foundation');
insert into stage(stage_number, description)
	values ('2', 'Build frame, roof, insulation');
insert into stage(stage_number, description)
	values ('3', 'Pipes, electricial, wiring');
insert into stage(stage_number, description)
	values ('4', 'Intall windows, exterior');
insert into stage(stage_number, description)
	values ('5', 'Water, heating, inspection');
insert into stage(stage_number, description)
	values ('6', 'Install flooring, built-ins');
insert into stage(stage_number, description)
	values ('7', 'Paint and install pictures. Landscaping.');


delete from option_choice;
insert into option_choice(option_category, description, price, last_allowed_stage_id)
	values ('Fixture', 'Nickel-finish bathroom fixtures', 456.67,
	(select stage_id from stage where stage_number = '7'));

insert into option_choice(option_category, description, price, last_allowed_stage_id)
	values ('Wall Texture', 'Plaster art', 4356.43, 
	(select stage_id from stage where stage_number = '3'));


delete from construction_project_stage;
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('05-JUN-13'), TO_DATE('15-JUN-13'), TO_DATE('15-JUN-13'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number = '1'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('16-JUN-13'), TO_DATE('25-JUL-13'), TO_DATE('26-JUL-13'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '2'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('26-JUL-13'), TO_DATE('11-DEC-13'), TO_DATE('12-DEC-13'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '3'));
insert into construction_project_stage(start_date, estimated_end_date, construction_project_id, stage_id)
	values (TO_DATE('12-DEC-13'), TO_DATE('04-FEB-14'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '4'));

delete from selected_stage_option;
insert into selected_stage_option(selected_date, option_choice_id, construction_project_stage_id)
	values (TO_DATE('15-FEB-12'),
		(select option_choice_id from option_choice where option_category like 'Fixture' and description like 
			'Nickel-finish bathroom fixtures'),
		(select construction_project_stage_id from construction_project_stage cs
			where cs.start_date = TO_DATE('12-DEC-13'))
		);
insert into selected_stage_option(selected_date, option_choice_id, construction_project_stage_id)
	values (TO_DATE('16-FEB-12'),
		(select option_choice_id from option_choice where option_category like 'Wall Texture' and description like 
			'Plaster art'),
		(select construction_project_stage_id from construction_project_stage cs, stage s
			where cs.start_date = TO_DATE('14-DEC-13'))
		);

delete from task;
insert into task(name, selected_stage_option_id)
	values ('install fixture', 
		(select selected_stage_option_id from selected_stage_option where selected_date = TO_DATE('14-FEB-12')));
insert into task(name, selected_stage_option_id)
	values ('plaster art installation', 
		(select selected_stage_option_id from selected_stage_option where selected_date = TO_DATE('15-FEB-12')));

delete from task_update;
insert into task_update(update_date, percent_complete, comments, employee_id, task_id)
	values(TO_DATE('16-FEB-12'), 100, 'Installed the fixture.', 
		(select e.employee_id from project_manager pm, employee e where e.first_name like 'Jim' and e.last_name like 'Roberts'),
		(select task_id from task where name like 'install fixture'));
insert into task_update(update_date, percent_complete, comments, employee_id, task_id)
	values(TO_DATE('16-FEB-12'), 50, 'Purchase the fixture.', 
		(select e.employee_id from project_manager pm, employee e where e.first_name like 'Jim' and e.last_name like 'Roberts'),
		(select task_id from task where name like 'install fixture'));


--house 2, completed today

insert into house(escrow_amount, is_reversed, financing_info, house_layout_id)
	values (89885.60, 'N', 'Financing from PNC Bank', (select house_layout_id from house_layout where name like 'Five bedroom, Garage'));
insert into house(house_layout_id)
	values ((select house_layout_id from house_layout where name like 'Five bedroom, Garage'));

update lot
	set house_id = (select house_id from house where financing_info like 'Financing from PNC Bank')
	where street like '122 W. North Street';

insert into customer(first_name, last_name, phone_number, mortgage_info, app_user_id)
	values ('Molly', 'North', '412-137-9809', 'American Bank owns this mortgage', 
		(select app_user_id from application_user where username like 'Molly North'));

insert into contract(submitted_date, time_limit_date, is_terminated, disclosure_form_id, subdivision_agreement_id, house_id)
	values (TO_DATE('06-JUN-12'), TO_DATE('15-JAN-14'), 'N',
	(select disclosure_form_id from disclosure_form where start_date = TO_DATE('12-NOV-12')),
	(select subdivision_agreement_id from subdivision_agreement sa where sa.subdivision_id = (select subdivision_id from subdivision where name like 'Riverview') and end_date is null),
	(select house_id from lot where street like '122 W. North Street'));

insert into customer_contract(customer_id, contract_id)
	values ((select customer_id from customer where first_name like 'Molly' and last_name like 'North'),
	(select contract_id from contract where submitted_date = TO_DATE('05-JUN-12')));

insert into floor(description, house_id)
	values ('first floor', (select house_id from lot where street like '122 W. North Street'));
insert into floor(description, house_id)
	values ('basement', (select house_id from lot where street like '122 W. North Street'));
insert into floor(description, house_id)
	values ('second floor', (select house_id from lot where street like '122 W. North Street'));

insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'first floor'), 
	(select room_id from room where room_type like 'Kitchen'), '20X14', 3);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'first floor'), 
	(select room_id from room where room_type like 'Bathroom'), '20X14', 1);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '12X12', 2); 
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '14X12', 3);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '14X12', 3);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '14X12', 3);
insert into room_on_a_floor(floor_id, room_id, room_size, num_windows)
	values((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'second floor'), 
	(select room_id from room where room_type like 'Bedroom'), '16X16', 5); 
insert into room_on_a_floor(floor_id, room_id)
	values ((select floor_id from floor where house_id = (select house_id from lot where street like '122 W. North Street') and description = 'second floor'),
	(select room_id from room where room_type like 'Bathroom'));


insert into house_sales_agent(start_date, is_main_sales_agent, sales_agent_employee_id, house_id)
	values (TO_DATE('05-JUN-12'), 'Y', 
		(select employee_id from sales_agent where license_number like '545354'),
		(select house_id from lot where street like '122 W. North Street'));


insert into sale(escrow_paid, financing_option, house_id, employee_id)
	values ('Y', 'mortgage', (select house_id from lot where street like '122 W. North Street'), 
		(select employee_id from sales_agent where license_number like '897859'));


insert into construction_project(start_date, estimated_end_date, end_date, project_manager_employee_id, crew_id, house_id)
	values (TO_DATE('15-JUN-12'), TO_DATE('31-DEC-13'), Sysdate,
		(select e.employee_id from project_manager pm, employee e where first_name like 'Jim' and last_name like 'Roberts'),
		(select crew_id from crew where crew_manager_employee_id = (select employee_id from employee where first_name like 'James' and last_name like 'Smiley')),
		(select house_id from lot where street like '122 W. North Street'));

insert into option_choice(option_category, description, price, last_allowed_stage_id)
	values ('Fixture', 'Nickel-finish kitchen fixtures', 356.67,
	(select stage_id from stage where stage_number = '7'));

insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('05-FEB-11'), TO_DATE('15-FEB-11'), TO_DATE('15-FEB-11'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number = '1'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('16-FEB-11'), TO_DATE('25-JUL-11'), TO_DATE('26-JUL-11'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '2'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('26-JUL-11'), TO_DATE('11-DEC-11'), TO_DATE('12-DEC-11'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '3'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('12-DEC-11'), TO_DATE('04-FEB-12'), TO_DATE('04-FEB-12'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '4'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('05-FEB-12'), TO_DATE('04-JUN-12'), TO_DATE('10-JUN-12'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '5'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('10-JUN-12'), TO_DATE('20-JUL-12'), TO_DATE('21-JUL-12'),
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '6'));
insert into construction_project_stage(start_date, estimated_end_date, end_date, construction_project_id, stage_id)
	values (TO_DATE('21-JUL-12'), TO_DATE('05-AUG-12'), sysdate,
	(select construction_project_id from construction_project where start_date = TO_DATE('05-FEB-11')),
	(select stage_id from stage where stage_number like '7'));

insert into selected_stage_option(selected_date, option_choice_id, construction_project_stage_id)
	values (TO_DATE('17-JUL-12'),
		(select option_choice_id from option_choice where option_category like 'Fixture' and description like 
			'Nickel-finish kitchen fixtures'),
		(select construction_project_stage_id from construction_project_stage cs
			where cs.start_date = TO_DATE('10-JUN-12'))
		);

insert into task(name, selected_stage_option_id)
	values ('install kitchen fixture', 
		(select selected_stage_option_id from selected_stage_option where selected_date = TO_DATE('17-JUL-12')));

insert into task_update(update_date, percent_complete, comments, employee_id, task_id)
	values(TO_DATE('15-JUL-12'), 100, 'Installed the fixture.', 
		(select e.employee_id from project_manager pm, employee e where e.first_name like 'Jim' and e.last_name like 'Roberts'),
		(select task_id from task where name like 'install kitchen fixture'));

insert into task_update(update_date, percent_complete, comments, employee_id, task_id)
	values(TO_DATE('14-JUL-12'), 50, 'Purchase the fixture.', 
		(select e.employee_id from project_manager pm, employee e where e.first_name like 'Jim' and e.last_name like 'Roberts'),
		(select task_id from task where name like 'install kitchen fixture'));