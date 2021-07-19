//
//  File.swift
//  FrantsuzanYS_HW2.3
//
//  Created by emmisar on 18.07.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    let photo: String
    
    static func getUserInfo() -> User {
        User(
                login: "User",
                password: "Password",
                person: Person(
                    surname: "Французан",
                    name: "Юлия",
                    age: 28,
                    hardSkills: HardSkills(
                        education: "Инженер-системотехник",
                        degree: "Магистр",
                        profession: "1С-разработчик",
                        workExperience: 5),
                    personalInfo: PersonalInfo(
                        familyStatus: "замужем",
                        havingСhildren: 1,
                        dream: "Стать хорошим ios-developer")),
                photo: "myPhoto")
    }

}

struct Person {
    let surname: String
    let name: String
    let age: Int
    let hardSkills: HardSkills
    let personalInfo: PersonalInfo
}

struct HardSkills {
    let education: String
    let degree: String
    let profession: String
    let workExperience: Int
}

struct PersonalInfo {
    let familyStatus: String
    let havingСhildren: Int
    let dream: String
}
