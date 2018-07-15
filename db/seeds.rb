florence = Student.create(name: "Florence Perez", username: "florence", password_digest: BCrypt::Password.create("perez"))
luis = Student.create(name: "Luis Potter", username: "luis", password_digest: BCrypt::Password.create("potter"))
herbert = Student.create(name: "Herbert Robbins", username: "herbert", password_digest: BCrypt::Password.create("robbins"))
joanne = Student.create(name: "Joanne Poole", username: "joanne", password_digest: BCrypt::Password.create("poole"))
ernestine = Student.create(name: "Ernestine Holmes", username: "ernestine", password_digest: BCrypt::Password.create("holmes"))
alberto = Student.create(name: "Alberto Bradley", username: "alberto", password_digest: BCrypt::Password.create("bradley"))

ferg = Teacher.create(name: "Ms. Ferguson", alma_mater: "Flatiron School", years_experience: 5, username: "ferguson", password_digest: BCrypt::Password.create("password1"))
dar = Teacher.create(name: "Dr. Darren", alma_mater: "Harvard", years_experience: 2, username: "darren", password_digest: BCrypt::Password.create("password2"))
george = Teacher.create(name: "Mrs. George", alma_mater: "Yale", years_experience: 8, username: "george", password_digest: BCrypt::Password.create("password3"))
col = Teacher.create(name: "Mr. Collier", alma_mater: "Princeton", years_experience: 20, username: "collier", password_digest: BCrypt::Password.create("password4"))

music = Course.create(subject: "Music", day: "Monday")
math = Course.create(subject: "Math", day: "Tuesday")
reading = Course.create(subject: "Reading", day: "Wednesday")
writing = Course.create(subject: "Writing", day: "Thursday")
film = Course.create(subject: "Film", day: "Friday")
theater = Course.create(subject: "Theater", day: "Monday")

music.teacher = george
music.students += [florence, joanne, alberto]
music.save

math.teacher = ferg
math.students += [florence, luis, herbert, joanne, ernestine, alberto]
math.save

reading.teacher = george
reading.students += [florence, luis, herbert, joanne, ernestine, alberto]
reading.save

writing.teacher = col
writing.students += [florence, luis, herbert, joanne, ernestine, alberto]
writing.save

film.teacher = dar
film.students += [herbert, ernestine, alberto]
film.save

theater.teacher = george
theater.students += [florence, joanne, alberto]
theater.save
