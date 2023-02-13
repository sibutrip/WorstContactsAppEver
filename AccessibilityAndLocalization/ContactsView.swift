//
//  ContactsView.swift
//  AccessibilityAndLocalization
//
//  Created by Cory Tripathy on 2/9/23.
//

import SwiftUI

struct ContactsView: View {
    @Binding var contacts: [Contact]
    @State var isShowingContactCard = false
    @State var selectedContact: Contact = Contact.contacts[0]
    @State var searchText = String()
    let style: ContactsViewStyle
    var searchResults: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter {
                $0.fullName.contains(searchText)
            }
        }
    }
    #warning("add photos for smart invert")
    var body: some View {
        NavigationView {
            List(searchResults, id: \.self) { contact in
                Button {
                    self.selectedContact = contact
                    isShowingContactCard = true
                } label: {
                    HStack(spacing: 5) {
                        Text(contact.firstName)
                            .bold()
                        Text(contact.lastName)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            //
                        } label: {
                            Label("ah", systemImage: "star.fill")
                                .tint(.yellow)
                        }
                    }
                }.listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $isShowingContactCard) {
                ContactCardView(contact: $selectedContact)
            }
            .navigationTitle(style.rawValue)
            .toolbarBackground(Material.ultraThin, for: .navigationBar)
            .toolbarBackground(Material.ultraThin, for: .tabBar)
            .searchable(text: $searchText)
            .background {
                LinearGradient(colors: [.blue,.indigo], startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
            }
        }
    }
}

struct ContactsViewDummy: View {
    @State var contacts = Contact.contacts.sorted()
    var body: some View {
        ContactsView(contacts: $contacts, style: .normal)
    }
}

struct ContactsViewList_Previews: PreviewProvider {
    static var previews: some View {
        ContactsViewDummy()
    }
}
