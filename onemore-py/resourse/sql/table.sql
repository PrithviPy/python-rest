CREATE DATABASE `ONEMORE_DB` /*!40100 DEFAULT CHARACTER SET UTF8MB4 COLLATE UTF8MB4_0900_AI_CI */ /*!80016 DEFAULT ENCRYPTION='N' */;


CREATE TABLE `users` (
  `id` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `workspace` (
  `id` varchar(10) NOT NULL,
  `workspace_name` varchar(150) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user`),
  CONSTRAINT `user_fk` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



------ SEQUENCE -------

CREATE TABLE USER_SEQ
(
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


DELIMITER $$
CREATE TRIGGER USER_TABLE_ID_INSERT
BEFORE INSERT ON USERS
FOR EACH ROW
BEGIN
  INSERT INTO USER_SEQ VALUES (NULL);
  SET NEW.ID = CONCAT('ONE_U', LPAD(LAST_INSERT_ID(), 3, '0'));
END$$
DELIMITER ;


CREATE TABLE WORKSPACE_SEQ
(
  ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


DELIMITER $$
CREATE TRIGGER WORKSPACE_TABLE_ID_INSERT
BEFORE INSERT ON WORKSPACE
FOR EACH ROW
BEGIN
  INSERT INTO WORKSPACE_SEQ VALUES (NULL);
  SET NEW.ID = CONCAT('ONE_WS', LPAD(LAST_INSERT_ID(), 3, '0'));
END$$
DELIMITER ;