(definstances individuals
	([AI_dep] of Department
		(Iname "Artificial Intelligence Department"))

	([AI_prog] of Program
		(Iname "Artificial Intelligence Program"))

	([Business_dep] of Department
		(Iname "Business"))

	([Cairo_Uni] of University
		(have_faculty
			[Commerce]
			[FCAI])
		(Iname "Cairo University"))

	([Commerce] of Faculty
		(have_department [Business_dep])
		(Iname "Faculty of Commerce"))

	([Course_1] of Course
		(course_of_department [CS_dep])
		(Iname "Semantic Web"))

	([Course_2] of Course
		(course_of_department [CS_dep])
		(Iname "Data Structures"))

	([Course_3] of Course
		(course_of_department [IS_dep])
		(Iname "File Systems"))

	([Course_business] of Course
		(course_of_department [Business_dep])
		(Iname "Finanical decision"))

	([Course_General] of Course
		(course_of_department [IT_dep])
		(Iname "Electronics"))

	([CS_dep] of Department
		(Iname "Computer Science Department"))

	([CS_prog] of Program
		(Iname "Computer Science Program"))

	([DS_dep] of Department
		(Iname "Decision Support Department"))

	([DS_prog] of Program
		(Iname "Decision Support Program"))

	([FCAI] of Faculty
		(have_department
			[AI_dep]
			[CS_dep]
			[DS_dep]
			[IS_dep]
			[IT_dep])
		(have_program
			[AI_prog]
			[CS_prog]
			[DS_prog]
			[IS_prog]
			[IT_prog]
			[general_prog])
		(Iname "Faculty of Computers And Artificial Intelligence"))

	([general_prog] of Program
		(Iname "General Program"))

	([IS_dep] of Department
		(Iname "Information System Department"))

	([IS_prog] of Program
		(Iname "Information System Program"))

	([IT_dep] of Department
		(Iname "Information Technology Department"))

	([IT_prog] of Program
		(Iname "Information Technology Program"))

	([Lecturer_1] of Lecturer
		(Iname "Abeer Korany")
		(staff_of [CS_dep])
		(teaches [Course_1]))

	([Lecturer_2] of Lecturer
		(Iname "Ahmed Morsy")
		(staff_of [CS_dep])
		(teaches
			[Course_2]
			[Course_General]))

	([Lecturer_3] of Lecturer
		(Iname "Khaled Mostafa")
		(staff_of [IS_dep])
		(teaches [Course_3]))

	([Student_1] of Student
		(enrolled_in
			[Course_1]
			[Course_2])
		(Iname "Mohamed Ashraf")
		(student_of [CS_prog]))

	([Student_2] of Student
		(enrolled_in
			[Course_1]
			[Course_3])
		(Iname "Abdo Ashraf")
		(student_of [IT_prog]))

	([Student_3] of Student
		(enrolled_in
			[Course_1]
			[Course_2])
		(Iname "Mostafa Hany")
		(student_of [DS_prog]))

	([TA1] of TA
		(Iname "Mostafa")
		(staff_of [IS_dep])
		(teaches [Course_3]))

	([TA2] of TA
		(Iname "Kareem")
		(staff_of [CS_dep])
		(teaches [Course_1]))

	([TA3] of TA
		(Iname "David")
		(staff_of [CS_dep])
		(teaches [Course_2]))
)