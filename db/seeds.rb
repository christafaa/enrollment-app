andrew = Student.create(name: "Florence Perez", username: "florence", password_digest: BCrypt::Password.create("perez"))
harry = Student.create(name: "Luis Potter", username: "luis", password_digest: BCrypt::Password.create("potter"))
chris_a = Student.create(name: "Herbert Robbins", username: "herbert", password_digest: BCrypt::Password.create("robbins"))
chris_t = Student.create(name: "Joanne Poole", username: "joanne", password_digest: BCrypt::Password.create("poole"))
ryan = Student.create(name: "Ernestine Holmes", username: "ernestine", password_digest: BCrypt::Password.create("holmes"))
alex = Student.create(name: "Alberto Bradley", username: "alberto", password_digest: BCrypt::Password.create("bradley"))

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
asian_studies = Course.create(subject: "Asian Studies", day: "Tuesday")

music.teacher = ferg
music.save
math.teacher = dar
math.save
reading.teacher = dar
reading.save
writing.teacher = dar
writing.save
film.teacher = george
film.save
theater.teacher = george
theater.save
asian_studies.teacher = col
asian_studies.save
