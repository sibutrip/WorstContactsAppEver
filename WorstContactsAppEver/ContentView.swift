//
//  ContentView.swift
//  WorstContactsAppEver
//
//  Created by Cory Tripathy on 2/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var contacts = Contact.contacts.sorted()
    @State var isShowingContactCard = false
    @State var selectedContact: Contact = Contact.contacts[0]
    @State var searchText = String()
    var searchResults: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter {
                $0.fullName.contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List(searchResults, id: \.self) { contact in
                HStack {
                    Button {
                        self.selectedContact = contact
                        isShowingContactCard = true
                    } label: {
                        HStack(spacing: 5) {
                            Text(contact.firstName)
                                .font(.system(size: 18, weight: .bold, design: .default))
                            Text(contact.lastName)
                                .font(.system(size: 18, weight: .regular, design: .default))
                        }
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        contacts.removeAll {
                            $0 == contact
                        }
                    } label: {
                        Image(systemName: "trash")
                        
                    }
                }
                .listRowBackground(Color.clear)
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $isShowingContactCard) {
                ContactCardView(contact: $selectedContact)
            }
            .navigationTitle("Contacts")
            .toolbarBackground(Material.ultraThin, for: .navigationBar)
            .toolbarBackground(Material.ultraThin, for: .tabBar)
            .searchable(text: $searchText)
            .background {
                Color.BackgroundBlue
                    .ignoresSafeArea()
            }
        }
    }
}

struct ContactsViewList_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDisplayName("Light Mode")
        ContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark Mode")
        ContentView()
            .environment(\._colorSchemeContrast, .increased)
            .previewDisplayName("Light Mode High Contrast")
        ContentView()
            .preferredColorScheme(.dark)
            .environment(\._colorSchemeContrast, .increased)
            .previewDisplayName("Dark Mode High Contrast")
        ContentView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            .previewDisplayName("Dynamic Type: Font Size Extra Extra Extra Large")
        ContentView()
            .environment(\._accessibilityReduceMotion, true)
            .previewDisplayName("Reduce Motion")
    }
}
