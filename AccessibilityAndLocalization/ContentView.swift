//
//  ContentView.swift
//  AccessibilityAndLocalization
//
//  Created by Cory Tripathy on 2/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var contacts: [Contact]
    @State var favoritedContacts: [Contact]
    
    init(contacts: [Contact]) {
        self.contacts = contacts
        favoritedContacts = contacts.filter {
            $0.isFavorited
        }
    }
    var body: some View {
        TabView {
            ContactsView(contacts: $contacts, style: .normal)
                .tabItem {
                    Image(systemName: "person.3.sequence.fill")
                }
            ContactsView(contacts: $favoritedContacts, style: .favorites)
                .tabItem {
                    Image(systemName: "star.fill")

                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contacts: Contact.contacts.sorted())
    }
}
