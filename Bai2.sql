CREATE DATABASE UniversityDB;

CREATE SCHEMA university;

CREATE TABLE university.Students (
                                     student_id SERIAL PRIMARY KEY,
                                     first_name VARCHAR(50) NOT NULL,
                                     last_name VARCHAR(50) NOT NULL,
                                     birth_date DATE,
                                     email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE university.Courses (
                                    course_id SERIAL PRIMARY KEY,
                                    course_name VARCHAR(100) NOT NULL,
                                    credits INT
);

CREATE TABLE university.Enrollments (
                                        enrollment_id SERIAL PRIMARY KEY,
                                        student_id INT NOT NULL REFERENCES university.Students(student_id),
                                        course_id INT NOT NULL REFERENCES university.Courses(course_id),
                                        enroll_date DATE
);

SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'students';

SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'courses';

SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'enrollments';