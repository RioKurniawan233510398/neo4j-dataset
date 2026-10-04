-- academic_database.sql
-- Dummy source relational database untuk Pertemuan 4 Basis Data Graf

CREATE DATABASE IF NOT EXISTS academic_db;
USE academic_db;

CREATE TABLE program (
  program_id VARCHAR(10) PRIMARY KEY,
  program_name VARCHAR(100) NOT NULL,
  faculty VARCHAR(100)
);

CREATE TABLE student (
  student_id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(120),
  program_id VARCHAR(10),
  year INT,
  FOREIGN KEY (program_id) REFERENCES program(program_id)
);

CREATE TABLE course (
  course_id VARCHAR(10) PRIMARY KEY,
  course_name VARCHAR(120) NOT NULL,
  credits INT,
  category VARCHAR(40)
);

CREATE TABLE enrollment (
  student_id VARCHAR(10),
  course_id VARCHAR(10),
  semester VARCHAR(20),
  grade VARCHAR(5),
  attendance INT,
  PRIMARY KEY (student_id, course_id, semester),
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);

INSERT INTO program VALUES
('P001','Informatika','FTI'),
('P002','Sistem Informasi','FTI'),
('P003','Sains Data','FTI');

INSERT INTO student VALUES
('S001','Andi Nasution','andi@student.ac.id','P001',2024),
('S002','Rina Putri','rina@student.ac.id','P001',2024),
('S003','Budi Santoso','budi@student.ac.id','P002',2023),
('S004','Dina Maharani','dina@student.ac.id','P002',2024),
('S005','Fajar Ramadhan','fajar@student.ac.id','P003',2024),
('S006','Siti Aisyah','siti@student.ac.id','P001',2023);

INSERT INTO course VALUES
('C001','Basis Data Graf',3,'Core'),
('C002','Artificial Intelligence',3,'Core'),
('C003','Basis Data',3,'Core'),
('C004','Natural Language Processing',3,'Elective');

INSERT INTO enrollment VALUES
('S001','C001','2026-1','A',95),
('S001','C002','2026-1','A-',90),
('S002','C001','2026-1','B+',88),
('S003','C003','2026-1','A',92),
('S004','C001','2026-1','B',82),
('S005','C004','2026-1','A-',89),
('S006','C001','2026-1','B+',87),
('S006','C003','2026-1','A',94);
