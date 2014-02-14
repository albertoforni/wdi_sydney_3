-- INSERT INTO courses (name) VALUES ('course 1');
-- INSERT INTO courses (name) VALUES ('course 2');
-- INSERT INTO courses (name) VALUES ('course 3');
-- INSERT INTO subjects (name,course_id) VALUES ('subject 1', 1);
-- INSERT INTO subjects (name,course_id) VALUES ('subject 2', 1);
-- INSERT INTO subjects (name,course_id) VALUES ('subject 3', 2);
-- INSERT INTO subjects (name,course_id) VALUES ('subject 4', 2);
-- INSERT INTO subjects (name,course_id) VALUES ('subject 5', 3);
-- INSERT INTO subjects (name,course_id) VALUES ('subject 6', 3);
-- INSERT INTO students (given_name,family_name,course_id) VALUES ('A','A',1);
-- INSERT INTO students (given_name,family_name,course_id) VALUES ('B','B',1);
-- INSERT INTO students (given_name,family_name,course_id) VALUES ('C','C',2);
-- INSERT INTO students (given_name,family_name,course_id) VALUES ('D','D',2);
-- INSERT INTO students (given_name,family_name,course_id) VALUES ('E','E',NULL);
-- INSERT INTO results (value,student_id,subject_id) VALUES (75,1,1);
-- INSERT INTO results (value,student_id,subject_id) VALUES (80,1,2);
-- INSERT INTO results (value,student_id,subject_id) VALUES (95,2,1);
-- INSERT INTO results (value,student_id,subject_id) VALUES (60,2,2);
-- INSERT INTO results (value,student_id,subject_id) VALUES (50,3,3);
-- INSERT INTO results (value,student_id,subject_id) VALUES (45,3,4);
-- INSERT INTO results (value,student_id,subject_id) VALUES (70,4,3);
-- INSERT INTO results (value,student_id,subject_id) VALUES (95,4,4);

-- Now try and figure out how would you pull out:
--   1 a list of students and their course name

SELECT students.given_name, courses.name
FROM students
JOIN courses
ON students.course_id = courses.id;

-- 2 the set of courses that don't have any students

SELECT courses.name
FROM students
RIGHT JOIN courses
ON students.course_id = courses.id
WHERE students.given_name IS null;

-- 3 a list of students and their subjects that they are enrolled in -ordered
--   by student names then by subject-name
--   eg: 
-- id | given_name | family_name |  name    
-- ----+------------+-------------+-----------
--   1 | A          | A          | subject 1
--   1 | A          | A          | subject 2
--   2 | B          | B          | subject 1
--   2 | B          | B          | subject 2
--   3 | C          | C          | subject 3
--   3 | C          | C          | subject 4
--   4 | D          | D          | subject 3
--   4 | D          | D          | subject 4

SELECT students.given_name, subjects.name
FROM students
INNER JOIN courses
ON students.course_id = courses.id
INNER JOIN subjects
ON courses.id = subjects.course_id
ORDER BY students.given_name,subjects.name ;

-- 4 a list of subjects that have any student enrolled in them
--   name    
-- -----------
-- subject 1
-- subject 2
-- subject 3
-- subject 4

SELECT DISTINCT subjects.name
FROM subjects
INNER JOIN courses
ON subjects.course_id = courses.id
INNER JOIN students
ON courses.id = students.course_id
ORDER BY subjects.name ASC;

-- 5 the complete set of results for all students (include the subject names and student name) order it by the student's best results first
-- id | given_name | family_name |  name    | value 
-- ----+------------+-------------+-----------+-------
--   1 | A          | A          | subject 2 |    80
--   1 | A          | A          | subject 1 |    75
--   2 | B          | B          | subject 1 |    95
--   2 | B          | B          | subject 2 |    60
--   3 | C          | C          | subject 3 |    50
--   3 | C          | C          | subject 4 |    45
--   4 | D          | D          | subject 4 |    95
--   4 | D          | D          | subject 3 |    70

SELECT students.given_name, subjects.name, results.value
FROM results
INNER JOIN students
ON results.student_id = students.id
INNER JOIN subjects
ON results.subject_id = subjects.id
ORDER BY students.given_name ASC,results.value DESC;

-- 6 the top ten results overall (hint: google "SQL LIMIT") and the name of
--   the student that acheived it
-- value | family_name | given_name 
-- -------+-------------+------------
--     95 | D          | D
--     95 | B          | B
--     80 | A          | A
--     75 | A          | A
--     70 | D          | D
--     60 | B          | B
--     50 | C          | C
--     45 | C          | C

SELECT results.value, students.given_name 
FROM results
INNER JOIN students
ON results.student_id = students.id
ORDER BY results.value DESC
LIMIT 10;