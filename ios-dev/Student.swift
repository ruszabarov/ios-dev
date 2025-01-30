//
//  Student.swift
//  ios-dev
//
//  Created by Ruslan Zabarov on 1/21/25.
//

import Foundation

class Student : Describeable {
    let firstName: String
    let lastName: String
    private var age: Int?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    public func setAge(_ age:Int) {
        self.age = age
    }
    
    func getDescription() -> String {
        return firstName + " " + lastName
    }
}

protocol Describeable {
    func getDescription() -> String
}

struct SimpleStudent : Describeable {
    let firstName: String
    let lastName: String
    private var age:Int?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func getDescription() -> String {
        return firstName
    }
}

