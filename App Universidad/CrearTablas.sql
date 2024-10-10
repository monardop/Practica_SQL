USE master
GO
CREATE DATABASE University;

GO
USE University;

GO
CREATE SCHEMA computer_engineering;
GO
CREATE TABLE [University].[computer_engineering].[career_branch]
(
	id INT NOT NULL IDENTITY,
	branch_description VARCHAR(70) NOT NULL,
	CONSTRAINT PK_ID_Branch PRIMARY KEY(id)
);

CREATE TABLE [University].[computer_engineering].[course_State]
(
	id INT NOT NULL IDENTITY,
	state_name VARCHAR(20) NOT NULL,
	CONSTRAINT PK_id_course_state PRIMARY KEY(id)
);

CREATE TABLE [University].[computer_engineering].[course]
(
	code INT NOT NULL,
	course_name VARCHAR(100) NOT NULL,
	id_branch INT NOT NULL,
	id_state INT NOT NULL,
	career_year TINYINT NOT NULL,
	CONSTRAINT PK_course_code 
			PRIMARY KEY(code),
	CONSTRAINT FK_course_state FOREIGN KEY (id_state) 
			REFERENCES [University].[computer_engineering].[course_State](id),
	CONSTRAINT FK_course_branch FOREIGN KEY(id_branch) 
			REFERENCES [University].[computer_engineering].[career_branch](id)
);

CREATE TABLE [University].[computer_engineering].[prerequisite_course]
(
	course_code INT NOT NULL,
	prerequisite_code INT NOT NULL,
	CONSTRAINT PK_prerequisite 
			PRIMARY KEY(course_code, prerequisite_code),
	CONSTRAINT FK_course FOREIGN KEY (course_code) 
			REFERENCES  [University].[computer_engineering].[course](code),
	CONSTRAINT FK_prerequisite FOREIGN KEY (prerequisite_code)
			REFERENCES  [University].[computer_engineering].[course](code)
);

CREATE TABLE [University].[computer_engineering].[Origin]
(
	id INT IDENTITY,
	origin_type VARCHAR(60) NOT NULL
		CONSTRAINT PK_Origin PRIMARY KEY(id)
);

CREATE TABLE [University].[computer_engineering].[Users] 
(
	id INT IDENTITY,
	name CHAR(30),
	email VARCHAR(100),
	password_hash VARCHAR(255),
	CONSTRAINT PK_id_users PRIMARY KEY(id)
);

CREATE TABLE [University].[computer_engineering].[Academic_History]
(
	id INT IDENTITY,
	log_date date NOT NULL,
	course_cod INT NOT NULL,
	mark INT,
	origin_id INT NOT NULL,
	id_user INT,
	CONSTRAINT PK_Academic_History PRIMARY KEY(id),
	CONSTRAINT FK_Origin 
			FOREIGN KEY (origin_id) 
			REFERENCES [University].[computer_engineering].[Origin](id),
	CONSTRAINT FK_Course_History 
			FOREIGN KEY (course_cod) 
			REFERENCES [University].[computer_engineering].[course](code),
	CONSTRAINT FK_User 
		FOREIGN KEY (id_user) 
		REFERENCES [University].[computer_engineering].[Users](id)  
);
GO