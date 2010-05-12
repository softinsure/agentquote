drop database if exists myquote_development;
create database myquote_development;
drop database if exists myquote_test;
create database myquote_test;
drop database if exists myquote_production;
create database myquote_production;
GRANT ALL PRIVILEGES ON myquote_development.* TO 'myquote'@'localhost'
IDENTIFIED BY 'Dr3amPr0j3ct' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON myquote_test.* TO 'myquote'@'localhost'
IDENTIFIED BY 'Dr3amPr0j3ct' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON myquote_production.* TO 'myquote'@'localhost'
IDENTIFIED BY 'Dr3amPr0j3ct' WITH GRANT OPTION;