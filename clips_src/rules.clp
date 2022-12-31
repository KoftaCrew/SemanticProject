(defrule run-query1 "Get all TAs belonging to a department."
    (query1 ?department)
    (object (name ?ta) (is-a TA) (staff_of ?department))
    =>
    (printout t "TA " ?ta " is staff of " ?department  crlf)
)

(defrule remove-query1
    (declare(salience -1))
    ?q <- (query1 ?department)
    =>
    (retract ?q)
)

(defrule run-query2 "Get the courses a student is currently studying."
    ?q <- (query2 ?student)
    (object (name ?student) (is-a Student) (enrolled_in $?courses))
    =>
    (printout t "Student " ?student " is enrolled in " ?courses crlf)
    (retract ?q)
)

(defrule run-query3 "Get all the courses offered by a certain faculty."
    (query3 ?faculty)
    (object (name ?faculty) (is-a Faculty) (have_department $? ?department $?))
    (object (name ?course) (is-a Course) (course_of_department ?department))
    =>
    (printout t "Faculty " ?faculty " offers " ?course crlf)
)

(defrule remove-query3
    (declare(salience -1))
    ?q <- (query3 ?faculty)
    =>
    (retract ?q)
)

(defrule run-query4 "Get Lecturers of a faculty."
    (query4 ?faculty)
    (object (name ?lecturer) (is-a Lecturer) (staff_of ?department))
    (object (name ?faculty) (is-a Faculty) (have_department $? ?department $?))
    =>
    (printout t "Faculty " ?faculty " has lecturer " ?lecturer crlf)
)

(defrule remove-query4
    (declare(salience -1))
    ?q <- (query4 ?faculty)
    =>
    (retract ?q)
)

(defrule run-query5 "Get all faculties of a university."
    ?q <- (query5 ?university)
    (object (name ?university) (is-a University) (have_faculty $?faculty))
    =>
    (printout t "University " ?university " has faculties " ?faculty crlf)
    (retract ?q)
)
