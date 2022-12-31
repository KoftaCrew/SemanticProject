(defclass Course_Work
	(is-a USER)
	(role concrete))

(defclass NamedClass
	(is-a USER)
	(role concrete)
	(slot Iname
		(type STRING)
		(create-accessor read-write)))

(defclass Course
	(is-a NamedClass)
	(role concrete)
	(multislot have_lecturehall
		(type INSTANCE)
		(create-accessor read-write))
	(slot capacity
		(type INTEGER)
		(create-accessor read-write))
	(multislot have_labroom
		(type INSTANCE)
		(create-accessor read-write))
	(multislot have_exam
		(type INSTANCE)
		(create-accessor read-write))
	(multislot has_coursework
		(type INSTANCE)
		(create-accessor read-write))
	(multislot course_of_department
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Department
	(is-a NamedClass)
	(role concrete)
	(multislot department_of
		(type INSTANCE)
		(create-accessor read-write))
	(multislot have_course
		(type INSTANCE)
		(create-accessor read-write))
	(multislot have_staff
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Exam
	(is-a NamedClass)
	(role concrete))

(defclass Faculty
	(is-a NamedClass)
	(role concrete)
	(multislot have_program
		(type INSTANCE)
		(create-accessor read-write))
	(multislot have_department
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Lab_room
	(is-a NamedClass)
	(role concrete))

(defclass Lecture_hall
	(is-a NamedClass)
	(role concrete))

(defclass Library
	(is-a NamedClass)
	(role concrete))

(defclass Person
	(is-a NamedClass)
	(role concrete)
	(slot id
		(type STRING)
		(create-accessor read-write)))

(defclass Academic_Staff
	(is-a Person)
	(role concrete)
	(multislot staff_of
		(type INSTANCE)
		(create-accessor read-write))
	(slot salary
		(type INTEGER)
		(create-accessor read-write))
	(multislot teaches
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Lecturer
	(is-a Academic_Staff)
	(role concrete))

(defclass TA
	(is-a Academic_Staff)
	(role concrete)
	(multislot have_thesis
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Student
	(is-a Person)
	(role concrete)
	(multislot enrolled_in
		(type INSTANCE)
		(create-accessor read-write))
	(multislot student_of
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Program
	(is-a NamedClass)
	(role concrete)
	(multislot program_of
		(type INSTANCE)
		(create-accessor read-write))
	(multislot have_students
		(type INSTANCE)
		(create-accessor read-write)))

(defclass Thesis
	(is-a NamedClass)
	(role concrete))

(defclass University
	(is-a NamedClass)
	(role concrete)
	(multislot have_faculty
		(type INSTANCE)
		(create-accessor read-write))
	(slot address
		(type STRING)
		(create-accessor read-write)))
