	import UIKit

// Question 1 :-
    

    //  a.
        let maxStudents = 30;

    // b.
        var currentNumberOfStudents = 0

    // c.
        var studentName = ""
        var studentAge = 0
        var studentGrade = ""

    // d.
        var mathScore = 85
        var scienceScore = 90
        var englishScore = 88
    


// Question 2 :-

    // Calculating total scores and average scores of three subjects
        func calculateScores() -> (totalScore: Int, averageScore: Double) {
            let totalScore = mathScore + scienceScore + englishScore
            let averageScore = Double(totalScore) / 3.0
            return (totalScore, averageScore)
        }
        calculateScores()



// Question 3 :-



    // a. Create an array to hold the names of all the students in the class (studentNames)
        var studentNames = [String]()

    // b. Write a function addStudent to add a name to the array and increment the number of students
        func addStudent(name: String) {
            studentNames.append(name)
            currentNumberOfStudents += 1
        }

    // c. Add names of at least five students using this function
        addStudent(name: "Darshan")
        addStudent(name: "Keval")
        addStudent(name: "Sakshi")
        addStudent(name: "Nikhil")
        addStudent(name: "Yajurva")



// Question 4 :-


    // a. Use a for loop in three different ways to print the names of all the students in the array.
       
        // 1st way -->
            print("1st way :-")
            for i in 0..<studentNames.count {
                print("         \(studentNames[i])")
            }


        // 2nd way -->
            print("\n2nd way :-")
            for name in studentNames {
                print("         \(name)")
            }

        // 3rd way -->
            print("\n3rd way :-")
            for(index, name) in studentNames.enumerated()  {
                print("         \(name) is on index \(index)")
            }

    // b. Use a for loop to print the names of all the students in reverse order
            print("\nNames in reverse order:")
            for i in (0..<studentNames.count).reversed() {
                print("                     \(studentNames[i])")
            }
    


// Question 5 :-


    // Check if the current number of students is less than the maximum allowed
            // currentNumberOfStudents = 30
            if currentNumberOfStudents < maxStudents {
                print("\nMore students can be added")
            } else {
                print("\nClass is full")
            }
    


// Question 6 :-
    

    // a. Create a variable for each of the 5 student's attendance percentage (attendancePercentage).
       
        var student1Atendance : Double
        var student2Atendance : Double
        var student3Atendance : Double
        var student4Atendance : Double
        var student5Atendance : Double

    // b. Assign values to each student

        student1Atendance = 90
        student2Atendance = 85
        student3Atendance = 100
        student4Atendance = 20
        student5Atendance = 35

    // c. Use a compound if-else statement to categorize attendance

        func categorizeAttendance(attendance: Double) -> String {
            if attendance >= 90 {
                return "Excellent"
            } else if attendance >= 75 {
                return "Good"
            } else if attendance >= 50 {
                return "Average"
            } else {
                return "Poor"
            }
        }

    // d. Print the result for each student

        print("\nAttendance of student 1 is \(categorizeAttendance(attendance: student1Atendance))")
        print("Attendance of student 2 is \(categorizeAttendance(attendance: student2Atendance))")
        print("Attendance of student 3 is \(categorizeAttendance(attendance: student3Atendance))")
        print("Attendance of student 4 is \(categorizeAttendance(attendance: student4Atendance))")
        print("Attendance of student 5 is \(categorizeAttendance(attendance: student5Atendance))\n")



// Question 7 :-



    // a. Usage of while loop to simulate adding students to the class until it is full.
            currentNumberOfStudents = 0
            while currentNumberOfStudents < maxStudents {
                addStudent(name: "New Student")
    
    // b. Incrementing the number and printing the current number of students after each addition.
                print("Total number of students after addition are : \(currentNumberOfStudents)")
            }

        if currentNumberOfStudents == maxStudents {
            print("Class is full.")
        }




// Question 8 :-






