USE master
GO

CREATE DATABASE University;

GO
USE University;

GO
CREATE TABLE [career_branch]
(
	id 					INT 		NOT NULL 	IDENTITY,
	branch_description 	VARCHAR(70) NOT NULL,
	CONSTRAINT PK_ID_Branch 
		PRIMARY KEY(id)
);

GO
CREATE TABLE [course_State]
(
	id 			INT 		NOT NULL IDENTITY,
	state_name 	VARCHAR(20) NOT NULL,
	CONSTRAINT PK_id_course_state 
		PRIMARY KEY(id)
);

GO
CREATE TABLE [course]
(
	code 		INT 			NOT NULL,
	course_name VARCHAR(100) 	NOT NULL,
	id_branch 	INT 			NOT NULL,
	id_state 	INT 			NOT NULL,
	career_year TINYINT 		NOT NULL,
	mark 		INT,
	available	BIT 			DEFAULT 0,
	CONSTRAINT PK_course_code 
			PRIMARY KEY(code),
	CONSTRAINT FK_course_state FOREIGN KEY (id_state) 
			REFERENCES [course_State](id),
	CONSTRAINT FK_course_branch FOREIGN KEY(id_branch) 
			REFERENCES [career_branch](id)
);

GO
CREATE TABLE [prerequisite_course]
(
	course_code 		INT		NOT NULL,
	prerequisite_code 	INT 	NOT NULL,
	CONSTRAINT PK_prerequisite 
			PRIMARY KEY(course_code, prerequisite_code),
	CONSTRAINT FK_course FOREIGN KEY (course_code) 
			REFERENCES  [course](code),
	CONSTRAINT FK_prerequisite FOREIGN KEY (prerequisite_code)
			REFERENCES  [course](code)
);

GO
CREATE TABLE [Origin]
(
	id 			INT 		IDENTITY,
	origin_type VARCHAR(60) NOT NULL
	CONSTRAINT PK_Origin 
		PRIMARY KEY(id)
);

GO
CREATE TABLE [Academic_History]
(
	id 			INT 	IDENTITY,
	log_date 	DATE 	NOT NULL,
	course_cod 	INT 	NOT NULL,
	mark 		INT,
	origin_id 	INT 	NOT NULL,
	CONSTRAINT PK_Academic_History 
		PRIMARY KEY(id),
	CONSTRAINT FK_Origin 
		FOREIGN KEY (origin_id) 
		REFERENCES [Origin](id),
	CONSTRAINT FK_Course_History 
		FOREIGN KEY (course_cod) 
		REFERENCES [course](code)
);


GO 
CREATE PROCEDURE setearCorrelatividades
AS
	UPDATE course