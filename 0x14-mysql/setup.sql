CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbt';
GRANT REPLICATION SLAVE ON *.* TO 'holberton_user'@'localhost';
CREATE DATABASE tyrell_corp;
USE tyrell_corp;
CREATE TABLE nexus6 (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255));
INSERT INTO nexus6 (name) VALUES ("AZZAZ");
GRANT SELECT ON tyrell_corp.* TO 'holberton_user'@'localhost';
CREATE USER 'replica_user'@'18.210.17.11' IDENTIFIED BY 'replica_user';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'replica_user'@'18.210.17.11';
GRANT SELECT ON mysql.user TO 'holberton_user'@'localhost';
CREATE USER web02@18.210.17.11 IDENTIFIED BY "web02";
GRANT REPLICATION SLAVE ON *.* TO 'web02'@18.210.17.11;

#solving errors in slave server:
CREATE USER 'replica_user'@'%' IDENTIFIED By 'replica_password';
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
FLUSH PRIVILEGES;
STOP SLAVE;
START SLAVE;
SHOW SLAVE STATUS\G;
