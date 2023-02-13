//
//  ContactView.swift
//  AccessibilityAndLocalization
//
//  Created by Cory Tripathy on 2/7/23.
//

import SwiftUI

struct ContactCardView: View {
    
    @Environment(\.dismiss) var dismiss: DismissAction
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    @Binding var contact: Contact
    @State var rotationAmount: Double = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text(String(contact.firstName.first ?? Character("")) + String(contact.lastName.first ?? Character("")))
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding()
                    .background {
                        Circle()
                            .foregroundColor(.gray)
                    }
                Text("\(contact.firstName) \(contact.lastName)")
                    .foregroundColor(.black)
                    .font(.system(size: 36))
                    .padding(.top)
                Text("Last contacted on")
                    .foregroundColor(.black)
                    .padding(.top)
                Text(contact.dateLastContacted)
                    .foregroundColor(.black)
            }
            .navigationBarTitle("Contact")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation {
                    rotationAmount += 360
                }
            }
            .toolbar {
                Button {
                dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 15, height: 15)
                }
            }
            .rotationEffect(Angle(degrees: reduceMotion ? 0 : rotationAmount))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                LinearGradient(colors: [.indigo,.purple], startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
            }
        }
    }
}

struct ContactCardDummy: View {
    @State var contact = Contact(firstName: "Jackson", lastName: "Williams")
    var body: some View {
        ContactCardView(contact: $contact)
    }
}

struct ContactCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContactCardDummy()
    }
}
