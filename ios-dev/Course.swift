import Foundation

class Course {
    let name: String
    let numCredits: Int
    var instructor: String?
    var students: [Student] = []
    var averageGrade: Double?
    
    init(name: String, numCredits: Int, instructor: String? = nil) {
        self.name = name
        self.numCredits = numCredits
        self.instructor = instructor
    }
    
    public func addStudent(_ student: Student) {
        self.students.append(student)
    }

}
