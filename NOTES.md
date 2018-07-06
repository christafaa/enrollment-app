Teachers:
A teacher has many courses
———
A teacher has a name (string)
A teacher has an alma mater (string)
A teacher has years of experience (integer)
A teacher can create/edit their courses
A teacher can create/edit their teacher profile
 
Courses:
A course belongs to a teacher
A course has many enrollments
A course has many students through enrollments
 ———
A course has a subject (string)
A course has a day of the week (string)
A course has a teacher_id (integer)

Enrollment:
An enrollment belongs to a course
An enrollment belongs to a student
———
An enrollment has a course_id (integer)
An enrollment has a student_id (integer)
 
Students:
A student has many enrollments
A student has many courses through enrollments
———
A student has a name (string)
A student can sign up for a course but cannot edit a course
A student can create/edit their student profiles

To do:
- signup / login
- Menu at top (of courses and teachers) if logged in 
- write readme
