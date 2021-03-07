## Welcome To EduFI
### Welcome To EduFi the education portal of the future.

**Your tasks, if you decide to complete them are to:**
<li>Create a student transfer page that will transfer one student from one school to another. If the student has an enrollment display a message letting the user know the student cannot be moved because he or she has an active enrollment.</li>
<li>Run the controller tests and fix all the tests that are currently erroring.</li>
<li>Bonus one: feel free to refactor any code or architectural decision you think could be improved.</li>
<li>Bonus two: Integrate the Google Maps API, or any other MAP api to show a map of the School based on its location.</li>
<b>Good luck.</b>

**Notes:**
<b>Please work on this repo, committing your work. When complete please zip the repo back up and email it to jwindholtz@everfi.com</b>
<b>Preferrably try to complete this within 7 days of receipt.  Please don't spend more then 2 hours on this take home project.

## My Notes:

- [ ] Create a student transfer page that will transfer one student from one school to another.
- [ ] If the student has an enrollment display a message letting the user know the student cannot be moved because he or she has an active enrollment.
- [ ] Fix tests that are currently erroring

Plan:
Create a transfer object that belongs to both student and schools

The object has:
from_school (school_id)
to_school (school_id)
student (student_id)
eligible (boolean)

Story
Student 'John Noneligeble', is enrolled at school "Test School" and has an active enrollment.
Student 'Mary Eligible' is enrolled at school "Test School" and she doesn't have active enrollments.

1. A student goes to her show page where she finds link labelled "Transfer to a new school"
	1.a. Clicking on the "Transfer..." link redirects to new view for transfer
	1.b. Transfer new view has a form that includes:
		- Name
		- School of origin
		- Eligible to transfer?
		- Destination school
		- Cohort
		- Start date
		- End date
		- Submit 
	1.c. Clicking submit 
			- redirects to student show page if student eligible. Student can see new enrollment		
			- flash message error and rerenders page if student is not eligible. Student can see new enrollment		
