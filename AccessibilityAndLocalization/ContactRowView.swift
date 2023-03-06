//
//  ContactRowView.swift
//  AccessibilityAndLocalization
//
//  Created by Tyler Lawrence1 on 3/6/23.
//

import SwiftUI

struct ContactRowView: View {
    var contact: Contact
    @Environment(\.dynamicTypeSize) var dynamicTypeSize: DynamicTypeSize

    var body: some View {
        if dynamicTypeSize.isAccessibilitySize {
            HStack{
                VStack(alignment: .leading){
                    shared
//                        .alignmentGuide(.leading) {d in d[.leading] }
                        .fixedSize(horizontal: true, vertical: false)
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
        } else {
            HStack{
                shared
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
    
    var shared: some View {
        
        Group{
            Text(contact.firstName)
            Text(contact.lastName)
                .bold()
        }
        
    }
}

struct ContactRowView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContactRowView(contact: Contact(firstName: "first", lastName: "last"))
        ContactRowView(contact: Contact(firstName: "first", lastName: "last"))
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
