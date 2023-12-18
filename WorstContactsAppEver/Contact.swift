//
//  Contact.swift
//  WorstContactsAppEver
//
//  Created by Cory Tripathy on 2/8/23.
//

import Foundation

struct Contact: Identifiable, Hashable {
    
    // MARK: - Properties
    let id = UUID()
    let firstName: String
    let lastName: String
    var fullName: String {
        self.firstName + self.lastName
    }
    var dateLastContacted = String()
    
    // MARK: - Initializer
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        dateLastContacted = createDate()
    }
    
    // MARK: - Properties
    private func createDate() -> String {
        /// create a random date from within the last 24 hours
        let randomTimeInterval = (Int.random(in: 1...1440) * -1) * 60
        let randomDate = Date().addingTimeInterval(TimeInterval(randomTimeInterval))
        let calendar = Calendar.current
        
        /// format the date to a string
        let year = calendar.component(.year, from: randomDate)
        let month = calendar.component(.month, from: randomDate)
        
        let day = calendar.component(.day, from: randomDate)
        var hour = calendar.component(.hour, from: randomDate) % 12
        if hour == 0 { hour = 12 }
        let amOrPm = {
            if calendar.component(.hour, from: randomDate) < 12 {
                return "AM"
            } else {
                return "PM"
            }
        }()
        
        let minute = calendar.component(.minute, from: randomDate)
        let formattedTime = "\(month)/\(day)/\(year) at \(hour):\(minute) \(amOrPm)"
        return formattedTime
    }
    
    public static let contacts: [Contact] = [
        .init(firstName: "Ty", lastName: "Lawrence"),
        .init(firstName: "Tom", lastName: "Phillips"),
        .init(firstName: "Zoe", lastName: "Cutler"),
        .init(firstName: "Kevin", lastName: "Marion"),
        .init(firstName: "Cory", lastName: "Tripathy"),
        .init(firstName: "Voe", lastName: "Morrell"),
        .init(firstName: "Marcus", lastName: "Westbrooks"),
        .init(firstName: "Tariq", lastName: "Williams"),
        .init(firstName: "Jackson", lastName: "Williams"),
        .init(firstName: "Anny", lastName: "Staten"),
        .init(firstName: "Alesha", lastName: "Duncan"),
        .init(firstName: "Alexia", lastName: "Henderson"),
        .init(firstName: "Telayne", lastName: "Keith"),
        .init(firstName: "Arlaya", lastName: "Worthen"),
        .init(firstName: "Sarah", lastName: "Gretter"),
        .init(firstName: "Hilary", lastName: "Srere"),
        .init(firstName: "Christine", lastName: "Yarzabek"),
        .init(firstName: "Joel", lastName: "Davies"),
        .init(firstName: "Shonda", lastName: "Jones"),
        .init(firstName: "Lilyan", lastName: "Talia"),
        .init(firstName: "Raven", lastName: "Scott"),
        .init(firstName: "Rhi", lastName: "Pleins"),
        .init(firstName: "Mike", lastName: "Goggins"),
        .init(firstName: "Theo", lastName: "Caldwell")
    ]
}

extension Contact: Comparable {
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.firstName < rhs.firstName
    }
}
