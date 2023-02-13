//
//  AccessibilityAndLocalizationApp.swift
//  AccessibilityAndLocalization
//
//  Created by Cory Tripathy on 2/2/23.
//

import SwiftUI

@main
struct AccessibilityAndLocalizationApp: App {
    @State var contacts = Contact.contacts
    var body: some Scene {
        WindowGroup {
            ContentView(contacts: Contact.contacts.sorted())
//            ContactsView(contacts: $contacts, style: .normal)
        }
    }
}
