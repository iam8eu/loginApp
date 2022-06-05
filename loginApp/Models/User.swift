//
//  User.swift
//  loginApp
//
//  Created by mac on 05.06.2022.
//

// import Foundation

struct User {
    let user: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            user: "User",
            password: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let hobby: String
    let emoji: Character
    
    static func getPerson() -> Person {
        Person(
            firstName: "Ivan",
            lastName: "Ivanov",
            hobby: "SwiftBook",
            emoji: "😎"
        )
    }
}


 
