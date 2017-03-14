USE fileshare;
CREATE TABLE AUTHORIZED
(
    ID INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ADDRESS VARCHAR(50) NOT NULL
);
CREATE TABLE COURSES
(
    ID INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL,
    DEPARTMENT VARCHAR(50) NOT NULL
);
CREATE TABLE DEPARTMENT
(
    ID INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(50) NOT NULL
);
CREATE TABLE FILE
(
    ID INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FILENAME VARCHAR(100) NOT NULL,
    SIZE FLOAT NOT NULL,
    COURSE_ID INT(11) NOT NULL,
    TEACHER VARCHAR(30) NOT NULL,
    LOCATION VARCHAR(100) NOT NULL,
    DESCRIPTION VARCHAR(100),
    UPLOADDATE DATE NOT NULL
);

INSERT INTO fileshare.DEPARTMENT 
	(
	NAME
	)
	VALUES
	( 
	'电子信息工程学院'
	),
	( 
	'计算机与信息技术学院'
	),
	( 
	'经济管理学院'
	),
	( 
	'交通运输学院'
	),
	( 
	'土木建筑工程学院'
	),
	( 
	'机械与电子控制工程学院'
	),
	( 
	'电气工程学院'
	),
	( 
	'理学院'
	),
	( 
	'电子信息工程学院'
	),
	( 
	'马克思主义学院'
	),
	( 
	'软件学院'
	),
	( 
	'建筑与艺术学院'
	),
	( 
	'语言与传播学院'
	),
	( 
	'法学院'
	);

