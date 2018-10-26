
CREATE DATABASE IF NOT EXISTS customers;
use customers;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET = latin1;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` 
VALUES 
('ivana','{bcrypt}$2a$10$rl2WbypqGJDWThfl2QSUee4xMJRfj.3lzeooLAU9c9kAeMxHiSBYW',1),
('marko','{bcrypt}$2a$10$dbkZabwTckUQ4YZhSJam9.YfBbTcUPSfJMp8AIO3TX7yoxzLbsTve',1),
('zeljko','{bcrypt}$2a$10$Q61XVimPyknPmhv47KFyp.Nk8aUFW2WnMJ7FyVkq5cExrdHz7.6ZO',1);


DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authorities` 
VALUES 
('ivana','ROLE_MENADZER'),
('marko','ROLE_ZAPOSLENI'),
('zeljko','ROLE_ADMIN');







