-- Code For Creating Table Name User

CREATE TABLE users (
ID INT NOT NULL AUTO_INCREMENT,
email VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
password VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
type VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
active TINYINT default 1,
PRIMARY KEY (ID)
);

DELIMITER $$
CREATE PROCEDURE addUser (IN newEmail VARCHAR(255), IN newPassword VARCHAR(255), IN newType VARCHAR(255))
BEGIN
INSERT INTO users (email, password, type) VALUES (newEmail, newPassword, newType);
END$$
DELIMITER ;

--  a new user with the email 'example@email.com', password 'password' and type 'admin' will be added to the users table.
CALL addUser('example@email.com', 'password', 'admin');

