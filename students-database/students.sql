CREATE DATABASE students;
CREATE TABLE students();
CREATE TABLE majors();
CREATE TABLE courses();
CREATE TABLE majors_courses();
ALTER TABLE students ADD COLUMN student_id SERIAL;
ALTER TABLE students ADD PRIMARY KEY (student_id);
ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN major_id INT;
ALTER TABLE students ADD COLUMN gpa NUMERIC(2,1);
ALTER TABLE majors ADD COLUMN major_id SERIAL;
ALTER TABLE majors ADD PRIMARY KEY (major_id);
ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;
ALTER TABLE students ADD FOREIGN KEY (major_id) REFERENCES majors(major_id);
ALTER TABLE courses ADD COLUMN course_id SERIAL;
ALTER TABLE courses ADD PRIMARY KEY(course_id);
ALTER TABLE courses ADD COLUMN course VARCHAR(100) NOT NULL;
ALTER TABLE majors_courses ADD COLUMN major_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
ALTER TABLE majors_courses ADD COLUMN course_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);
ALTER TABLE majors_courses ADD PRIMARY KEY(major_id, course_id);