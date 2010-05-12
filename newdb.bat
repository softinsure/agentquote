mysql -h localhost -u root -p <db\create.sql
call rake db:migrate
call rake db:fixtures:load