CREATE DATABASE redmine CHARACTER SET utf8;
CREATE USER 'redmine'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON redmine.* TO 'redmine'@'%';

