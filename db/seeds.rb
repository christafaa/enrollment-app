andrew = Student.create(name: "Andrew DiMola")
harry = Student.create(name: "Harry Lee")
chris_a = Student.create(name: "Chris Alberti")
chris_t = Student.create(name: "Chris Talarico")
ryan = Student.create(name: "Ryan Tarabocchia")
alex = Student.create(name: "Alex Ludewig")

ro = Teacher.create(name: "Mr. Ro", alma_mater: "Rutgers", years_experience: 5)
sherry = Teacher.create(name: "Ms. Sherry", alma_mater: "Harvard", years_experience: 2)
housley = Teacher.create(name: "Mr. Housley", alma_mater: "NVOT", years_experience: 8)
harding = Teacher.create(name: "Mr. Hanson-Harding", alma_mater: "Princeton", years_experience: 20)

music = Course.create(subject: "Music", day: "Monday")
math = Course.create(subject: "Math", day: "Tuesday")
reading = Course.create(subject: "Reading", day: "Wednesday")
writing = Course.create(subject: "Writing", day: "Thursday")
film = Course.create(subject: "Film", day: "Friday")
theater = Course.create(subject: "Theater", day: "Monday")
asian_studies = Course.create(subject: "Asian Studies", day: "Tuesday")

music.teacher = ro
music.save
math.teacher = sherry
math.save
reading.teacher = sherry
reading.save
writing.teacher = sherry
writing.save
film.teacher = housley
film.save
theater.teacher = housley
theater.save
asian_studies.teacher = harding
asian_studies.save
