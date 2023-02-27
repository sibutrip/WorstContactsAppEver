//
//  ContactView.swift
//  AccessibilityAndLocalization
//
//  Created by Cory Tripathy on 2/7/23.
//

import SwiftUI

struct ContactCardView: View {
    
    @Environment(\.dismiss) var dismiss: DismissAction
    
    @Binding var contact: Contact
    @State var zoomScale: CGFloat  = 1.5
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = UIImage(named: contact.firstName) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .offset(x: 0, y: 10)
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                } else {
                    Text(String(contact.firstName.first ?? Character("")) + String(contact.lastName.first ?? Character("")))
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .padding()
                        .background {
                            Circle()
                                .foregroundColor(.gray)
                        }
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
                    zoomScale = 1
                }
            }
            .toolbar {
                Button {
                dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 10, height: 10)
                }
            }
            .scaleEffect(zoomScale, anchor: .center)
            .animation(.interpolatingSpring(mass: 5, stiffness: 200, damping: 75, initialVelocity: 23), value: zoomScale)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                LinearGradient(colors: [.indigo,.purple], startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
            }
        }
    }
}

struct ContactCardDummy: View {
    @State var contact = Contact(firstName: "Cory", lastName: "Tripathy")
    var body: some View {
        ContactCardView(contact: $contact)
    }
}

struct ContactCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContactCardDummy()
    }
}
