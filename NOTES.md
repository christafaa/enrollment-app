Teachers:
A teacher has many klasses
———
A teacher has a name (string)
A teacher has an alma mater (string)
A teacher has years of experience (integer)
A teacher can create/edit their klasses
A teacher can create/edit their teacher profile
 
Klasses:
A klass belongs to a teacher
A klass has many klass_students
A klass has many students through klass_students ———
A klass has a subject (string)
A klass has a day of the week (string)
A klass has a teacher_id (integer)
 
Klass_students:
A klass_student belongs to a klass 
A klass_student belongs to a student
———
A klass_student has a klass_id (integer)
A klass_student has a student_id (integer)
 
Students:
A student has many klass_students
A student has many klasses through klass_students
———
A student has a name (string)
A student can sign up for a klass but cannot edit a klass
A student can create/edit their student profile
 
How does all of this look to you? Should I rethink anything or go full speed ahead? 
