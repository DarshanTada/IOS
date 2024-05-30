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


        func calculateScores() -> (totalScore: Int, averageScore: Double) {
            let totalScore = mathScore + scienceScore + englishScore
            let averageScore = Double(totalScore) / 3.0
            return (totalScore, averageScore)
        }
        calculateScores()



// Question 3 :-



    // a.
        var studentNames = [String]()

    // b.
        func addStudent(name: String) {
            studentNames.append(name)
            currentNumberOfStudents += 1
        }

    // c.
        addStudent(name: "Darshan")
        addStudent(name: "Keval")
        addStudent(name: "Sakshi")
        addStudent(name: "Nikhil")
        addStudent(name: "Yajurva")



// Question 4 :-


    // a.
       
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

    // b.
            print("\nNames in reverse order:")
            for i in (0..<studentNames.count).reversed() {
                print("                     \(studentNames[i])")
            }
    


// Question 5 :-


    
            // currentNumberOfStudents = 30
            if currentNumberOfStudents < maxStudents {
                print("\nMore students can be added")
            } else {
                print("\nClass is full")
            }
    


// Question 6 :-
    

    // a.
       
        var student1Atendance : Double
        var student2Atendance : Double
        var student3Atendance : Double
        var student4Atendance : Double
        var student5Atendance : Double

    // b.

        student1Atendance = 90
        student2Atendance = 85
        student3Atendance = 100
        student4Atendance = 20
        student5Atendance = 35

    // c.

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



    // a.
            currentNumberOfStudents = 0
            while currentNumberOfStudents < maxStudents {
                addStudent(name: "New Student")
    
    // b.
                print("Total number of students after addition are : \(currentNumberOfStudents)")
            }

        if currentNumberOfStudents == maxStudents {
            print("Class is full.")
        }




// Question 8 :-

    
    
    // a.
        repeat {
            studentNames.removeLast()
            currentNumberOfStudents -= 1
    // b. Decrementing the number and printing the current number of students after each removal.
            print("Total number of students are \(currentNumberOfStudents)")
        }  while currentNumberOfStudents > 5
        
    

// Question 9 :-

    

        func checkStudentname(name: String) {
            guard !name.isEmpty else {
                print("\nError: Invalid student name!")
                return
            }
            print("\nValid student name")
        }
        
        checkStudentname(name: "")
        checkStudentname(name: "Darshan")




// Question 10 :-



        func checkMiddleName(middleName: String?) {
            
            guard let enteredName = middleName  else {
                    print("\nError: No middle name provided")
                    return
                }
                print("\nMiddle name is \(enteredName)")
        }

        checkMiddleName(middleName: nil)
        checkMiddleName(middleName: "dars")
        
        
// or
        
        func checkMiddleName2(fullName: String) {
            let splittedName = fullName.split(separator: " ")
            guard splittedName.count == 3 else {
                print("\nError: No middle name provided")
                return
            }
            print("\nMiddle name of \(fullName) is \(splittedName[1])")
        }
        
        checkMiddleName2(fullName: "")
        checkMiddleName2(fullName: "Darshan keval darsh")




// Question 11 :-



            enum Grade {
                case A
                case B
                case C
                case D
                case F
            }
            
            func calculateGrade(averageGrade: Double) -> Grade {
                switch averageGrade {
                case 90...100 :
                    return .A
                case 80..<90 :
                    return .B
                case 70..<80 :
                    return .C
                case 60..<70 :
                    return .D
                default :
                    return .F
                }
            }
            
            
            func printGrade(averageScore: Double) {
                let grade = calculateGrade(averageGrade: averageScore)
                print("The grade for an average score of \(averageScore) is \(grade).")
            }
            
            printGrade(averageScore: 92)
            printGrade(averageScore: 83)
            printGrade(averageScore: 72)
            printGrade(averageScore: 61)
            printGrade(averageScore: 59)
         


// Questions 12 :-




        let congratulate: (String, String) -> Void = { (name, grade) in
            if grade.lowercased() == "a" {
                print("Congratulations \(name)! You received an A!")
            }
        }
        
        congratulate("Darshan", "A")
        congratulate("Dars", "b")



// Question 13 :-


    // a and b is already defined from line number 236

    // c
        let students = [
            ("Darshan", 92.0),
            ("Keval", 85.0),
            ("Sakshi", 74.5),
            ("Nikhil", 65.0),
            ("Yajurva", 55.0)
        ]
        
        for (name, numericGrade) in students {
            let grade = calculateGrade(averageGrade: numericGrade)
            print("Student: \(name), Grade: \(grade)")
        }



// Question 14 :-


    // a:
        var studentNickname: String? = "Ally"
        
    // b.
        if let nickname = studentNickname {
            print("Nickname: \(nickname)")
        } else {
            print("No nickname")
        }
        
